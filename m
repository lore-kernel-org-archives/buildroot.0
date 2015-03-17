From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 17 Mar 2015 18:15:43 -0500
Subject: [Buildroot] [PATCH v2 1/1] quagga: option for vtysh
Message-ID: <1426634143-31245-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---

  Changes v1 -> v2
  - Added readline dependency (Suggested by Thomas P)

 package/quagga/Config.in | 6 ++++++
 package/quagga/quagga.mk | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/quagga/Config.in b/package/quagga/Config.in
index d8b10f8..4a9f8bb 100644
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -82,6 +82,12 @@ config BR2_PACKAGE_QUAGGA_WATCHQUAGGA
 	help
 	  Build and install watchquagga, a zebra/protocol daemon supervisor.
 
+config BR2_PACKAGE_QUAGGA_VTYSH
+	bool "Build vtysh"
+	select BR2_PACKAGE_READLINE
+	help
+	  Build and install vtysh, a vty shell for Quagga.
+
 config BR2_PACKAGE_QUAGGA_SNMP
 	bool "SNMP support"
 	depends on BR2_USE_MMU # net-snmp
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 2c0a6a9..55f925f 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -32,4 +32,9 @@ QUAGGA_CONF_OPTS += --enable-snmp=agentx
 QUAGGA_DEPENDENCIES += netsnmp
 endif
 
+ifeq ($(BR2_PACKAGE_QUAGGA_VTYSH),y)
+QUAGGA_CONF_OPTS += --enable-vtysh
+QUAGGA_DEPENDENCIES += readline
+endif
+
 $(eval $(autotools-package))
-- 
1.9.1
