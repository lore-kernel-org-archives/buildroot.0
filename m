From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  8 Sep 2014 11:07:13 -0300
Subject: [Buildroot] [PATCH] samba4: bump to version 4.1.12
Message-ID: <1410185233-27571-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also tweak library moves since uClibc doesn't do $ORIGIN and libreplace
is found that way now.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba4/samba4.mk | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 541efe0..e1ee33f 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.1.11
+SAMBA4_VERSION = 4.1.12
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_LICENSE = GPLv3+
@@ -124,11 +124,13 @@ define SAMBA4_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S91smb
 endef
 
-# uClibc-based builds don't like libtalloc in /usr/lib/samba
-define SAMBA4_MOVE_TALLOC
+# uClibc doesn't honor $ORIGIN so we need to move a few libs
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+define SAMBA4_MOVE_LIBS
+	mv -f $(TARGET_DIR)/usr/lib/samba/libreplace* $(TARGET_DIR)/usr/lib
 	mv -f $(TARGET_DIR)/usr/lib/samba/libtalloc* $(TARGET_DIR)/usr/lib
 endef
-
-SAMBA4_POST_INSTALL_TARGET_HOOKS += SAMBA4_MOVE_TALLOC
+SAMBA4_POST_INSTALL_TARGET_HOOKS += SAMBA4_MOVE_LIBS
+endif
 
 $(eval $(generic-package))
-- 
1.8.5.5
