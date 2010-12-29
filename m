From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 Dec 2010 09:22:01 +0100
Subject: [Buildroot] [git commit master 1/1] libcap: fix target install
Message-ID: <20101229082225.CA9CF8EE5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0c4cf012fa0a772546971625204caa13840ffa9d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

/usr/lib/libcap.so.* was installed via "install -D" but libcap.so.2 is
a symlink so it was dereferenced.

Also update the buildsystem patch so that the shared lib is +X.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libcap/libcap-2.19-build-system.patch |   35 +++++++++++++++---------
 package/libcap/libcap.mk                      |    3 +-
 2 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/package/libcap/libcap-2.19-build-system.patch b/package/libcap/libcap-2.19-build-system.patch
index 51b73af..f548726 100644
--- a/package/libcap/libcap-2.19-build-system.patch
+++ b/package/libcap/libcap-2.19-build-system.patch
@@ -1,18 +1,6 @@
-diff -Nura libcap-2.19.orig/libcap/Makefile libcap-2.19/libcap/Makefile
---- libcap-2.19.orig/libcap/Makefile	2008-12-04 05:03:12.000000000 -0200
-+++ libcap-2.19/libcap/Makefile	2010-05-28 14:32:06.290297694 -0300
-@@ -33,7 +33,7 @@
- endif
- 
- _makenames: _makenames.c cap_names.list.h
--	$(BUILD_CC) $(BUILD_CFLAGS) $< -o $@
-+	$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) $< -o $@
- 
- cap_names.h: _makenames
- 	./_makenames > cap_names.h
 diff -Nura libcap-2.19.orig/Make.Rules libcap-2.19/Make.Rules
 --- libcap-2.19.orig/Make.Rules	2010-01-13 23:04:58.000000000 -0300
-+++ libcap-2.19/Make.Rules	2010-05-28 14:32:31.802296186 -0300
++++ libcap-2.19/Make.Rules	2010-12-28 16:44:18.164052748 -0300
 @@ -45,25 +45,26 @@
  KERNEL_HEADERS := $(topdir)/libcap/include
  IPATH += -I$(topdir)/libcap/include -I$(KERNEL_HEADERS)
@@ -48,3 +36,24 @@ diff -Nura libcap-2.19.orig/Make.Rules libcap-2.19/Make.Rules
  INDENT := $(shell if [ -n "$(which indent 2>/dev/null)" ]; then echo "| indent -kr" ; fi)
  DYNAMIC := $(shell if [ ! -d "$(topdir)/.git" ]; then echo yes; fi)
  LIBATTR := yes
+diff -Nura libcap-2.19.orig/libcap/Makefile libcap-2.19/libcap/Makefile
+--- libcap-2.19.orig/libcap/Makefile	2008-12-04 05:03:12.000000000 -0200
++++ libcap-2.19/libcap/Makefile	2010-12-28 16:44:33.457052750 -0300
+@@ -33,7 +33,7 @@
+ endif
+ 
+ _makenames: _makenames.c cap_names.list.h
+-	$(BUILD_CC) $(BUILD_CFLAGS) $< -o $@
++	$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) $< -o $@
+ 
+ cap_names.h: _makenames
+ 	./_makenames > cap_names.h
+@@ -65,7 +65,7 @@
+ 	install -m 0644 include/sys/capability.h $(INCDIR)/sys
+ 	mkdir -p -m 0755 $(LIBDIR)
+ 	install -m 0644 $(STALIBNAME) $(LIBDIR)/$(STALIBNAME)
+-	install -m 0644 $(MINLIBNAME) $(LIBDIR)/$(MINLIBNAME)
++	install -m 0755 $(MINLIBNAME) $(LIBDIR)/$(MINLIBNAME)
+ 	ln -sf $(MINLIBNAME) $(LIBDIR)/$(MAJLIBNAME)
+ 	ln -sf $(MAJLIBNAME) $(LIBDIR)/$(LIBNAME)
+ ifeq ($(FAKEROOT),)
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 301d1b1..d4f8f17 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -12,7 +12,8 @@ define LIBCAP_INSTALL_STAGING_CMDS
 endef
 
 define LIBCAP_INSTALL_TARGET_CMDS
- install -D $(STAGING_DIR)/usr/lib/libcap.so.* $(TARGET_DIR)/usr/lib
+ $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(TARGET_DIR) prefix=/usr lib=lib install
+ rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,capsh getpcaps)
 endef
 
 define HOST_LIBCAP_BUILD_CMDS
-- 
1.7.2.2
