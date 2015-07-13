From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 13:00:50 +0200
Subject: [Buildroot] [git commit] core/skeleton: drop /etc/securetty
Message-ID: <20150713110109.6A2C481974@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c1c7e8b7885263b3ffca466ef40f3264198ea509
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/login.pam  |    1 -
 system/skeleton/etc/securetty |   57 -----------------------------------------
 system/system.mk              |    8 ------
 3 files changed, 0 insertions(+), 66 deletions(-)

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
