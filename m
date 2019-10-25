From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 16:00:49 +0200
Subject: [Buildroot] [git commit] package/jitterentropy-library: fix static
 build
Message-ID: <20191025143231.319177FA96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38ca1d4e128a0de5d1ab0c10a891e0cdf7e77daa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/27b19c964c4457dca69639e1913ce44f010853ac

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...2-Makefile-add-additional-install-targets.patch | 56 ++++++++++++++++++++++
 .../jitterentropy-library/jitterentropy-library.mk | 23 +++++++--
 2 files changed, 76 insertions(+), 3 deletions(-)

diff --git a/package/jitterentropy-library/0002-Makefile-add-additional-install-targets.patch b/package/jitterentropy-library/0002-Makefile-add-additional-install-targets.patch
new file mode 100644
index 0000000000..a331c9f33b
--- /dev/null
+++ b/package/jitterentropy-library/0002-Makefile-add-additional-install-targets.patch
@@ -0,0 +1,56 @@
+From d545d76cb3173cc98e1421604929248f2d882821 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 24 Oct 2019 18:48:47 +0200
+Subject: [PATCH] Makefile: add additional install targets
+
+Add install-includes, install-man, install-shared and install-static
+targets to allow the user to configure what must be installed
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://github.com/smuellerDD/jitterentropy-library/pull/11]
+---
+ Makefile | 18 ++++++++++++++----
+ 1 file changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 2e78607..41bc4f7 100644
+--- a/Makefile
++++ b/Makefile
+@@ -57,19 +57,29 @@ scan: $(analyze_plists)
+ cppcheck:
+ 	cppcheck --force -q --enable=performance --enable=warning --enable=portability *.h *.c
+ 
+-install:
++install: install-man install-shared install-includes
++
++install-man:
+ 	install -d -m 0755 $(DESTDIR)$(PREFIX)/share/man/man3
+ 	install -m 644 doc/$(NAME).3 $(DESTDIR)$(PREFIX)/share/man/man3/
+ 	gzip -f -9 $(DESTDIR)$(PREFIX)/share/man/man3/$(NAME).3
++
++install-shared:
+ 	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(LIBDIR)
+ 	$(INSTALL_STRIP) -m 0755 lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/
+-	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(INCDIR)
+-	install -m 0644 jitterentropy.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
+-	install -m 0644 jitterentropy-base-user.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
+ 	$(RM) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so.$(LIBMAJOR)
+ 	ln -sf lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so.$(LIBMAJOR)
+ 	ln -sf lib$(NAME).so.$(LIBMAJOR) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so
+ 
++install-includes:
++	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(INCDIR)
++	install -m 0644 jitterentropy.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
++	install -m 0644 jitterentropy-base-user.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
++
++install-static:
++	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(LIBDIR)
++	install -m 0755 lib$(NAME).a $(DESTDIR)$(PREFIX)/$(LIBDIR)/
++
+ clean:
+ 	@- $(RM) $(NAME)
+ 	@- $(RM) $(OBJS)
+-- 
+2.23.0
+
diff --git a/package/jitterentropy-library/jitterentropy-library.mk b/package/jitterentropy-library/jitterentropy-library.mk
index 7ce52aa9ad..2ea24f83ac 100644
--- a/package/jitterentropy-library/jitterentropy-library.mk
+++ b/package/jitterentropy-library/jitterentropy-library.mk
@@ -9,17 +9,34 @@ JITTERENTROPY_LIBRARY_SITE = $(call github,smuellerDD,$(JITTERENTROPY_LIBRARY_NA
 JITTERENTROPY_LIBRARY_LICENSE = GPL-2.0 or BSD-3-Clause
 JITTERENTROPY_LIBRARY_LICENSE_FILES = COPYING COPYING.bsd COPYING.gplv2
 JITTERENTROPY_LIBRARY_INSTALL_STAGING = YES
+JITTERENTROPY_LIBRARY_INSTALL_TARGETS = install-includes
+
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+JITTERENTROPY_LIBRARY_BUILD_TARGETS += jitterentropy-static
+JITTERENTROPY_LIBRARY_INSTALL_TARGETS += install-static
+endif
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+JITTERENTROPY_LIBRARY_BUILD_TARGETS += jitterentropy
+JITTERENTROPY_LIBRARY_INSTALL_TARGETS += install-shared
+endif
+
 
 define JITTERENTROPY_LIBRARY_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		$(JITTERENTROPY_LIBRARY_BUILD_TARGETS)
 endef
 
 define JITTERENTROPY_LIBRARY_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) INSTALL_STRIP="install" PREFIX=/usr install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) \
+		INSTALL_STRIP="install" PREFIX=/usr \
+		$(JITTERENTROPY_LIBRARY_INSTALL_TARGETS)
 endef
 
 define JITTERENTROPY_LIBRARY_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) INSTALL_STRIP="install" PREFIX=/usr install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
+		INSTALL_STRIP="install" PREFIX=/usr \
+		$(JITTERENTROPY_LIBRARY_INSTALL_TARGETS)
 endef
 
 $(eval $(generic-package))
