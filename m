From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Mon,  8 May 2017 10:14:33 +0200
Subject: [Buildroot] [PATCH] sudo: honor target cflags/ldflags
Message-ID: <1494231273-6554-1-git-send-email-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sudo would previously have not been build using flags passed
via BR2_TARGET_OPTIMIZATION.

in our case -fPIE was being ignored.

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/sudo/sudo.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 0fcd740..dc15b4f 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -10,6 +10,7 @@ SUDO_LICENSE = ISC, BSD-3-Clause
 SUDO_LICENSE_FILES = doc/LICENSE
 # This is to avoid sudo's make install from chown()ing files which fails
 SUDO_INSTALL_TARGET_OPTS = INSTALL_OWNER="" DESTDIR="$(TARGET_DIR)" install
+SUDO_CONF_ENV += CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"
 SUDO_CONF_OPTS = \
 	--without-lecture \
 	--without-sendmail \
-- 
2.7.4
