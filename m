From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  8 Mar 2020 18:37:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/openjdk-bin: fix install
Message-ID: <20200308173737.181294-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Create $(HOST_DIR)/bin and $(HOST_DIR)/lib otherwise build can fail on:

cp -dpfr /home/buildroot/autobuild/instance-2/output-1/build/host-openjdk-bin-13.0.2_8/bin/* /home/buildroot/autobuild/instance-2/output-1/per-package/host-openjdk-bin/host/bin/
cp: target '/home/buildroot/autobuild/instance-2/output-1/per-package/host-openjdk-bin/host/bin/' is not a directory
package/pkg-generic.mk:276: recipe for target '/home/buildroot/autobuild/instance-2/output-1/build/host-openjdk-bin-13.0.2_8/.stamp_host_installed' failed
make: *** [/home/buildroot/autobuild/instance-2/output-1/build/host-openjdk-bin-13.0.2_8/.stamp_host_installed] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/28bcec0d28003c2784b6cd27039099c65bac3b96

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openjdk-bin/openjdk-bin.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index e2525a5c3d..e780a797e6 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -18,7 +18,9 @@ HOST_OPENJDK_BIN_LICENSE_FILES = legal/java.prefs/LICENSE legal/java.prefs/ASSEM
 # Because unpack200 is a deprecated tool, removing it to fix this
 # issue is safe.
 define HOST_OPENJDK_BIN_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/bin
 	cp -dpfr $(@D)/bin/* $(HOST_DIR)/bin/
+	mkdir -p $(HOST_DIR)/lib
 	cp -dpfr $(@D)/lib/* $(HOST_DIR)/lib/
 	$(RM) -f $(HOST_DIR)/bin/unpack200
 endef
-- 
2.25.0
