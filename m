From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 30 Jan 2021 22:40:32 +0100
Subject: [Buildroot] [PATCH 4/4] package/netopeer2: bump version to 1.1.53
In-Reply-To: <20210130214028.26398-1-heiko.thiery@gmail.com>
References: <20210130214028.26398-1-heiko.thiery@gmail.com>
Message-ID: <20210130214028.26398-5-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch applied upstream.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 ...support-using-current-user-for-SR-mo.patch | 93 -------------------
 package/netopeer2/netopeer2.hash              |  2 +-
 package/netopeer2/netopeer2.mk                |  2 +-
 3 files changed, 2 insertions(+), 95 deletions(-)
 delete mode 100644 package/netopeer2/0001-scripts-FEATURE-support-using-current-user-for-SR-mo.patch

diff --git a/package/netopeer2/0001-scripts-FEATURE-support-using-current-user-for-SR-mo.patch b/package/netopeer2/0001-scripts-FEATURE-support-using-current-user-for-SR-mo.patch
deleted file mode 100644
index 76c71d0ff9..0000000000
--- a/package/netopeer2/0001-scripts-FEATURE-support-using-current-user-for-SR-mo.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 4a950257fa353e27ef1bd753bca4d0279f41bc77 Mon Sep 17 00:00:00 2001
-From: Michal Vasko <mvasko@cesnet.cz>
-Date: Mon, 24 Aug 2020 13:47:40 +0200
-Subject: [PATCH] scripts FEATURE support using current user for SR modules
-
-Mostly for special cases user/group configuration
-when the user/group cannot be retrieved normally.
-
-Fixes #701
----
- CMakeLists.txt   | 10 +++++-----
- scripts/setup.sh | 23 +++++++++++++++++++----
- 2 files changed, 24 insertions(+), 9 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 77aea1f..8fd6b43 100755
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -68,19 +68,19 @@ if(NOT MODULES_OWNER)
-     OUTPUT_VARIABLE MODULES_OWNER OUTPUT_STRIP_TRAILING_WHITESPACE
-     ERROR_VARIABLE ERROR_STR OUTPUT_STRIP_TRAILING_WHITESPACE)
-     if(RET)
--        message(FATAL_ERROR "Learning server module user failed: ${ERROR_STR}")
-+        message(WARNING "Learning server module user failed (${ERROR_STR}), the current user will be used.")
-     endif()
- endif()
--set(MODULES_OWNER "${MODULES_OWNER}" CACHE STRING "System user that will become the owner of server modules")
--if(NOT MODULES_GROUP)
-+set(MODULES_OWNER "${MODULES_OWNER}" CACHE STRING "System user that will become the owner of server modules, empty means the current user")
-+if(NOT MODULES_GROUP AND MODULES_OWNER)
-     execute_process(COMMAND id -gn ${MODULES_OWNER} RESULT_VARIABLE RET
-     OUTPUT_VARIABLE MODULES_GROUP OUTPUT_STRIP_TRAILING_WHITESPACE
-     ERROR_VARIABLE ERROR_STR OUTPUT_STRIP_TRAILING_WHITESPACE)
-     if(RET)
--        message(FATAL_ERROR "Learning server module group failed: ${ERROR_STR}")
-+        message(WARNING "Learning server module group failed (${ERROR_STR}), the current user group will be used.")
-     endif()
- endif()
--set(MODULES_GROUP "${MODULES_GROUP}" CACHE STRING "System group that the server modules will belong to")
-+set(MODULES_GROUP "${MODULES_GROUP}" CACHE STRING "System group that the server modules will belong to, empty means the current user group")
- 
- # set prefix for the PID file
- if(NOT PIDFILE_PREFIX)
-diff --git a/scripts/setup.sh b/scripts/setup.sh
-index 9591a49..b7c7ba4 100755
---- a/scripts/setup.sh
-+++ b/scripts/setup.sh
-@@ -1,7 +1,8 @@
- #!/bin/bash
- 
--# env variables NP2_MODULE_DIR, NP2_MODULE_PERMS, NP2_MODULE_OWNER, NP2_MODULE_GROUP must be defined when executing this script!
--if [ -z "$NP2_MODULE_DIR" -o -z "$NP2_MODULE_PERMS" -o -z "$NP2_MODULE_OWNER" -o -z "$NP2_MODULE_GROUP" ]; then
-+# env variables NP2_MODULE_DIR, NP2_MODULE_PERMS must be defined and NP2_MODULE_OWNER, NP2_MODULE_GROUP will be used if
-+# defined when executing this script!
-+if [ -z "$NP2_MODULE_DIR" -o -z "$NP2_MODULE_PERMS" ]; then
-     echo "Required environment variables not defined!"
-     exit 1
- fi
-@@ -37,7 +38,14 @@ MODULES=(
- 
- # functions
- INSTALL_MODULE() {
--    "$SYSREPOCTL" -a -i $MODDIR/$1 -s "$MODDIR" -p "$PERMS" -o "$OWNER" -g "$GROUP" -v2
-+    CMD="'$SYSREPOCTL' -a -i $MODDIR/$1 -s '$MODDIR' -p '$PERMS' -v2"
-+    if [ ! -z ${OWNER} ]; then
-+        CMD="$CMD -o '$OWNER'"
-+    fi
-+    if [ ! -z ${GROUP} ]; then
-+        CMD="$CMD -g '$GROUP'"
-+    fi
-+    eval $CMD
-     local rc=$?
-     if [ $rc -ne 0 ]; then
-         exit $rc
-@@ -45,7 +53,14 @@ INSTALL_MODULE() {
- }
- 
- UPDATE_MODULE() {
--    "$SYSREPOCTL" -a -U $MODDIR/$1 -s "$MODDIR" -p "$PERMS" -o "$OWNER" -g "$GROUP" -v2
-+    CMD="'$SYSREPOCTL' -a -U $MODDIR/$1 -s '$MODDIR' -p '$PERMS' -v2"
-+    if [ ! -z ${OWNER} ]; then
-+        CMD="$CMD -o '$OWNER'"
-+    fi
-+    if [ ! -z ${GROUP} ]; then
-+        CMD="$CMD -g '$GROUP'"
-+    fi
-+    eval $CMD
-     local rc=$?
-     if [ $rc -ne 0 ]; then
-         exit $rc
--- 
-2.20.1
-
diff --git a/package/netopeer2/netopeer2.hash b/package/netopeer2/netopeer2.hash
index 1d5997505f..801c353e11 100644
--- a/package/netopeer2/netopeer2.hash
+++ b/package/netopeer2/netopeer2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e983683eda68792fedd73af54a5c7997496091489aa921f2a9e0dd27f2f6e19a  netopeer2-1.1.39.tar.gz
+sha256  6b43026211a787d5cb91d47cb7fdd7923649044c55f264aaf85bf5676c004211  netopeer2-1.1.53.tar.gz
 sha256  b46f161fbdcf127d3ef22602e15958c3092fe3294f71a2dc8cdf8f6689cba95b  LICENSE
diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index 5787d3a8cf..bc02e0dc93 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETOPEER2_VERSION = 1.1.39
+NETOPEER2_VERSION = 1.1.53
 NETOPEER2_SITE = $(call github,CESNET,Netopeer2,v$(NETOPEER2_VERSION))
 NETOPEER2_DL_SUBDIR = netopeer2
 NETOPEER2_LICENSE = BSD-3-Clause
-- 
2.20.1
