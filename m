From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 22:05:38 +0100
Subject: [Buildroot] [git commit] package/tslib: fix build with headers <
 4.16
Message-ID: <20200324205226.577BA88165@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7eaf235e58b5e7b60ff0646e016f1a9d66954283
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit fedaa28079489b308f77d80a0cac8698d776df23 fixed build with
headers >= 4.16 but as a side effect, build with headers < 4.16 is now
failing so add an upstream patch

Fixes:
 - http://autobuild.buildroot.org/results/594cd1a0d9e6286eca62b575fd1ba2d3a5e01234

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...error-with-input_event_sec-for-old-kernel.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/tslib/0002-Fix-build-error-with-input_event_sec-for-old-kernel.patch b/package/tslib/0002-Fix-build-error-with-input_event_sec-for-old-kernel.patch
new file mode 100644
index 0000000000..5dca3a009c
--- /dev/null
+++ b/package/tslib/0002-Fix-build-error-with-input_event_sec-for-old-kernel.patch
@@ -0,0 +1,28 @@
+From 050bf24c16e95f63a76e13156346a072035d45b4 Mon Sep 17 00:00:00 2001
+From: Evan Harvey <evanwork1234@gmail.com>
+Date: Thu, 19 Mar 2020 01:32:03 -0700
+Subject: [PATCH] Fix build error with input_event_sec for old kernel
+
+[Retrieved from:
+https://github.com/libts/tslib/commit/050bf24c16e95f63a76e13156346a072035d45b4]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tools/ts_uinput.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/tools/ts_uinput.c b/tools/ts_uinput.c
+index 1832a07..9c40bb3 100644
+--- a/tools/ts_uinput.c
++++ b/tools/ts_uinput.c
+@@ -51,6 +51,11 @@
+ #include <linux/fb.h>
+ #endif
+ 
++#ifndef input_event_sec
++#define input_event_sec time.tv_sec
++#define input_event_usec time.tv_usec
++#endif
++
+ #define RESET   "\033[0m"
+ #define RED     "\033[31m"
+ #define GREEN   "\033[32m"
