From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  2 Aug 2015 20:56:54 +0200
Subject: [Buildroot] [PATCH] systemd: Bump version and change hosting
Message-ID: <1438541814-20602-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd seems to do its release using their github repository up from
the 221 version.

Since they use the auto generated release, we can't have a hash file.

Remove the patch about 'ln --relative', coreutils's version is 8.23.4 on all
recent (starting from stable included) Debian so it as good a time as
any to discard this patch.

We need to use the autogen.sh scripts from systemd, since they don't
provide the Makefile.in file in the 'po' directory, intltoolize which is
called in the autogen.sh scripts will create it for us.
Therefore, there it's no longer needed to do AUTORECONF.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 ...uild-sys-revert-use-of-ln-relative-option.patch | 84 ----------------------
 package/systemd/systemd.hash                       |  2 -
 package/systemd/systemd.mk                         | 11 +--
 3 files changed, 7 insertions(+), 90 deletions(-)
 delete mode 100644 package/systemd/0002-build-sys-revert-use-of-ln-relative-option.patch
 delete mode 100644 package/systemd/systemd.hash

diff --git a/package/systemd/0002-build-sys-revert-use-of-ln-relative-option.patch b/package/systemd/0002-build-sys-revert-use-of-ln-relative-option.patch
deleted file mode 100644
index 2d9b347..0000000
--- a/package/systemd/0002-build-sys-revert-use-of-ln-relative-option.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 582c9a734a0e976592946ff5b577f98551170a38 Mon Sep 17 00:00:00 2001
-From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Date: Mon, 21 Jul 2014 11:34:38 +0200
-Subject: [PATCH 1/1] build-sys: revert use of ln relative option.
-
-Systemd build system now uses the `--relative` option from `ln(1)`.
-This option was added to GNU coreutils 8.16, which is not widely
-deployed yet by GNU/Linux distributions (not available in Debian Wheezy
-for example).
-
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
----
- Makefile.am  |   19 +++++--------------
- configure.ac |    2 --
- 2 files changed, 5 insertions(+), 16 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index e238cde..02b39ea 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -219,8 +219,8 @@ define move-to-rootlibdir
- 	if test "$(libdir)" != "$(rootlibdir)"; then \
- 		$(MKDIR_P) $(DESTDIR)$(rootlibdir) && \
- 		so_img_name=$$(readlink $(DESTDIR)$(libdir)/$$libname) && \
--		rm -f $(DESTDIR)$(libdir)/$$libname && \
--		$(LN_S) --relative -f $(DESTDIR)$(rootlibdir)/$$so_img_name $(DESTDIR)$(libdir)/$$libname && \
-+		so_img_rel_target_prefix=$$(echo $(libdir) | sed 's,\(^/\|\)[^/][^/]*,..,g') && \
-+		$(LN_S) -f $$so_img_rel_target_prefix$(rootlibdir)/$$so_img_name $(DESTDIR)$(libdir)/$$libname && \
- 		mv $(DESTDIR)$(libdir)/$$libname.* $(DESTDIR)$(rootlibdir); \
- 	fi
- endef
-@@ -279,9 +279,9 @@ install-aliases-hook:
- 	set -- $(SYSTEM_UNIT_ALIASES) && \
- 		dir=$(systemunitdir) && $(install-aliases)
- 	set -- $(USER_UNIT_ALIASES) && \
--		dir=$(userunitdir) && $(install-relative-aliases)
-+		dir=$(userunitdir) && $(install-aliases)
- 	set -- $(GENERAL_ALIASES) && \
--		dir= && $(install-relative-aliases)
-+		dir= && $(install-aliases)
- 
- define install-aliases
- 	while [ -n "$$1" ]; do \
-@@ -292,15 +292,6 @@ define install-aliases
- 	done
- endef
- 
--define install-relative-aliases
--	while [ -n "$$1" ]; do \
--		$(MKDIR_P) `dirname $(DESTDIR)$$dir/$$2` && \
--		rm -f $(DESTDIR)$$dir/$$2 && \
--		$(LN_S) --relative $(DESTDIR)$$1 $(DESTDIR)$$dir/$$2 && \
--		shift 2 || exit $$?; \
--	done
--endef
--
- install-touch-usr-hook:
- 	touch -c $(DESTDIR)/$(prefix)
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
-diff --git a/configure.ac b/configure.ac
-index ae88382..ec220af 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -96,8 +96,6 @@ AC_PATH_PROG([KMOD], [kmod], [/usr/bin/kmod], [$PATH:/usr/sbin:/sbin])
- 
- AC_PATH_PROG([KEXEC], [kexec], [/usr/sbin/kexec], [$PATH:/usr/sbin:/sbin])
- 
--AS_IF([! ln --relative --help > /dev/null 2>&1], [AC_MSG_ERROR([*** ln doesn't support --relative ***])])
--
- M4_DEFINES=
- 
- # gtkdocize greps for '^GTK_DOC_CHECK', so it needs to be on its own line
--- 
-1.7.10.4
-
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
deleted file mode 100644
index f746051..0000000
--- a/package/systemd/systemd.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  085e088650afbfc688ccb13459aedb1fbc7c8810358605b076301f472d51cc4f  systemd-221.tar.xz
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b62fc08..7115546 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 221
-SYSTEMD_SITE = http://www.freedesktop.org/software/systemd
-SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
+SYSTEMD_VERSION = 224
+SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPLv2.1+, GPLv2+ (udev), Public Domain (few source files, see README)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
 SYSTEMD_INSTALL_STAGING = YES
@@ -18,7 +17,6 @@ SYSTEMD_DEPENDENCIES = \
 	host-gperf
 
 SYSTEMD_PROVIDES = udev
-SYSTEMD_AUTORECONF = YES
 
 # Make sure that systemd will always be built after busybox so that we have
 # a consistent init setup between two builds
@@ -51,6 +49,11 @@ SYSTEMD_CONF_ENV = \
 	CFLAGS="$(SYSTEMD_CFLAGS)" \
 	ac_cv_path_KMOD=/usr/bin/kmod
 
+define SYSTEMD_RUN_AUTOGEN
+	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+endef
+SYSTEMD_PRE_CONFIGURE_HOOKS += SYSTEMD_RUN_AUTOGEN
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_COMPAT),y)
 SYSTEMD_CONF_OPTS += --enable-compat-libs
 else
-- 
2.4.6
