From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jul 2015 11:05:35 +0200
Subject: [Buildroot] [PATCH 1/2 v4] core/skeleton: drop /etc/securetty
In-Reply-To: <cover.1436778228.git.yann.morin.1998@free.fr>
References: <cover.1436778228.git.yann.morin.1998@free.fr>
Message-ID: <51509ea07660728b4f5aa519d67b6577bd4c9dd4.1436778228.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

securetty is supposed to restrict the terminals root is allowed to
login from. As it happens, login from busybox (w/ securetty support)
is actually enforcing use of securetty, while login from util-linux
is completely ignoring securetty altogether.

Remove securetty from our skeleton altogether and stop worrying about
it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/util-linux/login.pam  |  1 -
 system/skeleton/etc/securetty | 57 -------------------------------------------
 system/system.mk              |  8 ------
 3 files changed, 66 deletions(-)
 delete mode 100644 system/skeleton/etc/securetty

diff --git a/package/util-linux/login.pam b/package/util-linux/login.pam
index 1d9cd70..01f5632 100644
--- a/package/util-linux/login.pam
+++ b/package/util-linux/login.pam
@@ -1,4 +1,3 @@
-auth		required	pam_securetty.so
 auth		required	pam_unix.so nullok
 
 account		required	pam_unix.so
diff --git a/system/skeleton/etc/securetty b/system/skeleton/etc/securetty
deleted file mode 100644
index 0722677..0000000
--- a/system/skeleton/etc/securetty
+++ /dev/null
@@ -1,57 +0,0 @@
-tty1
-tty2
-tty3
-tty4
-tty5
-tty6
-tty7
-tty8
-ttyS0
-ttyS1
-ttyS2
-ttyS3
-ttyAMA0
-ttyAMA1
-ttyAMA2
-ttyAMA3
-ttySAC0
-ttySAC1
-ttySAC2
-ttySAC3
-ttyUL0
-ttyUL1
-ttyUL2
-ttyUL3
-ttyPS0
-ttyPS1
-ttyPSC0
-ttyPSC1
-ttyPSC2
-ttyPSC3
-ttyCPM0
-ttyCPM1
-ttyCPM2
-ttyCPM3
-ttymxc0
-ttymxc1
-ttymxc2
-ttyO0
-ttyO1
-ttyO2
-ttyO3
-ttyAM0
-ttyAM1
-ttyAM2
-ttySC0
-ttySC1
-ttySC2
-ttySC3
-ttySC4
-ttySC5
-ttySC6
-ttySC7
-ttyGS0
-hvc0
-hvc1
-hvc2
-hvc3
diff --git a/system/system.mk b/system/system.mk
index 2794667..fd94e03 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -8,14 +8,6 @@ TARGET_GENERIC_GETTY_BAUDRATE = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRAT
 TARGET_GENERIC_GETTY_TERM = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
 TARGET_GENERIC_GETTY_OPTIONS = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_OPTIONS))
 
-ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
-define SYSTEM_SECURETTY
-	grep -q '^$(TARGET_GENERIC_GETTY_PORT)$$' $(TARGET_DIR)/etc/securetty || \
-		echo '$(TARGET_GENERIC_GETTY_PORT)' >> $(TARGET_DIR)/etc/securetty
-endef
-TARGET_FINALIZE_HOOKS += SYSTEM_SECURETTY
-endif
-
 ifneq ($(TARGET_GENERIC_HOSTNAME),)
 define SYSTEM_HOSTNAME
 	mkdir -p $(TARGET_DIR)/etc
-- 
1.9.1
