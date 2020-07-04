From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Jul 2020 23:40:57 +0200
Subject: [Buildroot] [git commit] package/live555: bump version to 2020.06.25
Message-ID: <20200704213851.0D41083ADA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc80c9121b70b576695765ee009ac8325ea00f06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, the linux and linux-with-shared-libraries configurations
depend on OpenSSL, but with some trickery we can drop this dependency
like the linux-no-openssl configuration does.

Also separate the fields in the hash file by two spaces.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/live555/live555.hash |  6 +++---
 package/live555/live555.mk   | 11 ++++++++++-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/package/live555/live555.hash b/package/live555/live555.hash
index f5df69f24f..867e0befd0 100644
--- a/package/live555/live555.hash
+++ b/package/live555/live555.hash
@@ -1,5 +1,5 @@
 # From http://www.live555.com/liveMedia/public/live555-latest-md5.txt
-md5 12e105c8fef9d34658d68367dc26a3d9 live.2019.09.30.tar.gz
+md5  327bc53f60361c6d703d52e86f476f11  live.2020.06.25.tar.gz
 # Locally generated
-sha256 ef44f48a84324525cebc2081dd2d0f1e908f2d0a79d9d30dd41967e142dfb06b  live.2019.09.30.tar.gz
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  f206309f10d281990889b7a0c92c26a7fa55ac0e8568bf594b9b27433b4db585  live.2020.06.25.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index cbe1c1bc0d..b2313886b1 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIVE555_VERSION = 2019.09.30
+LIVE555_VERSION = 2020.06.25
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 LIVE555_SITE = http://www.live555.com/liveMedia/public
 LIVE555_LICENSE = LGPL-2.1+
@@ -22,6 +22,13 @@ LIVE555_LIBRARY_LINK = $(TARGET_CC) -o
 LIVE555_CFLAGS += -fPIC
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIVE555_DEPENDENCIES += openssl
+LIVE555_LIBS = -lssl -lcrypto
+else
+LIVE555_CFLAGS += -DNO_OPENSSL
+endif
+
 ifndef ($(BR2_ENABLE_LOCALE),y)
 LIVE555_CFLAGS += -DLOCALE_NOT_USED
 endif
@@ -37,6 +44,8 @@ define LIVE555_CONFIGURE_CMDS
 	# Must have a whitespace at the end of LIBRARY_LINK, otherwise static link
 	# fails
 	echo 'LIBRARY_LINK = $(LIVE555_LIBRARY_LINK) ' >> $(@D)/config.$(LIVE555_CONFIG_TARGET)
+	echo 'LIBS_FOR_CONSOLE_APPLICATION = $(LIVE555_LIBS)' >> $(@D)/config.$(LIVE555_CONFIG_TARGET)
+	echo 'LIBS_FOR_LIVEMEDIA_LIB = $(LIVE555_LIBS)' >> $(@D)/config.$(LIVE555_CONFIG_TARGET)
 	(cd $(@D); ./genMakefiles $(LIVE555_CONFIG_TARGET))
 endef
 
