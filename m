From: Romain Naour <romain.naour@openwide.fr>
Date: Sun,  4 Jan 2015 13:45:26 +0100
Subject: [Buildroot] [PATCH v2] package/dvb-app: handle static/shared only
	build
Message-ID: <1420375526-8806-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove tests since they require static libraries.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v2: remove tests (ThomasP)
    rework static/shared handling logic
---
 .../0003-handle-static-shared-only-build.patch     | 35 ++++++++++++++++++++++
 .../dvb-apps/0003-support-static-only-build.patch  | 20 -------------
 package/dvb-apps/0004-Makefile-remove-test.patch   | 27 +++++++++++++++++
 package/dvb-apps/dvb-apps.mk                       |  4 ++-
 4 files changed, 65 insertions(+), 21 deletions(-)
 create mode 100644 package/dvb-apps/0003-handle-static-shared-only-build.patch
 delete mode 100644 package/dvb-apps/0003-support-static-only-build.patch
 create mode 100644 package/dvb-apps/0004-Makefile-remove-test.patch

diff --git a/package/dvb-apps/0003-handle-static-shared-only-build.patch b/package/dvb-apps/0003-handle-static-shared-only-build.patch
new file mode 100644
index 0000000..7a7d59a
--- /dev/null
+++ b/package/dvb-apps/0003-handle-static-shared-only-build.patch
@@ -0,0 +1,35 @@
+From f461e831f8c0ee9a59c9f194c0306eb73298396b Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Thu, 25 Dec 2014 19:22:16 +0100
+Subject: [PATCH] Make.rules: Handle static/shared only build
+
+Do not build .a library when disable_static is set
+Do not build .so library when disable_shared is set
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ Make.rules | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/Make.rules b/Make.rules
+index 3410d7b..4add272 100644
+--- a/Make.rules
++++ b/Make.rules
+@@ -9,7 +9,13 @@ ifneq ($(lib_name),)
+ CFLAGS_LIB ?= -fPIC
+ CFLAGS += $(CFLAGS_LIB)
+ 
+-libraries = $(lib_name).so $(lib_name).a
++ifeq ($(disable_static),)
++libraries = $(lib_name).a
++endif
++
++ifeq ($(disable_shared),)
++libraries += $(lib_name).so
++endif
+ 
+ .PHONY: library
+ 
+-- 
+1.9.3
+
diff --git a/package/dvb-apps/0003-support-static-only-build.patch b/package/dvb-apps/0003-support-static-only-build.patch
deleted file mode 100644
index 236f1a3..0000000
--- a/package/dvb-apps/0003-support-static-only-build.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Make.rules: don't build .so libraries when static=1
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/Make.rules
-===================================================================
---- a/Make.rules
-+++ b/Make.rules
-@@ -9,7 +9,11 @@
- CFLAGS_LIB ?= -fPIC
- CFLAGS += $(CFLAGS_LIB)
- 
-+ifeq ($(static),1)
-+libraries = $(lib_name).a
-+else
- libraries = $(lib_name).so $(lib_name).a
-+endif
- 
- .PHONY: library
- 
diff --git a/package/dvb-apps/0004-Makefile-remove-test.patch b/package/dvb-apps/0004-Makefile-remove-test.patch
new file mode 100644
index 0000000..45bfad9
--- /dev/null
+++ b/package/dvb-apps/0004-Makefile-remove-test.patch
@@ -0,0 +1,27 @@
+From c578772d6abc5fdf3ec83f632c371373e5baf9f1 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Fri, 26 Dec 2014 01:04:58 +0100
+Subject: [PATCH] Makefile: remove test
+
+Tests needs static libraries, remove them for shared only build.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 65a2273..105c460 100644
+--- a/Makefile
++++ b/Makefile
+@@ -10,7 +10,6 @@ DVB_API_MINOR := $(word 3, $(shell grep -m1 "DVB_API_VERSION_MINOR" $(VERSION_FI
+ 
+ all clean install:
+ 	$(MAKE) -C lib $@
+-	$(MAKE) -C test $@
+ 	$(MAKE) -C util $@
+ 
+ update:
+-- 
+1.9.3
+
diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
index 892af63..a5037af 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -16,7 +16,9 @@ DVB_APPS_LDLIBS += -liconv
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
-DVB_APPS_MAKE_OPTS += static=1
+DVB_APPS_MAKE_OPTS += disable_shared=1
+else ifeq ($(BR2_SHARED_LIBS),y)
+DVB_APPS_MAKE_OPTS += disable_static=1
 endif
 
 DVB_APPS_INSTALL_STAGING = YES
-- 
1.9.3
