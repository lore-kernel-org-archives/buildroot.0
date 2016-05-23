From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 23 May 2016 11:27:16 +0100
Subject: [Buildroot] [PATCH next] lftp: bump version to 4.7.2
Message-ID: <1463999236-8470-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Help lftp to find readline and zlib so it will not fail this way:

checking for Readline... no
configure: error: cannot find readline library, install readline-devel
package

checking if zlib is wanted... yes
checking for inflateEnd in -lz... no
checking zlib.h usability... no
checking zlib.h presence... no
checking for zlib.h... no
configure: error: cannot find -lz library, install zlib-devel package

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/lftp/lftp.hash |  2 +-
 package/lftp/lftp.mk   | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/lftp/lftp.hash b/package/lftp/lftp.hash
index 4c5d799..3185fc5 100644
--- a/package/lftp/lftp.hash
+++ b/package/lftp/lftp.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  1e7cb674c83ace48172263f86847ed04bb6ab2f24116b11a8505f70a15e8805c  lftp-4.6.4.tar.xz
+sha256 475d7699b1390f951efee867ba1ad600f78329e13fd2a04d92f82bfffb70d872  lftp-4.7.2.tar.xz
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 5051f70..80479ee 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LFTP_VERSION = 4.6.4
+LFTP_VERSION = 4.7.2
 LFTP_SOURCE = lftp-$(LFTP_VERSION).tar.xz
 LFTP_SITE = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPLv3+
@@ -13,6 +13,14 @@ LFTP_LICENSE_FILES = COPYING
 LFTP_AUTORECONF = YES
 LFTP_DEPENDENCIES = readline zlib host-pkgconf
 
+# Help lftp finding readline
+LFTP_CONF_OPTS += --with-readline=$(STAGING_DIR)/usr
+LFTP_CONF_OPTS += --with-readline-inc=$(STAGING_DIR)/usr/include/readline
+LFTP_CONF_OPTS += --with-readline-lib=$(STAGING_DIR)/usr/lib
+
+# Help lftp finding zlib
+LFTP_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr
+
 ifneq ($(BR2_STATIC_LIBS),y)
 LFTP_CONF_OPTS += --with-modules
 endif
-- 
2.7.3
