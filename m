From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Jan 2017 13:33:14 -0300
Subject: [Buildroot] [PATCH] flac: bump to version 1.3.2
Message-ID: <20170103163314.12459-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And delete upstream patches.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...onfigure-don-t-try-to-unset-g-from-CFLAGS.patch | 27 ----------------------
 package/flac/0002-sigemptyset.patch                | 18 ---------------
 package/flac/flac.hash                             |  2 +-
 package/flac/flac.mk                               |  2 +-
 4 files changed, 2 insertions(+), 47 deletions(-)
 delete mode 100644 package/flac/0001-configure-don-t-try-to-unset-g-from-CFLAGS.patch
 delete mode 100644 package/flac/0002-sigemptyset.patch

diff --git a/package/flac/0001-configure-don-t-try-to-unset-g-from-CFLAGS.patch b/package/flac/0001-configure-don-t-try-to-unset-g-from-CFLAGS.patch
deleted file mode 100644
index 3aff5a8..0000000
--- a/package/flac/0001-configure-don-t-try-to-unset-g-from-CFLAGS.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-The sed expression is wrong, any flags with '-g' in any position gets
-zapped, for example:
-
--mfloat-gprs=double (for powerpc e500) -> -mfloatprs=double.
-
-Which gives build errors and is perfectly valid in real use scenarios to
-switch from e500v1 (single precision) code to e500v2 (double precision) code.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura flac-1.3.1.orig/configure flac-1.3.1/configure
---- flac-1.3.1.orig/configure	2014-11-27 20:43:29.921303105 -0300
-+++ flac-1.3.1/configure	2014-11-27 20:45:33.460250179 -0300
-@@ -19870,11 +19870,10 @@
- 
- if test "x$debug" = xtrue; then
- 	CPPFLAGS="-DDEBUG $CPPFLAGS"
--	CFLAGS=$(echo "$CFLAGS" | sed 's/-g//')
--	CFLAGS="-g $CFLAGS"
-+	CFLAGS=$(echo "-g $CFLAGS")
- else
- 	CPPFLAGS="-DNDEBUG $CPPFLAGS"
--	CFLAGS=$(echo "$CFLAGS" | sed 's/-O2//;s/-g//')
-+	CFLAGS=$(echo "$CFLAGS" | sed 's/-O2//')
- 	CFLAGS="-O3 -funroll-loops $CFLAGS"
- fi
- 
diff --git a/package/flac/0002-sigemptyset.patch b/package/flac/0002-sigemptyset.patch
deleted file mode 100644
index 9cbc338..0000000
--- a/package/flac/0002-sigemptyset.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Fix musl compile since it does not define __sigemptyset
-
-Downloaded from
-http://git.alpinelinux.org/cgit/aports/commit/main/flac/sigemptyset.patch?id=49fd0f4cebc46e2753d6a60e450078446f7f18a7
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
---- ./src/libFLAC/cpu.c.orig
-+++ ./src/libFLAC/cpu.c
-@@ -243,7 +243,7 @@
- 		struct sigaction sigill_save;
- 		struct sigaction sigill_sse;
- 		sigill_sse.sa_sigaction = sigill_handler_sse_os;
--		__sigemptyset(&sigill_sse.sa_mask);
-+		sigemptyset(&sigill_sse.sa_mask);
- 		sigill_sse.sa_flags = SA_SIGINFO | SA_RESETHAND; /* SA_RESETHAND just in case our SIGILL return jump breaks, so we don't get stuck in a loop */
- 		if(0 == sigaction(SIGILL, &sigill_sse, &sigill_save))
- 		{
diff --git a/package/flac/flac.hash b/package/flac/flac.hash
index 6a0da11..7ce76f1 100644
--- a/package/flac/flac.hash
+++ b/package/flac/flac.hash
@@ -1,2 +1,2 @@
 # From http://downloads.xiph.org/releases/flac/SHA256SUMS.txt
-sha256	4773c0099dba767d963fd92143263be338c48702172e8754b9bc5103efe1c56c	flac-1.3.1.tar.xz
+sha256	91cfc3ed61dc40f47f050a109b08610667d73477af6ef36dcad31c31a4a8d53f	flac-1.3.2.tar.xz
diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index b819064..5020d8a 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLAC_VERSION = 1.3.1
+FLAC_VERSION = 1.3.2
 FLAC_SITE = http://downloads.xiph.org/releases/flac
 FLAC_SOURCE = flac-$(FLAC_VERSION).tar.xz
 FLAC_INSTALL_STAGING = YES
-- 
2.10.2
