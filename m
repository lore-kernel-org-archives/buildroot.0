From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 28 Apr 2015 11:50:36 +0300
Subject: [Buildroot] [PATCH] argp-standalone: restrict value range passed to
	isprint function
Message-ID: <1430211036-4123-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to C standards isprint argument shall be representable as an
unsigned char or be equal to EOF, otherwise the behaviour is undefined.

Passing arbitrary ints leads to segfault in nm program from elfutils.

Restrict isprint argument range to values representable by unsigned char.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/argp-standalone/0002-isprint.patch | 35 ++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/argp-standalone/0002-isprint.patch

diff --git a/package/argp-standalone/0002-isprint.patch b/package/argp-standalone/0002-isprint.patch
new file mode 100644
index 0000000..a2962a1
--- /dev/null
+++ b/package/argp-standalone/0002-isprint.patch
@@ -0,0 +1,35 @@
+Subject: restrict value range passed to isprint function
+
+According to C standards isprint argument shall be representable as an
+unsigned char or be equal to EOF, otherwise the behaviour is undefined.
+
+Passing arbitrary ints leads to segfault in nm program from elfutils.
+
+Restrict isprint argument range to values representable by unsigned char.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+diff -bu argp-standalone-1.3/argp.h argp-standalone-1.3-/argp.h
+--- argp-standalone-1.3/argp.h	2015-04-28 10:31:39.015319337 +0300
++++ argp-standalone-1.3-/argp.h	2015-04-28 10:27:46.526770624 +0300
+@@ -577,7 +577,7 @@
+   else
+     {
+       int __key = __opt->key;
+-      return __key > 0 && isprint (__key);
++      return __key > 0 && __key <= UCHAR_MAX && isprint (__key);
+     }
+ }
+ 
+diff -bu argp-standalone-1.3/argp-parse.c argp-standalone-1.3-/argp-parse.c
+--- argp-standalone-1.3/argp-parse.c	2015-04-28 10:31:39.016319380 +0300
++++ argp-standalone-1.3-/argp-parse.c	2015-04-28 10:27:21.810818130 +0300
+@@ -1292,7 +1292,7 @@
+       int __key = __opt->key;
+       /* FIXME: whether or not a particular key implies a short option
+        * ought not to be locale dependent. */
+-      return __key > 0 && isprint (__key);
++      return __key > 0 && __key <= UCHAR_MAX && isprint (__key);
+     }
+ }
+ 
-- 
1.8.1.4
