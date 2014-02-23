From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 23 Feb 2014 18:19:49 +0100
Subject: [Buildroot] [PATCH] lua: needs dynamic library support (dlopen)
Message-ID: <8a14c6297835e91f6691.1393175989@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/e76/e765f992ad721a094579140c153ff71f20753265/

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/dnsmasq/Config.in     |  4 ++++
 package/efl/libedje/Config.in |  5 +++--
 package/haserl/Config.in      |  5 +++++
 package/lighttpd/Config.in    |  4 ++++
 package/lua/Config.in         |  4 ++++
 5 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -32,9 +32,13 @@ config BR2_PACKAGE_DNSMASQ_IDN
 config BR2_PACKAGE_DNSMASQ_LUA
 	bool "Lua scripting support"
 	select BR2_PACKAGE_LUA
+	depends on !BR2_PREFER_STATIC_LIB # lua
 	help
 	  Enable Lua scripting for dnsmasq
 
+comment "Lua scripting support needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
+
 config BR2_PACKAGE_DNSMASQ_CONNTRACK
 	bool "conntrack marking support"
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
diff --git a/package/efl/libedje/Config.in b/package/efl/libedje/Config.in
--- a/package/efl/libedje/Config.in
+++ b/package/efl/libedje/Config.in
@@ -1,6 +1,6 @@
-comment "libedje needs a toolchain w/ threads"
+comment "libedje needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_avr32
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
 
 config BR2_PACKAGE_LIBEDJE
 	bool "libedje"
@@ -13,6 +13,7 @@ config BR2_PACKAGE_LIBEDJE
 	select BR2_PACKAGE_LUA
 	depends on !BR2_avr32 # libevas
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
+	depends on !BR2_PREFER_STATIC_LIB # lua
 	help
 	  A graphical layout and animation library for animated
 	  resizable, compressed and scalable themes.
diff --git a/package/haserl/Config.in b/package/haserl/Config.in
--- a/package/haserl/Config.in
+++ b/package/haserl/Config.in
@@ -13,10 +13,15 @@ if BR2_PACKAGE_HASERL
 config BR2_PACKAGE_HASERL_WITH_LUA
 	bool "Lua support"
 	depends on BR2_PACKAGE_HASERL_VERSION_0_9_X
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_PACKAGE_LUA
 	help
 	  Enable Lua support for haserl
 
+comment "Lua support needs a toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_HASERL_VERSION_0_9_X
+	depends on BR2_PREFER_STATIC_LIB
+
 choice
 	prompt "Haserl version"
 	default BR2_PACKAGE_HASERL_VERSION_0_9_X
diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -48,7 +48,11 @@ config BR2_PACKAGE_LIGHTTPD_WEBDAV
 config BR2_PACKAGE_LIGHTTPD_LUA
 	bool "lua support"
 	select BR2_PACKAGE_LUA
+	depends on !BR2_PREFER_STATIC_LIB # lua
 	help
 	  Enable Lua support. Needed to support mod_magnet
 
+comment "lua support needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
+
 endif
diff --git a/package/lua/Config.in b/package/lua/Config.in
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -1,5 +1,9 @@
+comment "lua needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
+
 config BR2_PACKAGE_LUA
 	bool "lua"
+	depends on !BR2_PREFER_STATIC_LIB # dlopen
 	select BR2_PACKAGE_HAS_LUA_INTERPRETER
 	help
 	  Lua is a powerful, fast, light-weight, embeddable scripting language.
