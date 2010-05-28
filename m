From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 May 2010 21:47:46 +0200
Subject: [Buildroot] [git commit master] libcap: fix build issue when host
	pam is around
Message-ID: <20100528194810.3C8F4BFAC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2816c33c3d802f002bdb53d41f249eb5571a7cb9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1843

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                       |    6 +++-
 package/libcap/libcap-2.19-build-system.patch |   43 +++++++++++--------------
 2 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/CHANGES b/CHANGES
index 44ffa75..9eb6f81 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,11 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: coreutils, hal
+	Updated/fixed packages: coreutils, hal, libcap
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#1843: Fix libcap build failure
 
 2010.05-rc3, Released May 27th, 2010:
 
diff --git a/package/libcap/libcap-2.19-build-system.patch b/package/libcap/libcap-2.19-build-system.patch
index 42a5518..51b73af 100644
--- a/package/libcap/libcap-2.19-build-system.patch
+++ b/package/libcap/libcap-2.19-build-system.patch
@@ -1,13 +1,19 @@
----
- Make.Rules      |   15 ++++++++-------
- libcap/Makefile |    2 +-
- 2 files changed, 9 insertions(+), 8 deletions(-)
-
-Index: libcap-2.19/Make.Rules
-===================================================================
---- libcap-2.19.orig/Make.Rules
-+++ libcap-2.19/Make.Rules
-@@ -45,24 +45,25 @@
+diff -Nura libcap-2.19.orig/libcap/Makefile libcap-2.19/libcap/Makefile
+--- libcap-2.19.orig/libcap/Makefile	2008-12-04 05:03:12.000000000 -0200
++++ libcap-2.19/libcap/Makefile	2010-05-28 14:32:06.290297694 -0300
+@@ -33,7 +33,7 @@
+ endif
+ 
+ _makenames: _makenames.c cap_names.list.h
+-	$(BUILD_CC) $(BUILD_CFLAGS) $< -o $@
++	$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) $< -o $@
+ 
+ cap_names.h: _makenames
+ 	./_makenames > cap_names.h
+diff -Nura libcap-2.19.orig/Make.Rules libcap-2.19/Make.Rules
+--- libcap-2.19.orig/Make.Rules	2010-01-13 23:04:58.000000000 -0300
++++ libcap-2.19/Make.Rules	2010-05-28 14:32:31.802296186 -0300
+@@ -45,25 +45,26 @@
  KERNEL_HEADERS := $(topdir)/libcap/include
  IPATH += -I$(topdir)/libcap/include -I$(KERNEL_HEADERS)
  
@@ -36,20 +42,9 @@ Index: libcap-2.19/Make.Rules
  INCS=$(topdir)/libcap/include/sys/capability.h
  LDFLAGS += -L$(topdir)/libcap
  CFLAGS += -Dlinux $(WARNINGS) $(DEBUG) $(IPATH)
+-PAM_CAP := $(shell if [ -f /usr/include/security/pam_modules.h ]; then echo yes ; else echo no ; fi)
 +CFLAGS_FOR_BUILD += $(IPATH)
- PAM_CAP := $(shell if [ -f /usr/include/security/pam_modules.h ]; then echo yes ; else echo no ; fi)
++PAM_CAP := no
  INDENT := $(shell if [ -n "$(which indent 2>/dev/null)" ]; then echo "| indent -kr" ; fi)
  DYNAMIC := $(shell if [ ! -d "$(topdir)/.git" ]; then echo yes; fi)
-Index: libcap-2.19/libcap/Makefile
-===================================================================
---- libcap-2.19.orig/libcap/Makefile
-+++ libcap-2.19/libcap/Makefile
-@@ -33,7 +33,7 @@
- endif
- 
- _makenames: _makenames.c cap_names.list.h
--	$(BUILD_CC) $(BUILD_CFLAGS) $< -o $@
-+	$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) $< -o $@
- 
- cap_names.h: _makenames
- 	./_makenames > cap_names.h
+ LIBATTR := yes
-- 
1.6.3.3
