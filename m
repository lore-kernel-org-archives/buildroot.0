From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 15 Oct 2011 00:07:26 -0300
Subject: [Buildroot] [PATCH 12/25] pciutils: bump to version 3.1.8 and other
	fixes
In-Reply-To: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318648059-30431-12-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to pciutils version 3.1.8
Also make it build after busybox because it's got a lightweight
lspci whereas the full-blown is preferred.
Ditch the pci.ids skeleton comment since it's been shipped for some time
now.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pciutils/Config.in   |    3 ---
 package/pciutils/pciutils.mk |    7 ++++++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/pciutils/Config.in b/package/pciutils/Config.in
index 7b318da..a082f23 100644
--- a/package/pciutils/Config.in
+++ b/package/pciutils/Config.in
@@ -4,7 +4,4 @@ config BR2_PACKAGE_PCIUTILS
 	  Various utilities dealing with the PCI bus.
 	  Provides things like setpci and lspci.
 
-	  You'll need a copy of pci.ids or pci.ids.gz in your
-	  target skeleton to enjoy verbose output.
-
 	  http://atrey.karlin.mff.cuni.cz/~mj/pciutils.html
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 52f5f67..28f80d4 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PCIUTILS_VERSION = 3.1.7
+PCIUTILS_VERSION = 3.1.8
 PCIUTILS_SITE = ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 	PCIUTILS_ZLIB=yes
@@ -15,6 +15,11 @@ endif
 PCIUTILS_DNS=no
 PCIUTILS_SHARED=yes
 
+# Build after busybox since it's got a lightweight lspci
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+	PCIUTILS_DEPENDENCIES += busybox
+endif
+
 define PCIUTILS_CONFIGURE_CMDS
 	$(SED) 's/wget --no-timestamping/wget/' $(PCIUTILS_DIR)/update-pciids.sh
 	$(SED) 's/uname -s/echo Linux/' \
-- 
1.7.3.4
