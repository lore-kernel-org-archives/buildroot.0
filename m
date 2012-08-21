From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Aug 2012 19:07:03 +0200
Subject: [Buildroot] [PATCH 1/2] package/libnspr: add pkg-config file
In-Reply-To: <1345568824-7523-1-git-send-email-yann.morin.1998@free.fr>
References: <1345568824-7523-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1345568824-7523-2-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages use pkg-config to check for libnspr.

Add our own .pc file (vampirised from Debian).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libnspr/libnspr.mk |   16 ++++++++++++++++
 package/libnspr/nspr.pc.in |   10 ++++++++++
 2 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 package/libnspr/nspr.pc.in

diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 689caa4..736984d 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -16,4 +16,20 @@ LIBNSPR_CONF_OPT  = --host=$(GNU_HOST_NAME)
 LIBNSPR_CONF_OPT += --$(if $(BR2_ARCH_IS_64),en,dis)able-64bit
 LIBNSPR_CONF_OPT += --$(if $(BR2_INET_IPV6),en,dis)able-ipv6
 
+define LIBNSPR_INSTALL_STAGING_PC
+	$(INSTALL) -D -m 0644 $(TOPDIR)/package/libnspr/nspr.pc.in \
+		$(STAGING_DIR)/usr/lib/pkgconfig/nspr.pc
+	$(SED) 's/@VERSION@/$(LIBNSPR_VERSION)/g;' \
+		$(STAGING_DIR)/usr/lib/pkgconfig/nspr.pc
+endef
+LIBNSPR_POST_INSTALL_STAGING_HOOKS += LIBNSPR_INSTALL_STAGING_PC
+
+define LIBNSPR_INSTALL_TARGET_PC
+	$(INSTALL) -D -m 0644 $(TOPDIR)/package/libnspr/nspr.pc.in \
+		$(TARGET_DIR)/usr/lib/pkgconfig/nspr.pc
+	$(SED) 's/@VERSION@/$(LIBNSPR_VERSION)/g;' \
+		$(TARGET_DIR)/usr/lib/pkgconfig/nspr.pc
+endef
+LIBNSPR_POST_INSTALL_TARGET_HOOKS += LIBNSPR_INSTALL_TARGET_PC
+
 $(eval $(autotools-package))
diff --git a/package/libnspr/nspr.pc.in b/package/libnspr/nspr.pc.in
new file mode 100644
index 0000000..44873d2
--- /dev/null
+++ b/package/libnspr/nspr.pc.in
@@ -0,0 +1,10 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include/nspr
+
+Name: NSPR
+Description: The Netscape Portable Runtime
+Version: @VERSION@
+Libs: -L${exec_prefix}/lib -lplds4 -lplc4 -lnspr4 -lpthread -ldl
+Cflags: -I${prefix}/include/nspr
-- 
1.7.2.5
