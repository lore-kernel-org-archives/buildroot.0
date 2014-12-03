From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  3 Dec 2014 22:41:34 +0100
Subject: [Buildroot] [PATCH 7/8] Turn the static lib option into a choice
	with more options
In-Reply-To: <1417642895-29606-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417642895-29606-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417642895-29606-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit turns the single static option into a choice, which offers
various possibilities:

 1. Build and use static libraries only;
 2. Build both shared and static libraries, but used shared libraries;
 3. Build and use shared libraries only.

On most platforms, (2) is currently the default, and kept as the
default in this commit. Of course, on certain platforms (Blackfin,
m68k), only option (1) will be available.

In addition to the introduction of the Config.in options, this commit
also:

 * Remove the 'select BR2_STATIC_LIBS' from 'BR2_BINFMT_FLAT', since
   with the use of a choice, we are guaranteed that BR2_STATIC_LIBS
   will be selected when the binary format is BR2_BINFMT_FLAT, since
   BR2_STATIC_LIBS will be the only possible solution in the choice.

 * Changes package/Makefile.in to use the proper
   --{enable,disable}-{shared,static} options for autotools packages.

 * Changes the ncurses package to use the proper combination of
   --{with,without}-shared and --{with,without}-normal.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                  | 39 ++++++++++++++++++++++++++++++---------
 arch/Config.in             |  1 -
 package/Makefile.in        |  4 +++-
 package/ncurses/ncurses.mk |  9 ++++++++-
 4 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/Config.in b/Config.in
index fefa54e..e31f820 100644
--- a/Config.in
+++ b/Config.in
@@ -525,19 +525,40 @@ config BR2_ENABLE_SSP
 comment "enabling Stack Smashing Protection requires support in the toolchain"
 	depends on !BR2_TOOLCHAIN_HAS_SSP
 
+choice
+
+	prompt "libraries"
+	default BR2_SHARED_STATIC_LIBS if BR2_BINFMT_SUPPORTS_SHARED
+	default BR2_STATIC_LIBS if !BR2_BINFMT_SUPPORTS_SHARED
+
 config BR2_STATIC_LIBS
-	bool "build statically linked applications, no dynamic libraries"
+	bool "static libraries only"
 	help
-	  Build all applications for the target statically linked.
-	  This potentially increases your filesystem size and should only be
-	  used if you know what you do.
+	  Build and use only static libraries. No shared libraries
+	  will be instaled on the target. This potentially increases
+	  your code size and should only be used if you know what you
+	  do.  The default is to build dynamic libraries and use those
+	  on the target filesystem. Note that some packages may not be
+	  available when this option is enabled, due to their need of
+	  dynamic library support.
 
-	  Note that some applications cannot be build statically and so are
-	  intentionally disabled.
+config BR2_SHARED_LIBS
+	bool "shared libs only"
+	depends on BR2_BINFMT_SUPPORTS_SHARED
+	help
+	  Build and use only shared libraries. This is the recommended
+	  solution as it saves space and build time.
 
-	  The default (if this option is disabled) is to build dynamic
-	  libraries and dynamically link applications to use those on the
-	  target filesystem.
+config BR2_SHARED_STATIC_LIBS
+	bool "static and shared libs"
+	depends on BR2_BINFMT_SUPPORTS_SHARED
+	help
+	  Build both shared and static libraries, but link executables
+	  dynamically. While building both shared and static libraries
+	  take more time and more disk space, having static libraries
+	  may be useful to link some of the applications statically.
+
+endchoice
 
 
 config BR2_PACKAGE_OVERRIDE_FILE
diff --git a/arch/Config.in b/arch/Config.in
index c7bef5d..2f98237 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -284,7 +284,6 @@ config BR2_BINFMT_FDPIC
 config BR2_BINFMT_FLAT
 	bool "FLAT"
 	depends on BR2_bfin || BR2_m68k
-	select BR2_STATIC_LIBS
 	help
 	  FLAT binary is a relatively simple and lightweight executable format
 	  based on the original a.out format. It is widely used in environment
diff --git a/package/Makefile.in b/package/Makefile.in
index 49a158e..dbaa8af 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -394,7 +394,9 @@ SHARED_STATIC_LIBS_OPTS = --enable-static --disable-shared
 TARGET_CFLAGS += -static
 TARGET_CXXFLAGS += -static
 TARGET_LDFLAGS += -static
-else
+else ifeq ($(BR2_SHARED_LIBS),y)
+SHARED_STATIC_LIBS_OPTS = --disable-static --enable-shared
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 SHARED_STATIC_LIBS_OPTS = --enable-static --enable-shared
 endif
 
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 645c25c..f54f379 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -15,7 +15,6 @@ NCURSES_LICENSE_FILES = README
 NCURSES_CONFIG_SCRIPTS = ncurses$(NCURSES_LIB_SUFFIX)5-config
 
 NCURSES_CONF_OPTS = \
-	$(if $(BR2_STATIC_LIBS),--without-shared,--with-shared) \
 	--without-cxx \
 	--without-cxx-binding \
 	--without-ada \
@@ -36,6 +35,14 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 	NCURSES_DEPENDENCIES += busybox
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+NCURSES_CONF_OPTS += --without-shared --with-normal
+else ifeq ($(BR2_SHARED_LIBS),y)
+NCURSES_CONF_OPTS += --with-shared --without-normal
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+NCURSES_CONF_OPTS += --with-shared --with-normal
+endif
+
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 NCURSES_CONF_OPTS += --enable-widec
 NCURSES_LIB_SUFFIX = w
-- 
2.1.0
