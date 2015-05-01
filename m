From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 11:01:33 +0200
Subject: [Buildroot] [git commit] argp-standalone: restrict value range
	passed to isprint function
Message-ID: <20150501090909.F228881DD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30a3b08c1766561b17ef36dcd868a53917665a28
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to C standards isprint argument shall be representable as an
unsigned char or be equal to EOF, otherwise the behaviour is undefined.

Passing arbitrary ints leads to segfault in nm program from elfutils.

Restrict isprint argument range to values representable by unsigned char.

Note: a similar change was done to the internal argp implementation of
glibc in commit
https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=9055724a92433ffa4c36f93d918ee1b3dfa1d6f7.

[Thomas: add a reference to the corresponding glibc fix.]

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/argp-standalone/0002-isprint.patch |   35 ++++++++++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)

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
