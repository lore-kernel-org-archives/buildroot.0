From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Dec 2015 23:40:27 +0100
Subject: [Buildroot] [PATCH 4/4 v2] package/libedje: do not select Lua,
	depend on it
In-Reply-To: <cover.1450391976.git.yann.morin.1998@free.fr>
References: <cover.1450391976.git.yann.morin.1998@free.fr>
Message-ID: <84fa969c68f847a8cbc781c28da5a5c2bc56dce8.1450391976.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lua is a provider for the virtual package lua-interpreter, so it cannot
be selected, as explained in the manual.

Turn the 'select' into a 'depends on'; propagate the dependency. Update
the comment for Enlightenment to reference Lua.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Note: I haven't check if libedje could use luajit instead of Lua. This
change is just a mechanical change. Also, libedje is slated for removal
once we bump the EFL version to 1.15.x.

---
Changes v1 -> v2:
  - drop the comment  (Thomas)
  - except for Enlightenment
---
 package/efl/libedje/Config.in       | 4 ++--
 package/efl/libelementary/Config.in | 4 +++-
 package/efl/libethumb/Config.in     | 3 ++-
 package/enlightenment/Config.in     | 6 ++++--
 4 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/package/efl/libedje/Config.in b/package/efl/libedje/Config.in
index b163508..6af85ee 100644
--- a/package/efl/libedje/Config.in
+++ b/package/efl/libedje/Config.in
@@ -1,5 +1,5 @@
 comment "libedje needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PACKAGE_LUA || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_LIBEDJE
 	bool "libedje"
@@ -9,7 +9,7 @@ config BR2_PACKAGE_LIBEDJE
 	select BR2_PACKAGE_LIBECORE_EVAS
 	select BR2_PACKAGE_LIBEMBRYO
 	select BR2_PACKAGE_LIBEVAS
-	select BR2_PACKAGE_LUA
+	depends on BR2_PACKAGE_LUA
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
 	help
 	  A graphical layout and animation library for animated
diff --git a/package/efl/libelementary/Config.in b/package/efl/libelementary/Config.in
index fcc7025..68237c7 100644
--- a/package/efl/libelementary/Config.in
+++ b/package/efl/libelementary/Config.in
@@ -1,10 +1,12 @@
 comment "libelementary needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_PACKAGE_LUA || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_STATIC_LIBS
 
 config BR2_PACKAGE_LIBELEMENTARY
 	bool "libelementary"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_LUA # libedje
 	select BR2_PACKAGE_LIBEINA
 	select BR2_PACKAGE_LIBEVAS
 	select BR2_PACKAGE_LIBECORE
diff --git a/package/efl/libethumb/Config.in b/package/efl/libethumb/Config.in
index 3e9cbde..78d51f9 100644
--- a/package/efl/libethumb/Config.in
+++ b/package/efl/libethumb/Config.in
@@ -1,5 +1,5 @@
 comment "libethumb needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PACKAGE_LUA || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_LIBETHUMB
 	bool "libethumb"
@@ -9,6 +9,7 @@ config BR2_PACKAGE_LIBETHUMB
 	select BR2_PACKAGE_LIBECORE_EVAS
 	select BR2_PACKAGE_LIBEDJE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
+	depends on BR2_PACKAGE_LUA # libedje
 	help
 	  Ethumb is a library for generating thumbnail images of documents.
 
diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index 9dad571..67e1dbc 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	depends on BR2_PACKAGE_XORG7
 	# libevas-generic-loaders-svg -> librsvg -> pango -> cairo
 	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_PACKAGE_LUA # libedje
 	select BR2_PACKAGE_EFL
 	select BR2_PACKAGE_LIBECORE
 	select BR2_PACKAGE_LIBECORE_X
@@ -37,7 +38,8 @@ config BR2_PACKAGE_ENLIGHTENMENT
 
 	  http://www.enlightenment.org/
 
-comment "enlightenment needs a toolchain w/ wchar, C++, threads"
+comment "enlightenment needs the Lua interpreter and a toolchain w/ wchar, C++, threads"
 	depends on BR2_PACKAGE_XORG7 && BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_PACKAGE_LUA || !BR2_USE_WCHAR \
+                || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
 	depends on BR2_ARCH_HAS_ATOMICS
-- 
1.9.1
