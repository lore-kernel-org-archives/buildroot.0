From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 12 Dec 2019 15:01:17 +0100
Subject: [Buildroot] [PATCH 1/2] package/libnss: fix build failure on RHEL 7
In-Reply-To: <20191212140118.90730-1-giulio.benetti@benettiengineering.com>
References: <20191212140118.90730-1-giulio.benetti@benettiengineering.com>
Message-ID: <20191212140118.90730-2-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-DLINUX flag was passed to OS_CFLAGS instead of DEFINES, but OS_CFLAGS
is only used when cross-compiling, not when native building.

Add patch to fix build failure on RHEL 7 host by substituting OS_CFLAGS
with DEFINES.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
Patch is pending upstream:
https://bugzilla.mozilla.org/show_bug.cgi?id=1603398
---
 ...-nsinstall.c-build-failure-on-RHEL-7.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/libnss/0005-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch

diff --git a/package/libnss/0005-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch b/package/libnss/0005-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch
new file mode 100644
index 0000000000..631d97d11f
--- /dev/null
+++ b/package/libnss/0005-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch
@@ -0,0 +1,29 @@
+From 1ba8516045bc8a13fd72e1a85206a04b29d96758 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Thu, 12 Dec 2019 12:57:29 +0100
+Subject: [PATCH] Bug 1603398 - Fix nsinstall.c build failure on RHEL 7
+
+In Linux.mk -DLINUX and -Dlinux must be passed to DEFINES, not
+OS_CFLAGS.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ nss/coreconf/Linux.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nss/coreconf/Linux.mk b/nss/coreconf/Linux.mk
+index d07f8a3c5..4b45a6054 100644
+--- a/nss/coreconf/Linux.mk
++++ b/nss/coreconf/Linux.mk
+@@ -132,7 +132,7 @@ endif
+ 
+ OS_CFLAGS		= $(DSO_CFLAGS) $(OS_REL_CFLAGS) $(ARCHFLAG) -pipe -ffunction-sections -fdata-sections -DHAVE_STRERROR
+ ifeq ($(KERNEL),Linux)
+-	OS_CFLAGS	+= -DLINUX -Dlinux
++	DEFINES		+= -DLINUX -Dlinux
+ endif
+ OS_LIBS			= $(OS_PTHREAD) -ldl -lc
+ 
+-- 
+2.20.1
+
-- 
2.20.1
