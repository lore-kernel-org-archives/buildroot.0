From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Sep 2011 22:18:16 +0200
Subject: [Buildroot] [git commit] rtai, xenomai: use the pre patch hook point
Message-ID: <20110920202238.138A88D723@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be27a7933f12af29346eb7e73e0a0ca9ae7f947d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The post extract hook point is not really correct as what RTAI and
Xenomai extensions are doing is patching the kernel.

The post patch hook point doesn't work, because RTAI and Xenomai
patches would be applied *after* all other patches, while it sounds
more logical to apply them first, and *then* allow the user to apply
some platform/board specific patches if needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux-ext-rtai.mk    |    2 +-
 linux/linux-ext-xenomai.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/linux-ext-rtai.mk b/linux/linux-ext-rtai.mk
index a54230d..150f9e8 100644
--- a/linux/linux-ext-rtai.mk
+++ b/linux/linux-ext-rtai.mk
@@ -42,6 +42,6 @@ define RTAI_PREPARE_KERNEL
 endef
 endif
 
-LINUX_POST_PATCH_HOOKS += RTAI_PREPARE_KERNEL
+LINUX_PRE_PATCH_HOOKS += RTAI_PREPARE_KERNEL
 
 endif #BR2_LINUX_EXT_RTAI
diff --git a/linux/linux-ext-xenomai.mk b/linux/linux-ext-xenomai.mk
index e855ded..9b6772e 100644
--- a/linux/linux-ext-xenomai.mk
+++ b/linux/linux-ext-xenomai.mk
@@ -25,6 +25,6 @@ define XENOMAI_PREPARE_KERNEL
 		--verbose
 endef
 
-LINUX_POST_EXTRACT_HOOKS += XENOMAI_PREPARE_KERNEL
+LINUX_PRE_PATCH_HOOKS += XENOMAI_PREPARE_KERNEL
 
 endif #BR2_LINUX_EXT_XENOMAI
