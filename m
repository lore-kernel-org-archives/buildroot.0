From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Dec 2014 22:18:15 +0100
Subject: [Buildroot] [PATCH v2 3/4] libfm: new package
In-Reply-To: <1416583990-35169-3-git-send-email-Vincent.Riera@imgtec.com>
References: <1416583990-35169-1-git-send-email-Vincent.Riera@imgtec.com>
 <1416583990-35169-3-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141210211815.GH3926@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

vicente, All,

On 2014-11-21 15:33 +0000, Vicente Olivert Riera spake thusly:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
[--SNIP--]
> diff --git a/package/libfm/Config.in b/package/libfm/Config.in
> new file mode 100644
> index 0000000..51cdd4e
> --- /dev/null
> +++ b/package/libfm/Config.in
> @@ -0,0 +1,27 @@
> +config BR2_PACKAGE_LIBFM
> +	bool "libfm"
> +	select BR2_PACKAGE_MENU_CACHE
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_LIBGTK2
> +	select BR2_PACKAGE_CAIRO
> +	select BR2_PACKAGE_XORG7 # libgtk2

I know we said on IRC "The rule is that there is no rule" but I would
prefer this be a depends rather than a select.

We currently have no package that select Xorg, which would seem to mean
we do have an unwritten rule to not select Xorg. ;-)

> +	depends on BR2_USE_WCHAR # libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +	depends on BR2_USE_MMU # libglib2
> +	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
> +	depends on BR2_ARCH_HAS_ATOMICS # libgtk2
> +	help
> +	  A glib/gio-based library providing some file management utilities and
> +	  related-widgets missing in gtk+/glib. This is the core of PCManFM.
> +	  The library is desktop independent (not LXDE specific) and has clean
> +	  API. It can be used to develop other applications requiring file
> +	  management functionality. For example, you can create your own file
> +	  manager with facilities provided by libfm.
> +
> +	  http://wiki.lxde.org/en/Libfm
> +
> +comment "libfm needs a toolchain w/ wchar, threads, C++"
> +	depends on BR2_USE_MMU
> +	depends on BR2_ARCH_HAS_ATOMICS

So:

    comment "libfm needs X.Org and a toolchain w/ wchar, threads, C++"

and appropriate dependencies.

> +	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libfm/libfm.hash b/package/libfm/libfm.hash
> new file mode 100644
> index 0000000..5311dec
> --- /dev/null
> +++ b/package/libfm/libfm.hash
> @@ -0,0 +1,2 @@
> +# From http://blog.lxde.org/?p=1280
> +sha1  c3f2f34086761d89d6aba549883610084ba00750  libfm-1.2.3.tar.xz
> diff --git a/package/libfm/libfm.mk b/package/libfm/libfm.mk
> new file mode 100644
> index 0000000..b498a5d
> --- /dev/null
> +++ b/package/libfm/libfm.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# libfm
> +#
> +################################################################################
> +
> +LIBFM_VERSION = 1.2.3
> +LIBFM_SOURCE = libfm-$(LIBFM_VERSION).tar.xz
> +LIBFM_SITE = http://sourceforge.net/projects/pcmanfm/files
> +LIBFM_DEPENDENCIES = menu-cache libgtk2 libglib2 cairo
> +LIBFM_LICENSE = GPLv2

Same comment as for libfm-extra (since it's the same package): it is
also partly LGPLV2.1+.

> +LIBFM_LICENSE_FILES = COPYING

But then, I don't see any extra file we could add in there... :-/
Maybe the same as for libfm-extra? Or just src/fm.h ?

Regards,
Yann E. MORIN.

> +LIBFM_INSTALL_STAGING = YES
> +
> +$(eval $(autotools-package))
> -- 
> 1.7.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
