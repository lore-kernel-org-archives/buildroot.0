From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Oct 2011 23:07:27 +0200
Subject: [Buildroot] [git commit] pciutils: bump to version 3.1.8 and other
	fixes
Message-ID: <20111015213658.3AD818D520@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f4f23eb1b45c28378cd63629b13b4b2069b00d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to pciutils version 3.1.8
Also make it build after busybox because it's got a lightweight
lspci whereas the full-blown is preferred.
Ditch the pci.ids skeleton comment since it's been shipped for some time
now.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
