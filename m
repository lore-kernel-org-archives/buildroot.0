From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Feb 2014 21:22:54 +0100
Subject: [Buildroot] [git commit] evas: depend on thread support
Message-ID: <20140222210312.716949056B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eda5dd1cee689ae8b2c7b06f1f1873ab17f24bbc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Evas has an optional mechanism to do asynchronous preloading of
images. This mechanism is optional, and in commit
b6d92bf415df33ac86487d68f5f8299f406859d2 ("libevas: async image
preload support needs threads support in toolchain"), Peter made sure
to disable the asychronous preloading when no thread support was
available.

Unfortunately, it seems like disabling the asynchronous loading is
rarely used, and it in facts fails to build: a member of structure is
not present when asynchronous preloading is disabled, but the code
continues to use it.

Since the fix is not obvious, and all this mechanism seems to have
changed completely in EFL 1.8.x, and we probably don't care much about
EFL without threads, this commit adds a dependency of libevas on
thread support. Consequently, it also reverts commit
b6d92bf415df33ac86487d68f5f8299f406859d2 which is no longer necessary.

Of course, this commit propagates this additional dependency to the
reverse dependencies of libevas.

Fixes:

  http://autobuild.buildroot.org/results/6de/6de90018a9eeb9c495d15046a8b3270eb95a5550//
  http://autobuild.buildroot.org/results/693/693df99db4ab357b48d427be3a72f6d64dd53065//

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efl/expedite/Config.in      |    4 +++-
 package/efl/libecore/Config.in      |    5 +++++
 package/efl/libedje/Config.in       |    5 +++++
 package/efl/libelementary/Config.in |    5 +++++
 package/efl/libethumb/Config.in     |    5 +++++
 package/efl/libevas/Config.in       |   10 ++++++++++
 package/efl/libevas/libevas.mk      |    5 -----
 package/enlightenment/Config.in     |    2 +-
 8 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/package/efl/expedite/Config.in b/package/efl/expedite/Config.in
index 918c34e..96db266 100644
--- a/package/efl/expedite/Config.in
+++ b/package/efl/expedite/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_EXPEDITE
 	select BR2_PACKAGE_LIBEVAS
 	select BR2_PACKAGE_LIBEET
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
 	depends on !BR2_avr32 # libevas
 	help
 	  Expedite is the official Evas benchmark tool. It can test different
@@ -11,6 +12,7 @@ config BR2_PACKAGE_EXPEDITE
 	  DirectFB and so on. Its tests are quite extensive, trying to
 	  reproduce real world usage cases.
 
-comment "expedite needs a toolchain w/ C++"
+comment "expedite needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_avr32
diff --git a/package/efl/libecore/Config.in b/package/efl/libecore/Config.in
index 41a16f9..3db036c 100644
--- a/package/efl/libecore/Config.in
+++ b/package/efl/libecore/Config.in
@@ -38,6 +38,11 @@ config BR2_PACKAGE_LIBECORE_X_XCB
 config BR2_PACKAGE_LIBECORE_EVAS
 	bool "libecore Evas support"
 	select BR2_PACKAGE_LIBEVAS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_avr32 # libevas
+
+comment "evas support needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_avr32 # libevas
 
 endif # BR2_PACKAGE_LIBECORE
diff --git a/package/efl/libedje/Config.in b/package/efl/libedje/Config.in
index 4a0831a..503919c 100644
--- a/package/efl/libedje/Config.in
+++ b/package/efl/libedje/Config.in
@@ -1,3 +1,7 @@
+comment "libedje needs a toolchain w/ threads"
+	depends on !BR2_avr32
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_LIBEDJE
 	bool "libedje"
 	select BR2_PACKAGE_LIBEINA
@@ -8,6 +12,7 @@ config BR2_PACKAGE_LIBEDJE
 	select BR2_PACKAGE_LIBEVAS
 	select BR2_PACKAGE_LUA
 	depends on !BR2_avr32 # libevas
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
 	help
 	  A graphical layout and animation library for animated
 	  resizable, compressed and scalable themes.
diff --git a/package/efl/libelementary/Config.in b/package/efl/libelementary/Config.in
index d4584e8..91740af 100644
--- a/package/efl/libelementary/Config.in
+++ b/package/efl/libelementary/Config.in
@@ -1,3 +1,7 @@
+comment "libelementary needs a toolchain w/ threads"
+	depends on !BR2_avr32
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_LIBELEMENTARY
 	bool "libelementary"
 	select BR2_PACKAGE_LIBEINA
@@ -5,6 +9,7 @@ config BR2_PACKAGE_LIBELEMENTARY
 	select BR2_PACKAGE_LIBECORE
 	select BR2_PACKAGE_LIBEDJE
 	depends on !BR2_avr32 # libevas
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
 	help
 	  Elementary is a widget toolkit and EFL wrapper and convenience
 	  library to make it easy to build applications and tools with UIs
diff --git a/package/efl/libethumb/Config.in b/package/efl/libethumb/Config.in
index 3a2f3dc..64574a0 100644
--- a/package/efl/libethumb/Config.in
+++ b/package/efl/libethumb/Config.in
@@ -1,3 +1,7 @@
+comment "libethumb needs a toolchain w/ threads"
+	depends on !BR2_avr32
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_LIBETHUMB
 	bool "libethumb"
 	select BR2_PACKAGE_LIBEINA
@@ -6,6 +10,7 @@ config BR2_PACKAGE_LIBETHUMB
 	select BR2_PACKAGE_LIBECORE_EVAS
 	select BR2_PACKAGE_LIBEDJE
 	depends on !BR2_avr32 # libevas
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
 	help
 	  Ethumb is a library for generating thumbnail images of documents.
 
diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
index b14a319..2afa888 100644
--- a/package/efl/libevas/Config.in
+++ b/package/efl/libevas/Config.in
@@ -1,6 +1,16 @@
+comment "libevas needs a toolchain w/ threads"
+	depends on !BR2_avr32
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_LIBEVAS
 	bool "libevas"
 	depends on !BR2_avr32 # no epoll_create1 or inotify_init1
+	# libevas should normally build without threads, but due to a
+	# build issue when the async preloader is disabled, which is
+	# needed when no threads are available, we don't allow evas to
+	# be built without threads. This should be revisited when efl
+	# is bumped to 1.8.
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_LIBEINA
 	# required to build so far
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 46de4cb..41ceb49 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -203,11 +203,6 @@ else
 LIBEVAS_CONF_OPT += --disable-font-loader-eet
 endif
 
-# async image preload support needs threads support in toolchain
-ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-LIBEVAS_CONF_OPT += --disable-async-preload
-endif
-
 # libevas installs the source code of examples on the target, which
 # are generally not useful.
 define LIBEVAS_REMOVE_EXAMPLES
diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index 66c7055..43efe58 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -21,7 +21,7 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	depends on BR2_USE_WCHAR
 	depends on BR2_INSTALL_LIBSTDCPP
 	# libedbus -> dbus
-	# libedbus -> glib2
+	# libedbus -> glib2, libevas
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# libedbus -> dbus
 	depends on BR2_USE_MMU
