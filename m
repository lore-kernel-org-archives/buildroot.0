From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed,  4 Jun 2014 23:40:49 +0200
Subject: [Buildroot] [Patch v2 1/1] systemd: bump to v213
In-Reply-To: <1401918049-10503-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1401918049-10503-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1401918049-10503-2-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps systemd to v213.

This new version introduces systemd-timesyncd, a SNTP daemon. This
feature can be enabled if systemd-networkd is selected via the
configuration menu. It is a simple alternative to ntpd, useful for
machines without a RTC.

The patch for reverting the use of --relative option when calling `ln`
has been refreshed, as the configure script now checks if `ln` supports
the --relative option and fails if it does not.

Another patch for the proper deactivation of gtk-doc has been added.

All these steps now require an autoreconf.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/systemd/Config.in                          | 12 ++++
 ...uild-sys-revert-use-of-ln-relative-option.patch | 73 +++++++++++++---------
 package/systemd/systemd-03-fix-no-gtk-doc.patch    | 23 +++++++
 package/systemd/systemd.mk                         | 14 ++++-
 4 files changed, 92 insertions(+), 30 deletions(-)
 create mode 100644 package/systemd/systemd-03-fix-no-gtk-doc.patch

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 2566533..ce14415 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -93,6 +93,18 @@ config BR2_PACKAGE_SYSTEMD_NETWORKD
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-networkd.html
 
+config BR2_PACKAGE_SYSTEMD_TIMESYNCD
+	bool "enable SNTP client"
+	depends on BR2_PACKAGE_SYSTEMD_NETWORKD
+	help
+	  systemd-timesyncd is a service that may be used to synchronize the
+	  local system clock with a Network Time Protocol Server.
+
+	  This simple NTP solution is an alternative to sntp/ntpd from the ntp
+	  package.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-timesyncd.html
+
 config BR2_PACKAGE_SYSTEMD_COMPAT
 	bool "enable compatibility libraries"
 	help
diff --git a/package/systemd/systemd-02-build-sys-revert-use-of-ln-relative-option.patch b/package/systemd/systemd-02-build-sys-revert-use-of-ln-relative-option.patch
index 003d380..140c55c 100644
--- a/package/systemd/systemd-02-build-sys-revert-use-of-ln-relative-option.patch
+++ b/package/systemd/systemd-02-build-sys-revert-use-of-ln-relative-option.patch
@@ -1,7 +1,7 @@
-From a371e13f4400700d28c1a96767b3b28b0807bb1f Mon Sep 17 00:00:00 2001
+From d42cb9692f145d439b836f61a0b7f551a87d3484 Mon Sep 17 00:00:00 2001
 From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Date: Fri, 4 Apr 2014 11:13:23 +0200
-Subject: [PATCH] build-sys: revert use of ln relative option.
+Date: Mon, 2 Jun 2014 12:25:58 +0200
+Subject: [PATCH 1/1] build-sys: revert use of ln relative option.
 
 Systemd build system now uses the `--relative` option from `ln(1)`.
 This option was added to GNU coreutils 8.16, which is not widely
@@ -10,20 +10,22 @@ for example).
 
 This patch reverts the following commits:
 
-- "build-sys: Fix move-to-rootlibdir"
-- "build-sys: work around broken ln --relative -s -f"
-- "build-sys: prefer using ln --relative -s where appropriate"
+- 446883528524429283626208928b51f49f28f810
+- 0ce91e4e3ba60d5c87307c1be4a3f6095790c4c2
+- 5e11d962c02d583f38991adc4eec78872ccb23e4
+- e2438b7a321de8050f5db6793599a1668c91ccf5
 
 Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 ---
- Makefile.am |   30 ++++++++----------------------
- 1 file changed, 8 insertions(+), 22 deletions(-)
+ Makefile.am  |   30 ++++++++----------------------
+ configure.ac |    2 --
+ 2 files changed, 8 insertions(+), 24 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 3d9e5c1..acb25c4 100644
+index 5b26bc3..799a22f 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -208,8 +208,8 @@ define move-to-rootlibdir
+@@ -212,8 +212,8 @@ define move-to-rootlibdir
  	if test "$(libdir)" != "$(rootlibdir)"; then \
  		$(MKDIR_P) $(DESTDIR)$(rootlibdir) && \
  		so_img_name=$$(readlink $(DESTDIR)$(libdir)/$$libname) && \
@@ -34,15 +36,15 @@ index 3d9e5c1..acb25c4 100644
  		mv $(DESTDIR)$(libdir)/$$libname.* $(DESTDIR)$(rootlibdir); \
  	fi
  endef
-@@ -233,6 +233,7 @@ USER_BUSNAMES_TARGET_WANTS =
- 
+@@ -237,6 +237,7 @@ USER_BUSNAMES_TARGET_WANTS =
+
  SYSTEM_UNIT_ALIASES =
  USER_UNIT_ALIASES =
 +
  GENERAL_ALIASES =
- 
+
  install-target-wants-hook:
-@@ -268,9 +269,9 @@ install-aliases-hook:
+@@ -272,9 +273,9 @@ install-aliases-hook:
  	set -- $(SYSTEM_UNIT_ALIASES) && \
  		dir=$(systemunitdir) && $(install-aliases)
  	set -- $(USER_UNIT_ALIASES) && \
@@ -51,13 +53,13 @@ index 3d9e5c1..acb25c4 100644
  	set -- $(GENERAL_ALIASES) && \
 -		dir= && $(install-relative-aliases)
 +		dir= && $(install-aliases)
- 
+
  define install-aliases
  	while [ -n "$$1" ]; do \
-@@ -281,15 +282,6 @@ define install-aliases
+@@ -285,15 +286,6 @@ define install-aliases
  	done
  endef
- 
+
 -define install-relative-aliases
 -	while [ -n "$$1" ]; do \
 -		$(MKDIR_P) `dirname $(DESTDIR)$$dir/$$2` && \
@@ -70,10 +72,10 @@ index 3d9e5c1..acb25c4 100644
  INSTALL_EXEC_HOOKS += \
  	install-target-wants-hook \
  	install-directories-hook \
-@@ -312,10 +304,6 @@ AM_V_LN = $(AM_V_LN_$(V))
+@@ -316,10 +308,6 @@ AM_V_LN = $(AM_V_LN_$(V))
  AM_V_LN_ = $(AM_V_LN_$(AM_DEFAULT_VERBOSITY))
  AM_V_LN_0 = @echo "  LN      " $@;
- 
+
 -AM_V_RM = $(AM_V_RM_$(V))
 -AM_V_RM_ = $(AM_V_RM_$(AM_DEFAULT_VERBOSITY))
 -AM_V_RM_0 = @echo "  RM      " $@;
@@ -81,35 +83,48 @@ index 3d9e5c1..acb25c4 100644
  # ------------------------------------------------------------------------------
  rootbin_PROGRAMS = \
  	systemctl \
-@@ -1884,8 +1872,7 @@ systemd_dbus1_generator_LDADD = \
- 
+@@ -1907,8 +1895,7 @@ systemd_dbus1_generator_LDADD = \
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
+@@ -2041,8 +2028,7 @@ systemd_bus_proxyd_LDADD = \
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
+@@ -5102,7 +5088,7 @@ GENERAL_ALIASES += \
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
+diff --git a/configure.ac b/configure.ac
+index 5133c12..7e3938e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -76,8 +76,6 @@ AC_PATH_PROG([KMOD], [kmod], [/usr/bin/kmod], [$PATH:/usr/sbin:/sbin])
+
+ AC_PATH_PROG([KEXEC], [kexec], [/usr/sbin/kexec], [$PATH:/usr/sbin:/sbin])
+
+-AS_IF([! ln --relative --help > /dev/null 2>&1], [AC_MSG_ERROR([*** ln doesn't support --relative ***])])
+-
+ M4_DEFINES=
+
+ # gtkdocize greps for '^GTK_DOC_CHECK', so it needs to be on its own line
+--
+1.7.10.4
 
diff --git a/package/systemd/systemd-03-fix-no-gtk-doc.patch b/package/systemd/systemd-03-fix-no-gtk-doc.patch
new file mode 100644
index 0000000..dc236a7
--- /dev/null
+++ b/package/systemd/systemd-03-fix-no-gtk-doc.patch
@@ -0,0 +1,23 @@
+Fix deactivation of gtk-doc
+
+The tarball contains the Makefile for building documentation with gtk-doc,
+Unfortunately the AM_CONDITIONAL variable is not the correct one, which
+results in an error when running autoreconf.
+
+This patch fixes this issue.
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+---
+Index: systemd-213/docs/gtk-doc.make
+===================================================================
+--- systemd-213.orig/docs/gtk-doc.make	2014-02-14 09:27:47.000000000 +0100
++++ systemd-213/docs/gtk-doc.make	2014-06-04 15:20:11.976845074 +0200
+@@ -267,7 +267,7 @@
+ #
+ # Require gtk-doc when making dist
+ #
+-if HAVE_GTK_DOC
++if ENABLE_GTK_DOC
+ dist-check-gtkdoc: docs
+ else
+ dist-check-gtkdoc:
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e1c984f..ca51ddf 100644
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
@@ -18,6 +18,7 @@ SYSTEMD_DEPENDENCIES = \
 	host-gperf
 
 SYSTEMD_PROVIDES = udev
+SYSTEMD_AUTORECONF = YES
 
 # Make sure that systemd will always be built after busybox so that we have
 # a consistent init setup between two builds
@@ -34,6 +35,7 @@ SYSTEMD_CONF_OPT += \
 	--disable-selinux \
 	--disable-pam \
 	--disable-libcryptsetup \
+	--disable-gtk-doc \
 	--with-dbuspolicydir=/etc/dbus-1/system.d \
 	--with-dbussessionservicedir=/usr/share/dbus-1/services \
 	--with-dbussystemservicedir=/usr/share/dbus-1/system-services \
@@ -94,6 +96,15 @@ else
 SYSTEMD_CONF_OPT += --disable-networkd
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
+SYSTEMD_CONF_OPT += --enable-timesyncd
+define SYSTEMD_USER_TIMESYNC
+	systemd-timesync -1 systemd-timesync -1 * - - - Network Time Synchronization
+endef
+else
+SYSTEMD_CONF_OPT += --disable-timesyncd
+endif
+
 # mq_getattr needs -lrt
 SYSTEMD_MAKE_OPT += LIBS=-lrt
 SYSTEMD_MAKE_OPT += LDFLAGS+=-ldl
@@ -130,6 +141,7 @@ SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 define SYSTEMD_USERS
 	systemd-journal -1 systemd-journal -1 * /var/log/journal - - Journal
 	systemd-journal-gateway -1 systemd-journal-gateway -1 * /var/log/journal - - Journal Gateway
+	$(SYSTEMD_USER_TIMESYNC)
 endef
 
 $(eval $(autotools-package))
-- 
1.9.3
