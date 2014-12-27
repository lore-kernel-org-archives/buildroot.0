From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 27 Dec 2014 22:58:27 +0100
Subject: [Buildroot] [PATCH 09/10] package/dvb-app: handle static/shared
	only build
In-Reply-To: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>
References: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1419717508-11627-10-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 .../0003-handle-static-shared-only-build.patch     | 35 ++++++++++++++++++++++
 .../dvb-apps/0003-support-static-only-build.patch  | 20 -------------
 package/dvb-apps/dvb-apps.mk                       |  6 +++-
 3 files changed, 40 insertions(+), 21 deletions(-)
 create mode 100644 package/dvb-apps/0003-handle-static-shared-only-build.patch
 delete mode 100644 package/dvb-apps/0003-support-static-only-build.patch

diff --git a/package/dvb-apps/0003-handle-static-shared-only-build.patch b/package/dvb-apps/0003-handle-static-shared-only-build.patch
new file mode 100644
index 0000000..12a3f00
--- /dev/null
+++ b/package/dvb-apps/0003-handle-static-shared-only-build.patch
@@ -0,0 +1,35 @@
+From 2058cfd89b691fd05f37de6201fdb71b90889faa Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Thu, 25 Dec 2014 19:22:16 +0100
+Subject: [PATCH] Make.rules: Handle static/shared only build
+
+Only build .a library when static=1
+Only build .so library when shared=1
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ Make.rules | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/Make.rules b/Make.rules
+index 3410d7b..788397d 100644
+--- a/Make.rules
++++ b/Make.rules
+@@ -9,7 +9,13 @@ ifneq ($(lib_name),)
+ CFLAGS_LIB ?= -fPIC
+ CFLAGS += $(CFLAGS_LIB)
+ 
+-libraries = $(lib_name).so $(lib_name).a
++ifeq ($(static),1)
++libraries = $(lib_name).a
++endif
++
++ifeq ($(shared),1)
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
diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
index 892af63..c29c7fb 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -16,7 +16,11 @@ DVB_APPS_LDLIBS += -liconv
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
-DVB_APPS_MAKE_OPTS += static=1
+DVB_APPS_MAKE_OPTS += static=1 shared=0
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+DVB_APPS_MAKE_OPTS += static=1 shared=1
+else # BR2_SHARED_LIBS
+DVB_APPS_MAKE_OPTS += static=0 shared=1
 endif
 
 DVB_APPS_INSTALL_STAGING = YES
-- 
1.9.3
