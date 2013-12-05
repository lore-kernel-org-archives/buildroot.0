From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 5 Dec 2013 17:43:43 +0000
Subject: [Buildroot] [PATCH v2] bluez_utils: broken for static builds
Message-ID: <1386265423-51985-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The bluez_utils package requires shared library support unconditionally.
We can't fix it to make it build on static because, for instance,
"plugin.c" file uses dlfcn and it's a basic prereq for bluetoothd, so
add "depend on !BR2_PREFER_STATIC_LIB" to it and recursively to all
packages that selects BR2_PACKAGE_BLUEZ_UTILS.

Fixes:

   http://autobuild.buildroot.net/results/d81/d81970024649c1e89c01da491c63760afdad6cb6/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/bluez_utils/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index e08e9be..4c93577 100644
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_BLUEZ_UTILS
 	bool "bluez-utils"
 	depends on !BR2_avr32
+	depends on !BR2_PREFER_STATIC_LIB
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
@@ -38,6 +39,6 @@ config BR2_PACKAGE_BLUEZ_UTILS_USB
 
 endif
 
-comment "bluez-utils needs a toolchain w/ wchar, threads"
+comment "bluez-utils needs a toolchain w/ wchar, threads, dynamic library"
 	depends on !BR2_avr32 && BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
-- 
1.7.1
