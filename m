From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 12:23:29 +0100
Subject: [Buildroot] [git commit] package/screenfetch: new package
Message-ID: <20210117110441.5FDAE827F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb449b19c528849e2a6f8a38265338de760cb640
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christian Stewart <christian@paral.in>
Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[yann.morin.1998 at free.fr: rename package]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                    |  1 +
 package/screenfetch/Config.in        |  9 +++++++++
 package/screenfetch/screenfetch.hash |  2 ++
 package/screenfetch/screenfetch.mk   | 17 +++++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 54b917b736..bfc60b5a69 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2386,6 +2386,7 @@ comment "Utilities"
 	source "package/ranger/Config.in"
 	source "package/rtty/Config.in"
 	source "package/screen/Config.in"
+	source "package/screenfetch/Config.in"
 	source "package/sudo/Config.in"
 	source "package/terminology/Config.in"
 	source "package/time/Config.in"
diff --git a/package/screenfetch/Config.in b/package/screenfetch/Config.in
new file mode 100644
index 0000000000..c0e7100f38
--- /dev/null
+++ b/package/screenfetch/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SCREENFETCH
+	bool "screenfetch"
+	depends on BR2_USE_MMU # bash
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
+	select BR2_PACKAGE_BASH # runtime dependency
+	help
+	  screenFetch is a bash script to display distro info.
+
+	  https://github.com/KittyKatt/screenFetch
diff --git a/package/screenfetch/screenfetch.hash b/package/screenfetch/screenfetch.hash
new file mode 100644
index 0000000000..9730041948
--- /dev/null
+++ b/package/screenfetch/screenfetch.hash
@@ -0,0 +1,2 @@
+sha256  aa97dcd2a8576ae18de6c16c19744aae1573a3da7541af4b98a91930a30a3178  screenfetch-v3.9.1.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/screenfetch/screenfetch.mk b/package/screenfetch/screenfetch.mk
new file mode 100644
index 0000000000..b4eb452c97
--- /dev/null
+++ b/package/screenfetch/screenfetch.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# screenfetch
+#
+################################################################################
+
+SCREENFETCH_VERSION = v3.9.1
+SCREENFETCH_SITE = $(call github,KittyKatt,screenFetch,$(SCREENFETCH_VERSION))
+SCREENFETCH_LICENSE = GPL-3.0+
+SCREENFETCH_LICENSE_FILES = COPYING
+
+define SCREENFETCH_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/screenfetch-dev \
+		$(TARGET_DIR)/usr/bin/screenfetch
+endef
+
+$(eval $(generic-package))
