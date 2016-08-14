From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Aug 2016 22:26:34 +0200
Subject: [Buildroot] [PATCH 1/2] package/lldpd: disable use of libbsd
In-Reply-To: <1471171604-16162-1-git-send-email-yann.morin.1998@free.fr>
References: <1471171604-16162-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <6630fdd7-e057-3ef9-af57-4368ffec2fd0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14-08-16 12:46, Yann E. MORIN wrote:
> libbsd installs .pc files that contain -isystem /usr/include/bsd, but

 Actually, only libbsd-overlay.pc does that.

> -isystem is not munged by pkg-config, so we end up using /usr/include/bsd

 I'm not sure what pkg-config does, I can only say that it's not munged by pkgconf.

> which are not suitable for the target. And breaks big time (see
> failures, below).
> 
> But using libbsd is completely optional. In fact, our lldpd.mk did not
> even express the dependency on libbsd, so we may well have had builds
> without libbsd.
> 
> The functionality brought in by using libbsd is very minor, so we just

 It would be nice to mention _what_ functionality it brings.

> make lldpd not use libbsd at all. There is no --disable-libbsd or such,
> so we just patch it out of configure.ac.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/6b7/6b70fa379e834ec71cc260ba6af771b531ca3511/
>     http://autobuild.buildroot.org/results/769/769074c4bb67336ae6679f2c1cd2a8220d2bec24/
>     http://autobuild.buildroot.org/results/c8a/c8a6001f437701ecc75f6c9252935645bda8a8c8/
>     [...]
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>

 Note that this fix leaves any other users of libbsd out to dry. However, we
only have netcat-openbsd and libedit at the moment that declare a dependency on
libbsd, and these don't use libbsd-overlay, so it seems to be OK.


> ---
>  .../0002-configure-do-not-check-for-libbsd.patch   | 62 ++++++++++++++++++++++
>  package/lldpd/lldpd.mk                             |  2 +-
>  2 files changed, 63 insertions(+), 1 deletion(-)
>  create mode 100644 package/lldpd/0002-configure-do-not-check-for-libbsd.patch
> 
> diff --git a/package/lldpd/0002-configure-do-not-check-for-libbsd.patch b/package/lldpd/0002-configure-do-not-check-for-libbsd.patch
> new file mode 100644
> index 0000000..b89b442
> --- /dev/null
> +++ b/package/lldpd/0002-configure-do-not-check-for-libbsd.patch
> @@ -0,0 +1,62 @@
> +From 0801a066cd4a24a858ddfa7c62c7802e0f5533a8 Mon Sep 17 00:00:00 2001
> +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Date: Sun, 14 Aug 2016 12:15:17 +0200
> +Subject: [PATCH] configure: do not check for libbsd
> +
> +libbsd causes build issues because it .pc file is borked: it contains

 libbsd -> libbsd-overlay
 it -> its

> +-isystem in CFLAGS, which is not munged by pkg-config, so we end up
> +using the headers of the build machine, causing all sorts of hard to
> +debug trouble at build time.
> +
> +lldpd uses libbsd to a few helper functions, but has fallback in case

 to -> for
 fallback -> fallbacks

> +libbsd is not available. The only feature that is lost when not using
> +libbsd is that the neighbour name is no longer displayed in the
> +/proc/self/cmdline. As the author of lldpd said on IRC: "people should
> +survive! ;-)"
> +
> +So we just remove the detection of libbsd altogether.
> +
> +Fixes:
> +    http://autobuild.buildroot.org/results/6b7/6b70fa379e834ec71cc260ba6af771b531ca3511/
> +    http://autobuild.buildroot.org/results/769/769074c4bb67336ae6679f2c1cd2a8220d2bec24/
> +    http://autobuild.buildroot.org/results/c8a/c8a6001f437701ecc75f6c9252935645bda8a8c8/
> +    [...]
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +---
> + configure.ac | 19 -------------------
> + 1 file changed, 19 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index dd723b0..45498ce 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -165,25 +165,6 @@ AC_FUNC_MALLOC
> + AC_FUNC_REALLOC
> + AC_FUNC_FORK
> + 
> +-# Some functions can be in libbsd
> +-PKG_CHECK_MODULES([libbsd], [libbsd-overlay], [
> +-  _save_CFLAGS="$CFLAGS"
> +-  _save_LIBS="$LIBS"
> +-  CFLAGS="$CFLAGS $libbsd_CFLAGS"
> +-  LIBS="$LIBS $libbsd_LIBS"
> +-  AC_MSG_CHECKING([if libbsd can be linked correctly])
> +-  AC_LINK_IFELSE([AC_LANG_SOURCE([[int main() { return 0; }]])],
> +-    [
> +-      AC_MSG_RESULT(yes)
> +-      LLDP_CFLAGS="$LLDP_CFLAGS $libbsd_CFLAGS"
> +-      LLDP_LDFLAGS="$LLDP_LDFLAGS $libbsd_LIBS"
> +-    ],[
> +-      AC_MSG_RESULT(no)
> +-      CFLAGS="$_save_CFLAGS"
> +-      LIBS="$_save_LIBS"
> +-    ])
> +-], [:])
> +-
> + # setproctitle may have an _init function
> + AC_REPLACE_FUNCS([setproctitle])
> + AC_CHECK_FUNCS([setproctitle_init])
> +-- 
> +2.7.4
> +
> diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
> index 924f2db..008d4bf 100644
> --- a/package/lldpd/lldpd.mk
> +++ b/package/lldpd/lldpd.mk
> @@ -9,7 +9,7 @@ LLDPD_SITE = http://media.luffy.cx/files/lldpd
>  LLDPD_DEPENDENCIES = host-pkgconf libevent
>  LLDPD_LICENSE = ISC
>  LLDPD_LICENSE_FILES = README.md
> -# 0001-build-make-generation-of-atom-glue-compatible-with-o.patch
> +# Touching configure.ac and Makefile.am in our patches:

 I actually find it quite convenient if the comment states which patch(es) touch
the autotools files, but ATM we don't do that very often, so OK.

 Only spelling mistakes so

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

>  LLDPD_AUTORECONF = YES
>  
>  # Detection of c99 support in configure fails without WCHAR. To enable
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
