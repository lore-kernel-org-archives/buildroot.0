From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 21:59:24 +0100
Subject: [Buildroot] [git commit] msmtp: bump to version 1.8.0
Message-ID: <20181202071556.4ED208843B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b68ad1b2d0d1c290489e0b4e1afec46b8220a8b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update site to https://marlam.de/msmtp/ (see
  https://sourceforge.net/projects/msmtp)
- Replace libidn by libidn2:
  https://github.com/marlam/msmtp-mirror/commit/0d8be2a35f0c7757d1f423e2d21f042626fec60e
- Disable msmtpd (minimal SMTP server) as it uses fork:
  https://github.com/marlam/msmtp-mirror/commit/e0bc975fbfb8b26a6dfaac87ebc64d3f37ef1e36

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/msmtp/Config.in  |  2 +-
 package/msmtp/msmtp.hash |  7 ++-----
 package/msmtp/msmtp.mk   | 10 +++++-----
 3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/package/msmtp/Config.in b/package/msmtp/Config.in
index 46bb1985e3..c83525d5ba 100644
--- a/package/msmtp/Config.in
+++ b/package/msmtp/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_MSMTP
 	  mail to an SMTP server (for example at a free mail provider)
 	  which takes care of further delivery.
 
-	  http://msmtp.sourceforge.net/
+	  https://marlam.de/msmtp/
diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
index 0b66cec862..f966e5d6d4 100644
--- a/package/msmtp/msmtp.hash
+++ b/package/msmtp/msmtp.hash
@@ -1,9 +1,6 @@
-# From http://sourceforge.net/projects/msmtp/files/msmtp/1.6.6/
-md5	82b0520b57db4b2cf05333d11fb5974d	msmtp-1.6.6.tar.xz
-sha1	f997f40dfb3f882df837cfd9a63bd4d271dcdc41	msmtp-1.6.6.tar.xz
 # Locally calculated after checking signature
-# http://downloads.sourceforge.net/project/msmtp/msmtp/1.6.6/msmtp-1.6.6.tar.xz.sig
-sha256	da15db1f62bd0201fce5310adb89c86188be91cd745b7cb3b62b81a501e7fb5e	msmtp-1.6.6.tar.xz
+# https://marlam.de/msmtp/releases/msmtp-1.8.0.tar.xz.sig
+sha256	bd730cbf000d1b8382849ea21d569a387e63f936be00dc07c569f67915e53ccd	msmtp-1.8.0.tar.xz
 
 # Hash for license file:
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 65fd0e4319..2370591614 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-MSMTP_VERSION = 1.6.6
-MSMTP_SITE = http://downloads.sourceforge.net/project/msmtp/msmtp/$(MSMTP_VERSION)
+MSMTP_VERSION = 1.8.0
+MSMTP_SITE = https://marlam.de/msmtp/releases
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf
-MSMTP_CONF_OPTS = --disable-gai-idn
+MSMTP_CONF_OPTS = --disable-gai-idn --without-msmtpd
 MSMTP_LICENSE = GPL-3.0+
 MSMTP_LICENSE_FILES = COPYING
 
@@ -19,9 +19,9 @@ else
 MSMTP_CONF_OPTS += --without-libgsasl
 endif
 
-ifeq ($(BR2_PACKAGE_LIBIDN),y)
+ifeq ($(BR2_PACKAGE_LIBIDN2),y)
 MSMTP_CONF_OPTS += --with-libidn
-MSMTP_DEPENDENCIES += libidn
+MSMTP_DEPENDENCIES += libidn2
 else
 MSMTP_CONF_OPTS += --without-libidn
 endif
