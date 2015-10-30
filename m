From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Oct 2015 13:51:16 +0100
Subject: [Buildroot] [PATCH v3 1/1] gauche: new package
In-Reply-To: <201510301149.t9UBnn0F032747@ms-omx03.plus.so-net.ne.jp>
References: <201510301149.t9UBnn0F032747@ms-omx03.plus.so-net.ne.jp>
Message-ID: <563367C4.40607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30-10-15 12:49, Hiroshi Kawashima wrote:
> Gauche is an R7RS Scheme implementation developed to be a handy script
> interpriter, which allows programmers and systemadministrators to write

 interpreter

> small to large scripts for their daily chores. Quick startup, built-in
> system interface, native multilingual support are some of my goals.

 my -> its

 Same comments for the help text, obviously.

> 
> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
> Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v2 -> v3
> - add comment to patch file why I touch configure directly instead of
>   configure.ac
> Changes v1 -> v2
> - change help description to written in project's web page.
> - add brief description and SoB in patch file.
> - change depens on BR2_TOOLCHAIN_HAS_THREADS -> 
>     BR2_TOOLCHAIN_HAS_THREADS_NPTL.
> - add brief description why "-std=gnu99" needed in GAUCHE_CONF_ENV.
> - add depends on BR2_ARCH_HAS_ATOMICS (Boehm gc need this).
> - add # fork() to 'depends on BR2_USE_MMU'.
> - remove empty comment line in hash file.
> - remove unnecessary GAUCHE_CONF_OPTS.
> ---
>  package/Config.in                       |  1 +
>  package/gauche/0001-fix-so-suffix.patch | 18 ++++++++++++++++++
>  package/gauche/Config.in                | 18 ++++++++++++++++++
>  package/gauche/gauche.hash              |  2 ++
>  package/gauche/gauche.mk                | 19 +++++++++++++++++++
>  5 files changed, 58 insertions(+)
>  create mode 100644 package/gauche/0001-fix-so-suffix.patch
>  create mode 100644 package/gauche/Config.in
>  create mode 100644 package/gauche/gauche.hash
>  create mode 100644 package/gauche/gauche.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 7392363..eb92ead 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -459,6 +459,7 @@ menu "Erlang libraries/modules"
>  	source "package/erlang-p1-zlib/Config.in"
>  endmenu
>  endif
> +	source "package/gauche/Config.in"
>  	source "package/guile/Config.in"
>  	source "package/haserl/Config.in"
>  	source "package/jamvm/Config.in"
> diff --git a/package/gauche/0001-fix-so-suffix.patch b/package/gauche/0001-fix-so-suffix.patch
> new file mode 100644
> index 0000000..1d8c2a5
> --- /dev/null
> +++ b/package/gauche/0001-fix-so-suffix.patch
> @@ -0,0 +1,18 @@
> +With uclibc configuration, $host does not match to '*-linux-gnu-*'.

 uclibc or musl. Oh, and it's gnu*, not gnu-*, otherwise ARM's gnueabi would
also not match.

> +I touch configure instead of configure.ac because autoreconf failed
> +by version mismatch of autotools.

 Then also include the fix for configure.ac in the same patch, and of course
please send the patch upstream so we don't have to carry it forever.

> +
> +Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
> +
> +diff -ur a/configure b/configure
> +--- a/configure	2014-07-20 15:15:05.000000000 +0900
> ++++ b/configure	2015-10-20 21:52:32.791442291 +0900
> +@@ -6843,7 +6843,7 @@
> +     SHLIB_MAIN_LDFLAGS=""
> +     SHLIB_OK=ok
> +     ;;
> +-  *-linux-gnu*|*-*-gnu*|*freebsd*|*dragonfly*)
> ++  *-linux-*|*-*-gnu*|*freebsd*|*dragonfly*)
> +     SHLIB_SO_CFLAGS="-fPIC"
> +     SHLIB_SO_LDFLAGS="$rpath -shared -o"
> +     SHLIB_SO_SUFFIX="so"
> diff --git a/package/gauche/Config.in b/package/gauche/Config.in
> new file mode 100644
> index 0000000..1074bc1
> --- /dev/null
> +++ b/package/gauche/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_GAUCHE
> +	bool "gauche"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_ARCH_HAS_ATOMICS
> +	help
> +	  Gauche is an R7RS Scheme implementation developed to be a
> +	  handy script interpriter, which allows programmers and
> +	  systemadministrators to write small to large scripts for their
> +	  daily chores. Quick startup, built-in system interface, native
> +	  multilingual support are some of my goals.
> +
> +	  http://practical-scheme.net/gauche/
> +
> +comment "gauche needs a toolchain w/ NPTL"
> +	depends on BR2_USE_MMU
> +	depends on BR2_ARCH_HAS_ATOMICS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
> diff --git a/package/gauche/gauche.hash b/package/gauche/gauche.hash
> new file mode 100644
> index 0000000..9ec106a
> --- /dev/null
> +++ b/package/gauche/gauche.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 7b18bcd70beaced1e004594be46c8cff95795318f6f5830dd2a8a700410fc149  Gauche-0.9.4.tgz
> diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
> new file mode 100644
> index 0000000..39ddfdc
> --- /dev/null
> +++ b/package/gauche/gauche.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# gauche
> +#
> +################################################################################
> +
> +GAUCHE_VERSION = 0.9.4
> +GAUCHE_SOURCE = Gauche-$(GAUCHE_VERSION).tgz
> +GAUCHE_SITE = http://prdownloads.sourceforge.net/gauche

 That will lead to the annoying sourceforge redirect page. Instead, point
directly to http://downloads.sourceforge.net/project/gauche/Gauche

> +GAUCHE_LICENSE = BSD

 BSD doesn't exist, it's BSD-4c, BSD-3c or BSD-2c. In this case, it's BSD-3c.

 Also, there's a bunch of other licenses mentioned in COPYING. Many of them are
BSD-3c, one of them is "You may do as you please" so that's included in BSD-3c,
and boehm-gc has its own license so call it Boehm-gc (couldn't find it on SPDX).
srfi-11.scm has a home-grown license we can call SRFI (also not found on SPDX),
and reload.scm has another home-grown license so we'll call it reload license.
Are the latter two files actually used (i.e., if you remove them, does it still
work)?

 In summary, it should be:

GAUCHE_LICENSE = BSD-3c, Boehm-gc, SRFI (srfi-11.scm), reload (reload.scm)


 Regards,
 Arnout

> +GAUCHE_LICENSE_FILES = COPYING
> +GAUCHE_DEPENDENCIES = host-gauche
> +
> +# Checking c99 support in configure fails without WCHAR. But we do not
> +# need WCHAR at gauche runtime, so explicitly specify here.
> +GAUCHE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
> +
> +$(eval $(host-autotools-package))
> +$(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
