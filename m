From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 Aug 2018 23:45:48 +0200
Subject: [Buildroot] [git commit branch/next] minicom: change upstream site,
 bump version
Message-ID: <20180831214537.F1E8481F58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10b50e3dbc9a220e5a3cbd801320fc7b4dfc59bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Minicom is now available on a git repository at:
https://salsa.debian.org/minicom-team/minicom.git
Main changes:
- RS485 support
- NLS support
- various fixes

So:
- change MINICOM_METHOD to git pointing to latest commit
- add MINICOM_AUTORECONF = YES
- add MINICOM_MKDIR_M4 to MINICOM_POST_PATCH_HOOKS because autoreconf
requires and existing m4 directory
- add host-gettext to DEPENDENCIES for AM_ICONV macro
- delete old patches since they became part of git repository as commits
- add new patch to check if RS485 is supported
- update tarball sha256 in hash file

Git shortlog of Minicom repository follows starting from version 2.7
since commit for 2.7-1 debian version is not present.
The only difference between version 2.7-1(debian) and 2.7 seems to be
a coding style change in src/config.c file that breaks every line into a
string like:
(
"aaa"
"bbb"
"ccc"
)
instead of:
(
"aaa\
 bbb\
 ccc"
)
**************************************************************************
git shortlog --no-merges 068f085908801ee3ab004c9ace889f6a59aa49af..
Adam Lackorzynski (87):
      Added tag v2.7 for changeset ca0e6c0e1c7d
      Set version to 2.7.90
      Rename configure.in to configure.ac
      Add delta timestamp mode
      Enable SIGALRM signal
      Implement HPA ESC sequence
      Debugging aid (disabled)
      man: add "U" key shortcut description
      Fix filename of non-global config settings.
      Update indonesian translation
      Update french translations
      Use dial_tty in statusline
      Update by french translation team
      Add more TODO/ideas
      musl-libc compile fix
      Change MAXNAMLEN to POSIX's NAME_MAX
      Convert ChangeLog to UTF8
      Add alternative window support
      Remove SMOOTH code blocks
      da.po: Update from translation team
      Add ARRAY_SIZE macro
      Add default for missing function keys
      TODO: move location of config files to ~/.config
      Add F11+F12 for use in macros
      nb.po: Update from translation team
      script: Proper shell exit status handling.
      Add bug description
      Improvement to socket handling code
      autogen.sh: Set to 1.15
      loadconv: Add missing fclose()
      Add DTR toggle via TIOCMBIC+TIOCMBIS
      remove conditional DTR toggle enable
      Add entry
      Discontinue Changelog
      Fix printf warning on 64bit
      Updated swedish translation by Sebastian Rasmussen
      Fix color setting vt_pinit
      Color settings: Simplify same term color message
      Add "bug fixes" entry
      Change mbslen to mbswidth
      Add check_io_input() function
      Fix return value when socket got closed
      Add serbian translation
      TODO: Transmit delay has no influence on macros
      TODO: Need to move .macros location too
      Use vt_send for macros too
      Improve status line redrawing
      Simplify pointer logic in output function
      Fix CVE-2017-7467, a remote exploitalbe out of bound access
      TODO: Add to make literal capture available
      TODO: Add note on not running as root
      Remove absolute paths to called programs
      Make upload/download window wider
      windiv: Add sys/types.h
      Add sys/wait.h include
      Add a missing 'free' for a calloc.
      Fix type of vt_tabs for proper left shift
      Free dialents on exit
      dial: Remove tagged variable and code
      Use ARRAY_SIZE macro
      Zero initialize malloc'ed buffer
      Fix behind-buffer access in input window
      Fix buf size calculation by using ARRAY_SIZE
      Fix value for one mbswidth test
      Fix writing over end of array
      Redraw status line on screen size changes
      Support a second value for the mbswidth check
      Fix build with SVR4_LOCKS
      Fix a -Wformat-truncation warning from gcc7
      Fix -Wformat-truncation warning by gcc7
      Annotate switch-case fall-throughs
      Fix parsing of MINICOM env-var
      Introduce -O option, and add timestamps
      timestamping: Only print if prev time exists
      Add simplified chinese translation
      man: Add current maintainer
      Initial support for TCP connections
      Abstract check_io functionality
      Change return type of check_io_input to bool
      Update spanish translation
      Flush output before delaying output
      ascii-xfr: Put flushing into a function
      ascii-xfr: Apply 'static'
      configure.ac: Add -Wno-format-truncation
      Common FALLTHRU style
      Increase used automake verstion to 1.16
      NEWS: Update with RS485

Giulio Benetti (4):
      Add RS485 parameters.
      Add RS485 menu entries to "Serial port Setup"
      Handle RS485 low-level
      sysdep1: avoid asserting rts when rs485 enabled

Martin A. Godisch (2):
      fixed text width in history buffer message box
      properly escaped dashes in manual page

Matthias Dieter Walln??fer (1):
      Properly recognise multi-byte characters by introducing

Ond??ej Lyson??k (6):
      Add a missing va_end() call
      Make sure strings copied by strncpy are null-terminated
      Fix file descriptor leaks
      Fix a directory handle leak
      Fix a read past end of buffer
      Fix a warning about an unused variable

Sebastian Rasmussen (3):
      src/man: Fix typos in documentation and comments Fixes #315391
      src: Use gettext in ascii-xfr to make it translatable Fixes
      src: Make various messages/strings translatable Fixes #315392

**************************************************************************

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/minicom/0001-musl-libc-compile-fix.patch   | 28 ------------
 ...ck-if-RS485-is-support-before-setting-its.patch | 36 +++++++++++++++
 .../0002-change-maxnamlen-to-posixs-name-max.patch | 51 ----------------------
 package/minicom/Config.in                          |  2 +-
 package/minicom/minicom.hash                       |  2 +-
 package/minicom/minicom.mk                         | 17 ++++++--
 6 files changed, 52 insertions(+), 84 deletions(-)

diff --git a/package/minicom/0001-musl-libc-compile-fix.patch b/package/minicom/0001-musl-libc-compile-fix.patch
deleted file mode 100644
index 94c0da06a5..0000000000
--- a/package/minicom/0001-musl-libc-compile-fix.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-# HG changeset patch
-# User Adam Lackorzynski <adam@os.inf.tu-dresden.de>
-# Date 1432407431 -7200
-#      Sat May 23 20:57:11 2015 +0200
-# Node ID 8bf81e6a8e60e37c2dec9577a1be6357b8d56165
-# Parent  8c784c80c17aa7a346d982db23bca5df67302cda
-musl-libc compile fix
-
-By Felix Janda <felix.janda@posteo.de>:
-VC_MUSIC is enabled by default on linux and in dial.c the
-necessary header are only included for glibc. (The wrong conditional
-include has likely been introduced by the 2003-03-30 GNU/Hurd patch.)
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Taken from upstream Mercurial commit 8bf81e6a8e60]
-
-diff -r 8c784c80c17a -r 8bf81e6a8e60 src/dial.c
---- a/src/dial.c	Sat May 23 20:56:29 2015 +0200
-+++ b/src/dial.c	Sat May 23 20:57:11 2015 +0200
-@@ -39,7 +39,7 @@
- #include "intl.h"
- 
- #ifdef VC_MUSIC
--#  if defined(__GLIBC__)
-+#  if defined(__linux__) || defined(__GLIBC__)
- #    include <sys/ioctl.h>
- #    include <sys/kd.h>
- #    include <sys/time.h>
diff --git a/package/minicom/0001-sysdep1-check-if-RS485-is-support-before-setting-its.patch b/package/minicom/0001-sysdep1-check-if-RS485-is-support-before-setting-its.patch
new file mode 100644
index 0000000000..39f68350c8
--- /dev/null
+++ b/package/minicom/0001-sysdep1-check-if-RS485-is-support-before-setting-its.patch
@@ -0,0 +1,36 @@
+From 238bbe98558bcd5ed9ab73ef03db82b57ab056ab Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Fri, 31 Aug 2018 15:18:22 +0200
+Subject: [PATCH] sysdep1: check if RS485 is support before setting its
+ parameters
+
+Not every kernel supports RS485, so better check it before setting its
+parameters.
+
+Test if RS485 is supported by checking if these 3 macros are defined:
+- SER_RS485_ENABLED
+- TIOCGRS485
+- TIOCSRS485
+If they're not defined m_set485parms becomes a dummy function.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ src/sysdep1.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sysdep1.c b/src/sysdep1.c
+index 798b006..b03b442 100644
+--- a/src/sysdep1.c
++++ b/src/sysdep1.c
+@@ -599,7 +599,7 @@ void m_set485parms(int fd, int en, int rts_on_snd, int rts_aft_snd,
+                    int rx_dur_tx, int term_bus, char *del_rts_bef_snd,
+                    char *del_rts_aft_snd)
+ {
+-#ifdef SER_RS485_ENABLED
++#if defined (SER_RS485_ENABLED) && defined (TIOCGRS485) && defined (TIOCSRS485)
+   struct serial_rs485 rs485conf;
+ 
+   if (ioctl(fd, TIOCGRS485, &rs485conf))
+-- 
+2.17.1
+
diff --git a/package/minicom/0002-change-maxnamlen-to-posixs-name-max.patch b/package/minicom/0002-change-maxnamlen-to-posixs-name-max.patch
deleted file mode 100644
index 83e1530600..0000000000
--- a/package/minicom/0002-change-maxnamlen-to-posixs-name-max.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-# HG changeset patch
-# User Adam Lackorzynski <adam@os.inf.tu-dresden.de>
-# Date 1432407475 -7200
-#      Sat May 23 20:57:55 2015 +0200
-# Node ID 93e5dd955c8bd944fd64bb04fd117c963c3758bc
-# Parent  8bf81e6a8e60e37c2dec9577a1be6357b8d56165
-Change MAXNAMLEN to POSIX's NAME_MAX
-
-By Felix Janda <felix.janda@posteo.de>:
-MAXNAMLEN is usually defined in <sys/param.h> but it is
-better to use the equivalent POSIX NAME_MAX.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Taken from upstream Mercurial commit 93e5dd955c8b]
-
-diff -r 8bf81e6a8e60 -r 93e5dd955c8b src/getsdir.c
---- a/src/getsdir.c	Sat May 23 20:57:11 2015 +0200
-+++ b/src/getsdir.c	Sat May 23 20:57:55 2015 +0200
-@@ -145,7 +145,7 @@
-  *
-  *			    The data will be in the form:
-  *				typedef struct dirEntry {
-- *				    char fname[MAXNAMLEN + 1];
-+ *				    char fname[NAME_MAX + 1];
-  *				    time_t time;
-  *				    mode_t mode;
-  *				} GETSDIR_ENTRY;
-@@ -232,7 +232,7 @@
-             }
- 
-           /* copy the filename */
--          strncpy((*datptr)[cnt].fname, dp->d_name, MAXNAMLEN);
-+          strncpy((*datptr)[cnt].fname, dp->d_name, NAME_MAX);
- 
-           /* get information about the directory entry */
-           snprintf(fpath, sizeof(fpath), "%s/%s", dirpath, dp->d_name);
-diff -r 8bf81e6a8e60 -r 93e5dd955c8b src/getsdir.h
---- a/src/getsdir.h	Sat May 23 20:57:11 2015 +0200
-+++ b/src/getsdir.h	Sat May 23 20:57:55 2015 +0200
-@@ -23,9 +23,10 @@
-  */
- 
- #include <dirent.h>
-+#include <limits.h>
- 
- typedef struct dirEntry {		/* structure of data item */
--  char fname[MAXNAMLEN + 1];		/* filename + terminating null */
-+  char fname[NAME_MAX + 1];		/* filename + terminating null */
-   time_t time;				/* last modification date */
-   mode_t mode;				/* file mode (dir? etc.) */
-   ushort cflags;			/* caller field for convenience */
diff --git a/package/minicom/Config.in b/package/minicom/Config.in
index c41c188570..efc4f1b709 100644
--- a/package/minicom/Config.in
+++ b/package/minicom/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_MINICOM
 	  ANSI and VT102 terminals. It has a dialing directory and auto
 	  zmodem download.
 
-	  http://alioth.debian.org/projects/minicom/
+	  https://salsa.debian.org/minicom-team/minicom
 
 comment "minicom needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
diff --git a/package/minicom/minicom.hash b/package/minicom/minicom.hash
index f49e430c67..c566f4be52 100644
--- a/package/minicom/minicom.hash
+++ b/package/minicom/minicom.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 532f836b7a677eb0cb1dca8d70302b73729c3d30df26d58368d712e5cca041f1  minicom-2.7.1.tar.gz
+sha256 3bd58b594ac66545649c13ab2b728a4df0f78612eb030680d4152f7627d1f177  minicom-19ab49422f3431102c31fea01549121385113f80.tar.gz
 sha256 cf80a758014eefbf068afffe3d462fc34ff4f528527524d8e100329c42094e15  COPYING
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index cb06482379..000597f8a9 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-MINICOM_VERSION = 2.7.1
-MINICOM_SITE = https://alioth.debian.org/frs/download.php/file/4215
+MINICOM_VERSION = 19ab49422f3431102c31fea01549121385113f80
+MINICOM_SITE = https://salsa.debian.org/minicom-team/minicom.git
+MINICOM_SITE_METHOD = git
 MINICOM_LICENSE = GPL-2.0+
 MINICOM_LICENSE_FILES = COPYING
+MINICOM_AUTORECONF = YES
 
 # pkg-config is only used to check for liblockdev, which we don't have
 # in BR, so instead of adding host-pkgconf as a dependency, simply make
@@ -15,6 +17,15 @@ MINICOM_LICENSE_FILES = COPYING
 # people have liblockdev1-dev installed
 MINICOM_CONF_ENV = PKG_CONFIG=/bin/false
 
-MINICOM_DEPENDENCIES = ncurses $(if $(BR2_ENABLE_LOCALE),,libiconv)
+MINICOM_DEPENDENCIES = ncurses $(if $(BR2_ENABLE_LOCALE),,libiconv) \
+	$(TARGET_NLS_DEPENDENCIES)
+# add host-gettext for AM_ICONV macro
+MINICOM_DEPENDENCIES += host-gettext
+
+# Autoreconf requires an existing m4 directory
+define MINICOM_MKDIR_M4
+	mkdir -p $(@D)/m4
+endef
+MINICOM_POST_PATCH_HOOKS += MINICOM_MKDIR_M4
 
 $(eval $(autotools-package))
