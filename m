From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 14 Mar 2012 17:50:59 +0100
Subject: [Buildroot] [PATCH] valgrind: allow selecting which tools to install
Message-ID: <3d26fc988e01a367dd05.1331743859@beantl019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The full valgrind installation takes more than 20 MB, while one typically does
not use all of its tools. This patch adds extra config options to select which
tools to install.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/valgrind/Config.in   |  70 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 package/valgrind/valgrind.mk |  95 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 165 insertions(+), 0 deletions(-)

diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
--- a/package/valgrind/Config.in
+++ b/package/valgrind/Config.in
@@ -6,3 +6,73 @@ config BR2_PACKAGE_VALGRIND
 	  Tool for debugging and profiling Linux programs.
 
 	  http://valgrind.kde.org/
+
+if BR2_PACKAGE_VALGRIND
+
+config BR2_PACKAGE_VALGRIND_MEMCHECK
+	bool "Memcheck: a memory error detector"
+	default y
+	help
+	  This option allows to install the Memcheck tool
+
+config BR2_PACKAGE_VALGRIND_CACHEGRIND
+	bool "Cachegrind: a cache and branch-prediction profiler"
+	default y
+	help
+	  This option allows to install the Cachegrind tool
+
+config BR2_PACKAGE_VALGRIND_CALLGRIND
+	bool "Callgrind: a call-graph generating cache and branch prediction profiler"
+	default y
+	help
+	  This option allows to install the Callgrind tool
+
+config BR2_PACKAGE_VALGRIND_HELGRIND
+	bool "Helgrind: a thread error detector"
+	default y
+	help
+	  This option allows to install the Helgrind tool
+
+config BR2_PACKAGE_VALGRIND_DRD
+	bool "DRD: a thread error detector"
+	default y
+	help
+	  This option allows to install the DRD tool
+
+config BR2_PACKAGE_VALGRIND_MASSIF
+	bool "Massif: a heap profiler"
+	default y
+	help
+	  This option allows to install the Massif tool
+
+config BR2_PACKAGE_VALGRIND_DHAT
+	bool "DHAT: a dynamic heap analysis tool"
+	default y
+	help
+	  This option allows to install the DHAT tool
+
+config BR2_PACKAGE_VALGRIND_PTRCHECK
+	bool "Ptrcheck: an experimental head, stack and global array overrun detector"
+	default y
+	help
+	  This option allows to install the Ptrcheck tool
+
+config BR2_PACKAGE_VALGRIND_BBV
+	bool "BBV: an experimental basic block vector generation tool"
+	default y
+	help
+	  This option allows to install the BBV tool
+
+config BR2_PACKAGE_VALGRIND_LACKEY
+	bool "Lackey: an example tool"
+	default y
+	help
+	  This option allows to install the Lackey tool
+
+config BR2_PACKAGE_VALGRIND_NULGRIND
+	bool "Nulgrind: the minimal Valgrind tool"
+	default y
+	help
+	  This option allows to install the Nulgrind tool
+
+endif
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -25,4 +25,99 @@ endef
 
 VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_INSTALL_UCLIBC_SUPP
 
+ifeq ($(BR2_PACKAGE_VALGRIND_MEMCHECK),)
+define VALGRIND_REMOVE_MEMCHECK
+	rm -f $(TARGET_DIR)/usr/lib/valgrind/*memcheck*
+endef
+
+VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_MEMCHECK
+endif
+
+ifeq ($(BR2_PACKAGE_VALGRIND_CACHEGRIND),)
+define VALGRIND_REMOVE_CACHEGRIND
+	rm -f $(TARGET_DIR)/usr/lib/valgrind/*cachegrind*
+	for i in cg_annotate cg_diff cg_merge; do \
+		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
+	done
+endef
+
+VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_CACHEGRIND
+endif
+
+ifeq ($(BR2_PACKAGE_VALGRIND_CALLGRIND),)
+define VALGRIND_REMOVE_CALLGRIND
+	rm -f $(TARGET_DIR)/usr/lib/valgrind/*callgrind*
+	for i in callgrind_annotate callgrind_control ; do \
+		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
+	done
+endef
+
+VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_CALLGRIND
+endif
+
+ifeq ($(BR2_PACKAGE_VALGRIND_HELGRIND),)
+define VALGRIND_REMOVE_HELGRIND
+	rm -f $(TARGET_DIR)/usr/lib/valgrind/*helgrind*
+endef
+
+VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_HELGRIND
+endif
+
+ifeq ($(BR2_PACKAGE_VALGRIND_DRD),)
+define VALGRIND_REMOVE_DRD
+	rm -f $(TARGET_DIR)/usr/lib/valgrind/*drd*
+endef
+
+VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_DRD
+endif
+
+ifeq ($(BR2_PACKAGE_VALGRIND_MASSIF),)
+define VALGRIND_REMOVE_MASSIF
+	rm -f $(TARGET_DIR)/usr/lib/valgrind/*massif*
+	rm -f $(TARGET_DIR)/usr/bin/ms_script
+endef
+
+VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_MASSIF
+endif
+
+ifeq ($(BR2_PACKAGE_VALGRIND_DHAT),)
+define VALGRIND_REMOVE_DHAT
+	rm -f $(TARGET_DIR)/usr/lib/valgrind/*dhat*
+endef
+
+VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_DHAT
+endif
+
+ifeq ($(BR2_PACKAGE_VALGRIND_PTRCHECK),)
+define VALGRIND_REMOVE_PTRCHECK
+	rm -f $(TARGET_DIR)/usr/lib/valgrind/*ptrcheck*
+endef
+
+VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_PTRCHECK
+endif
+
+ifeq ($(BR2_PACKAGE_VALGRIND_BBV),)
+define VALGRIND_REMOVE_BBV
+	rm -f $(TARGET_DIR)/usr/lib/valgrind/*bbv*
+endef
+
+VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_BBV
+endif
+
+ifeq ($(BR2_PACKAGE_VALGRIND_LACKEY),)
+define VALGRIND_REMOVE_LACKEY
+	rm -f $(TARGET_DIR)/usr/lib/valgrind/*lackey*
+endef
+
+VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_LACKEY
+endif
+
+ifeq ($(BR2_PACKAGE_VALGRIND_NULGRIND),)
+define VALGRIND_REMOVE_NULGRIND
+	rm -f $(TARGET_DIR)/usr/lib/valgrind/*none*
+endef
+
+VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_NULGRIND
+endif
+
 $(eval $(call AUTOTARGETS))
