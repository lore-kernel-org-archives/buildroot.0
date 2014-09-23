From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 23 Sep 2014 23:57:35 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/gnupg2: configure script use the
	wrong stdint.h file
Message-ID: <1411509457-8182-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure test "checking absolute name of <stdint.h>..." return
the absolute path of a stdint.h file from the toolchain sources.

The contents of this file is completely different compared to what
was expected and does not contain intmax_t definitions.

Use gl_cv_absolute_stdint_h to indicate the correct file that
is in staging directory.

This issue is only trigged by uClibc toolchain although it's present
with glibc toolchain.

Ref: http://bugs.gnupg.org/gnupg/issue1547

Fixes:
http://autobuild.buildroot.net/results/92a/92af55396670685f12ed0ebcddfe2d082ed5aeb7/
http://autobuild.buildroot.net/results/bef/bef61579ba96a6a1b83c8ca259c39cef617aa77d/
http://autobuild.buildroot.net/results/989/989648cfd3cc5750992fbbc784726dca4be2e920/
http://autobuild.buildroot.net/results/e8a/e8a1d9b8d98c059d497bc493a9d2ae0ef5f9d0f5/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v2: improve commit log
    add comment in the .mk file

 package/gnupg2/gnupg2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 33b5bc0..af475bb 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -19,6 +19,10 @@ GNUPG2_CONF_OPT = \
 	--with-ksba-prefix=$(STAGING_DIR)/usr \
 	--with-pth-prefix=$(STAGING_DIR)/usr
 
+# Workaround: http://bugs.gnupg.org/gnupg/issue1547
+# The m4 macro absolute-header.m4 is brocken
+GNUPG2_CONF_OPT += gl_cv_absolute_stdint_h=$(STAGING_DIR)/usr/include/stdint.h
+
 ifneq ($(BR2_PACKAGE_GNUPG2_GPGV2),y)
 define GNUPG2_REMOVE_GPGV2
 	rm -f $(TARGET_DIR)/usr/bin/gpgv2
-- 
1.9.3
