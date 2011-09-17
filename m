From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2011 22:22:55 +0200
Subject: [Buildroot] [PATCH 5/8] xenomai: add support to keep or remove
	Analogy utilities and libs
In-Reply-To: <cover.1316290714.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316290714.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4013c3e3fc60e93f14b7a67db19b242c4663b41f.1316290714.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xenomai/Config.in  |    6 ++++++
 package/xenomai/xenomai.mk |   13 +++++++++++++
 2 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 6ba9f8b..3749a60 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -113,4 +113,10 @@ config BR2_PACKAGE_XENOMAI_RTCAN
        help
          This option allows to install the Xenomai RT-CAN utilities.
 
+config BR2_PACKAGE_XENOMAI_ANALOGY
+       bool "Analogy libs and utils"
+       help
+         This option allows to install the Xenomai Analogy utilities
+         and libraries
+
 endif
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 36e2e44..fff2c5d 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -90,6 +90,19 @@ endef
 XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_RTCAN_PROGS
 endif
 
+ifeq ($(BR2_PACKAGE_XENOMAI_ANALOGY),)
+define XENOMAI_REMOVE_ANALOGY
+	for i in cmd_bits cmd_read cmd_write insn_write \
+		insn_bits insn_read ; do \
+		rm -f $(TARGET_DIR)/usr/xenomai/bin/$$i ; \
+	done
+	rm -f $(TARGET_DIR)/usr/xenomai/sbin/analogy_config
+	rm -f $(TARGET_DIR)/usr/xenomai/lib/libanalogy.*
+endef
+
+XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_ANALOGY
+endif
+
 define XENOMAI_ADD_LD_SO_CONF
 	# Add /usr/xenomai/lib in the library search path
 	grep -q "^/usr/xenomai/lib" $(TARGET_DIR)/etc/ld.so.conf || \
-- 
1.7.4.1
