From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Nov 2014 17:32:27 +0100
Subject: [Buildroot] [git commit] package/qemu: fix specifying custom target
	sub-set
Message-ID: <20141108171552.D67C6B2F40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=78c0bbacdf0e7ff9b86fd12e8b7ddfcfc4277af5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The logic was wrong.

Even though it was working for previous versions of QEMU, it changed in
later versions, and thus now breaks on the version we currently package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.mk |   14 ++++++++++++--
 1 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 8182697..fe65a87 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -99,6 +99,18 @@ QEMU_VARS = \
 	PYTHON=$(HOST_DIR)/usr/bin/python2 \
 	PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
 
+# If we want to specify only a subset of targets, we must still enable all
+# of them, so that QEMU properly builds its list of default targets, from
+# which it then checks if the specified sub-set is valid. That's what we
+# do in the first part of the if-clause.
+# Otherwise, if we do not want to pass a sub-set of targets, we then need
+# to either enable or disable -user and/or -system emulation appropriately.
+# That's what we do in the else-clause.
+ifneq ($(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS)),)
+QEMU_OPTS += --enable-system --enable-linux-user
+QEMU_OPTS += --target-list="$(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS))"
+else
+
 ifeq ($(BR2_PACKAGE_QEMU_SYSTEM),y)
 QEMU_OPTS += --enable-system
 else
@@ -111,8 +123,6 @@ else
 QEMU_OPTS += --disable-linux-user
 endif
 
-ifneq ($(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS)),)
-QEMU_OPTS += --target-list="$(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS))"
 endif
 
 ifeq ($(BR2_PACKAGE_QEMU_SDL),y)
