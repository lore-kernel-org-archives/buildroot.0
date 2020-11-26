From: Francois Gervais <fgervais@distech-controls.com>
Date: Thu, 26 Nov 2020 08:06:30 -0500
Subject: [Buildroot] [PATCH v3 1/1] package/systemd: add a menu entry to
 enable portable services
Message-ID: <20201126130630.17954-1-fgervais@distech-controls.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Gervais <fgervais@distech-controls.com>
---
Changes v2 -> v3:
  - Squash both patches in 1

 package/systemd/Config.in  | 17 +++++++++++++++++
 package/systemd/systemd.mk |  7 ++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index ec34478e3d..3966ba2fc7 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -343,6 +343,23 @@ comment "polkit support needs a toolchain with C++, wchar, NPTL, gcc >= 4.9"
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_USE_WCHAR
 
+config BR2_PACKAGE_SYSTEMD_PORTABLED
+	bool "enable portable services"
+	help
+	  Portable services are systemd services that can be dynamically
+	  attached and detached from the system.
+
+	  These services must come with their own root directory which
+	  they are bond to through an automatically generated drop-in.
+
+	  They also have restrictions applied by the host system in the
+	  form of profiles.
+
+	  This functionality is provided by the system service systemd-portabled
+	  along with the corresponding CLI portablectl.
+
+	  https://systemd.io/PORTABLE_SERVICES/
+
 config BR2_PACKAGE_SYSTEMD_QUOTACHECK
 	bool "enable quotacheck tools"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index cb12f667d6..5aed87f452 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -33,7 +33,6 @@ SYSTEMD_CONF_OPTS += \
 	-Dman=false \
 	-Dmount-path=/usr/bin/mount \
 	-Dnss-systemd=true \
-	-Dportabled=false \
 	-Dquotacheck-path=/usr/sbin/quotacheck \
 	-Dquotaon-path=/usr/sbin/quotaon \
 	-Drootlibdir='/usr/lib' \
@@ -417,6 +416,12 @@ else
 SYSTEMD_CONF_OPTS += -Dpolkit=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_PORTABLED),y)
+SYSTEMD_CONF_OPTS += -Dportabled=true
+else
+SYSTEMD_CONF_OPTS += -Dportabled=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += -Dnetworkd=true
 SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * - - - systemd Network Management
-- 
2.17.1
