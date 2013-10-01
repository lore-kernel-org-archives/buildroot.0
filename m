From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2013 22:01:09 +0200
Subject: [Buildroot] [git commit] gnupg: option to include RSA support.
Message-ID: <20131001200152.CE2779B903@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2fab93b1636027c73c664cdf395cb8f93dc55dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gnupg is compiled with --enable-minimal flag. This produces a binary that only
supports ElGamal and DSA public key algorithms.

RSA has been the default for `gpg --gen-key` since 2009, so it makes sense to
be able to build a gnupg binary that supports it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg/Config.in |    5 +++++
 package/gnupg/gnupg.mk  |    6 ++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

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
