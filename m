From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat, 18 Apr 2020 19:14:11 -0300
Subject: [Buildroot] [PATCH v2 5/5] package/ti-sgx-km: use modules-load to
 load the kernel module
In-Reply-To: <20200418221411.1549783-1-unixmania@gmail.com>
References: <20200418221411.1549783-1-unixmania@gmail.com>
Message-ID: <20200418221411.1549783-6-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

This is compatible with BusyBox/sysvinit (via S02modules-load), OpenRC
and systemd. It also prevents trying to load the module each time the
init script is executed.

Remove the insmod command from the ti-sgx-um init script.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
Tested on a BeagleBone Black card using beaglebone_qt5_defconfig.
---
 package/ti-sgx-km/ti-sgx-km.mk | 10 ++++++++++
 package/ti-sgx-um/S80ti-sgx    | 19 ++-----------------
 2 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/package/ti-sgx-km/ti-sgx-km.mk b/package/ti-sgx-km/ti-sgx-km.mk
index ae294c300a..7f627f276b 100644
--- a/package/ti-sgx-km/ti-sgx-km.mk
+++ b/package/ti-sgx-km/ti-sgx-km.mk
@@ -33,4 +33,14 @@ define TI_SGX_KM_INSTALL_TARGET_CMDS
 		kbuild_install -C $(@D)/$(TI_SGX_KM_SUBDIR)
 endef
 
+define TI_SGX_KM_GEN_MODULES_CONF
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/modules-load.d
+	{ \
+		find $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra -name 'pvrsrvkm.ko*'; \
+	} 2> /dev/null | { \
+		sed 's:^.*/::; s:\.ko[^ ]*::'; \
+	} > $(TARGET_DIR)/etc/modules-load.d/50-ti-sgx-km.conf
+endef
+TI_SGX_KM_TARGET_FINALIZE_HOOKS += TI_SGX_KM_GEN_MODULES_CONF
+
 $(eval $(generic-package))
diff --git a/package/ti-sgx-um/S80ti-sgx b/package/ti-sgx-um/S80ti-sgx
index 2630a0576a..0f183b6fc5 100644
--- a/package/ti-sgx-um/S80ti-sgx
+++ b/package/ti-sgx-um/S80ti-sgx
@@ -1,24 +1,9 @@
 #!/bin/sh
 
-pvrsrvkm_ko="/lib/modules/$(/bin/uname -r)/extra/pvrsrvkm.ko"
-
-pvr_loaded() {
-	/sbin/lsmod | /bin/grep -q '^\<pvrsrvkm\>'
-}
-
-pvr_load() {
-	/sbin/insmod "$pvrsrvkm_ko" > /dev/null 2>&1
-}
-
 start() {
-	printf 'Loading pvrsrvkm module: '
-	pvr_loaded || pvr_load
+	printf 'Starting PowerVR services: '
+	/usr/bin/pvrsrvctl --start --no-module > /dev/null 2>&1
 	status=$?
-	if [ "$status" -eq 0 ]; then
-		printf 'Starting PowerVR services: '
-		/usr/bin/pvrsrvctl --start --no-module > /dev/null 2>&1
-		status=$?
-	fi
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
 	else
-- 
2.18.2
