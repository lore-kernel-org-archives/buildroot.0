From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Oct 2013 18:11:15 +0100
Subject: [Buildroot] [PATCH v2 1/1] valgrind: add support for glibc 2.17
 and 2.18
In-Reply-To: <1382953647-10451-1-git-send-email-phil@zankapfel.net>
References: <1382953647-10451-1-git-send-email-phil@zankapfel.net>
Message-ID: <526FEC33.8070100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/10/13 10:47, Phil Eichinger wrote:
> Fixes: http://autobuild.buildroot.net/results/f086e65aca220bc9a5869f8fc8c1dca4d87ada7d/
>
> Signed-off-by: Phil Eichinger <phil@zankapfel.net>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (untested, but obviously correct and I assume Phil tested it)

  Regards,
  Arnout

> ---
> Changes from v1:
> * added reference to upstream revisions in patch
> * fixed commit log
>
>   ...grind-add-support-for-glibc-2.17-and-2.18.patch |   50 ++++++++++++++++++++
>   package/valgrind/valgrind.mk                       |    2 +-
>   2 files changed, 51 insertions(+), 1 deletion(-)
>   create mode 100644 package/valgrind/valgrind-add-support-for-glibc-2.17-and-2.18.patch
>
> diff --git a/package/valgrind/valgrind-add-support-for-glibc-2.17-and-2.18.patch b/package/valgrind/valgrind-add-support-for-glibc-2.17-and-2.18.patch
> new file mode 100644
> index 0000000..c07dda2
> --- /dev/null
> +++ b/package/valgrind/valgrind-add-support-for-glibc-2.17-and-2.18.patch
> @@ -0,0 +1,50 @@
> +From bca21896dbdba12963aa7991d7f1b732b6a709a8 Mon Sep 17 00:00:00 2001
> +From: Phil Eichinger <phil@zankapfel.net>
> +Date: Wed, 23 Oct 2013 18:28:15 +0200
> +Subject: [PATCH 1/1] Add support for glibc 2.17 and 2.18.
> +
> +
> +Signed-off-by: Phil Eichinger <phil@zankapfel.net>
> +---
> +Status: fixed in upstream r13228 & r13504, not yet released.
> +
> + configure.in |   16 +++++++++++++++-
> + 1 file changed, 15 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.in b/configure.in
> +index 1da3a2c..ccc60a0 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -906,6 +906,20 @@ case "${GLIBC_VERSION}" in
> + 	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
> + 	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
> + 	;;
> ++     2.17)
> ++	AC_MSG_RESULT(2.17 family)
> ++	AC_DEFINE([GLIBC_2_17], 1, [Define to 1 if you're using glibc 2.17.x])
> ++	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
> ++	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
> ++	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
> ++	;;
> ++     2.18)
> ++	AC_MSG_RESULT(2.18 family)
> ++	AC_DEFINE([GLIBC_2_18], 1, [Define to 1 if you're using glibc 2.18.x])
> ++	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
> ++	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
> ++	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
> ++	;;
> +      darwin)
> + 	AC_MSG_RESULT(Darwin)
> + 	AC_DEFINE([DARWIN_LIBC], 1, [Define to 1 if you're using Darwin])
> +@@ -919,7 +933,7 @@ case "${GLIBC_VERSION}" in
> +
> +      *)
> + 	AC_MSG_RESULT([unsupported version ${GLIBC_VERSION}])
> +-	AC_MSG_ERROR([Valgrind requires glibc version 2.2 - 2.16])
> ++	AC_MSG_ERROR([Valgrind requires glibc version 2.2 - 2.18])
> + 	AC_MSG_ERROR([or Darwin libc])
> + 	;;
> + esac
> +--
> +1.7.10.4
> +
> diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
> index f40784e..953f929 100644
> --- a/package/valgrind/valgrind.mk
> +++ b/package/valgrind/valgrind.mk
> @@ -9,7 +9,7 @@ VALGRIND_SITE    = http://valgrind.org/downloads/
>   VALGRIND_SOURCE  = valgrind-$(VALGRIND_VERSION).tar.bz2
>   VALGRIND_LICENSE = GPLv2 GFDLv1.2
>   VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
> -
> +VALGRIND_AUTORECONF = YES
>   VALGRIND_CONF_OPT = --disable-tls
>
>   # On ARM, Valgrind only supports ARMv7, and uses the arch part of the
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
