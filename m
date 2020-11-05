From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  5 Nov 2020 20:15:46 +0200
Subject: [Buildroot] [PATCH] package/dnsmasq: bump to version 2.82
Message-ID: <7b338b2824ea678728d4e983bc5dd90989a06714.1604600146.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop Makefile modification for pkg-config. Build time PATH ensures that
the Buildroot pkg-config is used.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dnsmasq/dnsmasq.hash | 4 ++--
 package/dnsmasq/dnsmasq.mk   | 8 +-------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index 99e417f069b4..401f930bafc2 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# http://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.81.tar.xz.asc
-sha256  749ca903537c5197c26444ac24b0dce242cf42595fdfe6b9a5b9e4c7ad32f8fb  dnsmasq-2.81.tar.xz
+# http://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.82.tar.xz.asc
+sha256  84523646f3116bb5e1151efb66e645030f6e6a8256f29aab444777a343ebc132  dnsmasq-2.82.tar.xz
 # Locally calculated
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 4a7218a2b73c..117be38d4bcf 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.81
+DNSMASQ_VERSION = 2.82
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
@@ -77,13 +77,7 @@ DNSMASQ_DEPENDENCIES += ubus
 DNSMASQ_COPTS += -DHAVE_UBUS
 endif
 
-define DNSMASQ_FIX_PKGCONFIG
-	$(SED) 's^PKG_CONFIG = pkg-config^PKG_CONFIG = $(PKG_CONFIG_HOST_BINARY)^' \
-		$(DNSMASQ_DIR)/Makefile
-endef
-
 define DNSMASQ_BUILD_CMDS
-	$(DNSMASQ_FIX_PKGCONFIG)
 	$(DNSMASQ_TWEAK_LIBLUA)
 	$(DNSMASQ_MAKE_ENV) $(MAKE) -C $(@D) $(DNSMASQ_MAKE_OPTS) all$(DNSMASQ_I18N)
 endef
-- 
2.28.0
