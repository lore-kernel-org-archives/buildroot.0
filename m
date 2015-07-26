From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:18 +0200
Subject: [Buildroot] [RFC 08/37] package/efl: move one directory higher
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-9-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We usually do not have a sub-directory for a family of related
packages, so move efl packages one directory higher, so they
all are in package/

Also re-order packages alphabetically

Remove efl package for now without legacy handling, it'll
re-added in a follow up patch during efl version bump.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/Config.in                           | 11 ++++++++++-
 package/efl/Config.in                       | 27 ---------------------------
 package/efl/efl.mk                          |  2 --
 package/enlightenment/Config.in             |  1 -
 package/expedite/Config.in                  |  1 -
 package/{efl => }/libecore/Config.in        |  5 +++++
 package/{efl => }/libecore/libecore.mk      |  0
 package/{efl => }/libedbus/Config.in        | 12 ++++++------
 package/{efl => }/libedbus/libedbus.mk      |  0
 package/{efl => }/libedje/Config.in         |  6 ++++--
 package/{efl => }/libedje/libedje.mk        |  0
 package/{efl => }/libeet/Config.in          |  5 +++++
 package/{efl => }/libeet/libeet.mk          |  0
 package/{efl => }/libefreet/Config.in       |  5 +++++
 package/{efl => }/libefreet/libefreet.mk    |  0
 package/{efl => }/libeina/Config.in         |  6 ++++++
 package/{efl => }/libeina/libeina.mk        |  0
 package/{efl => }/libeio/Config.in          |  6 ++++--
 package/{efl => }/libeio/libeio.mk          |  0
 package/{efl => }/libembryo/Config.in       |  5 +++++
 package/{efl => }/libembryo/libembryo.mk    |  0
 package/{efl => }/libethumb/Config.in       |  6 ++++--
 package/{efl => }/libethumb/libethumb.mk    |  0
 package/{efl => }/libevas/0001-giflib.patch |  0
 package/{efl => }/libevas/Config.in         |  6 ++++--
 package/{efl => }/libevas/libevas.mk        |  0
 26 files changed, 58 insertions(+), 46 deletions(-)
 delete mode 100644 package/efl/Config.in
 delete mode 100644 package/efl/efl.mk
 rename package/{efl => }/libecore/Config.in (89%)
 rename package/{efl => }/libecore/libecore.mk (100%)
 rename package/{efl => }/libedbus/Config.in (73%)
 rename package/{efl => }/libedbus/libedbus.mk (100%)
 rename package/{efl => }/libedje/Config.in (78%)
 rename package/{efl => }/libedje/libedje.mk (100%)
 rename package/{efl => }/libeet/Config.in (71%)
 rename package/{efl => }/libeet/libeet.mk (100%)
 rename package/{efl => }/libefreet/Config.in (70%)
 rename package/{efl => }/libefreet/libefreet.mk (100%)
 rename package/{efl => }/libeina/Config.in (54%)
 rename package/{efl => }/libeina/libeina.mk (100%)
 rename package/{efl => }/libeio/Config.in (80%)
 rename package/{efl => }/libeio/libeio.mk (100%)
 rename package/{efl => }/libembryo/Config.in (68%)
 rename package/{efl => }/libembryo/libembryo.mk (100%)
 rename package/{efl => }/libethumb/Config.in (67%)
 rename package/{efl => }/libethumb/libethumb.mk (100%)
 rename package/{efl => }/libevas/0001-giflib.patch (100%)
 rename package/{efl => }/libevas/Config.in (97%)
 rename package/{efl => }/libevas/libevas.mk (100%)

diff --git a/package/Config.in b/package/Config.in
index 1d87350..c5729f1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -241,7 +241,17 @@ endif
 	source "package/fbv/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/imagemagick/Config.in"
+	source "package/libecore/Config.in"
+	source "package/libeet/Config.in"
+	source "package/libedje/Config.in"
+	source "package/libefreet/Config.in"
+	source "package/libeina/Config.in"
+	source "package/libeio/Config.in"
+	source "package/libedbus/Config.in"
 	source "package/libelementary/Config.in"
+	source "package/libembryo/Config.in"
+	source "package/libethumb/Config.in"
+	source "package/libevas/Config.in"
 	source "package/libevas-generic-loaders/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
@@ -259,7 +269,6 @@ endif
 	source "package/sdl_ttf/Config.in"
 
 comment "Other GUIs"
-	source "package/efl/Config.in"
 	source "package/qt/Config.in"
 	source "package/qt5/Config.in"
 if BR2_PACKAGE_QT || BR2_PACKAGE_QT5
diff --git a/package/efl/Config.in b/package/efl/Config.in
deleted file mode 100644
index 659ee10..0000000
--- a/package/efl/Config.in
+++ /dev/null
@@ -1,27 +0,0 @@
-menuconfig BR2_PACKAGE_EFL
-	bool "Enlightenment Foundation Libraries"
-	depends on BR2_USE_WCHAR
-	# libeina uses madvise(). To revisit when bumping EFL to 1.8
-	depends on BR2_USE_MMU
-	help
-	  Enlightenment Foundation Libraries
-
-	  http://enlightenment.org
-
-if BR2_PACKAGE_EFL
-
-source "package/efl/libeina/Config.in"
-source "package/efl/libecore/Config.in"
-source "package/efl/libeet/Config.in"
-source "package/efl/libefreet/Config.in"
-source "package/efl/libeio/Config.in"
-source "package/efl/libevas/Config.in"
-source "package/efl/libembryo/Config.in"
-source "package/efl/libedje/Config.in"
-source "package/efl/libethumb/Config.in"
-source "package/efl/libedbus/Config.in"
-
-endif # BR2_PACKAGE_EFL
-
-comment "EFL needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
deleted file mode 100644
index 99e4d14..0000000
--- a/package/efl/efl.mk
+++ /dev/null
@@ -1,2 +0,0 @@
-
-include $(sort $(wildcard package/efl/*/*.mk))
diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index 58f8f39..1af42c7 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_ENLIGHTENMENT
 	bool "enlightenment"
-	select BR2_PACKAGE_EFL
 	select BR2_PACKAGE_LIBECORE
 	select BR2_PACKAGE_LIBECORE_X
 	select BR2_PACKAGE_LIBEINA
diff --git a/package/expedite/Config.in b/package/expedite/Config.in
index 82bceb9..5d48af3 100644
--- a/package/expedite/Config.in
+++ b/package/expedite/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_EXPEDITE
 	bool "expedite"
-	select BR2_PACKAGE_EFL
 	select BR2_PACKAGE_LIBEINA
 	select BR2_PACKAGE_LIBEVAS
 	select BR2_PACKAGE_LIBEET
diff --git a/package/efl/libecore/Config.in b/package/libecore/Config.in
similarity index 89%
rename from package/efl/libecore/Config.in
rename to package/libecore/Config.in
index a9408dc..e8f31f0 100644
--- a/package/efl/libecore/Config.in
+++ b/package/libecore/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBECORE
 	bool "libecore"
+	depends on BR2_USE_MMU # efl
+	depends on BR2_USE_WCHAR # efl
 	select BR2_PACKAGE_LIBEINA
 	help
 	  Ecore is the event/X abstraction layer that makes doing
@@ -44,3 +46,6 @@ comment "evas support needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 endif # BR2_PACKAGE_LIBECORE
+
+comment "libecore needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/efl/libecore/libecore.mk b/package/libecore/libecore.mk
similarity index 100%
rename from package/efl/libecore/libecore.mk
rename to package/libecore/libecore.mk
diff --git a/package/efl/libedbus/Config.in b/package/libedbus/Config.in
similarity index 73%
rename from package/efl/libedbus/Config.in
rename to package/libedbus/Config.in
index 7e862d3..d3752ee 100644
--- a/package/efl/libedbus/Config.in
+++ b/package/libedbus/Config.in
@@ -4,7 +4,8 @@ config BR2_PACKAGE_LIBEDBUS
 	select BR2_PACKAGE_LIBECORE
 	select BR2_PACKAGE_DBUS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
-	depends on BR2_USE_MMU # dbus
+	depends on BR2_USE_MMU # dbus, efl
+	depends on BR2_USE_WCHAR # efl
 	help
 	  E_Dbus is a set of wrappers around D-Bus APIs so they can be
 	  easily used by EFL applications, automatically providing
@@ -17,14 +18,13 @@ if BR2_PACKAGE_LIBEDBUS
 config BR2_PACKAGE_LIBEDBUS_BLUEZ
 	bool "bluez support"
 	depends on !BR2_STATIC_LIBS # bluez_utils
-	depends on BR2_USE_WCHAR # bluez_utils -> glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils -> glib2
 	select BR2_PACKAGE_BLUEZ_UTILS
 	help
 	  Bluetooth support.
 
-comment "bluez support needs a toolchain w/ wchar, threads, dynamic library"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "bluez support needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_LIBEDBUS_CONNMAN
 	bool "connman support"
@@ -39,6 +39,6 @@ config BR2_PACKAGE_LIBEDBUS_NOTIFY
 
 endif
 
-comment "libedbus needs a toolchain w/ threads"
+comment "libedbus needs a toolchain w/ threads, wchar"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/efl/libedbus/libedbus.mk b/package/libedbus/libedbus.mk
similarity index 100%
rename from package/efl/libedbus/libedbus.mk
rename to package/libedbus/libedbus.mk
diff --git a/package/efl/libedje/Config.in b/package/libedje/Config.in
similarity index 78%
rename from package/efl/libedje/Config.in
rename to package/libedje/Config.in
index b163508..299e86b 100644
--- a/package/efl/libedje/Config.in
+++ b/package/libedje/Config.in
@@ -1,5 +1,5 @@
-comment "libedje needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "libedje needs a toolchain w/ threads, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_LIBEDJE
 	bool "libedje"
@@ -11,6 +11,8 @@ config BR2_PACKAGE_LIBEDJE
 	select BR2_PACKAGE_LIBEVAS
 	select BR2_PACKAGE_LUA
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
+	depends on BR2_USE_MMU # efl
+	depends on BR2_USE_WCHAR # efl
 	help
 	  A graphical layout and animation library for animated
 	  resizable, compressed and scalable themes.
diff --git a/package/efl/libedje/libedje.mk b/package/libedje/libedje.mk
similarity index 100%
rename from package/efl/libedje/libedje.mk
rename to package/libedje/libedje.mk
diff --git a/package/efl/libeet/Config.in b/package/libeet/Config.in
similarity index 71%
rename from package/efl/libeet/Config.in
rename to package/libeet/Config.in
index 48631a0..3f36295 100644
--- a/package/efl/libeet/Config.in
+++ b/package/libeet/Config.in
@@ -3,9 +3,14 @@ config BR2_PACKAGE_LIBEET
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBEINA
+	depends on BR2_USE_MMU
+	depends on BR2_USE_WCHAR # efl
 	help
 	  Eet is a tiny library designed to write an arbitary set of
 	  chunks of data to a file and optionally compress each chunk
 	  (very much like a zip file).
 
 	  http://trac.enlightenment.org/e/wiki/Eet
+
+comment "libeet needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/efl/libeet/libeet.mk b/package/libeet/libeet.mk
similarity index 100%
rename from package/efl/libeet/libeet.mk
rename to package/libeet/libeet.mk
diff --git a/package/efl/libefreet/Config.in b/package/libefreet/Config.in
similarity index 70%
rename from package/efl/libefreet/Config.in
rename to package/libefreet/Config.in
index 8687db4..75e5955 100644
--- a/package/efl/libefreet/Config.in
+++ b/package/libefreet/Config.in
@@ -3,8 +3,13 @@ config BR2_PACKAGE_LIBEFREET
 	select BR2_PACKAGE_LIBEINA
 	select BR2_PACKAGE_LIBEET
 	select BR2_PACKAGE_LIBECORE
+	depends on BR2_USE_MMU # efl
+	depends on BR2_USE_WCHAR # efl
 	help
 	  Efreet is a library designed to help apps work with several of the
 	  Freedesktop.org standards regarding Icons, Desktop files and Menus.
 
 	  http://trac.enlightenment.org/e/wiki/Efreet
+
+comment "libefreet needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/efl/libefreet/libefreet.mk b/package/libefreet/libefreet.mk
similarity index 100%
rename from package/efl/libefreet/libefreet.mk
rename to package/libefreet/libefreet.mk
diff --git a/package/efl/libeina/Config.in b/package/libeina/Config.in
similarity index 54%
rename from package/efl/libeina/Config.in
rename to package/libeina/Config.in
index 80600ad..13a74eb 100644
--- a/package/efl/libeina/Config.in
+++ b/package/libeina/Config.in
@@ -1,6 +1,12 @@
 config BR2_PACKAGE_LIBEINA
 	bool "libeina"
+	depends on BR2_USE_MMU # efl
+	depends on BR2_USE_WCHAR # efl
+	
 	help
 	  Eina is a tiny library to handle data types (list, hash, etc.)
 
 	  http://trac.enlightenment.org/e/wiki/Eina
+
+comment "libeina needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/efl/libeina/libeina.mk b/package/libeina/libeina.mk
similarity index 100%
rename from package/efl/libeina/libeina.mk
rename to package/libeina/libeina.mk
diff --git a/package/efl/libeio/Config.in b/package/libeio/Config.in
similarity index 80%
rename from package/efl/libeio/Config.in
rename to package/libeio/Config.in
index 5b1e395..e2e19a7 100644
--- a/package/efl/libeio/Config.in
+++ b/package/libeio/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_LIBEIO
 	select BR2_PACKAGE_LIBEINA
 	select BR2_PACKAGE_LIBECORE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # efl
+	depends on BR2_USE_WCHAR # efl
 	help
 	  Eio integrates with EFL (Ecore, Eina) to provide efficient
 	  filesystem Input/Output (I/O). It use the best techniques to
@@ -18,5 +20,5 @@ config BR2_PACKAGE_LIBEIO
 
 	  http://trac.enlightenment.org/e/wiki/Eio
 
-comment "libeio needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "libeio needs a toolchain w/ threads, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/efl/libeio/libeio.mk b/package/libeio/libeio.mk
similarity index 100%
rename from package/efl/libeio/libeio.mk
rename to package/libeio/libeio.mk
diff --git a/package/efl/libembryo/Config.in b/package/libembryo/Config.in
similarity index 68%
rename from package/efl/libembryo/Config.in
rename to package/libembryo/Config.in
index 63c7064..937876f 100644
--- a/package/efl/libembryo/Config.in
+++ b/package/libembryo/Config.in
@@ -1,9 +1,14 @@
 config BR2_PACKAGE_LIBEMBRYO
 	bool "libembryo"
 	select BR2_PACKAGE_LIBEINA
+	depends on BR2_USE_MMU # efl
+	depends on BR2_USE_WCHAR # efl
 	help
 	  Embryo is primarily a shared library that gives you an API
 	  to load and control interpreted programs compiled into an
 	  abstract machine bytecode that it understands.
 
 	  http://trac.enlightenment.org/e/wiki/Embryo
+
+comment "libembryo needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/efl/libembryo/libembryo.mk b/package/libembryo/libembryo.mk
similarity index 100%
rename from package/efl/libembryo/libembryo.mk
rename to package/libembryo/libembryo.mk
diff --git a/package/efl/libethumb/Config.in b/package/libethumb/Config.in
similarity index 67%
rename from package/efl/libethumb/Config.in
rename to package/libethumb/Config.in
index 3e9cbde..af641f0 100644
--- a/package/efl/libethumb/Config.in
+++ b/package/libethumb/Config.in
@@ -1,5 +1,5 @@
-comment "libethumb needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "libethumb needs a toolchain w/ threads, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_LIBETHUMB
 	bool "libethumb"
@@ -9,6 +9,8 @@ config BR2_PACKAGE_LIBETHUMB
 	select BR2_PACKAGE_LIBECORE_EVAS
 	select BR2_PACKAGE_LIBEDJE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
+	depends on BR2_USE_MMU # efl
+	depends on BR2_USE_WCHAR # efl
 	help
 	  Ethumb is a library for generating thumbnail images of documents.
 
diff --git a/package/efl/libethumb/libethumb.mk b/package/libethumb/libethumb.mk
similarity index 100%
rename from package/efl/libethumb/libethumb.mk
rename to package/libethumb/libethumb.mk
diff --git a/package/efl/libevas/0001-giflib.patch b/package/libevas/0001-giflib.patch
similarity index 100%
rename from package/efl/libevas/0001-giflib.patch
rename to package/libevas/0001-giflib.patch
diff --git a/package/efl/libevas/Config.in b/package/libevas/Config.in
similarity index 97%
rename from package/efl/libevas/Config.in
rename to package/libevas/Config.in
index 6645a14..1f17fa3 100644
--- a/package/efl/libevas/Config.in
+++ b/package/libevas/Config.in
@@ -1,5 +1,5 @@
-comment "libevas needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "libevas needs a toolchain w/ threads, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_LIBEVAS
 	bool "libevas"
@@ -9,6 +9,8 @@ config BR2_PACKAGE_LIBEVAS
 	# be built without threads. This should be revisited when efl
 	# is bumped to 1.8.
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # efl
+	depends on BR2_USE_WCHAR # efl
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_LIBEINA
 	# required to build so far
diff --git a/package/efl/libevas/libevas.mk b/package/libevas/libevas.mk
similarity index 100%
rename from package/efl/libevas/libevas.mk
rename to package/libevas/libevas.mk
-- 
2.4.3
