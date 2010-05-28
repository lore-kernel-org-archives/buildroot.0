From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 May 2010 12:06:47 +0200
Subject: [Buildroot] [git commit master] linux: zImage target no longer
	available on x86
Message-ID: <20100528113442.2A3F6BFCFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=98de259aee970b70f06f7e98253fbf20419057a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The legacy zImage target for x86 was removed from the kernel in 2.6.30,
and we state in Config.in that we'll use bzImage if BR2_PACKAGE_LINUX_FORMAT
isn't set, so ensure we do so for x86.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/linux/Makefile.in          |    7 ++++++-
 target/linux/Makefile.in.advanced |    5 +++++
 2 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/target/linux/Makefile.in b/target/linux/Makefile.in
index 6983d25..f019824 100644
--- a/target/linux/Makefile.in
+++ b/target/linux/Makefile.in
@@ -10,7 +10,7 @@ ifeq ($(DOWNLOAD_LINUX26_VERSION),)
 # User did not define linux version, try using headers
 ifeq ($(LINUX_HEADERS_VERSION),)
 # We did not have headers (this is for real???)
-# Version of linuc before patches
+# Version of linux before patches
 DOWNLOAD_LINUX26_VERSION=2.6.22.1
 # Version of Linux after applying any patches
 LINUX26_VERSION=2.6.22.1
@@ -44,9 +44,14 @@ ifndef LINUX26_FORMAT
 ifneq ($(call qstrip,$(BR2_PACKAGE_LINUX_FORMAT)),)
 LINUX26_FORMAT=$(call qstrip,$(BR2_PACKAGE_LINUX_FORMAT))
 else
+ifneq ($(filter i386 x86-64,$(KERNEL_ARCH)),)
+# zImage target no longer available on x86 since 2.6.30
+LINUX26_FORMAT=bzImage
+else
 LINUX26_FORMAT=zImage
 endif
 endif
+endif
 
 # Has to be set by the target/device
 ifndef LINUX26_BINLOC
diff --git a/target/linux/Makefile.in.advanced b/target/linux/Makefile.in.advanced
index 9e495f3..86d94ca 100644
--- a/target/linux/Makefile.in.advanced
+++ b/target/linux/Makefile.in.advanced
@@ -111,9 +111,14 @@ ifndef LINUX26_FORMAT
 ifneq ($(call qstrip,$(BR2_PACKAGE_LINUX_FORMAT)),)
 LINUX26_FORMAT:=$(call qstrip,$(BR2_PACKAGE_LINUX_FORMAT))
 else
+ifneq ($(filter i386 x86-64,$(KERNEL_ARCH)),)
+# zImage target no longer available on x86 since 2.6.30
+LINUX26_FORMAT=bzImage
+else
 LINUX26_FORMAT:=zImage
 endif
 endif
+endif
 
 # -----------------------------------------------------------------------------
 # Has to be set by the target/device
-- 
1.6.3.3
