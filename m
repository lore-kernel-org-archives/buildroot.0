From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 17 Mar 2017 09:42:42 -0700
Subject: [Buildroot] [PATCH] uboot-tools: pass empty CFLAGS on invocation of
	libfdt/setup.py
Message-ID: <1489768962-26768-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building u-boot tools in cross-build environment CFLAGS environment
variable set up for target is taken into an account when building code
for host. Make it empty on invocation of python.

This fixes the following build errors when cross-compiling for xtensa:

  cc1: error: unrecognized command line option "-mlongcalls"
  cc1: error: unrecognized command line option "-mauto-litpools"

Fixes:
  http://autobuild.buildroot.net/results/439d6dacfaa7f9244bd15ca04990c12a25ff4777
  http://autobuild.buildroot.net/results/e2fe36c20e75d01a01a6659ef11e888965a843b9
  http://autobuild.buildroot.net/results/6f37ff347822a76571a9fe9cf3c491fe7e4164fa

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Upstream status: fix is posted to the list.

 ...y-CFLAGS-on-invocation-of-libfdt-setup.py.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/uboot-tools/0004-Pass-empty-CFLAGS-on-invocation-of-libfdt-setup.py.patch

diff --git a/package/uboot-tools/0004-Pass-empty-CFLAGS-on-invocation-of-libfdt-setup.py.patch b/package/uboot-tools/0004-Pass-empty-CFLAGS-on-invocation-of-libfdt-setup.py.patch
new file mode 100644
index 0000000..ae01b33
--- /dev/null
+++ b/package/uboot-tools/0004-Pass-empty-CFLAGS-on-invocation-of-libfdt-setup.py.patch
@@ -0,0 +1,36 @@
+From 7807af13118eff3ac291bbaaf2159c7a441c0902 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Thu, 16 Mar 2017 11:21:58 -0700
+Subject: [PATCH] Pass empty CFLAGS on invocation of libfdt/setup.py
+
+When building u-boot tools in cross-build environment CFLAGS environment
+variable set up for target is taken into an account when building code
+for host. Make it empty on invocation of python.
+
+This fixes the following build errors when cross-compiling for xtensa:
+
+  cc1: error: unrecognized command line option "-mlongcalls"
+  cc1: error: unrecognized command line option "-mauto-litpools"
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+Reviewed-by: Simon Glass <sjg@chromium.org>
+---
+ tools/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/Makefile b/tools/Makefile
+index 1c840d7..f3de657 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -120,7 +120,7 @@ _libfdt.so-sharedobjs += $(LIBFDT_OBJS)
+ libfdt:
+ 
+ tools/_libfdt.so: $(patsubst %.o,%.c,$(LIBFDT_OBJS)) tools/libfdt_wrap.c
+-	LDFLAGS="$(HOSTLDFLAGS)" python $(srctree)/lib/libfdt/setup.py \
++	LDFLAGS="$(HOSTLDFLAGS)" CFLAGS= python $(srctree)/lib/libfdt/setup.py \
+ 		"$(_hostc_flags)" $^
+ 	mv _libfdt.so $@
+ 
+-- 
+2.1.4
+
-- 
2.1.4
