From: Ubaldo Porcheddu <ubaldo@eja.it>
Date: Tue, 23 Oct 2018 10:10:49 +0000
Subject: [Buildroot] [PATCH 1/1] Add kernel headers 4.19 choice
Message-ID: <1540289449-1977-1-git-send-email-ubaldo@eja.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ubaldo Porcheddu <ubaldo@eja.it>
---
 package/linux-headers/Config.in.host                                 | 4 ++++
 toolchain/Config.in                                                  | 5 +++++
 .../toolchain-external/toolchain-external-custom/Config.in.options   | 4 ++++
 3 files changed, 13 insertions(+)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index cdf639a..0b162a8 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -125,6 +125,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19
+	bool "4.19.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18
 	bool "4.18.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
diff --git a/toolchain/Config.in b/toolchain/Config.in
index c2192a5..474e3c8 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -361,10 +361,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	default "4.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
 	default "4.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
 	default "4.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 8665d2e..288fc3f 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -123,6 +123,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19
+	bool "4.19.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_18
 	bool "4.18.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
-- 
1.9.1
