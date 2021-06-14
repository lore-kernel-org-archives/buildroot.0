From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 14 Jun 2021 22:47:49 +0200
Subject: [Buildroot] [PATCH v1 4/4] package/libxmlrpc: add option for tools
 xmlrpc
In-Reply-To: <20210614204749.10693-1-ps.report@gmx.net>
References: <20210614204749.10693-1-ps.report@gmx.net>
Message-ID: <20210614204749.10693-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libxmlrpc/Config.in    |  9 +++++++++
 package/libxmlrpc/libxmlrpc.mk | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/package/libxmlrpc/Config.in b/package/libxmlrpc/Config.in
index d24a79163d..c07dad2fb4 100644
--- a/package/libxmlrpc/Config.in
+++ b/package/libxmlrpc/Config.in
@@ -10,5 +10,14 @@ config BR2_PACKAGE_LIBXMLRPC
 
 	  http://xmlrpc-c.sourceforge.net/
 
+if BR2_PACKAGE_LIBXMLRPC
+
+config BR2_PACKAGE_LIBXMLRPC_TOOLS_XMLRPC
+	bool "tools-xmlrpc"
+	help
+	  Command line tool xmlrpc.
+
+endif # BR2_PACKAGE_LIBXMLRPC
+
 comment "libxmlrpc needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index 833dca5065..c1b0eae8ee 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -53,4 +53,16 @@ LIBXMLRPC_INSTALL_STAGING_OPTS = $(LIBXMLRPC_STATIC_OPTS) \
 LIBXMLRPC_INSTALL_TARGET_OPTS = $(LIBXMLRPC_STATIC_OPTS) \
 	DESTDIR=$(TARGET_DIR) install
 
+ifeq ($(BR2_PACKAGE_LIBXMLRPC_TOOLS_XMLRPC),y)
+define LIBXMLRPC_TOOLS_XMLRPC_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(LIBXMLRPC_MAKE_OPTS) -C $(@D)/tools/xmlrpc
+endef
+LIBXMLRPC_POST_BUILD_HOOKS += LIBXMLRPC_TOOLS_XMLRPC_BUILD_CMDS
+define LIBXMLRPC_TOOLS_XMLRPC_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(LIBXMLRPC_MAKE_OPTS) -C $(@D)/tools/xmlrpc \
+		DESTDIR=$(TARGET_DIR) install
+endef
+LIBXMLRPC_POST_INSTALL_TARGET_HOOKS += LIBXMLRPC_TOOLS_XMLRPC_INSTALL_TARGET_CMDS
+endif
+
 $(eval $(autotools-package))
-- 
2.31.1
