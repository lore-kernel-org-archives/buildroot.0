From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 21:17:06 +0100
Subject: [Buildroot] [git commit] irssi: bump to version 0.8.18
Message-ID: <20160308201711.883FD7FB26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a3c8498ab9c8e8022798a5b7441197cee47d685
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also remove no longer needed patch (merged upstream).

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Fix-quote-around-macro-argument.patch     | 46 ----------------------
 package/irssi/irssi.hash                           |  2 +-
 package/irssi/irssi.mk                             |  7 ++--
 3 files changed, 4 insertions(+), 51 deletions(-)

diff --git a/package/irssi/0001-Fix-quote-around-macro-argument.patch b/package/irssi/0001-Fix-quote-around-macro-argument.patch
deleted file mode 100644
index d0509d5..0000000
--- a/package/irssi/0001-Fix-quote-around-macro-argument.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From a9d2f9ca6edb7a958ecb606f7db2055caad26a1e Mon Sep 17 00:00:00 2001
-From: Rodrigo Rebello <rprebello@gmail.com>
-Date: Wed, 28 Oct 2015 13:38:21 -0200
-Subject: [PATCH 1/1] Fix quote around macro argument
-
-In m4/curses.m4, line 134, the 5th argument passed to AC_NCURSES was
-surrounded by '"' instead of '[' and ']'. Because of that, the expansion
-of AC_NCURSES in that case would produce the following line inside the
-configure script (note the repeated double quotes):
-
-  screen_manager=""ncurses on $withval/include""
-
-That would cause the following error when configure was executed with
-the "--with-ncurses=dir" argument:
-
-  ./configure: line 13468: on: command not found
-
-Although in the case above the error doesn't actually influence the
-build process ('screen_manager' isn't used anywhere in the script),
-trying to execute 'on' might be harmful if it corresponded to an
-existing command in the user's environment.
-
-Upstream-status: accepted, not yet released.
-https://github.com/irssi/irssi/pull/344
-
-Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
----
- m4/curses.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/m4/curses.m4 b/m4/curses.m4
-index 82b110f..41c0e6c 100644
---- a/m4/curses.m4
-+++ b/m4/curses.m4
-@@ -131,7 +131,7 @@ AC_DEFUN([AC_CHECK_CURSES],[
- 	  if test x$withval = xno ; then
- 		search_ncurses=false
- 	  elif test x$withval != xyes ; then
--		AC_NCURSES($withval/include, ncurses.h, -L$withval/lib -lncurses, -I$withval/include, "ncurses on $withval/include")
-+		AC_NCURSES($withval/include, ncurses.h, -L$withval/lib -lncurses, -I$withval/include, [ncurses on $withval/include])
- 	  fi
- 	)
- 
--- 
-2.1.4
-
diff --git a/package/irssi/irssi.hash b/package/irssi/irssi.hash
index 0bfafe6..fa49d85 100644
--- a/package/irssi/irssi.hash
+++ b/package/irssi/irssi.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	3c9600cad2edf58f1d012febc1a0ba844274df6e331c01a9e935467705166807	irssi-0.8.17.tar.bz2
+sha256	c0a177f749757c2d171ebe49ab0f0dd9cf9374dea81ab01904d0549bcb057840	irssi-0.8.18.tar.xz
diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index 176dce7..8272e44 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -4,15 +4,14 @@
 #
 ################################################################################
 
-IRSSI_VERSION = 0.8.17
-IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.bz2
+IRSSI_VERSION = 0.8.18
+IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.xz
 # Do not use the github helper here. The generated tarball is *NOT* the
 # same as the one uploaded by upstream for the release.
-IRSSI_SITE = https://github.com/irssi-import/irssi/releases/download/$(IRSSI_VERSION)
+IRSSI_SITE = https://github.com/irssi/irssi/releases/download/$(IRSSI_VERSION)
 IRSSI_LICENSE = GPLv2+
 IRSSI_LICENSE_FILES = COPYING
 IRSSI_DEPENDENCIES = host-pkgconf libglib2 ncurses
-IRSSI_AUTORECONF = YES
 
 IRSSI_CONF_OPTS = \
 	--disable-glibtest \
