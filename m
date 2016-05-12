From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 12 May 2016 23:02:56 +0200
Subject: [Buildroot] [PATCH 1/1] fs/aci: Add App Container Image (ACI)
 support to filesystems
In-Reply-To: <5733B373.9090807@coreos.com>
References: <5733B373.9090807@coreos.com>
Message-ID: <7090f5c3-f8bc-b79e-ee0c-ba87a264ccaa@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Brian,

  Thanks for this contribution. I have a few comments though.

On 05/12/16 00:34, Brian 'redbeard' Harrington wrote:
> App Container Images (ACI) are a Linux containerization image format
> defined as a part of the AppC specification as defined by CoreOS,
> Red Hat, Google, and community members. These images consist of a Linux
> userland and a JSON metadata file describing how to execute the actual
> runtime.
>
> This filesystem package utilizes Buildroot for the generation of
> the userland and provides the user with a mechanism for configuring the
> contents of the manifest file.
>
> Signed-off-by: Brian 'redbeard' Harrington <redbeard@coreos.com>
> ---
>  fs/Config.in     |  1 +
>  fs/aci/Config.in | 72 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  fs/aci/aci.json  | 34 ++++++++++++++++++++++++++
>  fs/aci/aci.mk    | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 177 insertions(+)
>  create mode 100644 fs/aci/Config.in
>  create mode 100644 fs/aci/aci.json
>  create mode 100644 fs/aci/aci.mk
>
> diff --git a/fs/Config.in b/fs/Config.in
> index 51ccf28..1c468c5 100644
> --- a/fs/Config.in
> +++ b/fs/Config.in
> @@ -1,5 +1,6 @@
>  menu "Filesystem images"
>
> +source "fs/aci/Config.in"
>  source "fs/axfs/Config.in"
>  source "fs/cloop/Config.in"
>  source "fs/cpio/Config.in"
> diff --git a/fs/aci/Config.in b/fs/aci/Config.in
> new file mode 100644
> index 0000000..7dcac6b
> --- /dev/null
> +++ b/fs/aci/Config.in
> @@ -0,0 +1,72 @@
> +config BR2_TARGET_ROOTFS_ACI
> +	bool "Generate App Container Image (ACI)"

  We tend to keep our config prompts terse, and lowercase. So:
	bool "app container image (aci)"

> +	default y

  This should _definitely_ not default to y.

> +	select BR2_PACKAGE_HOST_JQ

  See below about jq.

> +	help
> +	  Build an App Container Image for use with a Linux
> +	  containerization engine like rkt, Kurma, 3ofCoins, nosecone,
> +	  etc.
> +
> +choice
> +	prompt "Compression method"
> +	default BR2_TARGET_ROOTFS_ACI_NONE
> +	depends on BR2_TARGET_ROOTFS_ACI

  Instead of adding a depends on, add an if around everything.

> +	help
> +	  Select compressor for application container image
> +
> +config BR2_TARGET_ROOTFS_ACI_NONE
> +	bool "no compression"
> +	help
> +	  Do not compress the ACI.
> +
> +config BR2_TARGET_ROOTFS_ACI_GZIP
> +	bool "gzip"
> +	help
> +	  Do compress the ACI with gzip.
> +
> +config BR2_TARGET_ROOTFS_ACI_BZIP2
> +	bool "bzip2"
> +	help
> +	  Do compress the ACI with bzip2.
> +
> +config BR2_TARGET_ROOTFS_ACI_LZMA
> +	bool "lzma"
> +	help
> +	  Do compress the ACI with lzma.
> +
> +config BR2_TARGET_ROOTFS_ACI_LZO
> +	bool "lzo"
> +	help
> +	  Do compress the ACI with lzop.
> +
> +config BR2_TARGET_ROOTFS_ACI_XZ
> +	bool "xz"
> +	help
> +	  Do compress the ACI with xz.
> +
> +endchoice
> +
> +config BR2_TARGET_ROOTFS_ACI_OPTIONS_NAME
> +	string "Name of the ACI image (e.g. example.com/my_app)"

	string "image name"

  Also I'd add a default, e.g.

	default "buildroot"

  We don't currently have (build) tests of the filesystems, but it's a lot 
easier to add tests if a default configuration just works.


> +	depends on BR2_TARGET_ROOTFS_ACI
> +	help
> +	  A human-readable name for this App Container Image

  The e.g. should go here, in the help text.

> +
> +comment "ACI images must have a name"
> +	depends on BR2_TARGET_ROOTFS_ACI_OPTIONS_NAME = ""

  This should also have the depends on ROOTFS_ACI - but by using an if around 
everything, it will already be OK.

  We also tend to check for these things in the .mk file, so that the build 
doesn't even start if you forget to set this. Cfr. for example the $(error ...) 
calls near the end of linux.mk.


> +
> +config BR2_TARGET_ROOTFS_ACI_OPTIONS_EXEC
> +	string "Command to execute inside the container (e.g. /bin/sh)"
> +	depends on BR2_TARGET_ROOTFS_ACI
> +	help
> +	  Executable to launch and any flags

  Perhaps this should default to /sbin/init if !BR2_INIT_NONE ? And otherwise 
default to /bin/sh?

  Is this one allowed to be empty?

> +
> +config BR2_TARGET_ROOTFS_ACI_OPTIONS_VERSION
> +	string "Version number of the container (e.g. v1.3.2)"

  Can we have a default here? Perhaps simply 0?

> +	depends on BR2_TARGET_ROOTFS_ACI
> +	help
> +	  When combined with "name", this SHOULD be unique for every
> +	  build of an app (on a given "os"/"arch" combination).

  Is the version supposed to be user-meaningful? If not, perhaps we can take a 
hash of .config and use that for the version when the user leaves it empty?

> +
> +comment "ACI images should be supplied with a version"
> +	depends on BR2_TARGET_ROOTFS_ACI_OPTIONS_VERSION = ""
> diff --git a/fs/aci/aci.json b/fs/aci/aci.json
> new file mode 100644
> index 0000000..bce9d39
> --- /dev/null
> +++ b/fs/aci/aci.json
> @@ -0,0 +1,34 @@
> +{
> +	"acKind":"ImageManifest",
> +	"acVersion":"0.7.4",
> +	"name":env.aciname,
> +	"labels":
> +		[{
> +			"name":"os",
> +			"value":"linux"
> +		},{
> +			"name":"arch",
> +			"value": env.aciarch
> +		},{
> +			"name":"version",
> +			"value": env.aciver
> +		}],
> +	"app":
> +	{
> +		"exec":
> +			[
> +			env.aciexec
> +			],
> +		"user": (if (env.aciexec == "") then "0" else env.aciexec end),
> +		"group": (if (env.aciexec == "") then "0" else env.aciexec end)
> +	},
> +	"annotations":
> +	[{
> +		"name": "buildroot.org/aci",
> +		"value": "Generated by Buildroot"
> +	},
> +	{
> +		"name": "created",
> +		"value": env.created_at
> +	}]
> +}
> diff --git a/fs/aci/aci.mk b/fs/aci/aci.mk
> new file mode 100644
> index 0000000..5af6c13
> --- /dev/null
> +++ b/fs/aci/aci.mk
> @@ -0,0 +1,70 @@
> +################################################################################
> +#
> +# Generate ACI image
> +# https://github.com/appc/spec/blob/master/spec/aci.md
> +#
> +################################################################################
> +ROOTFS_ACI_DEPENDS += host-jq
> +
> +# ACIs follow the Golang naming spec for CPU  architecture
> +
> +ifeq ($(BR2_arm),y)
> +ifeq ($(BR2_ARM_CPU_ARMV5),y)
> +	ACI_ARCH = arm5l
> +else ifeq ($(BR2_ARM_CPU_ARMV6),y)
> +	ACI_ARCH = arm6l
> +else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
> +	ACI_ARCH = arm7l
> +endif
> +else ifeq ($(BR2_armeb),y)
> +ifeq ($(BR2_ARM_CPU_ARMV5),y)
> +	ACI_ARCH = arm5b
> +else ifeq ($(BR2_ARM_CPU_ARMV6),y)
> +	ACI_ARCH = arm6b
> +else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
> +	ACI_ARCH = arm7b
> +endif
> +else ifeq ($(BR2_aarch64),y)
> +	ACI_ARCH = aarch64
> +else ifeq ($(BR2_aarch64_be),y)
> +	ACI_ARCH = aarch64_be
> +else ifeq ($(BR2_i386),y)
> +	ACI_ARCH = 386
> +else ifeq ($(BR2_x86_64),y)
> +	ACI_ARCH = amd64
> +else ifeq ($(BR2_powerpc),y)
> +	ACI_ARCH = ppc64
> +endif

  Such 'switch' constructs are a lot easier in the Config.in, cfr. for instance 
BR2_GCC_TARGET_CPU in arch/Config.in.arm

> +
> +# For the generation of our ACI we include a timestamp and pass the variables
> +# from the main configuration into jq to generate a JSON manifest.  We then
> +# create the TAR archive of all components, making sure all paths are
> +# represented correctly.
> +
> +define ROOTFS_ACI_CMD
> +	created_at='$(shell date --rfc-3339=ns | tr " " "T")' \

  Hm, Gilles is trying to make reproducible builds and there you go and add a 
timestamp... Is it really needed?

> +	aciname=$(BR2_TARGET_ROOTFS_ACI_OPTIONS_NAME) \
> +	aciexec=$(BR2_TARGET_ROOTFS_ACI_OPTIONS_EXEC) \
> +	aciver=$(BR2_TARGET_ROOTFS_ACI_OPTIONS_VERSION) \

  For these string options, we normally do a qstrip and add quotes externally. 
The reason for that is that you can also override the options on the make 
command line, and in that case it will not have any quotes.

  Also, to check if these options are not empty, you have to qstrip them again; 
so you can add a variable to store the qstrip'ped option.

> +	aciarch=$(ACI_ARCH) \
> +	$(HOST_DIR)/usr/bin/jq -n -f fs/aci/aci.json > $(TARGET_DIR)/manifest && \

  I really don't like that we need jq just to do some simple subsitutions in the 
template aci.json file. Just rename it to aci.json.in, and use a simple sed to 
replace it. Cfr. for example pkg-config.in in package/pkgconf.

  Also, you don't need to use && to connect commands. Make will terminate when 
one command fails. You can just use a newline, without \-continuation.

> +	tar -c$(TAR_OPTS)f $@ --xattrs --numeric-owner -C $(TARGET_DIR) \
> +	  --transform 's,^\./,rootfs/,' --exclude=*/manifest manifest .

  How is the --xattrs useful? We don't set any xattrs from buildroot AFAIK, so 
whatever xattrs happen to appear in the filesystem are unlikely to be relevant. 
If the user sets some xattrs in e.g. a post-build script, they can pass it in 
the tar options. But I doubt that it's a good idea anyway - you probably want 
--xattrs-include=.... Otherwise, if you happen to build on e.g. a filesystem 
with per-file encryption, you may carry along such a xattr while it has no 
relevance at all on the target and could even be plain wrong.

  I don't think it's a good idea to reuse $(TAR_OPTS): that is defined for the 
tar fs, which may not even be selected; it's not clear to the user that there is 
a relation. If there is anything relevant that could be added there (like the 
xattrs), it should be in an aci-specific config option.

  I don't think this is the proper way to add the manifest. The tarball is not 
compressed (yet), so we can easily add to it. So I would put the manifest in 
BINARIES_DIR instead of TARGET_DIR, and do:

	tar -cf $@ -C $(BINARIES_DIR) --owner=0 --group=0 manifest
	tar -rf $@ -C $(TARGET_DIR) --numeric-owner --transform='s,^\./,rootfs/' .

> +endef
> +
> +# ACI images are required to end in ".aci" regardless of compression
> +
> +ifneq ($(BR2_TARGET_ROOTFS_ACI_NONE),y)
> +

  Empty line not needed.

> +define ROOTFS_ACI_MOVE
> +	echo "br2 var - $(BR2_TARGET_ROOTFS_ACI_NONE)" && \

  Debugging leftover?

> +	mv -f $(BINARIES_DIR)/rootfs.aci$(ROOTFS_ACI_COMPRESS_EXT) \
> +		$(BINARIES_DIR)/rootfs.aci && \

  I tend to prefer an explicit rm -f over mv -f, because it does the right thing 
when the target is a symlink or hardlink. But in this case we _know_ that the 
target is not a symlink or hardlink, so OK.

> +	echo "Compressed ACI moved to $(BINARIES_DIR)/rootfs.aci"

  This is not needed.

> +

  Empty line not needed.


  Regards,
  Arnout

> +endef
> +
> +ROOTFS_ACI_POST_GEN_HOOKS += ROOTFS_ACI_MOVE
> +endif
> +
> +$(eval $(call ROOTFS_TARGET,aci))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
