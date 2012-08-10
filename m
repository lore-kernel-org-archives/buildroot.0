From: Dmitry <golubovsky@gmail.com>
Date: Thu,  9 Aug 2012 23:32:55 -0400
Subject: [Buildroot] [PATCH] Add package linux-pam
Message-ID: <1344569575-25960-1-git-send-email-golubovsky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dmitry <golubovsky@gmail.com>
---
 package/Config.in                                 |    1 +
 package/linux-pam/Config.in                       |   15 ++++++++++++
 package/linux-pam/linux-pam-configure.patch       |   11 +++++++++
 package/linux-pam/linux-pam-doc-makefile-am.patch |   25 +++++++++++++++++++++
 package/linux-pam/linux-pam-group.patch           |   18 +++++++++++++++
 package/linux-pam/linux-pam-rhosts.patch          |   16 +++++++++++++
 package/linux-pam/linux-pam-succeed.patch         |   23 +++++++++++++++++++
 package/linux-pam/linux-pam-time.patch            |   18 +++++++++++++++
 package/linux-pam/linux-pam.mk                    |   21 +++++++++++++++++
 9 files changed, 148 insertions(+), 0 deletions(-)
 create mode 100644 package/linux-pam/Config.in
 create mode 100644 package/linux-pam/linux-pam-configure.patch
 create mode 100644 package/linux-pam/linux-pam-doc-makefile-am.patch
 create mode 100644 package/linux-pam/linux-pam-group.patch
 create mode 100644 package/linux-pam/linux-pam-rhosts.patch
 create mode 100644 package/linux-pam/linux-pam-succeed.patch
 create mode 100644 package/linux-pam/linux-pam-time.patch
 create mode 100644 package/linux-pam/linux-pam.mk

diff --git a/package/Config.in b/package/Config.in
index f308de7..28bca5f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -460,6 +460,7 @@ source "package/libnspr/Config.in"
 source "package/libsigc/Config.in"
 source "package/libtpl/Config.in"
 source "package/liburcu/Config.in"
+source "package/linux-pam/Config.in"
 source "package/lttng-libust/Config.in"
 source "package/orc/Config.in"
 source "package/poco/Config.in"
diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
new file mode 100644
index 0000000..722b875
--- /dev/null
+++ b/package/linux-pam/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LINUX_PAM
+	bool "linux-pam"
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_FLEX
+	select BR2_PACKAGE_FLEX_LIBFL
+	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
+	help
+	  A Security Framework that Provides Authentication for Applications
+
+	  http://linux-pam.org
+
+comment "linux-pam requires a toolchain with WCHAR and locale support"
+	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
+
diff --git a/package/linux-pam/linux-pam-configure.patch b/package/linux-pam/linux-pam-configure.patch
new file mode 100644
index 0000000..26b3d4e
--- /dev/null
+++ b/package/linux-pam/linux-pam-configure.patch
@@ -0,0 +1,11 @@
+--- linux-pam-1.1.4/configure.in	2011-06-24 06:46:33.000000000 -0400
++++ linux-pam-1.1.4/configure.in	2012-08-09 21:14:11.000000000 -0400
+@@ -522,7 +522,7 @@
+ AC_CHECK_FUNCS(strcspn strdup strspn strstr strtol uname)
+ AC_CHECK_FUNCS(getutent_r getpwnam_r getpwuid_r getgrnam_r getgrgid_r getspnam_r)
+ AC_CHECK_FUNCS(getgrouplist getline getdelim)
+-AC_CHECK_FUNCS(inet_ntop inet_pton innetgr ruserok_af)
++AC_CHECK_FUNCS(inet_ntop inet_pton innetgr ruserok_af ruserok)
+ 
+ AC_CHECK_FUNCS(unshare, [UNSHARE=yes], [UNSHARE=no])
+ AM_CONDITIONAL([HAVE_UNSHARE], [test "$UNSHARE" = yes])
diff --git a/package/linux-pam/linux-pam-doc-makefile-am.patch b/package/linux-pam/linux-pam-doc-makefile-am.patch
new file mode 100644
index 0000000..b0f367a
--- /dev/null
+++ b/package/linux-pam/linux-pam-doc-makefile-am.patch
@@ -0,0 +1,25 @@
+--- linux-pam-1.1.4/doc/Makefile.am	2011-06-21 05:04:56.000000000 -0400
++++ linux-pam-1.1.4/doc/Makefile.am	2012-08-09 05:59:23.000000000 -0400
+@@ -2,8 +2,6 @@
+ # Copyright (c) 2005, 2006 Thorsten Kukuk <kukuk@suse.de>
+ #
+ 
+-SUBDIRS = man specs sag adg mwg
+-
+ CLEANFILES = *~
+ 
+ dist_html_DATA = index.html
+@@ -11,12 +9,4 @@
+ #######################################################
+ 
+ releasedocs: all
+-	$(mkinstalldirs) $(top_builddir)/Linux-PAM-$(VERSION)/doc/specs
+-	cp -av specs/draft-morgan-pam-current.txt \
+-		$(top_builddir)/Linux-PAM-$(VERSION)/doc/specs/
+-	cp -av $(srcdir)/specs/rfc86.0.txt \
+-		$(top_builddir)/Linux-PAM-$(VERSION)/doc/specs/
+-	make -C sag releasedocs
+-	make -C adg releasedocs
+-	make -C mwg releasedocs
+-	
++	/bin/true
diff --git a/package/linux-pam/linux-pam-group.patch b/package/linux-pam/linux-pam-group.patch
new file mode 100644
index 0000000..8d57adc
--- /dev/null
+++ b/package/linux-pam/linux-pam-group.patch
@@ -0,0 +1,18 @@
+--- linux-pam-1.1.4/modules/pam_group/pam_group.c	2011-06-21 05:04:56.000000000 -0400
++++ linux-pam-1.1.4/modules/pam_group/pam_group.c	2012-08-09 21:35:06.000000000 -0400
+@@ -655,8 +655,14 @@
+ 	    continue;
+ 	}
+ 	/* If buffer starts with @, we are using netgroups */
+-	if (buffer[0] == '@')
++	if (buffer[0] == '@') {
++#ifdef HAVE_INNETGR
+ 	  good &= innetgr (&buffer[1], NULL, user, NULL);
++#else
++	  good = 0;
++	  pam_syslog (pamh, LOG_ERR, "pam_group does not have netgroup support");
++#endif  /* HAVE_INNETGR */
++	}
+ 	/* otherwise, if the buffer starts with %, it's a UNIX group */
+ 	else if (buffer[0] == '%')
+           good &= pam_modutil_user_in_group_nam_nam(pamh, user, &buffer[1]);
diff --git a/package/linux-pam/linux-pam-rhosts.patch b/package/linux-pam/linux-pam-rhosts.patch
new file mode 100644
index 0000000..fbe633f
--- /dev/null
+++ b/package/linux-pam/linux-pam-rhosts.patch
@@ -0,0 +1,16 @@
+--- linux-pam-1.1.4/modules/pam_rhosts/pam_rhosts.c	2011-06-21 05:04:56.000000000 -0400
++++ linux-pam-1.1.4/modules/pam_rhosts/pam_rhosts.c	2012-08-09 21:19:34.000000000 -0400
+@@ -114,8 +114,12 @@
+ #ifdef HAVE_RUSEROK_AF
+     retval = ruserok_af (rhost, as_root, ruser, luser, PF_UNSPEC);
+ #else
++  #ifdef HAVE_RUSEROK
+     retval = ruserok (rhost, as_root, ruser, luser);
+-#endif
++  #else
++    retval = -1;
++  #endif  /* HAVE_RUSEROK */
++#endif  /*HAVE_RUSEROK_AF */
+     if (retval != 0) {
+       if (!opt_silent || opt_debug)
+ 	pam_syslog(pamh, LOG_WARNING, "denied access to %s@%s as %s",
diff --git a/package/linux-pam/linux-pam-succeed.patch b/package/linux-pam/linux-pam-succeed.patch
new file mode 100644
index 0000000..5a49f46
--- /dev/null
+++ b/package/linux-pam/linux-pam-succeed.patch
@@ -0,0 +1,23 @@
+--- linux-pam-1.1.4/modules/pam_succeed_if/pam_succeed_if.c	2011-06-21 05:04:56.000000000 -0400
++++ linux-pam-1.1.4/modules/pam_succeed_if/pam_succeed_if.c	2012-08-09 21:05:02.000000000 -0400
+@@ -233,16 +233,20 @@
+ static int
+ evaluate_innetgr(const char *host, const char *user, const char *group)
+ {
++#ifdef HAVE_INNETGR
+ 	if (innetgr(group, host, user, NULL) == 1)
+ 		return PAM_SUCCESS;
++#endif /* HAVE_INNETGR */
+ 	return PAM_AUTH_ERR;
+ }
+ /* Return PAM_SUCCESS if the (host,user) is NOT in the netgroup. */
+ static int
+ evaluate_notinnetgr(const char *host, const char *user, const char *group)
+ {
++#ifdef HAVE_INNETGR
+ 	if (innetgr(group, host, user, NULL) == 0)
+ 		return PAM_SUCCESS;
++#endif /* HAVE_INNETGR */
+ 	return PAM_AUTH_ERR;
+ }
+ 
diff --git a/package/linux-pam/linux-pam-time.patch b/package/linux-pam/linux-pam-time.patch
new file mode 100644
index 0000000..463ec3d
--- /dev/null
+++ b/package/linux-pam/linux-pam-time.patch
@@ -0,0 +1,18 @@
+--- linux-pam-1.1.4/modules/pam_time/pam_time.c	2011-06-21 05:04:56.000000000 -0400
++++ linux-pam-1.1.4/modules/pam_time/pam_time.c	2012-08-09 21:02:29.000000000 -0400
+@@ -554,8 +554,14 @@
+ 	       continue;
+ 	  }
+ 	  /* If buffer starts with @, we are using netgroups */
+-	  if (buffer[0] == '@')
++	  if (buffer[0] == '@') {
++#ifdef HAVE_INNETGR
+ 	    good &= innetgr (&buffer[1], NULL, user, NULL);
++#else
++	    good = 0;
++	    pam_syslog (pamh, LOG_ERR, "pam_time does not have netgroup support");
++#endif /* HAVE_INNETGR */
++	  }
+ 	  else
+ 	    good &= logic_field(pamh, user, buffer, count, is_same);
+ 	  D(("with user: %s", good ? "passes":"fails" ));
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
new file mode 100644
index 0000000..1b98d0a
--- /dev/null
+++ b/package/linux-pam/linux-pam.mk
@@ -0,0 +1,21 @@
+############################################
+#
+# linux-pam
+# 
+############################################
+
+LINUX_PAM_VERSION = 1.1.4
+LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.bz2
+LINUX_PAM_SITE = http://linux-pam.org/library/
+LINUX_PAM_INSTALL_STAGING = YES
+LINUX_PAM_INSTALL_TARGET = YES
+LINUX_PAM_CONF_OPT = --disable-prelude --disable-isadir --disable-nis --disable-regenerate-docu
+LINUX_PAM_CONF_OPT += --enable-securedir=/lib/security --libdir=/lib
+LINUX_PAM_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) libintl flex
+LINUX_PAM_AUTORECONF = YES
+
+define LINUX_PAM_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC) -lintl -lfl" LD="$(TARGET_LD)" -C $(@D) all
+endef
+
+$(eval $(autotools-package))
-- 
1.7.2.5
