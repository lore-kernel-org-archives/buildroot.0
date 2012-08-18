From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Aug 2012 14:55:43 +0200
Subject: [Buildroot] [PATCH 2/2] package/libnss: also install a pkg-config
	file
In-Reply-To: <1345294543-13671-1-git-send-email-yann.morin.1998@free.fr>
References: <1345294543-13671-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1345294543-13671-2-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages use pkg-config to check for libnss.

Add our own .pc file (vampirised from Debian).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libnss/libnss.mk |    8 ++++++++
 package/libnss/nss.pc.in |   11 +++++++++++
 2 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 package/libnss/nss.pc.in

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index f7fd682..84fc149 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -49,6 +49,10 @@ define LIBNSS_INSTALL_STAGING_CMDS
 		$(@D)/$(LIBNSS_DISTDIR)/public/nss/*
 	$(INSTALL) -m 755 -t $(STAGING_DIR)/usr/lib/ \
 		$(@D)/$(LIBNSS_DISTDIR)/lib/*.a
+	$(INSTALL) -D -m 0644 $(TOPDIR)/package/libnss/nss.pc.in \
+		$(STAGING_DIR)/usr/lib/pkgconfig/nss.pc
+	$(SED) 's/@VERSION@/$(LIBNSS_VERSION)/g;' \
+		$(STAGING_DIR)/usr/lib/pkgconfig/nss.pc
 endef
 
 define LIBNSS_INSTALL_TARGET_CMDS
@@ -59,6 +63,10 @@ define LIBNSS_INSTALL_TARGET_CMDS
 		$(@D)/$(LIBNSS_DISTDIR)/public/nss/*
 	$(INSTALL) -m 755 -t $(TARGET_DIR)/usr/lib/ \
 		$(@D)/$(LIBNSS_DISTDIR)/lib/*.a
+	$(INSTALL) -D -m 0644 $(TOPDIR)/package/libnss/nss.pc.in \
+		$(TARGET_DIR)/usr/lib/pkgconfig/nss.pc
+	$(SED) 's/@VERSION@/$(LIBNSS_VERSION)/g;' \
+		$(TARGET_DIR)/usr/lib/pkgconfig/nss.pc
 endef
 
 define LIBNSS_CLEAN_CMDS
diff --git a/package/libnss/nss.pc.in b/package/libnss/nss.pc.in
new file mode 100644
index 0000000..e27783f
--- /dev/null
+++ b/package/libnss/nss.pc.in
@@ -0,0 +1,11 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include/nss
+
+Name: NSS
+Description: Mozilla Network Security Services
+Version: @VERSION@
+Requires: nspr
+Libs: -L${libdir} -lnss3 -lnssutil3 -lsmime3 -lssl3
+Cflags: -I${includedir}
-- 
1.7.2.5
