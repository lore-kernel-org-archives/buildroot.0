From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 May 2018 22:52:51 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] linux: ensure correct
 make targets are used for cuImage/simpleImage.<dtb>
Message-ID: <20180524210451.30F6F8197A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c4518d9f371ca55ed23289ece2d37a941134a5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/66561794

LINUX_DTS_NAME may end up with a leading space because of the += logic, and
may contain multiple dts files - Neither of which works when we construct
the {cu,simple}Image.$(LINUX_DTS_NAME) make target name.

Fix it by using the first word in the variable.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 978a997c81f41702bc039f89a20129ef65060801)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 8d14f41c6b..0c78d824e1 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -155,9 +155,9 @@ LINUX_IMAGE_NAME = zImage.epapr
 else ifeq ($(BR2_LINUX_KERNEL_APPENDED_ZIMAGE),y)
 LINUX_IMAGE_NAME = zImage
 else ifeq ($(BR2_LINUX_KERNEL_CUIMAGE),y)
-LINUX_IMAGE_NAME = cuImage.$(KERNEL_DTS_NAME)
+LINUX_IMAGE_NAME = cuImage.$(firstword $(KERNEL_DTS_NAME))
 else ifeq ($(BR2_LINUX_KERNEL_SIMPLEIMAGE),y)
-LINUX_IMAGE_NAME = simpleImage.$(KERNEL_DTS_NAME)
+LINUX_IMAGE_NAME = simpleImage.$(firstword $(KERNEL_DTS_NAME))
 else ifeq ($(BR2_LINUX_KERNEL_IMAGE),y)
 LINUX_IMAGE_NAME = Image
 else ifeq ($(BR2_LINUX_KERNEL_LINUX_BIN),y)
