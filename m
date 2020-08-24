From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 24 Aug 2020 14:41:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/netopeer2: add patch to solve issue
 with empty group name
Message-ID: <20200824124147.23051-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building on a host that has no name specified for the used group in
/etc/group the script in install step will fail due to missing group name.

CMake Error at CMakeLists.txt:80 (message):
  Learning server module group failed: id: cannot find name for group ID 8000

The patch was taken from upstream and modified manually because of merge
conflicts.

Fixes:
http://autobuild.buildroot.net/results/f197ca1def9dc1292e1e784757f2da9d95484431/

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 ...support-using-current-user-for-SR-mo.patch | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 package/netopeer2/0003-scripts-FEATURE-support-using-current-user-for-SR-mo.patch

diff --git a/package/netopeer2/0003-scripts-FEATURE-support-using-current-user-for-SR-mo.patch b/package/netopeer2/0003-scripts-FEATURE-support-using-current-user-for-SR-mo.patch
new file mode 100644
index 0000000000..45257b2ff4
--- /dev/null
+++ b/package/netopeer2/0003-scripts-FEATURE-support-using-current-user-for-SR-mo.patch
@@ -0,0 +1,98 @@
+From 36ee1f33bceb0c2a7899e28d75c0d05408b561f1 Mon Sep 17 00:00:00 2001
+From: Michal Vasko <mvasko@cesnet.cz>
+Date: Mon, 24 Aug 2020 13:47:40 +0200
+Subject: [PATCH] scripts FEATURE support using current user for SR modules
+
+Mostly for special cases user/group configuration
+when the user/group cannot be retrieved normally.
+
+Fixes #701
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+[patch taken from upstream:
+https://github.com/CESNET/netopeer2/commit/12a82701e10651fbdedb1524b27edf3bb2377488]
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ CMakeLists.txt   | 10 +++++-----
+ scripts/setup.sh | 23 +++++++++++++++++++----
+ 2 files changed, 24 insertions(+), 9 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2d4175e..95e7e61 100755
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -68,19 +68,19 @@ if(NOT MODULES_OWNER)
+     OUTPUT_VARIABLE MODULES_OWNER OUTPUT_STRIP_TRAILING_WHITESPACE
+     ERROR_VARIABLE ERROR_STR OUTPUT_STRIP_TRAILING_WHITESPACE)
+     if(RET)
+-        message(FATAL_ERROR "Learning server module user failed: ${ERROR_STR}")
++        message(WARNING "Learning server module user failed (${ERROR_STR}), the current user will be used.")
+     endif()
+ endif()
+-set(MODULES_OWNER "${MODULES_OWNER}" CACHE STRING "System user that will become the owner of server modules")
+-if(NOT MODULES_GROUP)
++set(MODULES_OWNER "${MODULES_OWNER}" CACHE STRING "System user that will become the owner of server modules, empty means the current user")
++if(NOT MODULES_GROUP AND MODULES_OWNER)
+     execute_process(COMMAND id -gn ${MODULES_OWNER} RESULT_VARIABLE RET
+     OUTPUT_VARIABLE MODULES_GROUP OUTPUT_STRIP_TRAILING_WHITESPACE
+     ERROR_VARIABLE ERROR_STR OUTPUT_STRIP_TRAILING_WHITESPACE)
+     if(RET)
+-        message(FATAL_ERROR "Learning server module group failed: ${ERROR_STR}")
++        message(WARNING "Learning server module group failed (${ERROR_STR}), the current user group will be used.")
+     endif()
+ endif()
+-set(MODULES_GROUP "${MODULES_GROUP}" CACHE STRING "System group that the server modules will belong to")
++set(MODULES_GROUP "${MODULES_GROUP}" CACHE STRING "System group that the server modules will belong to, empty means the current user group")
+ 
+ # set prefix for the PID file
+ if(NOT PIDFILE_PREFIX)
+diff --git a/scripts/setup.sh b/scripts/setup.sh
+index 7175bc4..b5d1406 100755
+--- a/scripts/setup.sh
++++ b/scripts/setup.sh
+@@ -1,7 +1,8 @@
+ #!/bin/bash
+ 
+-# env variables NP2_MODULE_DIR, NP2_MODULE_PERMS, NP2_MODULE_OWNER, NP2_MODULE_GROUP must be defined when executing this script!
+-if [ -z "$NP2_MODULE_DIR" -o -z "$NP2_MODULE_PERMS" -o -z "$NP2_MODULE_OWNER" -o -z "$NP2_MODULE_GROUP" ]; then
++# env variables NP2_MODULE_DIR, NP2_MODULE_PERMS must be defined and NP2_MODULE_OWNER, NP2_MODULE_GROUP will be used if
++# defined when executing this script!
++if [ -z "$NP2_MODULE_DIR" -o -z "$NP2_MODULE_PERMS" ]; then
+     echo "Required environment variables not defined!"
+     exit 1
+ fi
+@@ -33,7 +34,14 @@ MODULES=(
+ 
+ # functions
+ INSTALL_MODULE() {
+-    $SYSREPOCTL -a -i $MODDIR/$1 -s $MODDIR -p $PERMS -o $OWNER -g $GROUP -v2
++    CMD="'$SYSREPOCTL' -a -i $MODDIR/$1 -s '$MODDIR' -p '$PERMS' -v2"
++    if [ ! -z ${OWNER} ]; then
++        CMD="$CMD -o '$OWNER'"
++    fi
++    if [ ! -z ${GROUP} ]; then
++        CMD="$CMD -g '$GROUP'"
++    fi
++    eval $CMD
+     local rc=$?
+     if [ $rc -ne 0 ]; then
+         exit $rc
+@@ -41,7 +49,14 @@ INSTALL_MODULE() {
+ }
+ 
+ UPDATE_MODULE() {
+-    $SYSREPOCTL -a -U $MODDIR/$1 -s $MODDIR -p $PERMS -o $OWNER -g $GROUP -v2
++    CMD="'$SYSREPOCTL' -a -U $MODDIR/$1 -s '$MODDIR' -p '$PERMS' -v2"
++    if [ ! -z ${OWNER} ]; then
++        CMD="$CMD -o '$OWNER'"
++    fi
++    if [ ! -z ${GROUP} ]; then
++        CMD="$CMD -g '$GROUP'"
++    fi
++    eval $CMD
+     local rc=$?
+     if [ $rc -ne 0 ]; then
+         exit $rc
+-- 
+2.20.1
+
-- 
2.20.1
