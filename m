From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Mar 2021 21:54:23 +0100
Subject: [Buildroot] [PATCH] uclibc-ng-test: update to latest
In-Reply-To: <20210227180439.GA12945@waldemar-brodkorb.de>
References: <20210227180439.GA12945@waldemar-brodkorb.de>
Message-ID: <20210302205423.GH2275@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar, All,

On 2021-02-27 19:04 +0100, Waldemar Brodkorb spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/877879987f7adea0fa239e879b056c248968b1e9
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...0001-add-nios2-tls-macros-from-glibc.patch | 84 -------------------
>  package/uclibc-ng-test/uclibc-ng-test.hash    |  2 +-
>  package/uclibc-ng-test/uclibc-ng-test.mk      |  2 +-
>  3 files changed, 2 insertions(+), 86 deletions(-)
>  delete mode 100644 package/uclibc-ng-test/0001-add-nios2-tls-macros-from-glibc.patch
> 
> diff --git a/package/uclibc-ng-test/0001-add-nios2-tls-macros-from-glibc.patch b/package/uclibc-ng-test/0001-add-nios2-tls-macros-from-glibc.patch
> deleted file mode 100644
> index 574d10c1b8..0000000000
> --- a/package/uclibc-ng-test/0001-add-nios2-tls-macros-from-glibc.patch
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -From bf6fcd59d1ff51584a703b1d78c9e8fd4f808917 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sat, 28 Nov 2020 11:44:00 +0100
> -Subject: [PATCH] add nios2 tls macros from glibc
> -
> -Retrieved from
> -https://github.com/bminor/glibc/blob/master/sysdeps/nios2/tls-macros.h
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Retrieved from:
> -https://github.com/wbx-github/uclibc-ng-test/commit/bf6fcd59d1ff51584a703b1d78c9e8fd4f808917]
> ----
> - test/tls/tls-macros-nios2.h | 46 +++++++++++++++++++++++++++++++++++++
> - test/tls/tls-macros.h       |  4 ++++
> - 2 files changed, 50 insertions(+)
> - create mode 100644 test/tls/tls-macros-nios2.h
> -
> -diff --git a/test/tls/tls-macros-nios2.h b/test/tls/tls-macros-nios2.h
> -new file mode 100644
> -index 0000000..7029530
> ---- /dev/null
> -+++ b/test/tls/tls-macros-nios2.h
> -@@ -0,0 +1,46 @@
> -+#define TLS_LE(x)					\
> -+  ({ int *__result;					\
> -+     asm ("addi %0, r23, %%tls_le(" #x ")"		\
> -+	  : "=r" (__result));		                \
> -+     __result; })
> -+
> -+#define TLS_IE(x)					\
> -+  ({ int *__result;					\
> -+     int __tmp;                                         \
> -+     asm ("nextpc %0 ; "                                \
> -+          "1: movhi %1, %%hiadj(_gp_got - 1b) ; "	\
> -+          "addi %1, %1, %%lo(_gp_got - 1b) ; "		\
> -+          "add %0, %0, %1 ; "                           \
> -+          "ldw %1, %%tls_ie(" #x ")(%0) ; "        	\
> -+	  "add %1, r23, %1"              		\
> -+          : "=&r" (__tmp), "=&r" (__result));           \
> -+     __result; })
> -+
> -+#define TLS_LD(x)					\
> -+  ({ char *__result;					\
> -+     char *__result2;                                   \
> -+     int *__result3;                                    \
> -+     int __tmp;                                         \
> -+     extern void *__tls_get_addr (void *);		\
> -+     asm ("nextpc %0 ; "                                \
> -+          "1: movhi %1, %%hiadj(_gp_got - 1b) ; "	\
> -+          "addi %1, %1, %%lo(_gp_got - 1b) ; "		\
> -+          "add %0, %0, %1 ; "                           \
> -+          "addi %0, %0, %%tls_ldm(" #x ")"              \
> -+          : "=r" (__result), "=r" (__tmp));             \
> -+     __result2 = (char *)__tls_get_addr (__result);	\
> -+     asm ("addi %0, %1, %%tls_ldo(" #x ")"              \
> -+	  : "=r" (__result3) : "r" (__result2));        \
> -+     __result3; })
> -+
> -+#define TLS_GD(x)					\
> -+  ({ int *__result;					\
> -+     int __tmp;                                         \
> -+     extern void *__tls_get_addr (void *);		\
> -+     asm ("nextpc %0 ; "                                \
> -+          "1: movhi %1, %%hiadj(_gp_got - 1b) ; "	\
> -+          "addi %1, %1, %%lo(_gp_got - 1b) ; "		\
> -+          "add %0, %0, %1 ; "                           \
> -+          "addi %0, %0, %%tls_gd(" #x ")"		\
> -+	  : "=r" (__result), "=r" (__tmp));		\
> -+     (int *)__tls_get_addr (__result); })
> -diff --git a/test/tls/tls-macros.h b/test/tls/tls-macros.h
> -index 4a4e916..087b365 100644
> ---- a/test/tls/tls-macros.h
> -+++ b/test/tls/tls-macros.h
> -@@ -64,6 +64,10 @@
> - #include <tls-macros-mips.h>
> - #endif
> - 
> -+#ifdef __nios2__
> -+#include <tls-macros-nios2.h>
> -+#endif
> -+
> - #if defined(__powerpc__) && !defined(__powerpc64__)
> - #include <tls-macros-powerpc.h>
> - #endif
> diff --git a/package/uclibc-ng-test/uclibc-ng-test.hash b/package/uclibc-ng-test/uclibc-ng-test.hash
> index 796f1dbced..37660b04c3 100644
> --- a/package/uclibc-ng-test/uclibc-ng-test.hash
> +++ b/package/uclibc-ng-test/uclibc-ng-test.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  ece0cb910ce649601e4dec42572c2871c3c58cff1be5c94e8e91816dce5793ba  uclibc-ng-test-c64d6ac77f0e745c70e76024212c72e4bbe2091a-br1.tar.gz
> +sha256  f731307c0547ce4bbd3f5025972f64e9b22208a147e34e5745000b54d4d3aa98  uclibc-ng-test-0844445e7358eb10e716155b55b0fb23e88d644a-br1.tar.gz
>  sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
> diff --git a/package/uclibc-ng-test/uclibc-ng-test.mk b/package/uclibc-ng-test/uclibc-ng-test.mk
> index 9f866f5d71..ea5f224219 100644
> --- a/package/uclibc-ng-test/uclibc-ng-test.mk
> +++ b/package/uclibc-ng-test/uclibc-ng-test.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -UCLIBC_NG_TEST_VERSION = c64d6ac77f0e745c70e76024212c72e4bbe2091a
> +UCLIBC_NG_TEST_VERSION = 0844445e7358eb10e716155b55b0fb23e88d644a
>  UCLIBC_NG_TEST_SITE = git://uclibc-ng.org/git/uclibc-ng-test
>  UCLIBC_NG_TEST_LICENSE = LGPL-2.1+
>  UCLIBC_NG_TEST_LICENSE_FILES = COPYING.LIB
> -- 
> 2.20.1
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
