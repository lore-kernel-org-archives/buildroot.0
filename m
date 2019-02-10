From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Feb 2019 15:08:36 +0100
Subject: [Buildroot] [git commit branch/next] package/ncmpc: bump to version
 0.33
Message-ID: <20190210140711.9B5CB80F78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6518cf4da7dd7ef2e6ff472f913d9bb28bde39cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Remove second patch (already in version)
- Replace true/false by enabled/disabled, see:
  https://github.com/MusicPlayerDaemon/ncmpc/commit/67d96543e64ec2eff2d3e9907c570ca09918c893
- Add new boost system dependency:
  https://github.com/MusicPlayerDaemon/ncmpc/commit/74cc24bdfcfd0ba288b78f0fb75f409832d7586d
  https://github.com/MusicPlayerDaemon/ncmpc/commit/bef9017712da31b750799e6c7fb9d2829fa5e69c
- Remove glib dependency:
  https://github.com/MusicPlayerDaemon/ncmpc/commit/dfcb3ab0216d6c9ae35d06060cee806bd919c2ba
- Disable new regex option (based on pcre)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ings-constructor-to-simplify-initializers.patch | 217 ---------------------
 package/ncmpc/Config.in                            |   7 +-
 package/ncmpc/ncmpc.hash                           |   2 +-
 package/ncmpc/ncmpc.mk                             |  11 +-
 4 files changed, 11 insertions(+), 226 deletions(-)

diff --git a/package/ncmpc/0002-Global-Bindings-add-KeyBindings-constructor-to-simplify-initializers.patch b/package/ncmpc/0002-Global-Bindings-add-KeyBindings-constructor-to-simplify-initializers.patch
deleted file mode 100644
index 217fa9b55b..0000000000
--- a/package/ncmpc/0002-Global-Bindings-add-KeyBindings-constructor-to-simplify-initializers.patch
+++ /dev/null
@@ -1,217 +0,0 @@
-From da27fcc39e187671b5e4373848f701a3d910446c Mon Sep 17 00:00:00 2001
-From: Max Kellermann <max@musicpd.org>
-Date: Wed, 26 Sep 2018 09:51:09 +0200
-Subject: [PATCH] {Global,}Bindings: add KeyBindings constructor to simplify
- initializers
-
-As a side effect, this works around a build failure with GCC 4.9.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from 
-https://github.com/MusicPlayerDaemon/ncmpc/commit/da27fcc39e187671b5e4373848f701a3d910446c
-and updated for 0.31 (remove NEWS update)]
----
- src/Bindings.hxx       |   3 +
- src/GlobalBindings.cxx | 142 ++++++++++++++++++++---------------------
- 3 files changed, 75 insertions(+), 71 deletions(-)
-
-diff --git a/src/Bindings.hxx b/src/Bindings.hxx
-index 342d951..0c630dc 100644
---- a/src/Bindings.hxx
-+++ b/src/Bindings.hxx
-@@ -42,6 +42,9 @@ struct KeyBinding {
- 	bool modified = false;
- #endif
- 
-+	constexpr KeyBinding(int a, int b=0, int c=0) noexcept
-+		:keys{{a, b, c}} {}
-+
- 	gcc_pure
- 	bool HasKey(int key) const {
- 		return std::find(keys.begin(), keys.end(), key) != keys.end();
-diff --git a/src/GlobalBindings.cxx b/src/GlobalBindings.cxx
-index b565848..8049ed2 100644
---- a/src/GlobalBindings.cxx
-+++ b/src/GlobalBindings.cxx
-@@ -51,110 +51,110 @@
- 
- static KeyBindings global_key_bindings{{{
- #ifdef ENABLE_KEYDEF_SCREEN
--	{ {'K', 0, 0 } },
-+	{'K'},
- #endif
--	{ { 'q', 'Q', C('C') } },
-+	{'q', 'Q', C('C')},
- 
- 	/* movement */
--	{ { UP, 'k', 0 } },
--	{ { DWN, 'j', 0 } },
--	{ { 'H', 0, 0 } },
--	{ { 'M', 0, 0 } },
--	{ { 'L', 0, 0 } },
--	{ { HOME, C('A'), 0 } },
--	{ { END, C('E'), 0 } },
--	{ { PGUP, 0, 0 } },
--	{ { PGDN, 0, 0 } },
--	{ { 'v',  0, 0 } },
--	{ { C('N'),  0, 0 } },
--	{ { C('B'),  0, 0 } },
--	{ { 'N',  0, 0 } },
--	{ { 'B',  0, 0 } },
--	{ { 'l', 0, 0 } },
-+	{UP, 'k'},
-+	{DWN, 'j'},
-+	{'H'},
-+	{'M'},
-+	{'L'},
-+	{HOME, C('A')},
-+	{END, C('E')},
-+	{PGUP},
-+	{PGDN},
-+	{'v',  0},
-+	{C('N'),  0},
-+	{C('B'),  0},
-+	{'N',  0},
-+	{'B',  0},
-+	{'l'},
- 
- 	/* basic screens */
--	{ { '1', F1, 'h' } },
--	{ { '2', F2, 0 } },
--	{ { '3', F3, 0 } },
-+	{'1', F1, 'h'},
-+	{'2', F2},
-+	{'3', F3},
- 
- 	/* player commands */
--	{ { RET, 0, 0 } },
--	{ { 'P', 0, 0 } },
--	{ { 's', BS, 0 } },
--	{ { 'o', 0, 0 } },
--	{ { '>', 0, 0 } },
--	{ { '<', 0, 0 } },
--	{ { 'f', 0, 0 } },
--	{ { 'b', 0, 0 } },
--	{ { '+', RGHT, 0 } },
--	{ { '-', LEFT, 0 } },
--	{ { ' ', 0, 0 } },
--	{ { 't', 0, 0 } },
--	{ { DEL, 'd', 0 } },
--	{ { 'Z', 0, 0 } },
--	{ { 'c', 0, 0 } },
--	{ { 'r', 0, 0 } },
--	{ { 'z', 0, 0 } },
--	{ { 'y', 0, 0 } },
--	{ { 'C', 0, 0 } },
--	{ { 'x', 0, 0 } },
--	{ { C('U'), 0, 0 } },
--	{ { 'S', 0, 0 } },
--	{ { 'a', 0, 0 } },
--
--	{ { '!', 0, 0 } },
--	{ { '"', 0, 0 } },
--
--	{ { 'G', 0, 0 } },
-+	{RET},
-+	{'P'},
-+	{'s', BS},
-+	{'o'},
-+	{'>'},
-+	{'<'},
-+	{'f'},
-+	{'b'},
-+	{'+', RGHT},
-+	{'-', LEFT},
-+	{' '},
-+	{'t'},
-+	{DEL, 'd'},
-+	{'Z'},
-+	{'c'},
-+	{'r'},
-+	{'z'},
-+	{'y'},
-+	{'C'},
-+	{'x'},
-+	{C('U')},
-+	{'S'},
-+	{'a'},
-+
-+	{'!'},
-+	{'"'},
-+
-+	{'G'},
- 
- 	/* lists */
--	{ { C('K'), 0, 0 } },
--	{ { C('J'), 0, 0 } },
--	{ { C('L'), 0, 0 } },
-+	{C('K')},
-+	{C('J')},
-+	{C('L')},
- 
- 
- 	/* ncmpc options */
--	{ { 'w', 0, 0 } },
--	{ { 'U', 0, 0 } },
-+	{'w'},
-+	{'U'},
- 
- 	/* change screen */
--	{ { TAB, 0, 0 } },
--	{ { STAB, 0, 0 } },
--	{ { '`', 0, 0 } },
-+	{TAB},
-+	{STAB},
-+	{'`'},
- 
- 
- 	/* find */
--	{ { '/', 0, 0 } },
--	{ { 'n', 0, 0 } },
--	{ { '?', 0, 0 } },
--	{ { 'p', 0, 0 } },
--	{ { '.', 0, 0 } },
-+	{'/'},
-+	{'n'},
-+	{'?'},
-+	{'p'},
-+	{'.'},
- 
- 
- 	/* extra screens */
- #ifdef ENABLE_ARTIST_SCREEN
--	{ {'4', F4, 0 } },
-+	{'4', F4},
- #endif
- #ifdef ENABLE_SEARCH_SCREEN
--	{ {'5', F5, 0 } },
--	{ {'m', 0, 0 } },
-+	{'5', F5},
-+	{'m'},
- #endif
- #ifdef ENABLE_SONG_SCREEN
--	{ { 'i', 0, 0 } },
-+	{'i'},
- #endif
- #ifdef ENABLE_LYRICS_SCREEN
--	{ {'7', F7, 0 } },
--	{ {ESC, 0, 0 } },
--	{ {'u', 0, 0 } },
--	{ {'e', 0, 0 } },
-+	{'7', F7},
-+	{ESC},
-+	{'u'},
-+	{'e'},
- #endif
- 
- #ifdef ENABLE_OUTPUTS_SCREEN
--	{ {'8', F8, 0 } },
-+	{'8', F8},
- #endif
- 
- #ifdef ENABLE_CHAT_SCREEN
--	{ {'9', F9, 0} },
-+	{'9', F9},
- #endif
- }}};
- 
diff --git a/package/ncmpc/Config.in b/package/ncmpc/Config.in
index d22ea368b4..00639b924a 100644
--- a/package/ncmpc/Config.in
+++ b/package/ncmpc/Config.in
@@ -2,10 +2,11 @@ config BR2_PACKAGE_NCMPC
 	bool "ncmpc"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR # libglib2 -> gettext
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_WCHAR # boost
+	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
-	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_LIBMPDCLIENT
 	select BR2_PACKAGE_NCURSES
 	help
diff --git a/package/ncmpc/ncmpc.hash b/package/ncmpc/ncmpc.hash
index afa5260be7..368bc642d1 100644
--- a/package/ncmpc/ncmpc.hash
+++ b/package/ncmpc/ncmpc.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 8d3416c5b99ec21527b506f75bd7e536ddff60e61695b05989e791a751611bcc  ncmpc-0.31.tar.xz
+sha256 94e04a34854015aa013b43ec15b578f4541d077cf7ae5bf7c0944475673fd7a5  ncmpc-0.33.tar.xz
 
 # Hash for license file:
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index 787f58201a..4167974490 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -5,22 +5,23 @@
 ################################################################################
 
 NCMPC_VERSION_MAJOR = 0
-NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).31
+NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).33
 NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
 NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
-NCMPC_DEPENDENCIES = host-pkgconf libglib2 libmpdclient ncurses
+NCMPC_DEPENDENCIES = boost host-pkgconf libmpdclient ncurses
 NCMPC_LICENSE = GPL-2.0+
 NCMPC_LICENSE_FILES = COPYING
 
 NCMPC_CONF_OPTS = \
 	-Dcurses=ncurses \
-	-Ddocumentation=false
+	-Ddocumentation=disabled \
+	-Dregex=disabled
 
 ifeq ($(BR2_PACKAGE_LIRC_TOOLS),y)
 NCMPC_DEPENDENCIES += lirc-tools
-NCMPC_CONF_OPTS += -Dlirc=true
+NCMPC_CONF_OPTS += -Dlirc=enabled
 else
-NCMPC_CONF_OPTS += -Dlirc=false
+NCMPC_CONF_OPTS += -Dlirc=disabled
 endif
 
 $(eval $(meson-package))
