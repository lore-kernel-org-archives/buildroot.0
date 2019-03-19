From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Mar 2019 23:01:27 +0100
Subject: [Buildroot] [PATCH v2, 1/2] package/uftp: fix openssl static linking
Message-ID: <20190319220128.12589-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/051cfd993b65830c34e675d797e241c272b6f35a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Use pkg-config instead of hard-coding libraries

 package/uftp/uftp.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/uftp/uftp.mk b/package/uftp/uftp.mk
index bbc362652b..f9f0502b49 100644
--- a/package/uftp/uftp.mk
+++ b/package/uftp/uftp.mk
@@ -6,16 +6,19 @@
 
 UFTP_VERSION = 4.9.9
 UFTP_SITE = http://sourceforge.net/projects/uftp-multicast/files/source-tar
-UFTP_DEPENDENCIES = openssl
+UFTP_DEPENDENCIES = host-pkgconf openssl
 UFTP_LICENSE = GPL-3.0+
 UFTP_LICENSE_FILES = LICENSE.txt
 
+UFTP_MAKE_OPTS = CRYPT_LIB="`$(PKG_CONFIG_HOST_BINARY) --libs libssl`"
+
 define UFTP_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(UFTP_MAKE_OPTS)
 endef
 
 define UFTP_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(UFTP_MAKE_OPTS) \
+		DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
-- 
2.14.1
