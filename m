From: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
Date: Wed, 20 Jan 2016 16:05:48 +0530
Subject: [Buildroot] [PATCH 1/2 V6] Adds package/nvme: new package
Message-ID: <20160120102906.23540.76413.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for building NVME utility - a utility for interacting with
standard NVM Express (optimized PCI Express SSD interface) devices.

Signed-off-by: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
---
 package/nvme/0001-NVME-Makefile-cleanup.patch |   25 +++++++++++++++++++++++++
 package/nvme/nvme.hash                        |    2 ++
 package/nvme/nvme.mk                          |   22 ++++++++++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100644 package/nvme/0001-NVME-Makefile-cleanup.patch
 create mode 100644 package/nvme/nvme.hash
 create mode 100755 package/nvme/nvme.mk

diff --git a/package/nvme/0001-NVME-Makefile-cleanup.patch b/package/nvme/0001-NVME-Makefile-cleanup.patch
new file mode 100644
index 0000000..74beac9
--- /dev/null
+++ b/package/nvme/0001-NVME-Makefile-cleanup.patch
@@ -0,0 +1,25 @@
+From 985a18605f8decd766370a7d9873c77c16b9253c Mon Sep 17 00:00:00 2001
+From: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
+Date: Mon, 18 Jan 2016 12:40:00 +0530
+Subject: [PATCH V2] NVME Makefile update
+
+Makefile cleanup: remove -Werror flag in CFLAGS
+
+Signed-off-by: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index d0c0ce4..003928b 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,4 +1,4 @@
+-CFLAGS += -std=gnu99 -O2 -g -Wall -Werror
++CFLAGS += -std=gnu99 -O2 -g -Wall
+ CPPFLAGS += -I $(SRC) -D_GNU_SOURCE
+ NVME = nvme
+ INSTALL ?= install
+--
+1.9.3
+
diff --git a/package/nvme/nvme.hash b/package/nvme/nvme.hash
new file mode 100644
index 0000000..539a2b6
--- /dev/null
+++ b/package/nvme/nvme.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  914319930a51372293c981562b165ae6af0de70f7da37e42da23940fe23aa387 nvme-v0.2.tar.gz
diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
new file mode 100755
index 0000000..f06ed47
--- /dev/null
+++ b/package/nvme/nvme.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# nvme
+#
+################################################################################
+
+NVME_VERSION = v0.2
+NVME_SITE = $(call github,linux-nvme,nvme-cli,$(NVME_VERSION))
+NVME_LICENSE = GPLv2+
+NVME_LICENSE_FILES = COPYING
+
+define NVME_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
+		LIBUDEV=1 -C $(@D)
+endef
+
+define NVME_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
+		PREFIX=/usr install-bin
+endef
+
+$(eval $(generic-package))
