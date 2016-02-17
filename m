From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Feb 2016 10:00:46 -0300
Subject: [Buildroot] [PATCH next] musl: add fwrite regression patch
Message-ID: <1455714046-22512-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As pointed in http://www.openwall.com/lists/musl/2016/02/17/3 add the
fwrite regression patch for the recent 1.1.13 release.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...n-in-fputs-that-fwrite-returning-0-implie.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/musl/1.1.13/0001-fix-assumption-in-fputs-that-fwrite-returning-0-implie.patch

diff --git a/package/musl/1.1.13/0001-fix-assumption-in-fputs-that-fwrite-returning-0-implie.patch b/package/musl/1.1.13/0001-fix-assumption-in-fputs-that-fwrite-returning-0-implie.patch
new file mode 100644
index 0000000..b32b752
--- /dev/null
+++ b/package/musl/1.1.13/0001-fix-assumption-in-fputs-that-fwrite-returning-0-implie.patch
@@ -0,0 +1,38 @@
+From 10a17dfbad2c267d885817abc9c7589fc7ff630b Mon Sep 17 00:00:00 2001
+From: Rich Felker <dalias@aerifal.cx>
+Date: Tue, 16 Feb 2016 13:26:16 -0500
+Subject: [PATCH] fix assumption in fputs that fwrite returning 0 implies an
+ error
+
+internally, the idiom of passing nmemb=1 to fwrite and interpreting
+the return value of fwrite (which is necessarily 0 or 1) as
+failure/success is fairly widely used. this is not correct, however,
+when the size argument is unknown and may be zero, since C requires
+fwrite to return 0 in that special case. previously fwrite always
+returned nmemb on success, but this was changed for conformance with
+ISO C by commit 500c6886c654fd45e4926990fee2c61d816be197.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Status: upstream.
+
+ src/stdio/fputs.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/stdio/fputs.c b/src/stdio/fputs.c
+index 4737f44..1cf344f 100644
+--- a/src/stdio/fputs.c
++++ b/src/stdio/fputs.c
+@@ -3,7 +3,8 @@
+ 
+ int fputs(const char *restrict s, FILE *restrict f)
+ {
+-	return (int)fwrite(s, strlen(s), 1, f) - 1;
++	size_t l = strlen(s);
++	return (fwrite(s, 1, l, f)==l) - 1;
+ }
+ 
+ weak_alias(fputs, fputs_unlocked);
+-- 
+2.4.10
+
-- 
2.4.10
