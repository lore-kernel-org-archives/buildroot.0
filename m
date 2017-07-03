From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon,  3 Jul 2017 16:16:52 +0200
Subject: [Buildroot] [PATCH] libusb-compat: fix a build issue with undefined
	PATH_MAX
Message-ID: <1499091412-26839-1-git-send-email-brgl@bgdev.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libsigrok build failed because of PATH_MAX not being defined in usb.h.
On linux it is defined in linux/limits.h, but usb.h only includes
limit.h. Add a patch fixing the header in libusb-compat.

While we're at it: remove the patch numbering from previous patch.

Fixes: http://autobuild.buildroot.net/results/535/5353c2418c0c3311ef9ecb1f1ddc3ce769369b96/
Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 ...andard-fixed-width-integer-types-in-usb.h.patch |  7 +++--
 .../0002-fix-a-build-issue-on-linux.patch          | 32 ++++++++++++++++++++++
 2 files changed, 36 insertions(+), 3 deletions(-)
 create mode 100644 package/libusb-compat/0002-fix-a-build-issue-on-linux.patch

diff --git a/package/libusb-compat/0001-Use-C99-standard-fixed-width-integer-types-in-usb.h.patch b/package/libusb-compat/0001-Use-C99-standard-fixed-width-integer-types-in-usb.h.patch
index ad71199..35872a9 100644
--- a/package/libusb-compat/0001-Use-C99-standard-fixed-width-integer-types-in-usb.h.patch
+++ b/package/libusb-compat/0001-Use-C99-standard-fixed-width-integer-types-in-usb.h.patch
@@ -1,7 +1,7 @@
-From 2e9b6bbebb7cf1ef0095516ec6d5203deb3822e8 Mon Sep 17 00:00:00 2001
+From 87adda6abc3467ede45a6d2a87df2b9efdf5bb33 Mon Sep 17 00:00:00 2001
 From: Nathan Hjelm <hjelmn@me.com>
 Date: Fri, 9 Oct 2015 15:03:10 -0600
-Subject: [PATCH 1/1] Use C99 standard fixed width integer types in usb.h
+Subject: [PATCH] Use C99 standard fixed width integer types in usb.h
 
 This patch modifies the integer types in usb.h of the form u_int* to the
 C99 standard uint* types.
@@ -13,6 +13,7 @@ https://github.com/libusb/libusb-compat-0.1/commit/2e9b6bbebb7cf1ef0095516ec6d52
 
 Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 Signed-off-by: Nathan Hjelm <hjelmn@me.com>
+Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
 ---
  libusb/usb.h | 130 ++++++++++++++++++++++++++++++++---------------------------
  1 file changed, 70 insertions(+), 60 deletions(-)
@@ -232,5 +233,5 @@ index 84e730f..d2c30aa 100644
    struct usb_device *root_dev;
  };
 -- 
-2.4.9
+2.9.3
 
diff --git a/package/libusb-compat/0002-fix-a-build-issue-on-linux.patch b/package/libusb-compat/0002-fix-a-build-issue-on-linux.patch
new file mode 100644
index 0000000..d2e26b3
--- /dev/null
+++ b/package/libusb-compat/0002-fix-a-build-issue-on-linux.patch
@@ -0,0 +1,32 @@
+From af07587e8775c25450cda8ba9e9a8b1a58072634 Mon Sep 17 00:00:00 2001
+From: Bartosz Golaszewski <brgl@bgdev.pl>
+Date: Mon, 3 Jul 2017 15:55:00 +0200
+Subject: [PATCH] fix a build issue on linux
+
+On linux PATH_MAX is defined in linux/limits.h. If we include usb.h
+without previously having indirectly included it, the build fails.
+
+Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
+---
+ libusb/usb.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libusb/usb.h b/libusb/usb.h
+index d2c30aa..7ad9a66 100644
+--- a/libusb/usb.h
++++ b/libusb/usb.h
+@@ -41,6 +41,11 @@ typedef unsigned __int32  uint32_t;
+ #include <stdint.h>
+ #endif
+ 
++/* On linux PATH_MAX is defined in linux/limits.h. */
++#if defined(__linux__)
++#include <linux/limits.h>
++#endif
++
+ /*
+  * USB spec information
+  *
+-- 
+2.9.3
+
-- 
2.9.3
