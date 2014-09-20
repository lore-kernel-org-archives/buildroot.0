From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 20 Sep 2014 22:07:20 +0200
Subject: [Buildroot] [PATCH 1/3] package/gnupg2: configure script looks at
	the wrong stdint.h
Message-ID: <1411243642-17955-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure test "checking absolute name of <stdint.h>..." return
the absolute path of a stdint.h file from the toolchain sources.

The contents of this file is completely different and obviously
does not contain intmax_t definitions.

Use gl_cv_absolute_stdint_h to indicate the correct file that
is in staging directory.

Fixes:
http://autobuild.buildroot.net/results/92a/92af55396670685f12ed0ebcddfe2d082ed5aeb7/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/gnupg2/gnupg2.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 33b5bc0..1e3506a 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -17,7 +17,8 @@ GNUPG2_CONF_OPT = \
 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr \
 	--with-libassuan-prefix=$(STAGING_DIR)/usr \
 	--with-ksba-prefix=$(STAGING_DIR)/usr \
-	--with-pth-prefix=$(STAGING_DIR)/usr
+	--with-pth-prefix=$(STAGING_DIR)/usr \
+	gl_cv_absolute_stdint_h=$(STAGING_DIR)/usr/include/stdint.h
 
 ifneq ($(BR2_PACKAGE_GNUPG2_GPGV2),y)
 define GNUPG2_REMOVE_GPGV2
-- 
1.9.3
