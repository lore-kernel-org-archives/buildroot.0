From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 28 Jan 2021 20:46:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/open62541: force Release build
Message-ID: <20210128194619.4160433-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Force Release build to remove -Werror and avoid the following build
failure:

/home/giuliobenetti/autobuild/run/instance-3/output-1/build/open62541-1.0/arch/network_tcp.c: At top level:
cc1: error: unrecognized command line option '-Wno-static-in-inline' [-Werror]
cc1: all warnings being treated as errors

Fixes:
 - http://autobuild.buildroot.org/results/24b429ce0ae2b33e72bb6a0f523c3906e539a4fd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/open62541/open62541.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 71c14f78ba..5a9f27562a 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -13,9 +13,11 @@ OPEN62541_INSTALL_STAGING = YES
 OPEN62541_LICENSE = MPL-2.0
 OPEN62541_LICENSE_FILES = LICENSE
 
+# Force Release build to remove -Werror.
 # Don't use git describe to get the version number.
 # Disable hardening options to let Buildroot handle it.
 OPEN62541_CONF_OPTS = \
+	-DCMAKE_BUILD_TYPE=Release \
 	-DGIT_EXECUTABLE=NO \
 	-DOPEN62541_VERSION=$(OPEN62541_VERSION) \
 	-DUA_ENABLE_HARDENING=OFF
-- 
2.29.2
