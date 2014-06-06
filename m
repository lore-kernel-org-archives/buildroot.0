From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 06 Jun 2014 22:13:00 +0200
Subject: [Buildroot] [PATCH 4 of 7 v3] toolchain/toolchain-buildroot:
 migrate to virtual package infrastructure
In-Reply-To: <patchbomb.1402085576@localhost>
References: <patchbomb.1402085576@localhost>
Message-ID: <58ea2200cf19b356f9d9.1402085580@localhost>
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
v3: no changes
v2: no changes

Note: this patch should only be applied when the first patch in this series
is.

 toolchain/toolchain-buildroot/toolchain-buildroot.mk |  4 +---
 toolchain/toolchain/toolchain.mk                     |  4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff -r b3ada349b3a1 -r 58ea2200cf19 toolchain/toolchain-buildroot/toolchain-buildroot.mk
--- a/toolchain/toolchain-buildroot/toolchain-buildroot.mk	Sun May 11 10:32:44 2014 +0200
+++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk	Tue May 06 09:36:14 2014 +0200
@@ -4,8 +4,6 @@
 #
 ################################################################################
 
-TOOLCHAIN_BUILDROOT_SOURCE =
-
 BR_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
 
 # Triggering the build of the host-gcc-final will automatically do the
@@ -16,4 +14,4 @@
 
 TOOLCHAIN_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
 
-$(eval $(generic-package))
+$(eval $(virtual-package))
diff -r b3ada349b3a1 -r 58ea2200cf19 toolchain/toolchain/toolchain.mk
--- a/toolchain/toolchain/toolchain.mk	Sun May 11 10:32:44 2014 +0200
+++ b/toolchain/toolchain/toolchain.mk	Tue May 06 09:36:14 2014 +0200
@@ -4,8 +4,6 @@
 #
 ################################################################################
 
-TOOLCHAIN_SOURCE =
-
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TOOLCHAIN_DEPENDENCIES += toolchain-buildroot
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
@@ -14,6 +12,6 @@
 
 TOOLCHAIN_ADD_TOOLCHAIN_DEPENDENCY = NO
 
-$(eval $(generic-package))
+$(eval $(virtual-package))
 
 toolchain: $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
