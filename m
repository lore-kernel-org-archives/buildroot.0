From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Nov 2015 08:00:53 +0100
Subject: [Buildroot] [PATCH] package/gauche: fix getcontext not solved
 error on link
In-Reply-To: <201511131005.tADA5pt9030611@ms-omx02.plus.so-net.ne.jp>
References: <201511131005.tADA5pt9030611@ms-omx02.plus.so-net.ne.jp>
Message-ID: <56497F25.4020100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13-11-15 11:05, Hiroshi Kawashima wrote:
> This patch is ported from bdwgc package.
> Gauche use internal boehm gc so it has same problem.
> 
> I touch configure directly instead of configure.ac because autoreconf
> failed by version mismatch of autotools.
> 
> Will fix:
> http://autobuild.buildroot.org/results/8c6/8c6ce526735a36b8c8b4c6047e3c69039c4527cb//
> http://autobuild.buildroot.org/results/894/89460829a737a4dab19103f7a46905636420b0a8//
> 
> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 However, ideally you should patch both configure.ac and configure, and also
send the patch upstream of course.

 Regards,
 Arnout

> ---
>  ...ac-add-check-for-NO_GETCONTEXT-definition.patch |   61 ++++++++++++++++++++
>  1 files changed, 61 insertions(+), 0 deletions(-)
>  create mode 100644 package/gauche/0002-gc-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
> 
> diff --git a/package/gauche/0002-gc-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch b/package/gauche/0002-gc-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
> new file mode 100644
> index 0000000..8940574
> --- /dev/null
> +++ b/package/gauche/0002-gc-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
> @@ -0,0 +1,61 @@
> +gc/configure.ac: add check for NO_GETCONTEXT definition
> +
> +This patch is ported from bdwgc package.
> +Gauche use internal boehm gc so it has same problem.
> +
> +I touch configure directly instead of configure.ac because autoreconf
> +failed by version mismatch of autotools.
> +
> +Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
> +
> +Original credits of patch in bdwgc package:
> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> +[yann.morin.1998 at free.fr: add a comment, change variable name, use
> + AS_IF, remove debug traces, use AC_CHECK_FUNCS (as suggested by
> + Thomas)]
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +
> +diff -ur a/gc/configure b/gc/configure
> +--- a/gc/configure	2015-11-12 21:41:02.394822056 +0900
> ++++ b/gc/configure	2015-11-12 22:04:14.655157423 +0900
> +@@ -16153,6 +16153,23 @@
> + $as_echo "$ac_cv_fno_strict_aliasing" >&6; }
> + fi
> + 
> ++# Check for getcontext (uClibc can be configured without it, for example)
> ++for ac_func in getcontext
> ++do :
> ++  ac_fn_c_check_func "$LINENO" "getcontext" "ac_cv_func_getcontext"
> ++if test "x$ac_cv_func_getcontext" = xyes; then :
> ++  cat >>confdefs.h <<_ACEOF
> ++#define HAVE_GETCONTEXT 1
> ++_ACEOF
> ++
> ++fi
> ++done
> ++
> ++if test "$ac_cv_func_getcontext" = "no"; then :
> ++  CFLAGS="$CFLAGS -DNO_GETCONTEXT"
> ++   CPPFLAGS="$CPPFLAGS -DNO_GETCONTEXT"
> ++fi
> ++
> + case "$host" in
> + # While IRIX 6 has libdl for the O32 and N32 ABIs, it's missing for N64
> + # and unnecessary everywhere.
> +diff -ur a/gc/configure.ac b/gc/configure.ac
> +--- a/gc/configure.ac	2015-11-12 22:31:44.851510997 +0900
> ++++ b/gc/configure.ac	2015-11-12 22:33:39.292191227 +0900
> +@@ -459,6 +459,12 @@
> +   AC_MSG_RESULT($ac_cv_fno_strict_aliasing)
> + fi
> + 
> ++# Check for getcontext (uClibc can be configured without it, for example)
> ++AC_CHECK_FUNCS([getcontext])
> ++AS_IF([test "$ac_cv_func_getcontext" = "no"],
> ++  [CFLAGS="$CFLAGS -DNO_GETCONTEXT"
> ++   CPPFLAGS="$CPPFLAGS -DNO_GETCONTEXT"])
> ++
> + case "$host" in
> + # While IRIX 6 has libdl for the O32 and N32 ABIs, it's missing for N64
> + # and unnecessary everywhere.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
