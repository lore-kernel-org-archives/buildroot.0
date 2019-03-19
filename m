From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Mar 2019 21:46:41 +0100
Subject: [Buildroot] [PATCH 2/3] package/uftp: fix openssl static linking
In-Reply-To: <20190319204642.28920-1-fontaine.fabrice@gmail.com>
References: <20190319204642.28920-1-fontaine.fabrice@gmail.com>
Message-ID: <20190319204642.28920-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/051cfd993b65830c34e675d797e241c272b6f35a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/uftp/uftp.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/uftp/uftp.mk b/package/uftp/uftp.mk
index bbc362652b..1f75a5bac8 100644
--- a/package/uftp/uftp.mk
+++ b/package/uftp/uftp.mk
@@ -10,12 +10,17 @@ UFTP_DEPENDENCIES = openssl
 UFTP_LICENSE = GPL-3.0+
 UFTP_LICENSE_FILES = LICENSE.txt
 
+ifeq ($(BR2_STATIC_LIBS),y)
+UFTP_MAKE_OPTS += CRYPT_LIB='-lssl -lcrypto -lz'
+endif
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
