From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Jul 2014 09:08:39 +0200
Subject: [Buildroot] [git commit] systemd: bump to version 215
Message-ID: <20140726071532.907EA9D301@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d1d119c271b1070e189beb06380540308e5d31ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump systemd to version 215.

Also refresh the patch reverting the use of `ln --relative`.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...uild-sys-revert-use-of-ln-relative-option.patch |   87 ++++++--------------
 package/systemd/systemd.mk                         |    2 +-
 2 files changed, 26 insertions(+), 63 deletions(-)

diff --git a/package/systemd/systemd-02-build-sys-revert-use-of-ln-relative-option.patch b/package/systemd/systemd-02-build-sys-revert-use-of-ln-relative-option.patch
index 140c55c..f4795b8 100644
--- a/package/systemd/systemd-02-build-sys-revert-use-of-ln-relative-option.patch
+++ b/package/systemd/systemd-02-build-sys-revert-use-of-ln-relative-option.patch
@@ -1,6 +1,6 @@
-From d42cb9692f145d439b836f61a0b7f551a87d3484 Mon Sep 17 00:00:00 2001
+From 582c9a734a0e976592946ff5b577f98551170a38 Mon Sep 17 00:00:00 2001
 From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Date: Mon, 2 Jun 2014 12:25:58 +0200
+Date: Mon, 21 Jul 2014 11:34:38 +0200
 Subject: [PATCH 1/1] build-sys: revert use of ln relative option.
 
 Systemd build system now uses the `--relative` option from `ln(1)`.
@@ -8,24 +8,17 @@ This option was added to GNU coreutils 8.16, which is not widely
 deployed yet by GNU/Linux distributions (not available in Debian Wheezy
 for example).
 
-This patch reverts the following commits:
-
-- 446883528524429283626208928b51f49f28f810
-- 0ce91e4e3ba60d5c87307c1be4a3f6095790c4c2
-- 5e11d962c02d583f38991adc4eec78872ccb23e4
-- e2438b7a321de8050f5db6793599a1668c91ccf5
-
 Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 ---
- Makefile.am  |   30 ++++++++----------------------
+ Makefile.am  |   21 ++++++---------------
  configure.ac |    2 --
- 2 files changed, 8 insertions(+), 24 deletions(-)
+ 2 files changed, 6 insertions(+), 17 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 5b26bc3..799a22f 100644
+index e238cde..02b39ea 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -212,8 +212,8 @@ define move-to-rootlibdir
+@@ -219,8 +219,8 @@ define move-to-rootlibdir
  	if test "$(libdir)" != "$(rootlibdir)"; then \
  		$(MKDIR_P) $(DESTDIR)$(rootlibdir) && \
  		so_img_name=$$(readlink $(DESTDIR)$(libdir)/$$libname) && \
@@ -36,15 +29,7 @@ index 5b26bc3..799a22f 100644
  		mv $(DESTDIR)$(libdir)/$$libname.* $(DESTDIR)$(rootlibdir); \
  	fi
  endef
-@@ -237,6 +237,7 @@ USER_BUSNAMES_TARGET_WANTS =
-
- SYSTEM_UNIT_ALIASES =
- USER_UNIT_ALIASES =
-+
- GENERAL_ALIASES =
-
- install-target-wants-hook:
-@@ -272,9 +273,9 @@ install-aliases-hook:
+@@ -279,9 +279,9 @@ install-aliases-hook:
  	set -- $(SYSTEM_UNIT_ALIASES) && \
  		dir=$(systemunitdir) && $(install-aliases)
  	set -- $(USER_UNIT_ALIASES) && \
@@ -53,13 +38,13 @@ index 5b26bc3..799a22f 100644
  	set -- $(GENERAL_ALIASES) && \
 -		dir= && $(install-relative-aliases)
 +		dir= && $(install-aliases)
-
+ 
  define install-aliases
  	while [ -n "$$1" ]; do \
-@@ -285,15 +286,6 @@ define install-aliases
+@@ -292,15 +292,6 @@ define install-aliases
  	done
  endef
-
+ 
 -define install-relative-aliases
 -	while [ -n "$$1" ]; do \
 -		$(MKDIR_P) `dirname $(DESTDIR)$$dir/$$2` && \
@@ -69,62 +54,40 @@ index 5b26bc3..799a22f 100644
 -	done
 -endef
 -
- INSTALL_EXEC_HOOKS += \
- 	install-target-wants-hook \
- 	install-directories-hook \
-@@ -316,10 +308,6 @@ AM_V_LN = $(AM_V_LN_$(V))
- AM_V_LN_ = $(AM_V_LN_$(AM_DEFAULT_VERBOSITY))
- AM_V_LN_0 = @echo "  LN      " $@;
-
--AM_V_RM = $(AM_V_RM_$(V))
--AM_V_RM_ = $(AM_V_RM_$(AM_DEFAULT_VERBOSITY))
--AM_V_RM_0 = @echo "  RM      " $@;
--
- # ------------------------------------------------------------------------------
- rootbin_PROGRAMS = \
- 	systemctl \
-@@ -1907,8 +1895,7 @@ systemd_dbus1_generator_LDADD = \
-
+ install-touch-usr-hook:
+ 	touch -c $(DESTDIR)/$(prefix)
+ 
+@@ -2034,7 +2025,7 @@ systemd_dbus1_generator_LDADD = \
  dbus1-generator-install-hook:
  	$(AM_V_at)$(MKDIR_P) $(DESTDIR)$(usergeneratordir)
--	$(AM_V_RM)rm -f $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
+ 	$(AM_V_RM)rm -f $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
 -	$(AM_V_LN)$(LN_S) --relative -f $(DESTDIR)$(systemgeneratordir)/systemd-dbus1-generator $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
 +	$(AM_V_LN)$(LN_S) -f $(systemgeneratordir)/systemd-dbus1-generator $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
-
+ 
  dbus1-generator-uninstall-hook:
  	rm -f $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
-@@ -2041,8 +2028,7 @@ systemd_bus_proxyd_LDADD = \
-
+@@ -2188,7 +2179,7 @@ systemd_bus_proxyd_LDADD = \
  bus-proxyd-install-hook:
  	$(AM_V_at)$(MKDIR_P) $(DESTDIR)$(bindir)
--	$(AM_V_RM)rm -f $(DESTDIR)$(bindir)/systemd-stdio-bridge
+ 	$(AM_V_RM)rm -f $(DESTDIR)$(bindir)/systemd-stdio-bridge
 -	$(AM_V_LN)$(LN_S) --relative -f $(DESTDIR)$(rootlibexecdir)/systemd-bus-proxyd $(DESTDIR)$(bindir)/systemd-stdio-bridge
 +	$(AM_V_LN)$(LN_S) -f $(rootlibexecdir)/systemd-bus-proxyd $(DESTDIR)$(bindir)/systemd-stdio-bridge
-
+ 
  bus-proxyd-uninstall-hook:
  	rm -f $(DESTDIR)$(bindir)/systemd-stdio-bridge
-@@ -5102,7 +5088,7 @@ GENERAL_ALIASES += \
- 	$(systemunitdir)/remote-fs.target $(pkgsysconfdir)/system/multi-user.target.wants/remote-fs.target \
- 	$(systemunitdir)/getty at .service $(pkgsysconfdir)/system/getty.target.wants/getty at tty1.service \
- 	$(pkgsysconfdir)/user $(sysconfdir)/xdg/systemd/user \
--	$(dbussystemservicedir)/org.freedesktop.systemd1.service $(dbussessionservicedir)/org.freedesktop.systemd1.service
-+	../system-services/org.freedesktop.systemd1.service $(dbussessionservicedir)/org.freedesktop.systemd1.service
-
- if HAVE_SYSV_COMPAT
- INSTALL_DIRS += \
 diff --git a/configure.ac b/configure.ac
-index 5133c12..7e3938e 100644
+index ae88382..ec220af 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -76,8 +76,6 @@ AC_PATH_PROG([KMOD], [kmod], [/usr/bin/kmod], [$PATH:/usr/sbin:/sbin])
-
+@@ -96,8 +96,6 @@ AC_PATH_PROG([KMOD], [kmod], [/usr/bin/kmod], [$PATH:/usr/sbin:/sbin])
+ 
  AC_PATH_PROG([KEXEC], [kexec], [/usr/sbin/kexec], [$PATH:/usr/sbin:/sbin])
-
+ 
 -AS_IF([! ln --relative --help > /dev/null 2>&1], [AC_MSG_ERROR([*** ln doesn't support --relative ***])])
 -
  M4_DEFINES=
-
+ 
  # gtkdocize greps for '^GTK_DOC_CHECK', so it needs to be on its own line
---
+-- 
 1.7.10.4
 
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e781b30..a5e1bd4 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 214
+SYSTEMD_VERSION = 215
 SYSTEMD_SITE = http://www.freedesktop.org/software/systemd/
 SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
 SYSTEMD_LICENSE = LGPLv2.1+; GPLv2+ for udev; MIT-like license for few source files listed in README
