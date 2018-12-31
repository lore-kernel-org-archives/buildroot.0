From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 17:15:01 +0100
Subject: [Buildroot] [git commit] package/php-amqp: fix build with php 7.3.0
Message-ID: <20181231161032.E8A3F8374C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78c4144fb172d8c203939e1c2fa7a24b9e288415
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This includes an upstream patch that fixes the following error:

```
/home/naourr/work/instance-1/output/build/php-amqp-1.9.3/amqp_channel.c: In function 'php_amqp_destroy_fci':
/home/naourr/work/instance-1/output/build/php-amqp-1.9.3/amqp_channel.c:104:37: error: lvalue required as decrement operand
             GC_REFCOUNT(fci->object)--;
                                     ^~
/home/naourr/work/instance-1/output/build/php-amqp-1.9.3/amqp_channel.c: In function 'php_amqp_duplicate_fci':
/home/naourr/work/instance-1/output/build/php-amqp-1.9.3/amqp_channel.c:115:40: error: lvalue required as increment operand
             GC_REFCOUNT(source->object)++;
                                        ^~
make[1]: *** [Makefile:206: amqp_channel.lo] Error 1
```

The patch was created from the commit at:

https://github.com/pdezwart/php-amqp/commit/1205d3287df0a9ec762a6594b4fa018ed9637d21

Upstream has not yet made an official release that includes it. Fixes:

http://autobuild.buildroot.net/results/222873a689f7b9da20acb3604b8364885e96b98d
http://autobuild.buildroot.net/results/90710cb2a4873f39aa75db79ff70aa9e4bdf83ae

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php-amqp/0001-fix-for-7.3-323.patch | 43 +++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/php-amqp/0001-fix-for-7.3-323.patch b/package/php-amqp/0001-fix-for-7.3-323.patch
new file mode 100644
index 0000000000..ad03e3bca0
--- /dev/null
+++ b/package/php-amqp/0001-fix-for-7.3-323.patch
@@ -0,0 +1,43 @@
+From 1205d3287df0a9ec762a6594b4fa018ed9637d21 Mon Sep 17 00:00:00 2001
+From: Remi Collet <remi@famillecollet.com>
+Date: Thu, 21 Jun 2018 11:16:32 +0200
+Subject: [PATCH] fix for 7.3 (#323)
+
+[Frank: backport from upstream commit 1205d3287df0a9ec762a6594b4fa018ed9637d21]
+Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
+
+---
+ amqp_channel.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/amqp_channel.c b/amqp_channel.c
+index f3dba5d..032526e 100644
+--- a/amqp_channel.c
++++ b/amqp_channel.c
+@@ -101,7 +101,11 @@ static void php_amqp_destroy_fci(zend_fcall_info *fci) {
+     if (fci->size > 0) {
+         zval_ptr_dtor(&fci->function_name);
+         if (fci->object != NULL) {
++#if PHP_VERSION_ID >= 70300
++            GC_DELREF(fci->object);
++#else
+             GC_REFCOUNT(fci->object)--;
++#endif
+         }
+         fci->size = 0;
+     }
+@@ -112,7 +116,11 @@ static void php_amqp_duplicate_fci(zend_fcall_info *source) {
+
+         zval_add_ref(&source->function_name);
+         if (source->object != NULL) {
++#if PHP_VERSION_ID >= 70300
++            GC_ADDREF(source->object);
++#else
+             GC_REFCOUNT(source->object)++;
++#endif
+         }
+     }
+ }
+--
+2.17.1
+
