From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Apr 2020 19:17:20 +0200
Subject: [Buildroot] [PATCH] package/cifs-utils: bump to version 6.10
In-Reply-To: <20200428141505.23883-1-ryanbarnett3@gmail.com>
References: <20200428141505.23883-1-ryanbarnett3@gmail.com>
Message-ID: <20200428171720.GF11346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, All,

On 2020-04-28 09:15 -0500, Ryan Barnett spake thusly:
> In the version bump to 6.10 the following changes were:
> 
>  * Fix hash file to two spaces format
>  * Add patch to respect DESTDIR and optionally install man pages for
>    mount.smb3 by utilizing CONFIG_MAN.
>  * Pass -std=c99 and -std=gnu11 to fix compile issues found with the
>    sourcery-arm toolchain with C99 style code errors in smbinfo.c and
>    defintion of 'struct sa' uisng gnu11 for C11 GNU extensions.
> 
> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
> index 511e9ccc01..d9d590342e 100644
> --- a/package/cifs-utils/cifs-utils.mk
> +++ b/package/cifs-utils/cifs-utils.mk
> @@ -4,12 +4,12 @@
>  #
>  ################################################################################
>  
> -CIFS_UTILS_VERSION = 6.9
> +CIFS_UTILS_VERSION = 6.10
>  CIFS_UTILS_SOURCE = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
>  CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
>  CIFS_UTILS_LICENSE = GPL-3.0+
>  CIFS_UTILS_LICENSE_FILES = COPYING
> -# Missing install-sh in release tarball
> +# Missing install-sh in release tarball and patching Makefile.am
>  CIFS_UTILS_AUTORECONF = YES
>  CIFS_UTILS_DEPENDENCIES = host-pkgconf
>  
> @@ -17,6 +17,9 @@ CIFS_UTILS_DEPENDENCIES = host-pkgconf
>  # the global BR2_RELRO_FULL option.
>  CIFS_UTILS_CONF_OPTS = --disable-pie --disable-man
>  
> +# uses C99 code in smbinfo.c but forgets to pass -std=c99 and c11 with mtab.c
> +CIFS_UTILS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99 -std=gnu11"

Doesn't the last -std value win over the previous ones? In that case,
gnu11 would win.

Care to check that, please?

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_PACKAGE_KEYUTILS),y)
>  CIFS_UTILS_DEPENDENCIES += keyutils
>  endif
> -- 
> 2.17.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
