From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 Jul 2015 17:30:24 +0200
Subject: [Buildroot] [git commit] gnupg: add option for AES cipher
Message-ID: <20150702154951.114A28166E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a6a2962d998c82f888957fb19bd2933bbf73f92d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to our RSA option. Enabling this adds ~17K to the gpg binary (ARMv7):

ls -lah output/target/usr/bin/gpg{.orig,}
-rwxr-xr-x 1 peko peko 532K Jul  2 17:29 output/target/usr/bin/gpg
-rwxr-xr-x 1 peko peko 515K Jul  2 17:29 output/target/usr/bin/gpg.orig

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg/Config.in |    5 +++++
 package/gnupg/gnupg.mk  |    6 ++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/gnupg/Config.in b/package/gnupg/Config.in
index 1dc27a4..30f215f 100644
--- a/package/gnupg/Config.in
+++ b/package/gnupg/Config.in
@@ -16,6 +16,11 @@ config BR2_PACKAGE_GNUPG
 
 if BR2_PACKAGE_GNUPG
 
+config BR2_PACKAGE_GNUPG_AES
+	bool "AES support"
+	help
+	  Support for the AES cipher
+
 config BR2_PACKAGE_GNUPG_RSA
 	bool "RSA support"
 	help
diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index 94f5d89..f358fa3 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -31,6 +31,12 @@ else
 GNUPG_CONF_OPTS += --without-readline
 endif
 
+ifeq ($(BR2_PACKAGE_GNUPG_AES),y)
+GNUPG_CONF_OPTS += --enable-aes
+else
+GNUPG_CONF_OPTS += --disable-aes
+endif
+
 ifeq ($(BR2_PACKAGE_GNUPG_RSA),y)
 GNUPG_CONF_OPTS += --enable-rsa
 else
