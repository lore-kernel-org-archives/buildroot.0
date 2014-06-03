From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed,  4 Jun 2014 00:06:44 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: bump to v213
Message-ID: <1401833204-32300-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps systemd to v213. This new version introduces
systemd-timesyncd, a SNTP daemon, which requires a new user
systemd-timesync to be created.

It also refreshes the patch for reverting the use of --relative option
when calling `ln`. Since this version, the configure script checks if
`ln` supports the --relative option and fails if it does not. Instead of
reverting commit 446883528524429283626208928b51f49f28f810, which affects
configure.ac, the configure script is directly patched to remove this
check (hence avoiding an autoreconf).

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 ...uild-sys-revert-use-of-ln-relative-option.patch | 75 +++++++++++++---------
 package/systemd/systemd.mk                         |  3 +-
 2 files changed, 45 insertions(+), 33 deletions(-)

diff --git a/package/systemd/systemd-02-build-sys-revert-use-of-ln-relative-option.patch b/package/systemd/systemd-02-build-sys-revert-use-of-ln-relative-option.patch
index 003d380..8278dda 100644
--- a/package/systemd/systemd-02-build-sys-revert-use-of-ln-relative-option.patch
+++ b/package/systemd/systemd-02-build-sys-revert-use-of-ln-relative-option.patch
@@ -1,8 +1,3 @@
-From a371e13f4400700d28c1a96767b3b28b0807bb1f Mon Sep 17 00:00:00 2001
-From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Date: Fri, 4 Apr 2014 11:13:23 +0200
-Subject: [PATCH] build-sys: revert use of ln relative option.
-
 Systemd build system now uses the `--relative` option from `ln(1)`.
 This option was added to GNU coreutils 8.16, which is not widely
 deployed yet by GNU/Linux distributions (not available in Debian Wheezy
@@ -14,16 +9,20 @@ This patch reverts the following commits:
 - "build-sys: work around broken ln --relative -s -f"
 - "build-sys: prefer using ln --relative -s where appropriate"
 
+Since v213, the configure script checks if `ln` supports the --relative option
+and fails if it does not. Instead of reverting commit
+446883528524429283626208928b51f49f28f810, which affects configure.ac, the
+configure script is directly patched to remove this check (hence avoiding an
+autoreconf).
+
 Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 ---
- Makefile.am |   30 ++++++++----------------------
- 1 file changed, 8 insertions(+), 22 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 3d9e5c1..acb25c4 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -208,8 +208,8 @@ define move-to-rootlibdir
+
+Index: systemd-213/Makefile.am
+===================================================================
+--- systemd-213.orig/Makefile.am	2014-05-28 03:42:22.808237166 +0200
++++ systemd-213/Makefile.am	2014-06-02 12:52:33.698983315 +0200
+@@ -212,8 +212,8 @@
  	if test "$(libdir)" != "$(rootlibdir)"; then \
  		$(MKDIR_P) $(DESTDIR)$(rootlibdir) && \
  		so_img_name=$$(readlink $(DESTDIR)$(libdir)/$$libname) && \
@@ -34,15 +33,15 @@ index 3d9e5c1..acb25c4 100644
  		mv $(DESTDIR)$(libdir)/$$libname.* $(DESTDIR)$(rootlibdir); \
  	fi
  endef
-@@ -233,6 +233,7 @@ USER_BUSNAMES_TARGET_WANTS =
- 
+@@ -237,6 +237,7 @@
+
  SYSTEM_UNIT_ALIASES =
  USER_UNIT_ALIASES =
 +
  GENERAL_ALIASES =
- 
+
  install-target-wants-hook:
-@@ -268,9 +269,9 @@ install-aliases-hook:
+@@ -272,9 +273,9 @@
  	set -- $(SYSTEM_UNIT_ALIASES) && \
  		dir=$(systemunitdir) && $(install-aliases)
  	set -- $(USER_UNIT_ALIASES) && \
@@ -51,13 +50,13 @@ index 3d9e5c1..acb25c4 100644
  	set -- $(GENERAL_ALIASES) && \
 -		dir= && $(install-relative-aliases)
 +		dir= && $(install-aliases)
- 
+
  define install-aliases
  	while [ -n "$$1" ]; do \
-@@ -281,15 +282,6 @@ define install-aliases
+@@ -285,15 +286,6 @@
  	done
  endef
- 
+
 -define install-relative-aliases
 -	while [ -n "$$1" ]; do \
 -		$(MKDIR_P) `dirname $(DESTDIR)$$dir/$$2` && \
@@ -70,10 +69,10 @@ index 3d9e5c1..acb25c4 100644
  INSTALL_EXEC_HOOKS += \
  	install-target-wants-hook \
  	install-directories-hook \
-@@ -312,10 +304,6 @@ AM_V_LN = $(AM_V_LN_$(V))
+@@ -316,10 +308,6 @@
  AM_V_LN_ = $(AM_V_LN_$(AM_DEFAULT_VERBOSITY))
  AM_V_LN_0 = @echo "  LN      " $@;
- 
+
 -AM_V_RM = $(AM_V_RM_$(V))
 -AM_V_RM_ = $(AM_V_RM_$(AM_DEFAULT_VERBOSITY))
 -AM_V_RM_0 = @echo "  RM      " $@;
@@ -81,35 +80,47 @@ index 3d9e5c1..acb25c4 100644
  # ------------------------------------------------------------------------------
  rootbin_PROGRAMS = \
  	systemctl \
-@@ -1884,8 +1872,7 @@ systemd_dbus1_generator_LDADD = \
- 
+@@ -1907,8 +1895,7 @@
+
  dbus1-generator-install-hook:
  	$(AM_V_at)$(MKDIR_P) $(DESTDIR)$(usergeneratordir)
 -	$(AM_V_RM)rm -f $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
 -	$(AM_V_LN)$(LN_S) --relative -f $(DESTDIR)$(systemgeneratordir)/systemd-dbus1-generator $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
 +	$(AM_V_LN)$(LN_S) -f $(systemgeneratordir)/systemd-dbus1-generator $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
- 
+
  dbus1-generator-uninstall-hook:
  	rm -f $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
-@@ -2017,8 +2004,7 @@ systemd_bus_proxyd_LDADD = \
- 
+@@ -2041,8 +2028,7 @@
+
  bus-proxyd-install-hook:
  	$(AM_V_at)$(MKDIR_P) $(DESTDIR)$(bindir)
 -	$(AM_V_RM)rm -f $(DESTDIR)$(bindir)/systemd-stdio-bridge
 -	$(AM_V_LN)$(LN_S) --relative -f $(DESTDIR)$(rootlibexecdir)/systemd-bus-proxyd $(DESTDIR)$(bindir)/systemd-stdio-bridge
 +	$(AM_V_LN)$(LN_S) -f $(rootlibexecdir)/systemd-bus-proxyd $(DESTDIR)$(bindir)/systemd-stdio-bridge
- 
+
  bus-proxyd-uninstall-hook:
  	rm -f $(DESTDIR)$(bindir)/systemd-stdio-bridge
-@@ -4959,7 +4945,7 @@ GENERAL_ALIASES += \
+@@ -5102,7 +5088,7 @@
  	$(systemunitdir)/remote-fs.target $(pkgsysconfdir)/system/multi-user.target.wants/remote-fs.target \
  	$(systemunitdir)/getty at .service $(pkgsysconfdir)/system/getty.target.wants/getty at tty1.service \
  	$(pkgsysconfdir)/user $(sysconfdir)/xdg/systemd/user \
 -	$(dbussystemservicedir)/org.freedesktop.systemd1.service $(dbussessionservicedir)/org.freedesktop.systemd1.service
 +	../system-services/org.freedesktop.systemd1.service $(dbussessionservicedir)/org.freedesktop.systemd1.service
- 
+
  if HAVE_SYSV_COMPAT
  INSTALL_DIRS += \
--- 
-1.7.9.5
+Index: systemd-213/configure
+===================================================================
+--- systemd-213.orig/configure	2014-05-28 08:49:44.026507777 +0200
++++ systemd-213/configure	2014-06-02 12:53:13.418985237 +0200
+@@ -14000,10 +14000,6 @@
+
+
+
+-if ! ln --relative --help > /dev/null 2>&1; then :
+-  as_fn_error $? "*** ln doesn't support --relative ***" "$LINENO" 5
+-fi
+-
+ M4_DEFINES=
 
+ # gtkdocize greps for '^GTK_DOC_CHECK', so it needs to be on its own line
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e1c984f..375e17f 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 212
+SYSTEMD_VERSION = 213
 SYSTEMD_SITE = http://www.freedesktop.org/software/systemd/
 SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
 SYSTEMD_LICENSE = LGPLv2.1+; GPLv2+ for udev; MIT-like license for few source files listed in README
@@ -130,6 +130,7 @@ SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 define SYSTEMD_USERS
 	systemd-journal -1 systemd-journal -1 * /var/log/journal - - Journal
 	systemd-journal-gateway -1 systemd-journal-gateway -1 * /var/log/journal - - Journal Gateway
+	systemd-timesync -1 systemd-timesync -1 * /var/lib/systemd - - Network Time Synchronization
 endef
 
 $(eval $(autotools-package))
-- 
1.9.3
