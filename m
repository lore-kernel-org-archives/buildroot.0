From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 23:20:40 +0100
Subject: [Buildroot] [git commit] quagga: option for vtysh
Message-ID: <20150320222101.3713C818AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=92e8d431f5917a05b5023cf65b43c6f07efab867
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: add corresponding explicit --disable option.]

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/quagga/Config.in |    6 ++++++
 package/quagga/quagga.mk |    7 +++++++
 2 files changed, 13 insertions(+), 0 deletions(-)

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
index 2c0a6a9..756d6e0 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -32,4 +32,11 @@ QUAGGA_CONF_OPTS += --enable-snmp=agentx
 QUAGGA_DEPENDENCIES += netsnmp
 endif
 
+ifeq ($(BR2_PACKAGE_QUAGGA_VTYSH),y)
+QUAGGA_CONF_OPTS += --enable-vtysh
+QUAGGA_DEPENDENCIES += readline
+else
+QUAGGA_CONF_OPTS += --disable-vtysh
+endif
+
 $(eval $(autotools-package))
