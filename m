From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 Jun 2010 11:48:58 +0200
Subject: [Buildroot] [git commit master 1/1] ntfsprogs: fix fuse dependency
Message-ID: <20100618114218.3FEA6816CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4342271319870cecd6d84c9725e1dfaa483cb51d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ntfsprogs configure script would add hardcoded host dirs to the
pkg-config search path, confusing configure if libraries were installed
on the host and not on the target.

At the same time, ensure that fuse is build before ntfsprogs (if enabled),
so the fuse support gets built.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...tfsprogs-2.0.0-no-pkgconfig-path-override.patch |   42 ++++++++++++++++++++
 package/ntfsprogs/ntfsprogs.mk                     |    4 ++
 2 files changed, 46 insertions(+), 0 deletions(-)
 create mode 100644 package/ntfsprogs/ntfsprogs-2.0.0-no-pkgconfig-path-override.patch

diff --git a/package/ntfsprogs/ntfsprogs-2.0.0-no-pkgconfig-path-override.patch b/package/ntfsprogs/ntfsprogs-2.0.0-no-pkgconfig-path-override.patch
new file mode 100644
index 0000000..bf7824d
--- /dev/null
+++ b/package/ntfsprogs/ntfsprogs-2.0.0-no-pkgconfig-path-override.patch
@@ -0,0 +1,42 @@
+[PATCH] ntfsprogs: don't override PKG_CONFIG_PATH
+
+Adding hardcoded directories to the pkg-config search path breaks
+cross compilation (E.G. if the host has a .pc for a package the
+target doesn't have).
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ configure    |    4 ----
+ configure.ac |    4 ----
+ 2 files changed, 8 deletions(-)
+
+Index: ntfsprogs-2.0.0/configure.ac
+===================================================================
+--- ntfsprogs-2.0.0.orig/configure.ac
++++ ntfsprogs-2.0.0/configure.ac
+@@ -168,10 +168,6 @@ AC_PROG_MAKE_SET
+ AC_PROG_LIBTOOL
+ PKG_PROG_PKG_CONFIG
+ 
+-# Libraries often install their metadata .pc files in directories not searched
+-# by pkg-config. Let's workaround this. 
+-export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:/usr/lib/pkgconfig:/opt/gnome/lib/pkgconfig:/usr/share/pkgconfig:/usr/local/lib/pkgconfig:$prefix/lib/pkgconfig:/opt/gnome/share/pkgconfig:/usr/local/share/pkgconfig
+-
+ # Enable large file support.
+ AC_SYS_LARGEFILE
+ 
+Index: ntfsprogs-2.0.0/configure
+===================================================================
+--- ntfsprogs-2.0.0.orig/configure
++++ ntfsprogs-2.0.0/configure
+@@ -20210,10 +20210,6 @@ echo "${ECHO_T}no" >&6; }
+ 
+ fi
+ 
+-# Libraries often install their metadata .pc files in directories not searched
+-# by pkg-config. Let's workaround this.
+-export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:/usr/lib/pkgconfig:/opt/gnome/lib/pkgconfig:/usr/share/pkgconfig:/usr/local/lib/pkgconfig:$prefix/lib/pkgconfig:/opt/gnome/share/pkgconfig:/usr/local/share/pkgconfig
+-
+ # Enable large file support.
+ # Check whether --enable-largefile was given.
+ if test "${enable_largefile+set}" = set; then
diff --git a/package/ntfsprogs/ntfsprogs.mk b/package/ntfsprogs/ntfsprogs.mk
index 654d3cb..2046d29 100644
--- a/package/ntfsprogs/ntfsprogs.mk
+++ b/package/ntfsprogs/ntfsprogs.mk
@@ -12,6 +12,10 @@ NTFSPROGS_INSTALL_STAGING:=yes
 NTFSPROGS_BIN:=ntfscat ntfscluster ntfscmp ntfsfix ntfsinfo ntfsls
 NTFSPROGS_SBIN:=ntfsclone ntfscp ntfslabel ntfsresize ntfsundelete mkntfs
 
+ifeq ($(BR2_PACKAGE_LIBFUSE),y)
+NTFSPROGS_DEPENDENCIES += libfuse
+endif
+
 $(eval $(call AUTOTARGETS,package,ntfsprogs))
 
 $(NTFSPROGS_TARGET_INSTALL_TARGET): $(NTFSPROGS_TARGET_INSTALL_STAGING)
-- 
1.7.1
