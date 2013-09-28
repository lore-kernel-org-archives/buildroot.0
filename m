From: Peter Sanford <psanford@nearbuysystems.com>
Date: Sat, 28 Sep 2013 13:02:13 -0700
Subject: [Buildroot] [PATCH 1/1] gnupg: option to include RSA support.
Message-ID: <1380398533-12094-1-git-send-email-psanford@nearbuysystems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gnupg is compiled with --enable-minimal flag. This produces a binary that only
supports ElGamal and DSA public key algorithms.

RSA has been the default for `gpg --gen-key` since 2009, so it makes sense to
be able to build a gnupg binary that supports it.

Signed-off-by: Peter Sanford <psanford@nearbuysystems.com>
---
 package/gnupg/Config.in |    5 +++++
 package/gnupg/gnupg.mk  |    4 ++++
 2 files changed, 9 insertions(+)

diff --git a/package/gnupg/Config.in b/package/gnupg/Config.in
index 8ddffaa..8b57771 100644
--- a/package/gnupg/Config.in
+++ b/package/gnupg/Config.in
@@ -15,6 +15,11 @@ config BR2_PACKAGE_GNUPG
 
 if BR2_PACKAGE_GNUPG
 
+config BR2_PACKAGE_GNUPG_RSA
+  bool "RSA support"
+  help
+    Support for RSA public key algorithm
+
 config BR2_PACKAGE_GNUPG_GPGV
 	bool "gpgv"
 	help
diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index f0c4b03..ddbec4f 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -31,6 +31,10 @@ else
 GNUPG_CONF_OPT += --without-readline
 endif
 
+ifeq ($(BR2_PACKAGE_GNUPG_RSA),y)
+GNUPG_CONF_OPT += --enable-rsa
+endif
+
 ifneq ($(BR2_PACKAGE_GNUPG_GPGV),y)
 define GNUPG_REMOVE_GPGV
 	rm -f $(TARGET_DIR)/usr/bin/gpgv \
-- 
1.7.9.5
