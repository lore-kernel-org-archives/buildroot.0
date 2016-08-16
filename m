From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 16 Aug 2016 10:38:28 -0500
Subject: [Buildroot] [PATCH v2] skeleton: /etc/network/interface.d/* support
Message-ID: <1471361908-51757-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---

v1 -> v2
 - interfaces.d is only supported with full ifupdown package
---
 package/skeleton/skeleton.mk                    | 10 ++++++++++
 system/device_table.txt                         |  1 +
 system/skeleton/etc/network/interfaces.d/.empty |  0
 3 files changed, 11 insertions(+)
 create mode 100644 system/skeleton/etc/network/interfaces.d/.empty

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 1000161..39e2cbb 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -170,9 +170,19 @@ define SKELETON_SET_NETWORK_DHCP
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_IFUPDOWN),y)
+define SKELETON_SET_NETWORK_SUPPORT_INTERFACES_D
+	( \
+		echo ;                                               \
+		echo "source interfaces.d/*";                        \
+	) >> $(TARGET_DIR)/etc/network/interfaces
+endef
+endif
+
 define SKELETON_SET_NETWORK
 	mkdir -p $(TARGET_DIR)/etc/network/
 	$(SKELETON_SET_NETWORK_LOCALHOST)
+	$(SKELETON_SET_NETWORK_SUPPORT_INTERFACES_D)
 	$(SKELETON_SET_NETWORK_DHCP)
 endef
 
diff --git a/system/device_table.txt b/system/device_table.txt
index dc1af51..69b1d46 100644
--- a/system/device_table.txt
+++ b/system/device_table.txt
@@ -17,5 +17,6 @@
 /etc/network/if-pre-up.d		d	755	0	0	-	-	-	-	-
 /etc/network/if-down.d			d	755	0	0	-	-	-	-	-
 /etc/network/if-post-down.d		d	755	0	0	-	-	-	-	-
+/etc/network/interfaces.d		d	755	0	0	-	-	-	-	-
 # uncomment this to allow starting x as non-root
 #/usr/X11R6/bin/Xfbdev		     	f	4755	0	0	-	-	-	-	-
diff --git a/system/skeleton/etc/network/interfaces.d/.empty b/system/skeleton/etc/network/interfaces.d/.empty
new file mode 100644
index 0000000..e69de29
-- 
1.9.1
