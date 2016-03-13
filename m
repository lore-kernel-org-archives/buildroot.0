From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 14 Mar 2016 00:08:06 +0100
Subject: [Buildroot] [PATCH] uclibc: update uClibc-ng to latest release
Message-ID: <20160313230806.GA3186@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patches included upstream.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...e-netdb.h-Do-not-define-IDN-related-flags.patch | 54 --------------------
 ...02-mips-fix-build-if-threads-are-disabled.patch | 59 ----------------------
 package/uclibc/uclibc.hash                         |  2 +-
 package/uclibc/uclibc.mk                           |  2 +-
 4 files changed, 2 insertions(+), 115 deletions(-)
 delete mode 100644 package/uclibc/0001-include-netdb.h-Do-not-define-IDN-related-flags.patch
 delete mode 100644 package/uclibc/0002-mips-fix-build-if-threads-are-disabled.patch

diff --git a/package/uclibc/0001-include-netdb.h-Do-not-define-IDN-related-flags.patch b/package/uclibc/0001-include-netdb.h-Do-not-define-IDN-related-flags.patch
deleted file mode 100644
index c1985ef..0000000
--- a/package/uclibc/0001-include-netdb.h-Do-not-define-IDN-related-flags.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 5e9a78c8a839381add6faa61e196e6dad9143163 Mon Sep 17 00:00:00 2001
-From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
-Date: Tue, 2 Feb 2016 12:13:09 +0100
-Subject: [PATCH] include/netdb.h: Do not define IDN-related flags.
-
-getaddrinfo() does not implement IDN encoding, and always fail when
-provided an IDN flag (e.g., AI_IDN) with EAI_BADFLAGS.  Some packages
-(such as the VLC media player) check for AI_IDN before they use it;
-providing an unimplemented AI_IDN in the libc makes these package
-fail.  As a result they make calls to getaddrinfo() with AI_IDN that
-always fail while they could have made successful calls without AI_IDN
-instead.
-
-Thus, do not define IDN flags: it is better not to compile rather than
-to compile a code that always fail.
-
-Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
----
- include/netdb.h |   11 -----------
- 1 file changed, 11 deletions(-)
-
-diff --git a/include/netdb.h b/include/netdb.h
-index a636b5f..95abe95 100644
---- a/include/netdb.h
-+++ b/include/netdb.h
-@@ -627,16 +627,6 @@ struct addrinfo
- # define AI_ALL		0x0010	/* Return IPv4 mapped and IPv6 addresses.  */
- # define AI_ADDRCONFIG	0x0020	/* Use configuration of this host to choose
- 				   returned address type..  */
--# ifdef __USE_GNU
--#  define AI_IDN	0x0040	/* IDN encode input (assuming it is encoded
--				   in the current locale's character set)
--				   before looking it up. */
--#  define AI_CANONIDN	0x0080	/* Translate canonical name from IDN format. */
--#  define AI_IDN_ALLOW_UNASSIGNED 0x0100 /* Don't reject unassigned Unicode
--					    code points.  */
--#  define AI_IDN_USE_STD3_ASCII_RULES 0x0200 /* Validate strings according to
--						STD3 rules.  */
--# endif
- # define AI_NUMERICSERV	0x0400	/* Don't use name resolution.  */
- 
- /* Error values for `getaddrinfo' function.  */
-@@ -658,7 +648,6 @@ struct addrinfo
- #  define EAI_NOTCANCELED -102	/* Request not canceled.  */
- #  define EAI_ALLDONE	  -103	/* All requests done.  */
- #  define EAI_INTR	  -104	/* Interrupted by a signal.  */
--#  define EAI_IDN_ENCODE  -105	/* IDN encoding failed.  */
- # endif
- 
- # ifdef __USE_MISC
--- 
-1.7.10.4
-
diff --git a/package/uclibc/0002-mips-fix-build-if-threads-are-disabled.patch b/package/uclibc/0002-mips-fix-build-if-threads-are-disabled.patch
deleted file mode 100644
index a74a5f9..0000000
--- a/package/uclibc/0002-mips-fix-build-if-threads-are-disabled.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From b499fe614ac5b492fc0fdc6e1fbbeeb904674159 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@uclibc-ng.org>
-Date: Wed, 3 Feb 2016 21:57:04 +0100
-Subject: [PATCH] mips: fix build if threads are disabled
-
-Reported-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
----
- libc/string/mips/memcpy.S |    4 ++--
- libc/string/mips/memset.S |    4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/libc/string/mips/memcpy.S b/libc/string/mips/memcpy.S
-index 3afdb2c..59f9f0a 100644
---- a/libc/string/mips/memcpy.S
-+++ b/libc/string/mips/memcpy.S
-@@ -23,7 +23,7 @@
- # define PREFETCH_STORE_HINT PREFETCH_HINT_PREPAREFORSTORE
- #elif _LIBC
- # include <sysdep.h>
--# include <regdef.h>
-+# include <sys/regdef.h>
- # include <sys/asm.h>
- # define PREFETCH_LOAD_HINT PREFETCH_HINT_LOAD_STREAMED
- # define PREFETCH_STORE_HINT PREFETCH_HINT_PREPAREFORSTORE
-@@ -33,7 +33,7 @@
- # define PREFETCH_LOAD_HINT PREFETCH_HINT_LOAD_STREAMED
- # define PREFETCH_STORE_HINT PREFETCH_HINT_PREPAREFORSTORE
- #else
--# include <regdef.h>
-+# include <sys/regdef.h>
- # include <sys/asm.h>
- #endif
- 
-diff --git a/libc/string/mips/memset.S b/libc/string/mips/memset.S
-index ef8ab0b..43034ce 100644
---- a/libc/string/mips/memset.S
-+++ b/libc/string/mips/memset.S
-@@ -21,7 +21,7 @@
- # define PREFETCH_STORE_HINT PREFETCH_HINT_PREPAREFORSTORE
- #elif _LIBC
- # include <sysdep.h>
--# include <regdef.h>
-+# include <sys/regdef.h>
- # include <sys/asm.h>
- # define PREFETCH_STORE_HINT PREFETCH_HINT_PREPAREFORSTORE
- #elif defined _COMPILING_NEWLIB
-@@ -29,7 +29,7 @@
- # include "machine/regdef.h"
- # define PREFETCH_STORE_HINT PREFETCH_HINT_PREPAREFORSTORE
- #else
--# include <regdef.h>
-+# include <sys/regdef.h>
- # include <sys/asm.h>
- #endif
- 
--- 
-1.7.10.4
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 1290f92..b700406 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,2 +1,2 @@
 # From http://www.uclibc-ng.org/
-sha256  c238b300356b2638432e023076293f29935094108a2714ad1762b76015fae729        uClibc-ng-1.0.12.tar.xz
+sha256  7baae61e243da3ab85e219fead68406995be5eabf889001c0d41676546b19317        uClibc-ng-1.0.13.tar.xz
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 200de04..88a4a8c 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.12
+UCLIBC_VERSION = 1.0.13
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPLv2.1+
-- 
2.1.4
