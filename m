From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 3 May 2018 23:48:02 +0200
Subject: [Buildroot] [RFC v2 3/3] freeswitch: bump to git master
 8f10ae54a18a19fc6ed938e4f662bd218ba54b5e
In-Reply-To: <20180503212436.2521-3-ps.report@gmx.net>
References: <20180503212436.2521-1-ps.report@gmx.net>
 <20180503212436.2521-3-ps.report@gmx.net>
Message-ID: <20180503234802.5a0e48e6@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 May 2018 23:24:36 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> Enables openssl-1.1.0h compatible compile.
> 
> - add bootstrap.sh pre-configure call (normal AUTORECONF is broken)
> - add tiff dependency (bundled tiff source is gone)
> - rebase (and git format) 001-libvpx-cross.patch patch
> - update libs/srtp/LICENSE file hash (updated copyright year)
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - new patch (suggested by Bernd Kuhls)
> 
> Notes:
>   - needed to disable BR2_COMPILER_PARANOID_UNSAFE_PATH for error
>     free compile
> ---
>  ...patch => 0001-Fix-cross-compiling-libvpx.patch} | 26 +++++++++++++++-------
>  package/freeswitch/Config.in                       |  1 +
>  package/freeswitch/freeswitch.hash                 | 14 +++++-------
>  package/freeswitch/freeswitch.mk                   | 16 ++++++++++---
>  4 files changed, 37 insertions(+), 20 deletions(-)
>  rename package/freeswitch/{0001-libvpx-cross.patch => 0001-Fix-cross-compiling-libvpx.patch} (71%)
> 
> diff --git a/package/freeswitch/0001-libvpx-cross.patch b/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch
> similarity index 71%
> rename from package/freeswitch/0001-libvpx-cross.patch
> rename to package/freeswitch/0001-Fix-cross-compiling-libvpx.patch
> index a2583dac35..6f9e122242 100644
> --- a/package/freeswitch/0001-libvpx-cross.patch
> +++ b/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch
> @@ -1,4 +1,7 @@
> -Fix cross-compiling libvpx
> +From 4ba073af7877242a79579b040e3be00bed4275cc Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Thu, 3 May 2018 22:24:23 +0200
> +Subject: [PATCH] Fix cross-compiling libvpx
>  
>  Freeswitch since version 1.6.7 only uses an in-tree-version of libvpx:
>  https://freeswitch.org/fisheye/changelog/freeswitch?cs=febe0f8dacea2d2a31902b3dc469be757f8c3c4d
> @@ -10,15 +13,19 @@ package/freeswitch/freeswitch.mk and add target=generic-gnu as
>  configure parameter:
>  https://freeswitch.org/stash/projects/FS/repos/freeswitch/browse/libs/libvpx/README#110
>  
> -And yes, autoreconf is also broken, so we patch Makefile.in instead
> -of Makefile.am.
> -
>  Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>  
> -diff -uNr freeswitch-1.6.7.org/Makefile.in freeswitch-1.6.7/Makefile.in
> ---- freeswitch-1.6.7.org/Makefile.in	2016-04-01 18:09:54.000000000 +0200
> -+++ freeswitch-1.6.7/Makefile.in	2016-04-22 20:11:37.938961730 +0200
> -@@ -3491,7 +3491,7 @@
> +[rebased on freeswitch git master branch]
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 53bd7c66aa..2e4059740a 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -567,7 +567,7 @@ libs/libzrtp/libzrtp.a:
>   	cd libs/libzrtp && $(MAKE)
>   
>   libs/libvpx/Makefile:
> @@ -27,3 +34,6 @@ diff -uNr freeswitch-1.6.7.org/Makefile.in freeswitch-1.6.7/Makefile.in
>   
>   libs/libvpx/libvpx.a: libs/libvpx/Makefile
>   	@cd libs/libvpx && $(MAKE)
> +-- 
> +2.16.3
> +
> diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
> index 1f6459335d..8557d75134 100644
> --- a/package/freeswitch/Config.in
> +++ b/package/freeswitch/Config.in
> @@ -18,6 +18,7 @@ config BR2_PACKAGE_FREESWITCH
>  	select BR2_PACKAGE_PCRE
>  	select BR2_PACKAGE_SPEEX
>  	select BR2_PACKAGE_SQLITE
> +	select BR2_PACKAGE_TIFF
>  	select BR2_PACKAGE_UTIL_LINUX
>  	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>  	select BR2_PACKAGE_ZLIB
> diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
> index 25421de99b..2cc8ebc974 100644
> --- a/package/freeswitch/freeswitch.hash
> +++ b/package/freeswitch/freeswitch.hash
> @@ -1,10 +1,7 @@
> -# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.20.tar.xz.md5
> -md5 e9890a2d6ca6f58dd3fa440fdfbf91a0  freeswitch-1.6.20.tar.xz
> -# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.20.tar.xz.sha1
> -sha1 ce284b805e262504cbb1f74796785b4dfa70d5ac  freeswitch-1.6.20.tar.xz
> -# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.20.tar.xz.sha256
> -sha256 dbb0f73109171bd381772b247b8ef581f6a176964619082a1fe031b004086f6b  freeswitch-1.6.20.tar.xz
> -# Locally computed
> +# Locally computed:
> +sha256 56d932c001f3cc53b6ee5d835536b01fceacf1e360a6b48c5c1265eda5d6be86  freeswitch-8f10ae54a18a19fc6ed938e4f662bd218ba54b5e.tar.gz
> +
> +# License files:
>  sha256 10299420c1e8602c0daf5a59d022621cd72a9148d1f0f33501edb3db3445c7fe  COPYING
>  sha256 e8e26b16da14aa3e6ed5c22c705fdc1f45d6225fca461ea9f7314bcdfdc414c4  libs/apr/LICENSE
>  sha256 1eefb2ea1db0af7729a9d8a27d7c65d8a37ab185393f935b029aac6828ce315a  libs/apr-util/LICENSE
> @@ -12,6 +9,5 @@ sha256 7d72a8aee2c4b1a084200487992a5d86f5df6b535727a14c1874918e99d24600  libs/li
>  sha256 e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  libs/sofia-sip/COPYING
>  sha256 b402ae58cf355b33be8fa023f704a039e3d41ecaccd2bbcda43ca31d703e4556  libs/sofia-sip/COPYRIGHTS
>  sha256 366576cb0b869cd9e95a4882878607314650488ac635e5df0692180382e9666a  libs/spandsp/COPYING
> -sha256 8defed37d52096ae14b60adc499c33d43975109bc265552ee67e9a888c634b93  libs/srtp/LICENSE
> -sha256 fbd6fed7938541d2c809c0826225fc85e551fdbfa8732b10f0c87e0847acafd7  libs/tiff-4.0.2/COPYRIGHT
> +sha256 8e19d42a1eec9561f3f347253ddf2e385c55f392f025bb0fd41b88dbf38db5ae  libs/srtp/LICENSE
>  sha256 ab00a482b6a3902e40211b43c5d0441962ea99b6cc7c25c0f243fa270b78d482  src/mod/codecs/mod_isac/LICENSE
> diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
> index 98f2f48356..32a556eba7 100644
> --- a/package/freeswitch/freeswitch.mk
> +++ b/package/freeswitch/freeswitch.mk
> @@ -4,9 +4,11 @@
>  #
>  ################################################################################
>  
> -FREESWITCH_VERSION = 1.6.20
> -FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
> -FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
> +FREESWITCH_VERSION = 8f10ae54a18a19fc6ed938e4f662bd218ba54b5e
> +#FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
> +FREESWITCH_SITE = https://freeswitch.org/stash/scm/fs/freeswitch.git
> +FREESWITCH_SITE_METHOD = git
> +#FREESWITCH_AUTORECONF = YES
>  # External modules need headers/libs from staging
>  FREESWITCH_INSTALL_STAGING = YES
>  FREESWITCH_LICENSE = MPL-1.1, \
> @@ -36,9 +38,17 @@ FREESWITCH_DEPENDENCIES = \
>  	pcre \
>  	speex \
>  	sqlite \
> +	tiff \
>  	util-linux \
>  	zlib
>  
> +# run bootstrap.sh (normal AUTORECONF is broken)
> +define FREESWITCH_RUN_BOOTSTRAP
> +	cd $(@D) && ./bootstrap.sh
> +endef
> +
> +FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_RUN_BOOTSTRAP

...needs additional:

FREESWITCH_DEPENDENCIES += host-automake host-autoconf host-libtool

Regards,
Peter

> +
>  # disable display of ClueCon banner in fs_cli
>  FREESWITCH_CONF_ENV += \
>  	disable_cc=yes
