From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 15 Dec 2020 22:00:55 +0100
Subject: [Buildroot] [git commit] package/systemd: add a menu entry to
 enable portable services
Message-ID: <20201215204630.E46DF815EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70f35db9f75272ae29936cb0fb7e67c28f098739
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Gervais <fgervais@distech-controls.com>
Reviewed-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/systemd/Config.in  | 18 ++++++++++++++++++
 package/systemd/systemd.mk |  7 ++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index ec34478e3d..fbe1a4081b 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -343,6 +343,24 @@ comment "polkit support needs a toolchain with C++, wchar, NPTL, gcc >= 4.9"
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_USE_WCHAR
 
+config BR2_PACKAGE_SYSTEMD_PORTABLED
+	bool "enable portable services"
+	help
+	  Portable services are systemd services that can be dynamically
+	  attached and detached from the system.
+
+	  These services must come with their own root directory which
+	  they are bound to through an automatically generated drop-in.
+
+	  They also have restrictions applied by the host system in the
+	  form of profiles.
+
+	  This functionality is provided by the system service
+	  systemd-portabled along with the corresponding CLI
+	  portablectl.
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
