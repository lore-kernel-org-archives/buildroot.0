From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Oct 2014 19:18:29 +0200
Subject: [Buildroot] [PATCH 1/3] xtables-addons: new package
In-Reply-To: <1413925852-12765-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413925852-12765-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <5447E6E5.10904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/10/14 23:10, Gustavo Zacarias wrote:
> The geoip "helpers" are basically scripts that download and reformat
> the geoip database in a form usable by xt_geoip.
> The netfilter (kernel & userland) sides of it are built and installed.
> Since there are many considerations to geoip databases (free, commercial
> and variants for each) it's left to the user to deal with that if they
> plan to use the extension which is only one among many.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in                          |  1 +
>  package/xtables-addons/Config.in           | 22 +++++++++++++++++++++
>  package/xtables-addons/xtables-addons.hash |  3 +++
>  package/xtables-addons/xtables-addons.mk   | 31 ++++++++++++++++++++++++++++++
>  4 files changed, 57 insertions(+)
>  create mode 100644 package/xtables-addons/Config.in
>  create mode 100644 package/xtables-addons/xtables-addons.hash
>  create mode 100644 package/xtables-addons/xtables-addons.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 989790e..97985b3 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1128,6 +1128,7 @@ endif
>  	source "package/wvdial/Config.in"
>  	source "package/xinetd/Config.in"
>  	source "package/xl2tp/Config.in"
> +	source "package/xtables-addons/Config.in"
>  	source "package/znc/Config.in"
>  
>  endmenu
> diff --git a/package/xtables-addons/Config.in b/package/xtables-addons/Config.in
> new file mode 100644
> index 0000000..6e3b88c
> --- /dev/null
> +++ b/package/xtables-addons/Config.in
> @@ -0,0 +1,22 @@
> +comment "xtables-addons needs a Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL
> +
> +comment "xtables-addons needs a toolchain w/ dynamic library, largefile, threads"
> +	depends on BR2_LINUX_KERNEL

 Do we usually do this? I mean, if a user discovers the 'needs a Linux kernel'
comment and builds a kernel, then he comes back only to discover that he still
has to enable all this other stuff...


> +	depends on BR2_PREFER_STATIC_LIB || !BR2_LARGEFILE || \
> +		!BR2_TOOLCHAIN_HAS_THREADS
> +
> +
> +config BR2_PACKAGE_XTABLES_ADDONS
> +	bool "xtables-addons"
> +	depends on BR2_LINUX_KERNEL
> +	depends on BR2_LARGEFILE
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_PREFER_STATIC_LIB # extensions are .so
> +	select BR2_PACKAGE_IPTABLES
> +	help
> +	  Xtables-addons is the successor to patch-o-matic(-ng).
> +	  Likewise, it contains extensions that were not, or are not yet,
> +	  accepted in the main kernel/iptables packages.
> +
> +	  http://xtables-addons.sourceforge.net/
> diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
> new file mode 100644
> index 0000000..d742aed
> --- /dev/null
> +++ b/package/xtables-addons/xtables-addons.hash
> @@ -0,0 +1,3 @@
> +# From http://sourceforge.net/projects/xtables-addons/files/Xtables-addons/2.6/
> +md5	087835ba7e564481b6fd398692268340	xtables-addons-2.6.tar.xz
> +sha1	10586961a70fd4fe4f972cb3f31962c6766b359c	xtables-addons-2.6.tar.xz
> diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
> new file mode 100644
> index 0000000..2992ac6
> --- /dev/null
> +++ b/package/xtables-addons/xtables-addons.mk
> @@ -0,0 +1,31 @@
> +################################################################################
> +#
> +# xtables-addons
> +#
> +################################################################################
> +
> +XTABLES_ADDONS_VERSION = 2.6
> +XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
> +XTABLES_ADDONS_SITE = http://downloads.sourceforge.net/project/xtables-addons/Xtables-addons/$(XTABLES_ADDONS_VERSION)
> +XTABLES_ADDONS_CONF_OPTS = --with-kbuild="$(LINUX_DIR)" \
> +	--with-xtables="$(STAGING_DIR)/usr" \
> +	--with-xtlibdir="/usr/lib/xtables"
> +XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
> +XTABLES_ADDONS_LICENSE = GPLv2+
> +XTABLES_ADDONS_LICENSE_FILES = LICENSE
> +
> +# geoip helpers need perl with modules and unzip so disable
> +define XTABLES_DISABLE_GEOIP_HELPERS
> +	$(SED) 's/ geoip//' $(@D)/Makefile.in
> +endef
> +XTABLES_ADDONS_POST_PATCH_HOOKS += XTABLES_DISABLE_GEOIP_HELPERS
> +
> +define XTABLES_ADDONS_BUILD_CMDS
> +	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS)

 Is there a reason why

XTABLE_ADDONS_MAKE_OPTS = $(LINUX_MAKE_FLAGS)

doesn't work instead of overriding the build commands?

 Regards,
 Arnout

> +endef
> +
> +define XTABLES_ADDONS_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) DESTDIR="$(TARGET_DIR)" install
> +endef
> +
> +$(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
