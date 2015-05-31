From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 May 2015 13:06:29 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/nmap: Fix static linking
Message-ID: <1433070389-8581-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/040/040129539257d88d9437d113752bc8634fd9b2b2/
http://autobuild.buildroot.net/results/73a/73a562a3a1f356c1a39b2fb57f0848c4b99fe8b1/
http://autobuild.buildroot.net/results/767/767b8eafe7a204327eaa182c065ca5cfff18096f/
http://autobuild.buildroot.net/results/0f7/0f7f3a56815dc6422a466fe9b4357ace98f78e11/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: reworked to use pcap-config, add openssl libs (libz was missing) (Baruch)

 package/nmap/nmap.mk |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index c8c16e6..5273c4f 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -14,6 +14,13 @@ NMAP_CONF_OPTS = --without-liblua --without-zenmap \
 NMAP_LICENSE = GPLv2
 NMAP_LICENSE_FILES = COPYING
 
+# needed by libpcap
+NMAP_LIBS_FOR_STATIC_LINK += $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)
+
+ifeq ($(BR2_STATIC_LIBS),y)
+NMAP_CONF_ENV += LIBS='$(NMAP_LIBS_FOR_STATIC_LINK)'
+endif
+
 # for 0001-libdnet-wrapper-configure.patch
 define NMAP_WRAPPER_EXEC
 	chmod +x $(@D)/libdnet-stripped/configure.gnu
@@ -23,6 +30,7 @@ NMAP_POST_PATCH_HOOKS += NMAP_WRAPPER_EXEC
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 NMAP_CONF_OPTS += --with-openssl="$(STAGING_DIR)/usr"
 NMAP_DEPENDENCIES += openssl
+NMAP_LIBS_FOR_STATIC_LINK += $(shell $(PKG_CONFIG_HOST_BINARY) --libs --static openssl)
 else
 NMAP_CONF_OPTS += --without-openssl
 endif
-- 
1.7.10.4
