From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 22:32:53 +0100
Subject: [Buildroot] [git commit] package/azure-iot-sdk-c: bump to version
 2018-12-13
Message-ID: <20181230212944.7EB0A88172@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51ef4bbf6bbefbd60cd19a44f510958ae952eca0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump azure-iot-sdk-c to 2018-12-13 release.

We need to specify a value for CMAKE_SYSTEM_VERSION, because the
azure-iot-sdk-c build system is doing a test on this value, and CMake
doesn't internally define it when cross-compiling (see
https://cmake.org/cmake/help/v3.4/variable/CMAKE_SYSTEM_VERSION.html).

Signed-off-by: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
[Thomas: drop patch, pass dummy CMAKE_SYSTEM_VERSION instead.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index 504929aee6..3618e591a9 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AZURE_IOT_SDK_C_VERSION = 2018-03-16
+AZURE_IOT_SDK_C_VERSION = 2018-12-13
 AZURE_IOT_SDK_C_SITE = https://github.com/Azure/azure-iot-sdk-c
 AZURE_IOT_SDK_C_SITE_METHOD = git
 AZURE_IOT_SDK_C_GIT_SUBMODULES = YES
@@ -14,6 +14,11 @@ AZURE_IOT_SDK_C_INSTALL_STAGING = YES
 AZURE_IOT_SDK_C_DEPENDENCIES = libxml2 openssl libcurl util-linux
 AZURE_IOT_SDK_C_CONF_OPTS = -Dskip_samples=ON
 
+# When cross-compiling, CMake doesn't internally pass any
+# CMAKE_SYSTEM_VERSION, so pass a dummy version to make the c-utility
+# WIN32 test happy.
+AZURE_IOT_SDK_C_CONF_OPTS += -DCMAKE_SYSTEM_VERSION=1.0
+
 # The project only supports building one kind of library.
 # Further the install target installs the wrong files, so we do it here:
 ifeq ($(BR2_STATIC_LIBS),y)
