From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Nov 2013 22:52:39 +0100
Subject: [Buildroot] [git commit] libevas: disable on avr32
Message-ID: <20131106215451.478479BAEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fdecbd5f82361652fdca30ed20b5bd7e012c1a39
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Neither epoll_create1 nor inotify_init1 is available on avr32. Fixes build
failures such as the following.

  http://autobuild.buildroot.net/results/4d435a5fc608936362d605aca696c01023be9723

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efl/expedite/Config.in      |    2 ++
 package/efl/libecore/Config.in      |    1 +
 package/efl/libedje/Config.in       |    1 +
 package/efl/libelementary/Config.in |    1 +
 package/efl/libethumb/Config.in     |    1 +
 package/efl/libevas/Config.in       |    1 +
 package/enlightenment/Config.in     |    2 ++
 7 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/efl/expedite/Config.in b/package/efl/expedite/Config.in
index 466fd7d..918c34e 100644
--- a/package/efl/expedite/Config.in
+++ b/package/efl/expedite/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_EXPEDITE
 	select BR2_PACKAGE_LIBEVAS
 	select BR2_PACKAGE_LIBEET
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_avr32 # libevas
 	help
 	  Expedite is the official Evas benchmark tool. It can test different
 	  engines, such as X11, XRender, OpenGL (also ES variant), SDL,
@@ -12,3 +13,4 @@ config BR2_PACKAGE_EXPEDITE
 
 comment "expedite needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_avr32
diff --git a/package/efl/libecore/Config.in b/package/efl/libecore/Config.in
index 6c887f5..41a16f9 100644
--- a/package/efl/libecore/Config.in
+++ b/package/efl/libecore/Config.in
@@ -38,5 +38,6 @@ config BR2_PACKAGE_LIBECORE_X_XCB
 config BR2_PACKAGE_LIBECORE_EVAS
 	bool "libecore Evas support"
 	select BR2_PACKAGE_LIBEVAS
+	depends on !BR2_avr32 # libevas
 
 endif # BR2_PACKAGE_LIBECORE
diff --git a/package/efl/libedje/Config.in b/package/efl/libedje/Config.in
index f0985dd..4c30274 100644
--- a/package/efl/libedje/Config.in
+++ b/package/efl/libedje/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBEDJE
 	select BR2_PACKAGE_LIBEMBRYO
 	select BR2_PACKAGE_LIBEVAS
 	select BR2_PACKAGE_LUA
+	depends on !BR2_avr32 # libevas
 	help
 	  A graphical layout and animation library for animated
 	  resizable, compressed and scalable themes.
diff --git a/package/efl/libelementary/Config.in b/package/efl/libelementary/Config.in
index 59af80e..d4584e8 100644
--- a/package/efl/libelementary/Config.in
+++ b/package/efl/libelementary/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBELEMENTARY
 	select BR2_PACKAGE_LIBEVAS
 	select BR2_PACKAGE_LIBECORE
 	select BR2_PACKAGE_LIBEDJE
+	depends on !BR2_avr32 # libevas
 	help
 	  Elementary is a widget toolkit and EFL wrapper and convenience
 	  library to make it easy to build applications and tools with UIs
diff --git a/package/efl/libethumb/Config.in b/package/efl/libethumb/Config.in
index fb0032a..3a2f3dc 100644
--- a/package/efl/libethumb/Config.in
+++ b/package/efl/libethumb/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBETHUMB
 	select BR2_PACKAGE_LIBECORE
 	select BR2_PACKAGE_LIBECORE_EVAS
 	select BR2_PACKAGE_LIBEDJE
+	depends on !BR2_avr32 # libevas
 	help
 	  Ethumb is a library for generating thumbnail images of documents.
 
diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
index f73376b..8c4193f 100644
--- a/package/efl/libevas/Config.in
+++ b/package/efl/libevas/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBEVAS
 	bool "libevas"
+	depends on !BR2_avr32 # no epoll_create1 or inotify_init1
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_LIBEINA
 	# required to build so far
diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index 54c0ac6..5df817b 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -26,6 +26,7 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	# libedbus -> dbus
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_XORG7
+	depends on !BR2_avr32 # libevas
 	help
 	  Enlightenment, also known simply as E, is a stacking window
 	  manager for the X Window System which can be used alone or
@@ -38,3 +39,4 @@ config BR2_PACKAGE_ENLIGHTENMENT
 comment "enlightenment needs a toolchain w/ wchar, C++, threads"
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_avr32
