From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Sep 2011 23:00:07 +0200
Subject: [Buildroot] [git commit] xenomai: add support to keep or remove
	Analogy utilities and libs
Message-ID: <20110918210215.CD1B78D5CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=60d48220525f154ee43b2fbe3137a393ebacd4a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
