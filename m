From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Jun 2020 22:09:21 +0200
Subject: [Buildroot] [git commit] package/ell: needs headers >= 4.12
Message-ID: <20200605202035.1C136839E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b3ac6d24db08b241df4687f22f757837ddcb5ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ell needs headers >= 4.12 since version 0.31 and
https://git.kernel.org/pub/scm/libs/ell/ell.git/commit?id=fa950995a48bbcd8f0d3dfbbe9a7f768aba5c50f

Indeed NLM_F_CAPPED, NLM_F_ACK_TLVS, NLMSGERR_ATTR_MSG and
NETLINK_EXT_ACK are only available since
https://github.com/torvalds/linux/commit/2d4bc93368f5a0ddb57c8c885cdad9c9b7a10ed5

So add this dependency to ell and its reverse dependencies

Fixes:
 - http://autobuild.buildroot.org/results/bafc0ee2a3bcb2418a3612da38eb9dcd586b57d4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bluez5_utils/Config.in | 4 ++++
 package/connman/Config.in      | 4 ++++
 package/ell/Config.in          | 6 ++++--
 package/iwd/Config.in          | 6 ++++--
 package/ofono/Config.in        | 7 +++++--
 5 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 1e9eda31dc..73c6f01324 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -62,12 +62,16 @@ config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH
 
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MESH
 	bool "build mesh profile"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # ell
 	select BR2_PACKAGE_ELL
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_READLINE
 	help
 	  Build BlueZ 5.x mesh plugin
 
+comment "mesh profile needs a toolchain w/ headers >= 4.12"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
+
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MIDI
 	bool "build midi profile"
 	select BR2_PACKAGE_ALSA_LIB
diff --git a/package/connman/Config.in b/package/connman/Config.in
index 614b826f96..72b76bf19d 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -85,8 +85,12 @@ config BR2_PACKAGE_CONNMAN_NEARD
 config BR2_PACKAGE_CONNMAN_OFONO
 	bool "enable ofono support"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # ofono
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # ofono
 	select BR2_PACKAGE_OFONO
 
+comment "ofono support needs a toolchain w/ headers >= 4.12"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
+
 config BR2_PACKAGE_CONNMAN_DEBUG
 	bool "enable compiling with debugging information"
 
diff --git a/package/ell/Config.in b/package/ell/Config.in
index f27d581f98..d337154878 100644
--- a/package/ell/Config.in
+++ b/package/ell/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_ELL
 	bool "ell"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
 	help
@@ -8,6 +9,7 @@ config BR2_PACKAGE_ELL
 
 	  https://01.org/ell
 
-comment "ell needs a toolchain w/ dynamic library, wchar"
+comment "ell needs a toolchain w/ dynamic library, wchar, headers >= 4.12"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
diff --git a/package/iwd/Config.in b/package/iwd/Config.in
index c790f3dba1..eff24a8599 100644
--- a/package/iwd/Config.in
+++ b/package/iwd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_IWD
 	bool "iwd"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # ell
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # ell
 	depends on !BR2_STATIC_LIBS # ell
 	depends on BR2_USE_WCHAR # ell
 	select BR2_PACKAGE_ELL
@@ -9,6 +10,7 @@ config BR2_PACKAGE_IWD
 
 	  https://iwd.wiki.kernel.org/
 
-comment "iwd needs a toolchain w/ dynamic library, wchar"
+comment "iwd needs a toolchain w/ dynamic library, wchar, headers >= 4.12"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # ell
-	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
diff --git a/package/ofono/Config.in b/package/ofono/Config.in
index 57ee4bc536..c1d0cae4ef 100644
--- a/package/ofono/Config.in
+++ b/package/ofono/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_OFONO
 	depends on BR2_USE_MMU # dbus, libglib2
 	depends on !BR2_STATIC_LIBS # dlopen(), ell
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # ell
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_ELL
 	select BR2_PACKAGE_LIBCAP_NG
@@ -17,7 +18,9 @@ config BR2_PACKAGE_OFONO
 
 	  http://ofono.org/
 
-comment "ofono needs a toolchain w/ dynamic library, wchar, threads"
+comment "ofono needs a toolchain w/ dynamic library, wchar, threads, headers >= 4.12"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
