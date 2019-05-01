From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 1 May 2019 14:10:39 +0200
Subject: [Buildroot] [PATCH 2/2] package/mfgtools: bump to version 1.2.91
In-Reply-To: <20190430201121.15634-2-joerg.krause@embedded.rocks>
References: <20190430201121.15634-1-joerg.krause@embedded.rocks>
 <20190430201121.15634-2-joerg.krause@embedded.rocks>
Message-ID: <880fdc14-d19f-020b-9735-9e0077e6be76@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/04/2019 22:11, J?rg Krause wrote:
> The version 0.02 was a pre-release and is dated from Nov 20, 2017.
> 
> Meanwhile:
>  * the repo owner switch to NXPmicro
>  * latest version is 1.12.91
>  * the build system is CMake
>  * the license is BSD-3 only
> 
> Note, that mfgtools uses git to define a version string `GIT_VERSION`.
> It does so even when building from the provided source tarball.

 Is there an upstream-provided tarball? If so, why do you use the github helper?

> The
> problem is, that git provides the version information of Buildroot.

 Is it that much of a problem if the Buildroot version is used?

> 
> To fix this, we patch the logic to retrieve the git version so it does
> not run git for mfgtools. Unfortunately, this breaks the build process
> because of the missing `gitversion.h` header file. Therefore, we add a
> post configure hook which generates this file with the correct version
> string.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  .../0001-Fix-version-generation.patch         | 38 +++++++++++++++++++
>  package/mfgtools/mfgtools.hash                |  5 +--
>  package/mfgtools/mfgtools.mk                  | 35 ++++++-----------
>  3 files changed, 51 insertions(+), 27 deletions(-)
>  create mode 100644 package/mfgtools/0001-Fix-version-generation.patch
> 
> diff --git a/package/mfgtools/0001-Fix-version-generation.patch b/package/mfgtools/0001-Fix-version-generation.patch
> new file mode 100644
> index 0000000000..ca48c522ab
> --- /dev/null
> +++ b/package/mfgtools/0001-Fix-version-generation.patch
> @@ -0,0 +1,38 @@
> +From af9704ca3b7b02503f8ade069a77203869f0bcfa Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
> +Date: Tue, 30 Apr 2019 15:51:47 +0200
> +Subject: [PATCH] Fix version generation
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +mfgtools uses git to extract its own version number.
> +
> +This is an issue as the git-extracted version is conflicting when a top
> +level project, e.g. a package manager, itself is a git repository.
> +
> +Since these git calls are legitimate only if git is used for the mfgtools
> +subtree only, this patch adds a check: A .git directory has to exist at
> +the root of the project to enable git-extracted version string.
> +
> +Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> +---
> + libuuu/gen_ver.sh | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libuuu/gen_ver.sh b/libuuu/gen_ver.sh
> +index d4e8c1b..bcc04a2 100755
> +--- a/libuuu/gen_ver.sh
> ++++ b/libuuu/gen_ver.sh
> +@@ -13,7 +13,7 @@ else
> + fi
> + 
> + # Test if we are in a repo
> +-if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ];
> ++if [ -d .git ] && [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ];

 The libuuu directory doesn't have a .git subdir. Also in some situations (e.g.
worktrees) .git may be a file or symlink.

> + then
> + 	#echo "In a repo"
> + 	# Get the version of the last commit of the repo
> +-- 
> +2.21.0
> +
> diff --git a/package/mfgtools/mfgtools.hash b/package/mfgtools/mfgtools.hash
> index 4932a80dba..4db97e6ae2 100644
> --- a/package/mfgtools/mfgtools.hash
> +++ b/package/mfgtools/mfgtools.hash
> @@ -1,4 +1,3 @@
>  # locally computed
> -sha256  055d71227d18883d6e8bc9e854c076015f9a7749820a94272e19071bf0b25c89  mfgtools-v0.02.tar.gz
> -sha256  2655559a6bb1179eae514f5c7166f4ede4f2453efa9cf4dc3c045cab5d57dede  LICENSE
> -sha256  0963b6e5086bf454265b0f57821a02b681d1211e40ad74c310231cb4d94815c9  README.txt
> +sha256  378caa930fdc1b06d49abf26811827f12103d995438b91302a7c6e34368419f9  mfgtools-uuu_1.2.91.tar.gz
> +sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
> diff --git a/package/mfgtools/mfgtools.mk b/package/mfgtools/mfgtools.mk
> index e4663a8af9..c42b18d43b 100644
> --- a/package/mfgtools/mfgtools.mk
> +++ b/package/mfgtools/mfgtools.mk
> @@ -4,31 +4,18 @@
>  #
>  ################################################################################
>  
> -MFGTOOLS_VERSION = v0.02
> -MFGTOOLS_SITE = $(call github,codeauroraforum,mfgtools,$(MFGTOOLS_VERSION))
> -MFGTOOLS_SUBDIR = MfgToolLib
> -MFGTOOLS_LICENSE = BSD-3-Clause or CPOL
> -MFGTOOLS_LICENSE_FILES = LICENSE README.txt
> -HOST_MFGTOOLS_DEPENDENCIES = host-libusb
> +MFGTOOLS_VERSION = uuu_1.2.91
> +MFGTOOLS_SITE = $(call github,NXPmicro,mfgtools,$(MFGTOOLS_VERSION))
> +MFGTOOLS_LICENSE = BSD-3-Clause
> +MFGTOOLS_LICENSE_FILES = LICENSE
> +HOST_MFGTOOLS_DEPENDENCIES = host-libusb host-libzip host-zlib
>  
> -HOST_MFGTOOLS_CFLAGS = \
> -	$(HOST_CFLAGS) $(HOST_LDFLAGS) -std=c++11 -lpthread \
> -	-L$(@D)/MfgToolLib -lMfgToolLib -I$(@D)/MfgToolLib \
> -	-lusb-1.0 -I$(HOST_DIR)/include/libusb-1.0 \
> -	-fpermissive -Wno-write-strings
> -
> -define HOST_MFGTOOLS_CLI_BUILD
> -	$(HOST_CONFIGURE_OPTS) $(MAKE) CC="$(HOSTCXX)" \
> -		CFLAGS="$(HOST_MFGTOOLS_CFLAGS)" -C $(@D)/TestPrgm
> -endef
> -
> -HOST_MFGTOOLS_POST_BUILD_HOOKS += HOST_MFGTOOLS_CLI_BUILD
> -
> -define HOST_MFGTOOLS_INSTALL_CMDS
> -	$(INSTALL) -D -m 755 $(@D)/MfgToolLib/libMfgToolLib.so \
> -		$(HOST_DIR)/lib/libMfgToolLib.so
> -	$(INSTALL) -D -m 755 $(@D)/TestPrgm/mfgtoolcli \
> -		$(HOST_DIR)/bin/mfgtoolcli
> +# Version string generation is broken in mfgtools as it relies on git, even
> +# when building from a source tarball. We patch gen_ver.sh to prevent defining
> +# the GIT_VERSION in the build step and define GIT_VERSION ourself.
> +define MFGTOOLS_SET_VERSION
> +	echo '#define GIT_VERSION "lib$(MFGTOOLS_VERSION)"' > $(@D)/libuuu/gitversion.h

 Isn't this sufficient to avoid (re)generation of gitversion.h?

 Ah, no, it is a PRE_BUILD command so it is always run.

 Since the patch is anyway not upstreamable, maybe it's easier to do something
like this:

# Version string generation is broken in mfgtools as it relies on git, even
# when building from a source tarball. We overwrite gen_ver.sh with something
# that simply prints the version.
define MFGTOOLS_GEN_VER_SH
	echo '#! /bin/sh' > $(@D)/libuu/gen_ver.sh
	echo 'printf "$(MFGTOOLS_VERSION)" > $$1'  >> $(@D)/libuu/gen_ver.sh
	chmod +x  $(@D)/libuu/gen_ver.sh
endef
MFGTOOLS_POST_PATCH_HOOKS += MFGTOOLS_GEN_VER_SH


 Regards,
 Arnout

>  endef
> +HOST_MFGTOOLS_POST_CONFIGURE_HOOKS += MFGTOOLS_SET_VERSION
>  
>  $(eval $(host-cmake-package))
> 
