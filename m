From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 22:10:53 +0200
Subject: [Buildroot] [PATCH 2/5] rtai, xenomai: use the pre patch hook point
In-Reply-To: <cover.1316463052.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316463052.git.thomas.petazzoni@free-electrons.com>
Message-ID: <40ab53037f455a50bfbd5430bed946fccd0298ea.1316463052.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The post extract hook point is not really correct as what RTAI and
Xenomai extensions are doing is patching the kernel.

The post patch hook point doesn't work, because RTAI and Xenomai
patches would be applied *after* all other patches, while it sounds
more logical to apply them first, and *then* allow the user to apply
some platform/board specific patches if needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
-- 
1.7.4.1
