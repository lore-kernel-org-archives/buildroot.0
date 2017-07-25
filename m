From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 21:47:26 +0200
Subject: [Buildroot] [git commit] package/kismet: bump version to 2016-07-R1
Message-ID: <20170725194356.47A7D7FC8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88adc94297e71680b41c6d83c03e1806dd132898
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changed _SITE from git clone to tarball provided by upstream.
Rebased patches 0003 & 0004.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kismet/0003-fix-curses-libs-ordering.patch | 8 +++++---
 package/kismet/0004-no-include-host-paths.patch    | 6 ++++--
 package/kismet/kismet.hash                         | 2 +-
 package/kismet/kismet.mk                           | 6 +++---
 4 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/package/kismet/0003-fix-curses-libs-ordering.patch b/package/kismet/0003-fix-curses-libs-ordering.patch
index b579c96..8d2b911 100644
--- a/package/kismet/0003-fix-curses-libs-ordering.patch
+++ b/package/kismet/0003-fix-curses-libs-ordering.patch
@@ -14,10 +14,12 @@ at the *front* of the list, not at the end.
 Reported-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+[bernd.kuhls at t-online.de: update for 2016-07-R1]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 
 diff -durN kismet-Kismet-2014-02-R1.orig/configure.in kismet-Kismet-2014-02-R1/configure.in
---- kismet-Kismet-2014-02-R1.orig/configure.in	2014-02-19 05:37:43.000000000 +0100
-+++ kismet-Kismet-2014-02-R1/configure.in	2014-12-26 16:46:55.770692349 +0100
+--- kismet-Kismet-2014-02-R1.orig/configure.ac	2014-02-19 05:37:43.000000000 +0100
++++ kismet-Kismet-2014-02-R1/configure.ac	2014-12-26 16:46:55.770692349 +0100
 @@ -437,10 +434,10 @@
  		AC_MSG_ERROR(Failed to find curses.h or ncurses.h.  You probably need to install the curses-devel package from your distribution)
  	fi
@@ -25,7 +27,7 @@ diff -durN kismet-Kismet-2014-02-R1.orig/configure.in kismet-Kismet-2014-02-R1/c
 -	LIBS="$LIBS $curseaux"
 +	LIBS="$curseaux $LIBS"
  	AC_CHECK_LIB([panel], [new_panel],
- 				 AC_DEFINE(HAVE_LIBPANEL, 1, Panel terminal lib) 
+ 				 AC_DEFINE(HAVE_LIBPANEL, 1, Panel terminal lib)
 -				 curseaux="$curseaux -lpanel",
 +				 curseaux="-lpanel $curseaux",
  				 AC_MSG_ERROR(Failed to find libpanel extension to curses/ncurses.  Install it, or disable building the Kismet client with --disable-client.  Disabling the client is probably not something you want to do normally.))
diff --git a/package/kismet/0004-no-include-host-paths.patch b/package/kismet/0004-no-include-host-paths.patch
index 1dcf120..6819bf4 100644
--- a/package/kismet/0004-no-include-host-paths.patch
+++ b/package/kismet/0004-no-include-host-paths.patch
@@ -7,10 +7,12 @@ Remove that directory from the include search dirs.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+[bernd.kuhls at t-online.de: update for 2016-07-R1]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 
 diff -durN kismet-Kismet-2014-02-R1.orig/configure.in kismet-Kismet-2014-02-R1/configure.in
---- kismet-Kismet-2014-02-R1.orig/configure.in	2014-02-19 05:37:43.000000000 +0100
-+++ kismet-Kismet-2014-02-R1/configure.in	2014-12-26 16:46:55.770692349 +0100
+--- kismet-Kismet-2014-02-R1.orig/configure.ac	2014-02-19 05:37:43.000000000 +0100
++++ kismet-Kismet-2014-02-R1/configure.ac	2014-12-26 16:46:55.770692349 +0100
 @@ -406,9 +406,6 @@
  )
  AC_SUBST(wantclient)
diff --git a/package/kismet/kismet.hash b/package/kismet/kismet.hash
index e4dc5a4..913dffc 100644
--- a/package/kismet/kismet.hash
+++ b/package/kismet/kismet.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 23b693baa29549b051e95e9d597b115bd94f7267c4677307ebd87f2a00e5a52b kismet-Kismet-2014-02-R1.tar.gz
+sha256 bdb21f153311f1ff3b16621bf0d6740f66369bf0982b0a289c9a12af8847e237  kismet-2016-07-R1.tar.xz
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 8abf712..cee814b 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-KISMET_VERSION = Kismet-2014-02-R1
-KISMET_SITE = http://www.kismetwireless.net/kismet.git
-KISMET_SITE_METHOD = git
+KISMET_VERSION = 2016-07-R1
+KISMET_SOURCE = kismet-$(KISMET_VERSION).tar.xz
+KISMET_SITE = http://www.kismetwireless.net/code
 KISMET_DEPENDENCIES = host-pkgconf libpcap ncurses libnl
 KISMET_CONF_OPTS += --with-netlink-version=3
 KISMET_LICENSE = GPL-2.0+
