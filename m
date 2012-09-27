From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 27 Sep 2012 09:54:42 +0200
Subject: [Buildroot] [PATCHv3 1/4] pkgconf: new package
In-Reply-To: <1348656857-27725-1-git-send-email-gustavo@zacarias.com.ar>
References: <1348656857-27725-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <50640642.8020407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/26/12 12:54, Gustavo Zacarias wrote:
> pkgconf is a drop-in replacement for pkg-config that doesn't need
> itself to build and just requires a C89 compiler.
>
> Instead of using a patch for hardcoded sysroot support (as the patch to
> pkg-config does) we rely instead on a wrapper script that takes the
> appropiate action.
>
> Signed-off-by: Gustavo Zacarias<gustavo@zacarias.com.ar>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Minor comments below.

  The v1 is now
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(on 750 packages, with the external sourcery toolchain for x86_64, excluding the
30-ish packages that didn't build before; took a bit of time to find a working
allpackageyesconfig). I don't suppose I have to retest with this series?

[snip]
> diff --git a/package/pkgconf/pkg-config.in b/package/pkgconf/pkg-config.in
> new file mode 100644
> index 0000000..4039d4d
> --- /dev/null
> +++ b/package/pkgconf/pkg-config.in
> @@ -0,0 +1,2 @@
> +#!/bin/sh
> +PKG_CONFIG_PATH=${PKG_CONFIG_PATH:- at PKG_CONFIG_PATH@} PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:- at STAGING_DIR@} @HOST_DIR@/usr/bin/pkgconf $@

  Actually, instead of @HOST_DIR@/usr/bin, it's better to use $(dirname $0).
That way it's relocatable.

> diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
> new file mode 100644
> index 0000000..2d79f05
> --- /dev/null
> +++ b/package/pkgconf/pkgconf.mk
> @@ -0,0 +1,30 @@
> +#############################################################
> +#
> +# pkgconf
> +#
> +#############################################################
> +
> +PKGCONF_VERSION = 0.8.9
> +PKGCONF_SITE = http://tortois.es/~nenolod/distfiles
> +PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.bz2
> +
> +PKG_CONFIG_HOST_BINARY = $(HOST_DIR)/usr/bin/pkg-config
> +
> +define PKGCONF_LINK_PKGCONFIG
> +	ln -sf pkgconf $(TARGET_DIR)/usr/bin/pkg-config
> +endef

  I wouldn't remove the pkg-config package on the target, just host-pkg-config.
Unless pkg-config is really deprecated?  Anyway, even if it is, it should be
marked as deprecated first and only removed later.

  That said, this hook should still be in
ifeq ($(BR2_PACKAGE_PKG_CONFIG),)



  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
