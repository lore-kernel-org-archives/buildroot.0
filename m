From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed,  1 Aug 2018 23:12:33 +0200
Subject: [Buildroot] [PATCH v2] minicom: update package to use git
 repository.
Message-ID: <20180801211233.48005-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Minicom is now available on a git repository at:
https://salsa.debian.org/minicom-team/minicom.git
Lot of fixes has been added since version 2.7-1 and RS485 support has
been added too under serial port configuration.

- change MINICOM_METHOD to git pointing to latest commit
- add MINICOM_AUTORECONF = YES
- add MINICOM_MKDIR_M4 to MINICOM_POST_PATCH_HOOKS because autoreconf
requires and existing m4 directory
- delete patches since they became part of git repository as commits
- delete hash file since it's not used anymore

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
Adam Lackorzynski (85):
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

Giulio Benetti (4):
      Add RS485 parameters.
      Add RS485 menu entries to "Serial port Setup"
      Handle RS485 low-level
      sysdep1: avoid asserting rts when rs485 enabled

Martin A. Godisch (2):
      fixed text width in history buffer message box
      properly escaped dashes in manual page

Matthias Dieter Walln?fer (1):
      Properly recognise multi-byte characters by introducing

Ond?ej Lyson?k (6):
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
---
 .../minicom/0001-musl-libc-compile-fix.patch  | 28 ----------
 ...-change-maxnamlen-to-posixs-name-max.patch | 51 -------------------
 package/minicom/minicom.hash                  |  2 -
 package/minicom/minicom.mk                    | 13 ++++-
 4 files changed, 11 insertions(+), 83 deletions(-)
 delete mode 100644 package/minicom/0001-musl-libc-compile-fix.patch
 delete mode 100644 package/minicom/0002-change-maxnamlen-to-posixs-name-max.patch
 delete mode 100644 package/minicom/minicom.hash

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
diff --git a/package/minicom/minicom.hash b/package/minicom/minicom.hash
deleted file mode 100644
index ca3087160b..0000000000
--- a/package/minicom/minicom.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256 532f836b7a677eb0cb1dca8d70302b73729c3d30df26d58368d712e5cca041f1  minicom-2.7.1.tar.gz
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index cb06482379..a87fbe9f19 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-MINICOM_VERSION = 2.7.1
-MINICOM_SITE = https://alioth.debian.org/frs/download.php/file/4215
+MINICOM_VERSION = 0e79d0bb731a16a3126d926740f923bcb6ecd738
+MINICOM_SITE = https://salsa.debian.org/minicom-team/minicom.git
+MINICOM_SITE_METHOD = git
 MINICOM_LICENSE = GPL-2.0+
 MINICOM_LICENSE_FILES = COPYING
+MINICOM_AUTORECONF = YES
 
 # pkg-config is only used to check for liblockdev, which we don't have
 # in BR, so instead of adding host-pkgconf as a dependency, simply make
@@ -17,4 +19,11 @@ MINICOM_CONF_ENV = PKG_CONFIG=/bin/false
 
 MINICOM_DEPENDENCIES = ncurses $(if $(BR2_ENABLE_LOCALE),,libiconv)
 
+# configure is missing and minicom is not compatible with our autoreconf
+# mechanism so we have to do it manually instead of using MINICOM_AUTORECONF = YES
+define MINICOM_MKDIR_M4
+	mkdir -p $(@D)/m4
+endef
+MINICOM_POST_PATCH_HOOKS += MINICOM_MKDIR_M4
+
 $(eval $(autotools-package))
-- 
2.17.1
