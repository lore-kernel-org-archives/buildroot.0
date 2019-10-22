From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 20:37:49 +0200
Subject: [Buildroot] [git commit] package/jitterentropy-library: new package
Message-ID: <20191022183149.2B21483AF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99daf7831a4bd567fbceaa849cbfc00f94a897cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

New library to support rng-tools using a CPU source as a backup entropy
source when a kernel provided rng isn't present.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-Makefile-cleanup-install.patch            | 55 ++++++++++++++++++++++
 package/jitterentropy-library/Config.in            |  6 +++
 .../jitterentropy-library.hash                     |  5 ++
 .../jitterentropy-library/jitterentropy-library.mk | 25 ++++++++++
 6 files changed, 93 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index db7d81fa86..531328ca20 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1542,6 +1542,7 @@ F:	package/iperf/
 F:	package/iperf3/
 F:	package/iputils/
 F:	package/iw/
+F:	package/jitterentropy-library/
 F:	package/kvm-unit-tests/
 F:	package/kvmtool/
 F:	package/libcsv/
diff --git a/package/Config.in b/package/Config.in
index d4cfd50a4b..467c5861d5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1401,6 +1401,7 @@ menu "Hardware handling"
 	source "package/gnu-efi/Config.in"
 	source "package/hackrf/Config.in"
 	source "package/hidapi/Config.in"
+	source "package/jitterentropy-library/Config.in"
 	source "package/lcdapi/Config.in"
 	source "package/let-me-create/Config.in"
 	source "package/libaio/Config.in"
diff --git a/package/jitterentropy-library/0001-Makefile-cleanup-install.patch b/package/jitterentropy-library/0001-Makefile-cleanup-install.patch
new file mode 100644
index 0000000000..7d209008c9
--- /dev/null
+++ b/package/jitterentropy-library/0001-Makefile-cleanup-install.patch
@@ -0,0 +1,55 @@
+From 83b1d46ae48eed576cf3dff0ffd7e772c8e638e4 Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Mon, 9 Sep 2019 20:42:14 -0500
+Subject: [PATCH] Makefile: cleanup install
+
+Support the ability to rebuild and redeploy without a clean. This
+required some force linking and forced man archive creation.
+
+Provide the ability to override the stripping of the shared lib for
+cases where a embedded target build may want to control stripping
+or provide cross arch tools.
+
+Upstream: https://github.com/smuellerDD/jitterentropy-library/pull/10
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ Makefile | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 5e31276..a575f32 100644
+--- a/Makefile
++++ b/Makefile
+@@ -14,6 +14,8 @@ LIBDIR := lib
+ # include target directory
+ INCDIR := include
+ 
++INSTALL_STRIP ?= install -s
++
+ NAME := jitterentropy
+ LIBMAJOR=$(shell cat jitterentropy-base.c | grep define | grep MAJVERSION | awk '{print $$3}')
+ LIBMINOR=$(shell cat jitterentropy-base.c | grep define | grep MINVERSION | awk '{print $$3}')
+@@ -49,14 +51,15 @@ scan:	$(OBJS)
+ install:
+ 	install -d -m 0755 $(DESTDIR)$(PREFIX)/share/man/man3
+ 	install -m 644 doc/$(NAME).3 $(DESTDIR)$(PREFIX)/share/man/man3/
+-	gzip -9 $(DESTDIR)$(PREFIX)/share/man/man3/$(NAME).3
++	gzip -f -9 $(DESTDIR)$(PREFIX)/share/man/man3/$(NAME).3
+ 	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(LIBDIR)
+-	install -m 0755 -s lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/
++	$(INSTALL_STRIP) -m 0755 lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/
++	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(INCDIR)
+ 	install -m 0644 jitterentropy.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
+ 	install -m 0644 jitterentropy-base-user.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
+ 	$(RM) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so.$(LIBMAJOR)
+-	ln -s lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so.$(LIBMAJOR)
+-	ln -s lib$(NAME).so.$(LIBMAJOR) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so
++	ln -sf lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so.$(LIBMAJOR)
++	ln -sf lib$(NAME).so.$(LIBMAJOR) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so
+ 
+ clean:
+ 	@- $(RM) $(NAME)
+-- 
+2.17.1
+
diff --git a/package/jitterentropy-library/Config.in b/package/jitterentropy-library/Config.in
new file mode 100644
index 0000000000..02f8ff6164
--- /dev/null
+++ b/package/jitterentropy-library/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_JITTERENTROPY_LIBRARY
+	bool "libjitterentropy"
+	help
+	  Hardware RNG based on CPU timing jitter.
+
+	  https://github.com/smuellerDD/jitterentropy-library
diff --git a/package/jitterentropy-library/jitterentropy-library.hash b/package/jitterentropy-library/jitterentropy-library.hash
new file mode 100644
index 0000000000..5846f2147d
--- /dev/null
+++ b/package/jitterentropy-library/jitterentropy-library.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256	38519115c6b750b7fa15547826123a7821b271535c168823259e609b42847223  jitterentropy-library-2.1.2.tar.gz
+sha256	c3352794eff829a3c8097b77e4cbc9f1faf5c3f47a8abed960a0f411cbc6ab9f  COPYING
+sha256	13aa749a5b0a454917a944ed8fffc530b784f5ead522b1aacaf4ec8aa55a6239  COPYING.bsd
+sha256	e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING.gplv2
diff --git a/package/jitterentropy-library/jitterentropy-library.mk b/package/jitterentropy-library/jitterentropy-library.mk
new file mode 100644
index 0000000000..4e791e19dd
--- /dev/null
+++ b/package/jitterentropy-library/jitterentropy-library.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# jitterentropy-library
+#
+################################################################################
+
+JITTERENTROPY_LIBRARY_VERSION = 2.1.2
+JITTERENTROPY_LIBRARY_SITE = $(call github,smuellerDD,$(JITTERENTROPY_LIBRARY_NAME),v$(JITTERENTROPY_LIBRARY_VERSION))
+JITTERENTROPY_LIBRARY_LICENSE = GPL-2.0 or BSD-3-Clause
+JITTERENTROPY_LIBRARY_LICENSE_FILES = COPYING COPYING.bsd COPYING.gplv2
+JITTERENTROPY_LIBRARY_INSTALL_STAGING = YES
+
+define JITTERENTROPY_LIBRARY_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+endef
+
+define JITTERENTROPY_LIBRARY_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) INSTALL_STRIP="install" PREFIX=/usr install
+endef
+
+define JITTERENTROPY_LIBRARY_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) INSTALL_STRIP="install" PREFIX=/usr install
+endef
+
+$(eval $(generic-package))
