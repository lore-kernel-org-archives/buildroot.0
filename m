From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:42 -0000
Subject: [Buildroot] [git commit branch/next] package/linux: don't enforce
	check for DTS when not building
Message-ID: <20150808105632.18DBD81904@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ce2b7face01acab42e67c5ddf9f075445fe77693
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently, this is triggering the error message:
    make randconfig
    make source

Limit the checks that enforce a DTS is set and at most one DTB is
appended to when we are actually building, like is done for the
configuration-file variables.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index b602a04..cd32652 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -88,6 +88,8 @@ else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
 KERNEL_DTS_NAME = $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
 endif
 
+ifeq ($(BR_BUILDING),y)
+
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),y)
 $(error No kernel device tree source specified, check your \
 BR2_LINUX_KERNEL_USE_INTREE_DTS / BR2_LINUX_KERNEL_USE_CUSTOM_DTS settings)
@@ -100,6 +102,8 @@ $(error Kernel with appended device tree needs exactly one DTS source. \
 endif
 endif
 
+endif # BR_BUILDING
+
 KERNEL_DTBS = $(addsuffix .dtb,$(KERNEL_DTS_NAME))
 
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
