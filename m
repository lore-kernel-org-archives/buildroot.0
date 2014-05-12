From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 12 May 2014 16:44:12 +0200
Subject: [Buildroot] [PATCH 4 of 7 v2] toolchain/toolchain-buildroot:
 migrate to virtual package infrastructure
In-Reply-To: <patchbomb.1399905848@argentina>
References: <patchbomb.1399905848@argentina>
Message-ID: <40dabe030c0fd187eea4.1399905852@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch migrates the toolchain and toolchain-buildroot packages to the
virtual package infrastructure, causing the log messages to change from:

>>> toolchain undefined Downloading
>>> toolchain undefined Extracting
...

to

>>> toolchain virtual Downloading
>>> toolchain virtual Extracting
...

and similar for 'toolchain-buildroot', simply because it looks nicer.

At the same time, the directory names also become toolchain-virtual,
toolchain-buildroot-virtual instead of the corresponding 'undefined'
variants.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
v2: no changes

Note: this patch should only be applied when the first patch in this series
is.

 toolchain/toolchain-buildroot/toolchain-buildroot.mk |  4 +---
 toolchain/toolchain/toolchain.mk                     |  4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-buildroot/toolchain-buildroot.mk b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
--- a/toolchain/toolchain-buildroot/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
@@ -4,8 +4,6 @@
 #
 ################################################################################
 
-TOOLCHAIN_BUILDROOT_SOURCE =
-
 BR_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
 
 # Triggering the build of the host-gcc-final will automatically do the
@@ -16,4 +14,4 @@ TOOLCHAIN_BUILDROOT_DEPENDENCIES = host-
 
 TOOLCHAIN_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
 
-$(eval $(generic-package))
+$(eval $(virtual-package))
diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -4,8 +4,6 @@
 #
 ################################################################################
 
-TOOLCHAIN_SOURCE =
-
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TOOLCHAIN_DEPENDENCIES += toolchain-buildroot
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
@@ -14,6 +12,6 @@ endif
 
 TOOLCHAIN_ADD_TOOLCHAIN_DEPENDENCY = NO
 
-$(eval $(generic-package))
+$(eval $(virtual-package))
 
 toolchain: $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
