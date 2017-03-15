From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Mar 2017 11:50:05 +0100
Subject: [Buildroot] [git commit] irssi: bump version to version 1.0.2
Message-ID: <20170315105237.A891D7F99D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1e2d290d9fd4cc8b12bcae72725ebad1cac8edc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Notice that this fixes a security issue:

CWE-416 (use after free condition during netjoin processing). No CVE
assigned yet:

https://irssi.org/security/irssi_sa_2017_03.txt

But the 0.8.x series is not believed to be vulnerable to this specific
issue.  From the advisory:

Affected versions
-----------------

Irssi up to and including 1.0.1

We believe Irssi 0.8.21 and prior are not affected since a different
code path causes the netjoins to be flushed prior to reaching the use
after free condition.

Openssl is no longer optional, so select it and drop the enable/disable
handling.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/irssi/Config.in  |  1 +
 package/irssi/irssi.hash |  2 +-
 package/irssi/irssi.mk   | 11 ++---------
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/package/irssi/Config.in b/package/irssi/Config.in
index 7d29201..2cdd06c 100644
--- a/package/irssi/Config.in
+++ b/package/irssi/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_IRSSI
 	bool "irssi"
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_OPENSSL
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # fork()
diff --git a/package/irssi/irssi.hash b/package/irssi/irssi.hash
index b1048bf..f1472e0 100644
--- a/package/irssi/irssi.hash
+++ b/package/irssi/irssi.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	e433063b8714dcf17438126902c9a9d5c97944b3185ecd0fc5ae25c4959bf35a	irssi-0.8.21.tar.xz
+sha256	5c1c3cc2caf103aad073fadeb000e0f8cb3b416833a7f43ceb8bd9fcf275fbe9	irssi-1.0.2.tar.xz
diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index e467f89..7df7bbc 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -4,27 +4,20 @@
 #
 ################################################################################
 
-IRSSI_VERSION = 0.8.21
+IRSSI_VERSION = 1.0.2
 IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.xz
 # Do not use the github helper here. The generated tarball is *NOT* the
 # same as the one uploaded by upstream for the release.
 IRSSI_SITE = https://github.com/irssi/irssi/releases/download/$(IRSSI_VERSION)
 IRSSI_LICENSE = GPLv2+
 IRSSI_LICENSE_FILES = COPYING
-IRSSI_DEPENDENCIES = host-pkgconf libglib2 ncurses
+IRSSI_DEPENDENCIES = host-pkgconf libglib2 ncurses openssl
 
 IRSSI_CONF_OPTS = \
 	--disable-glibtest \
 	--with-ncurses=$(STAGING_DIR)/usr \
 	--without-perl
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-IRSSI_CONF_OPTS += --enable-ssl
-IRSSI_DEPENDENCIES += openssl
-else
-IRSSI_CONF_OPTS += --disable-ssl
-endif
-
 ifeq ($(BR2_PACKAGE_IRSSI_PROXY),y)
 IRSSI_CONF_OPTS += --with-proxy
 # If shared libs are disabled, 'proxy' has to go in the list of built-in
