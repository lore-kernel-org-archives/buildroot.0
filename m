From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 12 Nov 2014 18:04:44 +0300
Subject: [Buildroot] [PATCH] uclibc: enable UCLIBC_HAS_STRING_GENERIC_OPT in
	all configs
Message-ID: <1415804684-17297-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Description in uClibc for this optoin is:
--->---
bool "Use faster (but larger) generic string functions"
	default y
	help
	  Answer Y to use the (tweaked) glibc generic string functions.

	  In general, they are faster (but 3-5K larger) than the base
	  uClibc string functions which are optimized solely for size.

	  Many people will answer Y.
--->---

Additional 3-5K of size is not that important if resulting libuClibc.so is
of size about 300k.

But benefits in terms of performance could be pretty significant.

For example on ARC in LMbench we see more than 3 times bump in some tests
--->---
libc bcopy unaligned
...
8.39 - 6.76  (UCLIBC_HAS_STRING_GENERIC_OPT=no)
8.39 - 23.86 (UCLIBC_HAS_STRING_GENERIC_OPT=yes)
--->---

Also since the option in question is default in uClibc I don't expect if
enabled back (it was silently disabled in http://git.buildroot.net/buildroot/commit/?id=cfbf8abc33d86a0cf5c1bb3e0817a22009b7f301 on introduction of NPTL in uClibc
by Khem Raj) it to introduce problems.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <anton.kolesov@synopsys.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Khem Raj <raj.khem@gmail.com>
---
 package/uclibc/uClibc-0.9.31.config   | 2 +-
 package/uclibc/uClibc-0.9.33.config   | 2 +-
 package/uclibc/uClibc-snapshot.config | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uClibc-0.9.31.config b/package/uclibc/uClibc-0.9.31.config
index 76772e8..83df7d0 100644
--- a/package/uclibc/uClibc-0.9.31.config
+++ b/package/uclibc/uClibc-0.9.31.config
@@ -144,7 +144,7 @@ UCLIBC_HAS_LIBNSL_STUB=y
 #
 # String and Stdio Support
 #
-# UCLIBC_HAS_STRING_GENERIC_OPT is not set
+UCLIBC_HAS_STRING_GENERIC_OPT=y
 UCLIBC_HAS_STRING_ARCH_OPT=y
 UCLIBC_HAS_CTYPE_TABLES=y
 UCLIBC_HAS_CTYPE_SIGNED=y
diff --git a/package/uclibc/uClibc-0.9.33.config b/package/uclibc/uClibc-0.9.33.config
index 1b07d4a..88dc7fa 100644
--- a/package/uclibc/uClibc-0.9.33.config
+++ b/package/uclibc/uClibc-0.9.33.config
@@ -178,7 +178,7 @@ UCLIBC_HAS_LIBNSL_STUB=y
 #
 # String and Stdio Support
 #
-# UCLIBC_HAS_STRING_GENERIC_OPT is not set
+UCLIBC_HAS_STRING_GENERIC_OPT=y
 UCLIBC_HAS_STRING_ARCH_OPT=y
 UCLIBC_HAS_CTYPE_TABLES=y
 UCLIBC_HAS_CTYPE_SIGNED=y
diff --git a/package/uclibc/uClibc-snapshot.config b/package/uclibc/uClibc-snapshot.config
index ffc1535..1f04561 100644
--- a/package/uclibc/uClibc-snapshot.config
+++ b/package/uclibc/uClibc-snapshot.config
@@ -183,7 +183,7 @@ UCLIBC_HAS_LIBNSL_STUB=y
 #
 # String and Stdio Support
 #
-# UCLIBC_HAS_STRING_GENERIC_OPT is not set
+UCLIBC_HAS_STRING_GENERIC_OPT=y
 UCLIBC_HAS_STRING_ARCH_OPT=y
 UCLIBC_HAS_CTYPE_TABLES=y
 UCLIBC_HAS_CTYPE_SIGNED=y
-- 
1.9.3
