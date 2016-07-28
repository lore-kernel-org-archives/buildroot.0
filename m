From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jul 2016 21:59:33 +0200
Subject: [Buildroot] [git commit] package/systemd: bump version
Message-ID: <20160728201546.7407D7FDA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2cfee6fc981816cb3986f058c68772fac15cf132
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version v231.
Along that, refresh a patch that did not apply anymore.

For reference, here is the changelog:
https://lists.freedesktop.org/archives/systemd-devel/2016-July/037220.html

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...uild-sys-revert-use-of-ln-relative-option.patch | 62 ++++++++++------------
 package/systemd/systemd.hash                       |  2 +-
 package/systemd/systemd.mk                         |  2 +-
 3 files changed, 29 insertions(+), 37 deletions(-)

diff --git a/package/systemd/0002-build-sys-revert-use-of-ln-relative-option.patch b/package/systemd/0002-build-sys-revert-use-of-ln-relative-option.patch
index 2d9b347..18dc987 100644
--- a/package/systemd/0002-build-sys-revert-use-of-ln-relative-option.patch
+++ b/package/systemd/0002-build-sys-revert-use-of-ln-relative-option.patch
@@ -1,35 +1,36 @@
-From 582c9a734a0e976592946ff5b577f98551170a38 Mon Sep 17 00:00:00 2001
+From 32b6c22006767f0762edfa116b8b0f7be0c5c121 Mon Sep 17 00:00:00 2001
 From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Date: Mon, 21 Jul 2014 11:34:38 +0200
-Subject: [PATCH 1/1] build-sys: revert use of ln relative option.
+Date: Wed, 27 Jul 2016 15:43:16 +0200
+Subject: [PATCH] build-sys: revert use of ln relative option.
 
 Systemd build system now uses the `--relative` option from `ln(1)`.
+
 This option was added to GNU coreutils 8.16, which is not widely
 deployed yet by GNU/Linux distributions (not available in Debian Wheezy
 for example).
 
 Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+[Maxime: refresh the patch]
+Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 ---
- Makefile.am  |   19 +++++--------------
- configure.ac |    2 --
- 2 files changed, 5 insertions(+), 16 deletions(-)
+ Makefile.am  | 15 +++------------
+ configure.ac |  2 --
+ 2 files changed, 3 insertions(+), 14 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index e238cde..02b39ea 100644
+index 0c27f81..4de1595 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -219,8 +219,8 @@ define move-to-rootlibdir
- 	if test "$(libdir)" != "$(rootlibdir)"; then \
+@@ -255,7 +255,7 @@ define move-to-rootlibdir
  		$(MKDIR_P) $(DESTDIR)$(rootlibdir) && \
  		so_img_name=$$(readlink $(DESTDIR)$(libdir)/$$libname) && \
--		rm -f $(DESTDIR)$(libdir)/$$libname && \
+ 		rm -f $(DESTDIR)$(libdir)/$$libname && \
 -		$(LN_S) --relative -f $(DESTDIR)$(rootlibdir)/$$so_img_name $(DESTDIR)$(libdir)/$$libname && \
-+		so_img_rel_target_prefix=$$(echo $(libdir) | sed 's,\(^/\|\)[^/][^/]*,..,g') && \
-+		$(LN_S) -f $$so_img_rel_target_prefix$(rootlibdir)/$$so_img_name $(DESTDIR)$(libdir)/$$libname && \
++		$(LN_S) -f $(DESTDIR)$(rootlibdir)/$$so_img_name $(DESTDIR)$(libdir)/$$libname && \
  		mv $(DESTDIR)$(libdir)/$$libname.* $(DESTDIR)$(rootlibdir); \
  	fi
  endef
-@@ -279,9 +279,9 @@ install-aliases-hook:
+@@ -312,9 +312,9 @@ install-aliases-hook:
  	set -- $(SYSTEM_UNIT_ALIASES) && \
  		dir=$(systemunitdir) && $(install-aliases)
  	set -- $(USER_UNIT_ALIASES) && \
@@ -38,13 +39,13 @@ index e238cde..02b39ea 100644
  	set -- $(GENERAL_ALIASES) && \
 -		dir= && $(install-relative-aliases)
 +		dir= && $(install-aliases)
- 
+
  define install-aliases
  	while [ -n "$$1" ]; do \
-@@ -292,15 +292,6 @@ define install-aliases
+@@ -325,15 +325,6 @@ define install-aliases
  	done
  endef
- 
+
 -define install-relative-aliases
 -	while [ -n "$$1" ]; do \
 -		$(MKDIR_P) `dirname $(DESTDIR)$$dir/$$2` && \
@@ -56,29 +57,20 @@ index e238cde..02b39ea 100644
 -
  install-touch-usr-hook:
  	touch -c $(DESTDIR)/$(prefix)
- 
-@@ -2034,7 +2025,7 @@ systemd_dbus1_generator_LDADD = \
- dbus1-generator-install-hook:
- 	$(AM_V_at)$(MKDIR_P) $(DESTDIR)$(usergeneratordir)
- 	$(AM_V_RM)rm -f $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
--	$(AM_V_LN)$(LN_S) --relative -f $(DESTDIR)$(systemgeneratordir)/systemd-dbus1-generator $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
-+	$(AM_V_LN)$(LN_S) -f $(systemgeneratordir)/systemd-dbus1-generator $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
- 
- dbus1-generator-uninstall-hook:
- 	rm -f $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
+
 diff --git a/configure.ac b/configure.ac
-index ae88382..ec220af 100644
+index cf595e6..d58f303 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -96,8 +96,6 @@ AC_PATH_PROG([KMOD], [kmod], [/usr/bin/kmod], [$PATH:/usr/sbin:/sbin])
- 
- AC_PATH_PROG([KEXEC], [kexec], [/usr/sbin/kexec], [$PATH:/usr/sbin:/sbin])
- 
+@@ -110,8 +110,6 @@ AC_PATH_PROG([SULOGIN], [sulogin], [/usr/sbin/sulogin], [$PATH:/usr/sbin:/sbin])
+ AC_PATH_PROG([MOUNT_PATH], [mount], [/usr/bin/mount], [$PATH:/usr/sbin:/sbin])
+ AC_PATH_PROG([UMOUNT_PATH], [umount], [/usr/bin/umount], [$PATH:/usr/sbin:/sbin])
+
 -AS_IF([! ln --relative --help > /dev/null 2>&1], [AC_MSG_ERROR([*** ln doesn't support --relative ***])])
 -
  M4_DEFINES=
- 
- # gtkdocize greps for '^GTK_DOC_CHECK', so it needs to be on its own line
--- 
-1.7.10.4
+
+ AC_CHECK_TOOL(OBJCOPY, objcopy)
+--
+2.8.1
 
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 141eadf..30e9ef6 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 46b07568142adcd017c62e6230d39eb10d219ed3b2f13ffc12d9a3a6b1c840cd  systemd-230.tar.gz
+sha256 899733ad6c157cedbb89aec4efe3bc824dcfd65a1d6f6bebc7b043f7924e39b4 systemd-231.tar.gz
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 689b40d..fb07819 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 230
+SYSTEMD_VERSION = 231
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPLv2.1+, GPLv2+ (udev), Public Domain (few source files, see README)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
