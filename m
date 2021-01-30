From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 11:38:39 +0100
Subject: [Buildroot] [git commit] package/pinentry: bump to version 1.1.1
Message-ID: <20210130102238.5C21D81414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=767f7567e33bbd9f51e1593035b09ef9b46c033a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- add efl optional dependency which is available since
  http://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=commit;h=948105b7a34ec9a9e5479d376b7c86bafee50a01
- Update indentation in hash file (two spaces)

http://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=blob;f=NEWS;h=c8b5195ace7bb3ffb1420ae479ac39d65b0fa17c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pinentry/Config.in     | 11 +++++++++++
 package/pinentry/pinentry.hash |  6 +++---
 package/pinentry/pinentry.mk   | 10 +++++++++-
 3 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index 586ffea295..684e4eed4a 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -15,6 +15,17 @@ menuconfig BR2_PACKAGE_PINENTRY
 
 if BR2_PACKAGE_PINENTRY
 
+config BR2_PACKAGE_PINENTRY_EFL
+	bool "pinentry-efl"
+	depends on BR2_PACKAGE_EFL
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_EFL_X_XLIB
+	help
+	  The pinentry-efl tool
+
+comment "pinentry-efl needs efl and X"
+	depends on !BR2_PACKAGE_EFL || !BR2_PACKAGE_XORG7
+
 config BR2_PACKAGE_PINENTRY_FLTK
 	bool "pinentry-fltk"
 	depends on BR2_USE_MMU # fltk
diff --git a/package/pinentry/pinentry.hash b/package/pinentry/pinentry.hash
index c9610d6eb1..e5f3d90652 100644
--- a/package/pinentry/pinentry.hash
+++ b/package/pinentry/pinentry.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  693bdf9f48dfb3e040d92f50b1bb464e268b9fb0  pinentry-1.1.0.tar.bz2
+sha1  b8b88cab4fd844e3616d55aeba8f084f2b98fb0f  pinentry-1.1.1.tar.bz2
 # Locally computed
-sha256 68076686fa724a290ea49cdf0d1c0c1500907d1b759a3bcbfbec0293e8f56570  pinentry-1.1.0.tar.bz2
-sha256 67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34  COPYING
+sha256  cd12a064013ed18e2ee8475e669b9f58db1b225a0144debdb85a68cecddba57f  pinentry-1.1.1.tar.bz2
+sha256  67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34  COPYING
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index e7bd31d40e..8ebd35cfab 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PINENTRY_VERSION = 1.1.0
+PINENTRY_VERSION = 1.1.1
 PINENTRY_SOURCE = pinentry-$(PINENTRY_VERSION).tar.bz2
 PINENTRY_SITE = https://www.gnupg.org/ftp/gcrypt/pinentry
 PINENTRY_LICENSE = GPL-2.0+
@@ -29,6 +29,14 @@ else
 PINENTRY_CONF_OPTS += --disable-libsecret
 endif
 
+# pinentry-efl backend
+ifeq ($(BR2_PACKAGE_PINENTRY_EFL),y)
+PINENTRY_CONF_OPTS += --enable-pinentry-efl
+PINENTRY_DEPENDENCIES += efl
+else
+PINENTRY_CONF_OPTS += --disable-pinentry-efl
+endif
+
 # pinentry-fltk backend
 ifeq ($(BR2_PACKAGE_PINENTRY_FLTK),y)
 PINENTRY_CONF_ENV += ac_cv_path_FLTK_CONFIG=$(STAGING_DIR)/usr/bin/fltk-config
