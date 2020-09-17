From: Michael Nosthoff <buildroot@heine.tech>
Date: Thu, 17 Sep 2020 23:43:16 +0200
Subject: [Buildroot] [PATCH] package/live555: bump to version 2020.08.19
Message-ID: <20200917214317.23734-1-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to [0] this version fixes memory leaks and buffer overflows.

Commit bc80c9121b70b576 added LIBS_FOR_LIVEMEDIA_LIB also for
static builds. That broke those builds.
With this commit it now only alters this parameter if it's there
by replacing echo with sed.
Also it explicitly links static against -pthread -lz as this
seems neccessary.

Fixes:
http://autobuild.buildroot.net/results/f13/f13f1e40a2749fec5ad8a93cd8eea9a6e4e577b

[0] http://live555.com/liveMedia/public/changelog.txt

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/live555/live555.hash | 4 ++--
 package/live555/live555.mk   | 9 ++++++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/live555/live555.hash b/package/live555/live555.hash
index 52ca068288..5e65cacd7b 100644
--- a/package/live555/live555.hash
+++ b/package/live555/live555.hash
@@ -1,5 +1,5 @@
 # From http://www.live555.com/liveMedia/public/live555-latest-md5.txt
-md5  327bc53f60361c6d703d52e86f476f11  live.2020.06.25.tar.gz
+md5  4645d2a0c865505c85b48af5317bcb4a  live.2020.08.19.tar.gz
 # Locally generated
-sha256  f206309f10d281990889b7a0c92c26a7fa55ac0e8568bf594b9b27433b4db585  live.2020.06.25.tar.gz
+sha256  af3af7f2510b0b45f38892c232abca2cee2ab36a62503e7085b47ed2c3c2c537  live.2020.08.19.tar.gz
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSER
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index e7be6024c9..59650d2174 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIVE555_VERSION = 2020.06.25
+LIVE555_VERSION = 2020.08.19
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 LIVE555_SITE = http://www.live555.com/liveMedia/public
 # There is a COPYING file with the GPL-3.0 license text, but none of
@@ -29,6 +29,9 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIVE555_DEPENDENCIES += openssl
 LIVE555_LIBS = -lssl -lcrypto
+ifeq ($(BR2_STATIC_LIBS),y)
+LIVE555_LIBS += $(if $(BR2_TOOLCHAIN_HAS_THREADS),-lpthread) -lz
+endif
 else
 LIVE555_CFLAGS += -DNO_OPENSSL
 endif
@@ -48,8 +51,8 @@ define LIVE555_CONFIGURE_CMDS
 	# Must have a whitespace at the end of LIBRARY_LINK, otherwise static link
 	# fails
 	echo 'LIBRARY_LINK = $(LIVE555_LIBRARY_LINK) ' >> $(@D)/config.$(LIVE555_CONFIG_TARGET)
-	echo 'LIBS_FOR_CONSOLE_APPLICATION = $(LIVE555_LIBS)' >> $(@D)/config.$(LIVE555_CONFIG_TARGET)
-	echo 'LIBS_FOR_LIVEMEDIA_LIB = $(LIVE555_LIBS)' >> $(@D)/config.$(LIVE555_CONFIG_TARGET)
+	sed -i 's:^LIBS_FOR_CONSOLE_APPLICATION =.*:LIBS_FOR_CONSOLE_APPLICATION = $(LIVE555_LIBS):g' $(@D)/config.$(LIVE555_CONFIG_TARGET)
+	sed -i 's:^LIBS_FOR_LIVEMEDIA_LIB =.*:LIBS_FOR_LIVEMEDIA_LIB = $(LIVE555_LIBS):g' $(@D)/config.$(LIVE555_CONFIG_TARGET)
 	(cd $(@D); ./genMakefiles $(LIVE555_CONFIG_TARGET))
 endef
 
-- 
2.25.1
