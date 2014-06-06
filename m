From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 6 Jun 2014 14:44:25 +0100
Subject: [Buildroot] [PATCH 1/5] pth: new package
In-Reply-To: <1402062269-57018-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1402062269-57018-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1402062269-57018-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
---
 package/Config.in                               |    1 +
 package/pth/Config.in                           |   10 +++
 package/pth/pth-001-disable-documentation.patch |   74 +++++++++++++++++++++++
 package/pth/pth.mk                              |   28 +++++++++
 4 files changed, 113 insertions(+), 0 deletions(-)
 create mode 100644 package/pth/Config.in
 create mode 100644 package/pth/pth-001-disable-documentation.patch
 create mode 100644 package/pth/pth.mk

diff --git a/package/Config.in b/package/Config.in
index 1706197..14508ae 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -829,6 +829,7 @@ source "package/p11-kit/Config.in"
 source "package/poco/Config.in"
 source "package/protobuf/Config.in"
 source "package/protobuf-c/Config.in"
+source "package/pth/Config.in"
 source "package/qhull/Config.in"
 source "package/schifra/Config.in"
 source "package/startup-notification/Config.in"
diff --git a/package/pth/Config.in b/package/pth/Config.in
new file mode 100644
index 0000000..54bb34c
--- /dev/null
+++ b/package/pth/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PTH
+	bool "pth"
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	help
+	  GNU Pth - The GNU Portable Threads
+
+	  http://www.gnu.org/software/pth/
+
+comment "pth doesn't work with uClibc"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/pth/pth-001-disable-documentation.patch b/package/pth/pth-001-disable-documentation.patch
new file mode 100644
index 0000000..b9f9500
--- /dev/null
+++ b/package/pth/pth-001-disable-documentation.patch
@@ -0,0 +1,74 @@
+--- pth-2.0.7/Makefile.in.orig	2014-06-05 14:49:36.860173486 +0100
++++ pth-2.0.7/Makefile.in	2014-06-05 14:54:51.662441551 +0100
+@@ -174,24 +174,6 @@ libpthread.la: pthread.lo $(LOBJS)
+ 	$(LIBTOOL) --mode=link --quiet $(CC) -o libpthread.la pthread.lo $(LOBJS) \
+ 	-rpath $(libdir) -version-info `$(SHTOOL) version -lc -dlibtool $(_VERSION_FILE)`
+ 
+-#   build the manual pages
+-$(S)pth-config.1: $(S)pth-config.pod $(_VERSION_FILE)
+-	@BASENAME="pth-config"; SEC=1; \
+-	NAME="GNU Pth"; ONELINE="GNU Portable Threads"; \
+-	$(_MANPAGE)
+-$(S)pth.3: $(S)pth.pod $(_VERSION_FILE)
+-	@BASENAME="pth"; SEC=3; \
+-	NAME="GNU Pth"; ONELINE="GNU Portable Threads"; \
+-	$(_MANPAGE)
+-$(S)pthread-config.1: $(S)pthread-config.pod $(_VERSION_FILE)
+-	@BASENAME="pthread-config"; SEC=1; \
+-	NAME="GNU Pth"; ONELINE="POSIX Threading API of GNU Pth"; \
+-	$(_MANPAGE)
+-$(S)pthread.3: $(S)pthread.pod $(_VERSION_FILE)
+-	@BASENAME="pthread"; SEC=3; \
+-	NAME="GNU Pth"; ONELINE="POSIX Threading API of GNU Pth"; \
+-	$(_MANPAGE)
+-
+ #   build test program
+ test_std: test_std.o test_common.o libpth.la
+ 	$(LIBTOOL) --mode=link --quiet $(CC) $(LDFLAGS) -o test_std test_std.o test_common.o libpth.la $(LIBS)
+@@ -224,22 +206,16 @@ install-dirs:
+ 	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(bindir)
+ 	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(includedir)
+ 	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(libdir)
+-	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(mandir)/man1
+-	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(mandir)/man3
+ 	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(datadir)/aclocal
+ install-pth:
+ 	$(SHTOOL) install -c -m 755 pth-config $(DESTDIR)$(bindir)/pth-config
+-	$(SHTOOL) install -c -m 644 $(S)pth-config.1 $(DESTDIR)$(mandir)/man1/pth-config.1
+-	$(SHTOOL) install -c -m 644 $(S)pth.3 $(DESTDIR)$(mandir)/man3/pth.3
+ 	$(SHTOOL) install -c -m 644 $(S)pth.m4 $(DESTDIR)$(datadir)/aclocal/pth.m4
+ 	$(SHTOOL) install -c -m 644 pth.h $(DESTDIR)$(includedir)/pth.h
+ 	@umask 022; $(LIBTOOL) --mode=install \
+ 	$(SHTOOL) install -c libpth.la $(DESTDIR)$(libdir)/libpth.la
+ install-pthread:
+ 	$(SHTOOL) install -c -m 755 pthread-config $(DESTDIR)$(bindir)/pthread-config
+-	$(SHTOOL) install -c -m 644 $(S)pthread-config.1 $(DESTDIR)$(mandir)/man1/pthread-config.1
+ 	$(SHTOOL) install -c -m 644 pthread.h $(DESTDIR)$(includedir)/pthread.h
+-	$(SHTOOL) install -c -m 644 $(S)pthread.3 $(DESTDIR)$(mandir)/man3/pthread.3
+ 	@umask 022; $(LIBTOOL) --mode=install \
+ 	$(SHTOOL) install -c libpthread.la $(DESTDIR)$(libdir)/libpthread.la
+ 
+@@ -250,23 +226,16 @@ uninstall:
+ 	@$(MAKE) $(MKFLAGS) what-next
+ uninstall-pthread:
+ 	$(RM) $(DESTDIR)$(bindir)/pthread-config
+-	$(RM) $(DESTDIR)$(mandir)/man1/pthread-config.1
+ 	$(RM) $(DESTDIR)$(includedir)/pthread.h
+-	$(RM) $(DESTDIR)$(mandir)/man3/pthread.3
+ 	@$(LIBTOOL) --mode=uninstall $(RM) $(DESTDIR)$(libdir)/libpthread.la
+ uninstall-pth:
+ 	$(RM) $(DESTDIR)$(bindir)/pth-config
+-	$(RM) $(DESTDIR)$(mandir)/man1/pth-config.1
+-	$(RM) $(DESTDIR)$(mandir)/man3/pth.3
+ 	$(RM) $(DESTDIR)$(datadir)/aclocal/pth.m4
+ 	$(RM) $(DESTDIR)$(includedir)/pth.h
+ 	@$(LIBTOOL) --mode=uninstall $(RM) $(DESTDIR)$(libdir)/libpth.la
+ uninstall-dirs:
+ 	-$(RMDIR) $(DESTDIR)$(datadir)/aclocal >/dev/null 2>&1 || $(TRUE)
+ 	-$(RMDIR) $(DESTDIR)$(datadir) >/dev/null 2>&1 || $(TRUE)
+-	-$(RMDIR) $(DESTDIR)$(mandir)/man1 >/dev/null 2>&1 || $(TRUE)
+-	-$(RMDIR) $(DESTDIR)$(mandir)/man3 >/dev/null 2>&1 || $(TRUE)
+-	-$(RMDIR) $(DESTDIR)$(mandir) >/dev/null 2>&1 || $(TRUE)
+ 	-$(RMDIR) $(DESTDIR)$(libdir) >/dev/null 2>&1 || $(TRUE)
+ 	-$(RMDIR) $(DESTDIR)$(includedir) >/dev/null 2>&1 || $(TRUE)
+ 	-$(RMDIR) $(DESTDIR)$(bindir) >/dev/null 2>&1 || $(TRUE)
diff --git a/package/pth/pth.mk b/package/pth/pth.mk
new file mode 100644
index 0000000..5768f12
--- /dev/null
+++ b/package/pth/pth.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# pth
+#
+################################################################################
+
+PTH_VERSION = 2.0.7
+PTH_SOURCE = pth-$(PTH_VERSION).tar.gz
+PTH_SITE = ftp://ftp.gnu.org/gnu/pth
+PTH_LICENSE = LGPL
+PTH_LICENSE_FILES = COPYING
+PTH_CONFIG_SCRIPTS = pth-config
+PTH_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+PTH_CONFIG_OPT = --enable-static
+else
+PTH_CONFIG_OPT = --disable-static
+endif
+
+# This hooks fixes a race condition in the Makefile.
+# It allows you to run make with multiple jobs.
+define PTH_FIX_SMP_BUILD
+	cd $(@D) && sed -i 's#$(LOBJS): Makefile#$(LOBJS): pth_p.h Makefile#' Makefile.in
+endef
+PTH_PRE_CONFIGURE_HOOKS += PTH_FIX_SMP_BUILD
+
+$(eval $(autotools-package))
-- 
1.7.1
