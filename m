From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Feb 2016 23:45:00 +0100
Subject: [Buildroot] [git commit branch/next] musl: bump to version 1.1.14
Message-ID: <20160222224504.A64AF81842@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=330b112f7474f40c4bb5b6b3aa9b652ca7010c77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...n-in-fputs-that-fwrite-returning-0-implie.patch | 38 ----------------------
 package/musl/musl.hash                             |  2 +-
 package/musl/musl.mk                               |  2 +-
 3 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/package/musl/1.1.13/0001-fix-assumption-in-fputs-that-fwrite-returning-0-implie.patch b/package/musl/1.1.13/0001-fix-assumption-in-fputs-that-fwrite-returning-0-implie.patch
deleted file mode 100644
index b32b752..0000000
--- a/package/musl/1.1.13/0001-fix-assumption-in-fputs-that-fwrite-returning-0-implie.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 10a17dfbad2c267d885817abc9c7589fc7ff630b Mon Sep 17 00:00:00 2001
-From: Rich Felker <dalias@aerifal.cx>
-Date: Tue, 16 Feb 2016 13:26:16 -0500
-Subject: [PATCH] fix assumption in fputs that fwrite returning 0 implies an
- error
-
-internally, the idiom of passing nmemb=1 to fwrite and interpreting
-the return value of fwrite (which is necessarily 0 or 1) as
-failure/success is fairly widely used. this is not correct, however,
-when the size argument is unknown and may be zero, since C requires
-fwrite to return 0 in that special case. previously fwrite always
-returned nmemb on success, but this was changed for conformance with
-ISO C by commit 500c6886c654fd45e4926990fee2c61d816be197.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Status: upstream.
-
- src/stdio/fputs.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/stdio/fputs.c b/src/stdio/fputs.c
-index 4737f44..1cf344f 100644
---- a/src/stdio/fputs.c
-+++ b/src/stdio/fputs.c
-@@ -3,7 +3,8 @@
- 
- int fputs(const char *restrict s, FILE *restrict f)
- {
--	return (int)fwrite(s, strlen(s), 1, f) - 1;
-+	size_t l = strlen(s);
-+	return (fwrite(s, 1, l, f)==l) - 1;
- }
- 
- weak_alias(fputs, fputs_unlocked);
--- 
-2.4.10
-
diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index 0970ad6..907e9c6 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	bbacdc64f557d0c4857f7d2daf592c32c29aec1babbb94fcf01a2e05bed15013  musl-1.1.13.tar.gz
+sha256	35f6c00c84a6091bd5dab29eedde7508dae755ead92dcc0239f3677d1055b9b5  musl-1.1.14.tar.gz
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index d68e769..081a700 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.1.13
+MUSL_VERSION = 1.1.14
 MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
