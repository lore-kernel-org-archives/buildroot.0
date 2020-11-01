From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  1 Nov 2020 17:57:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/azure-iot-sdk-c: needs wchar
Message-ID: <20201101165738.2334483-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wchar is needed since version LTS_07_2020_Ref01 which bumped internal
umock with
https://github.com/Azure/azure-iot-sdk-c/commit/8a27860452ec7345bce84d6690b0e8d167b7560a

Indeed umock unconditionally depends on wchar since
https://github.com/Azure/umock-c/commit/6b8e0160defb23ec4fde159ba6389cf61e352a0b

Fixes:
 - http://autobuild.buildroot.org/results/ad7ecd00d8f55c7cae5886c38c097ff0d071a962

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/azure-iot-sdk-c/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/azure-iot-sdk-c/Config.in b/package/azure-iot-sdk-c/Config.in
index c554d2fb9b..860746524c 100644
--- a/package/azure-iot-sdk-c/Config.in
+++ b/package/azure-iot-sdk-c/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_AZURE_IOT_SDK_C
 	bool "azure-iot-sdk-c"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_OPENSSL
@@ -13,5 +14,6 @@ config BR2_PACKAGE_AZURE_IOT_SDK_C
 
 	  https://github.com/Azure/azure-iot-sdk-c
 
-comment "azure-iot-sdk-c needs a toolchain w/ C++ and NPTL"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+comment "azure-iot-sdk-c needs a toolchain w/ C++, NPTL and wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
-- 
2.28.0
