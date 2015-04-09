From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 21:44:07 +0200
Subject: [Buildroot] [PATCH] pciutils: bump to version 3.3.1
In-Reply-To: <1428605866-17345-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428605866-17345-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150409214407.5592a172@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  9 Apr 2015 15:57:46 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/pciutils/pciutils.hash |  2 +-
>  package/pciutils/pciutils.mk   | 11 +++++++++--
>  2 files changed, 10 insertions(+), 3 deletions(-)

I've applied, even though I believe things could be done in a bit nicer
way, see below.

> diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
> index 5df3a17..1410738 100644
> --- a/package/pciutils/pciutils.mk
> +++ b/package/pciutils/pciutils.mk
> @@ -4,13 +4,20 @@
>  #
>  ################################################################################
>  
> -PCIUTILS_VERSION = 3.3.0
> +PCIUTILS_VERSION = 3.3.1
>  PCIUTILS_SITE = $(BR2_KERNEL_MIRROR)/software/utils/pciutils
>  PCIUTILS_SOURCE = pciutils-$(PCIUTILS_VERSION).tar.xz
>  PCIUTILS_INSTALL_STAGING = YES
>  PCIUTILS_LICENSE = GPLv2+
>  PCIUTILS_LICENSE_FILES = COPYING
>  
> +ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> +PCIUTILS_DEPENDENCIES += udev
> +PCIUTILS_MAKE_OPTS += HWDB=yes
> +else
> +PCIUTILS_MAKE_OPTS += HWDB=no
> +endif
> +
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
>  PCIUTILS_ZLIB=yes
>  PCIUTILS_DEPENDENCIES += zlib
> @@ -33,7 +40,7 @@ else
>  PCIUTILS_SHARED=yes
>  endif
>  
> -PCIUTILS_MAKE_OPTS = \
> +PCIUTILS_MAKE_OPTS += \
>  	CC="$(TARGET_CC)" \
>  	HOST="$(KERNEL_ARCH)-linux" \
>  	OPT="$(TARGET_CFLAGS)" \

It's a little bit strange to have the unconditional PCIUTILS_MAKE_OPTS
after the conditional ones.

But it's also tied to the fact that for udev you've decided to add
HWDB=<foo> in PCIUTILS_MAKE_OPTS, while for the other dependencies,
they do PCIUTILS_ZLIB = <foo>, and then in PCIUTILS_MAKE_OPTS, they
have ZLIB=$(PCIUTILS_ZLIB).

So things are not very consistent right now. If you can send a
follow-up patch to make things a bit more consistent, it'd be great.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
