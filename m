From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 19:10:13 +0200
Subject: [Buildroot] [git commit] toolchain/toolchain-buildroot: migrate to
	virtual package infrastructure
Message-ID: <20140614171145.AAD859CFE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a8ec9195c4f035dfb315267c2da92cc4b6e96a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../toolchain-buildroot/toolchain-buildroot.mk     |    4 +---
 toolchain/toolchain/toolchain.mk                   |    4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-buildroot/toolchain-buildroot.mk b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
index 853baf8..b30cc33 100644
--- a/toolchain/toolchain-buildroot/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
@@ -4,8 +4,6 @@
 #
 ################################################################################
 
-TOOLCHAIN_BUILDROOT_SOURCE =
-
 BR_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
 
 # Triggering the build of the host-gcc-final will automatically do the
@@ -16,4 +14,4 @@ TOOLCHAIN_BUILDROOT_DEPENDENCIES = host-gcc-final
 
 TOOLCHAIN_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
 
-$(eval $(generic-package))
+$(eval $(virtual-package))
diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
index 7241fe7..c22713b 100644
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
