From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2011 22:22:54 +0200
Subject: [Buildroot] [PATCH 4/8] xenomai: add support to keep or remove
	RT-CAN utilities
In-Reply-To: <cover.1316290714.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316290714.git.thomas.petazzoni@free-electrons.com>
Message-ID: <cc01cb476eb76c41074c5fe55d38fe6215a2578b.1316290714.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xenomai/Config.in  |    5 +++++
 package/xenomai/xenomai.mk |   11 +++++++++++
 2 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 26c6b51..6ba9f8b 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -108,4 +108,9 @@ config BR2_PACKAGE_XENOMAI_TESTSUITE
        help
          This option allows to install the Xenomai test programs.
 
+config BR2_PACKAGE_XENOMAI_RTCAN
+       bool "RTCan utilities"
+       help
+         This option allows to install the Xenomai RT-CAN utilities.
+
 endif
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index cb73740..36e2e44 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -79,6 +79,17 @@ endef
 XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_TESTSUITE
 endif
 
+ifeq ($(BR2_PACKAGE_XENOMAI_RTCAN),)
+define XENOMAI_REMOVE_RTCAN_PROGS
+	for i in rtcanrecv rtcansend ; do \
+		rm -f $(TARGET_DIR)/usr/xenomai/bin/$$i ; \
+	done
+	rm -f $(TARGET_DIR)/usr/xenomai/sbin/rtcanconfig
+endef
+
+XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_RTCAN_PROGS
+endif
+
 define XENOMAI_ADD_LD_SO_CONF
 	# Add /usr/xenomai/lib in the library search path
 	grep -q "^/usr/xenomai/lib" $(TARGET_DIR)/etc/ld.so.conf || \
-- 
1.7.4.1
