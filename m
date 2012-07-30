From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 19:10:48 +0200
Subject: [Buildroot] [git commit] ncurses: bump to 5.9
Message-ID: <20120730171224.CB81896FB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea479450da0017827760f895758d2ccd1fc8d684
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumping to 5.9 has two nice side-effects:

 * It builds fine on noMMU architectures such as Blackfin, which will
   fix build failures like
   http://autobuild.buildroot.org/results/cf3e6a95c82b60d63da041293db576a8f21f9136/build-end.log.

 * It installs a pkg-config file, which will allow gpsd to find
   ncurses properly, without the need to use ncurses5-config, which
   means we can get rid of one of our gpsd patches. Thanks to Mike
   Frysinger for pointing the new --enable-pc-files option.

After this bump, I build tested a large number of the ncurses reverse
dependencies we have in Buildroot, and they all built fine.

Thanks to Gustavo Zacarias for the investigation on why ncurses 5.9
why segfaulting: it turned out to be caused by the
--enable-broken-linker configure option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../ncurses-01-fixup-pkg-config-handling.patch     |   89 ++++++++++++++++++++
 package/ncurses/ncurses.mk                         |    5 +-
 2 files changed, 92 insertions(+), 2 deletions(-)

diff --git a/package/ncurses/ncurses-01-fixup-pkg-config-handling.patch b/package/ncurses/ncurses-01-fixup-pkg-config-handling.patch
new file mode 100644
index 0000000..e1cfc75
--- /dev/null
+++ b/package/ncurses/ncurses-01-fixup-pkg-config-handling.patch
@@ -0,0 +1,89 @@
+Change handling of PKG_CONFIG_LIBDIR
+
+When PKG_CONFIG_LIBDIR was unset in the environment, the configure
+script was deducing the PKG_CONFIG_LIBDIR from the location of the
+pkg-config binary, which doesn't make a lot of sense, and isn't done
+by other autotools based packages.
+
+Also, the configure script was checking that the directory really
+exists. This forced to create the directory *and* provide an absolute
+path in PKG_CONFIG_LIBDIR, which didn't play well with the fact that
+at installation time, PKG_CONFIG_LIBDIR is suffixed to DESTDIR, which
+means that we got two times the staging directory location.
+
+This patch fixes both of those issues. Also, since ncurses uses a fork
+of autoconf 2.13, we can't simply use _AUTORECONF=YES, so we also fix
+the configure script in this patch.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure
+===================================================================
+--- a/configure
++++ b/configure
+@@ -3623,27 +3623,20 @@
+ 
+ 	# Leave this as something that can be overridden in the environment.
+ 	if test -z "$PKG_CONFIG_LIBDIR" ; then
+-		PKG_CONFIG_LIBDIR=`echo "$PKG_CONFIG" | sed -e 's,/[^/]*/[^/]*$,,'`/lib/pkgconfig
++		PKG_CONFIG_LIBDIR="/usr/lib/pkgconfig"
+ 	fi
++
+ 	PKG_CONFIG_LIBDIR=`echo "$PKG_CONFIG_LIBDIR" | sed -e 's/^://' -e 's/:.*//'`
+-	if test -n "$PKG_CONFIG_LIBDIR" && test -d "$PKG_CONFIG_LIBDIR" ; then
+ 
+-# Check whether --enable-pc-files or --disable-pc-files was given.
+-if test "${enable_pc_files+set}" = set; then
+-  enableval="$enable_pc_files"
+-  enable_pc_files=$enableval
+-else
+-  enable_pc_files=no
+-fi;
+-		echo "$as_me:3638: result: $enable_pc_files" >&5
+-echo "${ECHO_T}$enable_pc_files" >&6
++        # Check whether --enable-pc-files or --disable-pc-files was given.
++	if test "${enable_pc_files+set}" = set; then
++	    enableval="$enable_pc_files"
++	    enable_pc_files=$enableval
+ 	else
+-		echo "$as_me:3641: result: no" >&5
+-echo "${ECHO_T}no" >&6
+-		{ echo "$as_me:3643: WARNING: did not find library $PKG_CONFIG_LIBDIR" >&5
+-echo "$as_me: WARNING: did not find library $PKG_CONFIG_LIBDIR" >&2;}
+-		enable_pc_files=no
+-	fi
++	    enable_pc_files=no
++	fi;
++	echo "$as_me:3638: result: $enable_pc_files" >&5
++	echo "${ECHO_T}$enable_pc_files" >&6
+ fi
+ 
+ echo "$as_me:3649: checking if we should assume mixed-case filenames" >&5
+Index: b/configure.in
+===================================================================
+--- a/configure.in
++++ b/configure.in
+@@ -174,20 +174,14 @@
+ 
+ 	# Leave this as something that can be overridden in the environment.
+ 	if test -z "$PKG_CONFIG_LIBDIR" ; then
+-		PKG_CONFIG_LIBDIR=`echo "$PKG_CONFIG" | sed -e 's,/[[^/]]*/[[^/]]*$,,'`/lib/pkgconfig
++		PKG_CONFIG_LIBDIR="/usr/lib/pkgconfig"
+ 	fi
+ 	PKG_CONFIG_LIBDIR=`echo "$PKG_CONFIG_LIBDIR" | sed -e 's/^://' -e 's/:.*//'`
+-	if test -n "$PKG_CONFIG_LIBDIR" && test -d "$PKG_CONFIG_LIBDIR" ; then
+-		AC_ARG_ENABLE(pc-files,
++	AC_ARG_ENABLE(pc-files,
+ 			[  --enable-pc-files       generate and install .pc files for pkg-config],
+ 			[enable_pc_files=$enableval],
+ 			[enable_pc_files=no])
+-		AC_MSG_RESULT($enable_pc_files)
+-	else
+-		AC_MSG_RESULT(no)
+-		AC_MSG_WARN(did not find library $PKG_CONFIG_LIBDIR)
+-		enable_pc_files=no
+-	fi
++	AC_MSG_RESULT($enable_pc_files)
+ fi
+ AC_SUBST(PKG_CONFIG_LIBDIR)
+ 
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 72a8030..d823996 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -23,7 +23,7 @@
 # USA
 
 # TARGETS
-NCURSES_VERSION = 5.7
+NCURSES_VERSION = 5.9
 NCURSES_SITE = $(BR2_GNU_MIRROR)/ncurses
 NCURSES_INSTALL_STAGING = YES
 NCURSES_DEPENDENCIES = host-ncurses
@@ -38,10 +38,11 @@ NCURSES_CONF_OPT = \
 	--disable-big-core \
 	--without-profile \
 	--disable-rpath \
+	--disable-rpath-hack \
 	--enable-echo \
 	--enable-const \
 	--enable-overwrite \
-	--enable-broken_linker
+	--enable-pc-files
 
 ifneq ($(BR2_ENABLE_DEBUG),y)
 NCURSES_CONF_OPT += --without-debug
