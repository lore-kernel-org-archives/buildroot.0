From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 20 Aug 2019 21:53:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/swconfig: new package
In-Reply-To: <20190820155119.17636-1-vadim4j@gmail.com>
References: <20190820155119.17636-1-vadim4j@gmail.com>
Message-ID: <76a4d75c-e0cf-2852-b8af-14fa6b391f45@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Vadim,

On 20/08/2019 17:51, Vadim Kochan wrote:
> Add swconfig package which allows to configure switchdev
> device (Ethernet switch) via netlink interface.
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
>  DEVELOPERS                     |  1 +
>  package/Config.in              |  1 +
>  package/swconfig/Config.in     |  8 ++++++++
>  package/swconfig/swconfig.hash |  2 ++
>  package/swconfig/swconfig.mk   | 24 ++++++++++++++++++++++++
>  5 files changed, 36 insertions(+)
>  create mode 100644 package/swconfig/Config.in
>  create mode 100644 package/swconfig/swconfig.hash
>  create mode 100644 package/swconfig/swconfig.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index e50ac78ae7..11b976526b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2307,6 +2307,7 @@ F:	package/tstools/
>  N:	Vadim Kochan <vadim4j@gmail.com>
>  F:	package/brcm-patchram-plus/
>  F:	package/gettext-tiny/
> +F:	package/swconfig/
>  
>  N:	Valentin Korenblit <valentinkorenblit@gmail.com>
>  F:	package/clang/
> diff --git a/package/Config.in b/package/Config.in
> index 710ed12be0..2f05a364f0 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1990,6 +1990,7 @@ menu "Networking applications"
>  	source "package/nfacct/Config.in"
>  	source "package/nftables/Config.in"
>  	source "package/nginx/Config.in"
> +	source "package/swconfig/Config.in"

 check-package will consider the alphabetical ordering OK here, but obviously
swconfig should go *after* the external nginx modules...

>  if BR2_PACKAGE_NGINX
>  menu "External nginx modules"
>  	source "package/nginx-dav-ext/Config.in"
> diff --git a/package/swconfig/Config.in b/package/swconfig/Config.in
> new file mode 100644
> index 0000000000..25603f2752
> --- /dev/null
> +++ b/package/swconfig/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_SWCONFIG
> +	bool "swconfig"
> +	select BR2_PACKAGE_LIBNL
> +	help
> +	  The program swconfig allows you to configure configurable
> +	  Ethernet network switches.

 I would also copy the following paragraph from the documentation:

It is considered legacy and new switch drivers should use the DSA (distributed
switch architecture) kernel framework which makes it possible to use standard
userspace tools such as ip to configure the switches.

 Also, as far as I understand, it uses a framework that never got upstreamed to
Linux so you need an openwrt-forked kernel to use it. I think it's worth
mentioning that in the help text as well.

> +
> +	  http://wiki.openwrt.org/doc/techref/swconfig

 That is the "old wiki". The new URL is
https://openwrt.org/docs/techref/swconfig

 At first sight, the content seems to be the same however.

> diff --git a/package/swconfig/swconfig.hash b/package/swconfig/swconfig.hash
> new file mode 100644
> index 0000000000..78e16aa37f
> --- /dev/null
> +++ b/package/swconfig/swconfig.hash
> @@ -0,0 +1,2 @@
> +# locally computed
> +sha256  d55f2580629fb4a585048efe4fdc6af30b269cad9adc6ae1b236c8c73ee70e8c  swconfig-20150806.tar.gz
> diff --git a/package/swconfig/swconfig.mk b/package/swconfig/swconfig.mk
> new file mode 100644
> index 0000000000..c5105f8bbe
> --- /dev/null
> +++ b/package/swconfig/swconfig.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# swconfig
> +#
> +################################################################################
> +
> +SWCONFIG_VERSION = 20150806
> +SWCONFIG_SITE = $(call github,rains31,swconfig,$(SWCONFIG_VERSION))

 Oh boy, this is an "interesting" situation...

 This repository is actually a fork of a fork of the upstream openwrt
implementation. Neither this fork, nor the fork it forked from, nor openwrt
itself have made any changes in the last three years though.

 Normally we'd prefer to use the real upstream, but that has some problems:

* openwrt doesn't have it as a separate repo, it is bundled in the full openwrt
tree directly (much like our makedevs package);
* the openwrt version directly uses UCI, the fork removed that so it's usable
outside openwrt;
* since it relies on non-upstream kernel API, it relies on netlink attribute
definitions that are not found in typical external toolchains; the fork contains
a copy of the non-upstream switch.h uapi header to avoid this problem.

 In addition, since this tool is for talking with a deprecated driver anyway,
it's unlikely that there ever will be any upstream changes.

 So I guess we're better off with the fork after all. But it would have been
nice to explain all this in the commit message.

 I do wonder though about the usefulness of adding a tool that was deprecated
more than two years ago...

> +SWCONFIG_LICENSE = GPL-2.0

 There is a LICENSE file, so please add it and its hash.

> +SWCONFIG_DEPENDENCIES = libnl
> +
> +# redefine original CFLAGS as it points directly to /usr/include

 Excellent comment!

> +SWCONFIG_MAKE_ENV = CC="$(TARGET_CC)" \
> +		    CFLAGS="-I. -I$(STAGING_DIR)/usr/include/libnl3"

 ... and the Makefile uses ?= so this works.

 However, later commits update it to := instead of ?=, so it would be safer to
instead pass it after $(MAKE) instead of before.


 Regards,
 Arnout

> +
> +define SWCONFIG_BUILD_CMDS
> +	 $(SWCONFIG_MAKE_ENV) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define SWCONFIG_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) DESTDIR="$(TARGET_DIR)" $(MAKE) -C $(@D) install
> +endef
> +
> +$(eval $(generic-package))
> 
