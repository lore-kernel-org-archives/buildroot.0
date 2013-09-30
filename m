From: Peter Sanford <psanford@nearbuysystems.com>
Date: Sun, 29 Sep 2013 17:25:20 -0700
Subject: [Buildroot] [PATCH v2 1/1] gnupg: option to include RSA support.
Message-ID: <1380500720-29245-1-git-send-email-psanford@nearbuysystems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gnupg is compiled with --enable-minimal flag. This produces a binary that only
supports ElGamal and DSA public key algorithms.

RSA has been the default for `gpg --gen-key` since 2009, so it makes sense to
be able to build a gnupg binary that supports it.
---
Changes v1 -> v2:
  - Fix tab/space issue in Config.in (suggested by Thomas Petazzoni)
  - Added explict else clause for --disable-rsa case
---
 package/gnupg/Config.in |    5 +++++
 package/gnupg/gnupg.mk  |    6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/gnupg/Config.in b/package/gnupg/Config.in
index 8ddffaa..90f07c2 100644
--- a/package/gnupg/Config.in
+++ b/package/gnupg/Config.in
@@ -15,6 +15,11 @@ config BR2_PACKAGE_GNUPG
 
 if BR2_PACKAGE_GNUPG
 
+config BR2_PACKAGE_GNUPG_RSA
+	bool "RSA support"
+	help
+	  Support for RSA public key algorithm
+
 config BR2_PACKAGE_GNUPG_GPGV
 	bool "gpgv"
 	help
diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index f0c4b03..38604b5 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -31,6 +31,12 @@ else
 GNUPG_CONF_OPT += --without-readline
 endif
 
+ifeq ($(BR2_PACKAGE_GNUPG_RSA),y)
+GNUPG_CONF_OPT += --enable-rsa
+else
+GNUPG_CONF_OPT += --disable-rsa
+endif
+
 ifneq ($(BR2_PACKAGE_GNUPG_GPGV),y)
 define GNUPG_REMOVE_GPGV
 	rm -f $(TARGET_DIR)/usr/bin/gpgv \
-- 
1.7.9.5
