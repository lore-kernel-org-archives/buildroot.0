From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 23 Mar 2015 21:58:19 +0100
Subject: [Buildroot] [PATCH v2] mc: new package
References: <1427143360-26369-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <XnsA466DF82DB83BberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Yegor Yefremov <yegorslists@googlemail.com> wrote
in news:1427143360-26369-1-git-send-email-yegorslists at googlemail.com: 

> --- /dev/null
> +++ b/package/mc/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_MC
> +     bool "mc"
> +     depends on BR2_USE_WCHAR # libglib2
> +     depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +     depends on BR2_USE_MMU # libglib2, slang
> +     select BR2_PACKAGE_LIBGLIB2
> +     # mc prefers slang, but can use ncurses too
> +     select BR2_PACKAGE_SLANG if !BR2_PACKAGE_NCURSES
> +     help
> +       GNU Midnight Commander is a visual file manager, licensed under
> +       GNU General Public License. It can use either SLang(preferred)
> +       or ncurses for screen handling; if neither is enabled SLang
> +       will be automatically chosen.
> +
> +       https://www.midnight-commander.org/

please drop the trailing slash in the URL and add

comment "mc needs a toolchain w/ threads, wchar"
        depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
        depends on BR2_USE_MMU

> diff --git a/package/mc/mc.hash b/package/mc/mc.hash
> new file mode 100644
> index 0000000..5d14f5a
> --- /dev/null
> +++ b/package/mc/mc.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:

please refer to this upstream file:
http://ftp.midnight-commander.org/mc-4.8.14.sha256

> +sha256 
> 61fd0fd2280c3d09d7e0aec8ab001fc89dad8e4fd9941f386414667b55152ec5 
> mc-4.8.14.tar.bz2 diff --git a/package/mc/mc.mk b/package/mc/mc.mk
> new file mode 100644
> index 0000000..dd74d0c
> --- /dev/null
> +++ b/package/mc/mc.mk
> @@ -0,0 +1,26 @@
> +########################################################################
> ######## +#
> +# mc
> +#
> +########################################################################
> ######## +
> +MC_VERSION = 4.8.14
> +MC_SOURCE = mc-$(MC_VERSION).tar.bz2
> +MC_SITE = http://ftp.midnight-commander.org
> +MC_LICENSE =  GPLv3
> +MC_LICENSE_FILES = COPYING
> +MC_INSTALL_STAGING = YES

Which package needs files installed by mc in staging? Imho you can drop
that line. The rest looks good, but I did not yet compile your package. 

Therefore the rest should be seen as a comment for your inspiration ;) The
fli4l (fli4l.de) project, which is based on buildroot, also contains its
own mc package which I am using pretty often. It uses additional
CONF_OPTS: --without-gpm-mouse --without-subshell --without-x 

and some CONV_ENV magic: fu_cv_sys_stat_statfs2_bsize=yes
ac_cv_func_mmap_fixed_mapped=yes ac_cv_func_strcoll_works=yes 

and these depends:
host-bison
$(if $(BR2_PACKAGE_LIBICONV),libiconv)
$(if $(BR2_NEEDS_GETTEXT),gettext)

Regards, Bernd
