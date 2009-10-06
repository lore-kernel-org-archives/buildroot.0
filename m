From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Oct 2009 15:08:55 +0200
Subject: [Buildroot] [git commit master] target/generic: /etc/{hostname,
	issue}:  work around quotes in kconfig
Message-ID: <20091006131014.4FEF777785@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d31c7723ae05b82f501bac1c69bc91a5162edca6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise the targets will always run.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/generic/Makefile.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/generic/Makefile.in b/target/generic/Makefile.in
index 31f4a0c..f77f969 100644
--- a/target/generic/Makefile.in
+++ b/target/generic/Makefile.in
@@ -7,6 +7,8 @@ TARGET_SKELETON=target/generic/target_busybox_skeleton
 TARGET_DEVICE_TABLE=target/generic/mini_device_table.txt
 endif
 
+TARGET_GENERIC_HOSTNAME:=$(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
+TARGET_GENERIC_ISSUE:=$(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
 TARGET_GENERIC_GETTY:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
 TARGET_GENERIC_GETTY_BAUDRATE:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
 
@@ -22,11 +24,11 @@ target-generic-getty:
 	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) vt100 #~' \
 		$(TARGET_DIR)/etc/inittab
 
-ifneq ($(BR2_TARGET_GENERIC_HOSTNAME),)
+ifneq ($(TARGET_GENERIC_HOSTNAME),)
 TARGETS += target-generic-hostname
 endif
 
-ifneq ($(BR2_TARGET_GENERIC_ISSUE),)
+ifneq ($(TARGET_GENERIC_ISSUE),)
 TARGETS += target-generic-issue
 endif
 
-- 
1.6.3.3
