From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu,  3 Sep 2020 10:49:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/netopeer2: fix patch
Message-ID: <20200903084956.23337-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch cannot be applied to bumped version anymore. So recreate on top of
current version.

Also change the patch numbering from 0003 -> 0001 since the others are
dropped due to version bump.

Fixes:
http://autobuild.buildroot.net/results/ec58bc318e0e2fd46c16814a4011a4847090e696/

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 ...upport-using-current-user-for-SR-mo.patch} | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)
 rename package/netopeer2/{0003-scripts-FEATURE-support-using-current-user-for-SR-mo.patch => 0001-scripts-FEATURE-support-using-current-user-for-SR-mo.patch} (85%)

diff --git a/package/netopeer2/0003-scripts-FEATURE-support-using-current-user-for-SR-mo.patch b/package/netopeer2/0001-scripts-FEATURE-support-using-current-user-for-SR-mo.patch
similarity index 85%
rename from package/netopeer2/0003-scripts-FEATURE-support-using-current-user-for-SR-mo.patch
rename to package/netopeer2/0001-scripts-FEATURE-support-using-current-user-for-SR-mo.patch
index 45257b2ff4..76c71d0ff9 100644
--- a/package/netopeer2/0003-scripts-FEATURE-support-using-current-user-for-SR-mo.patch
+++ b/package/netopeer2/0001-scripts-FEATURE-support-using-current-user-for-SR-mo.patch
@@ -1,4 +1,4 @@
-From 36ee1f33bceb0c2a7899e28d75c0d05408b561f1 Mon Sep 17 00:00:00 2001
+From 4a950257fa353e27ef1bd753bca4d0279f41bc77 Mon Sep 17 00:00:00 2001
 From: Michal Vasko <mvasko@cesnet.cz>
 Date: Mon, 24 Aug 2020 13:47:40 +0200
 Subject: [PATCH] scripts FEATURE support using current user for SR modules
@@ -7,18 +7,13 @@ Mostly for special cases user/group configuration
 when the user/group cannot be retrieved normally.
 
 Fixes #701
-
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
-[patch taken from upstream:
-https://github.com/CESNET/netopeer2/commit/12a82701e10651fbdedb1524b27edf3bb2377488]
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
 ---
  CMakeLists.txt   | 10 +++++-----
  scripts/setup.sh | 23 +++++++++++++++++++----
  2 files changed, 24 insertions(+), 9 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2d4175e..95e7e61 100755
+index 77aea1f..8fd6b43 100755
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -68,19 +68,19 @@ if(NOT MODULES_OWNER)
@@ -47,7 +42,7 @@ index 2d4175e..95e7e61 100755
  # set prefix for the PID file
  if(NOT PIDFILE_PREFIX)
 diff --git a/scripts/setup.sh b/scripts/setup.sh
-index 7175bc4..b5d1406 100755
+index 9591a49..b7c7ba4 100755
 --- a/scripts/setup.sh
 +++ b/scripts/setup.sh
 @@ -1,7 +1,8 @@
@@ -61,11 +56,11 @@ index 7175bc4..b5d1406 100755
      echo "Required environment variables not defined!"
      exit 1
  fi
-@@ -33,7 +34,14 @@ MODULES=(
+@@ -37,7 +38,14 @@ MODULES=(
  
  # functions
  INSTALL_MODULE() {
--    $SYSREPOCTL -a -i $MODDIR/$1 -s $MODDIR -p $PERMS -o $OWNER -g $GROUP -v2
+-    "$SYSREPOCTL" -a -i $MODDIR/$1 -s "$MODDIR" -p "$PERMS" -o "$OWNER" -g "$GROUP" -v2
 +    CMD="'$SYSREPOCTL' -a -i $MODDIR/$1 -s '$MODDIR' -p '$PERMS' -v2"
 +    if [ ! -z ${OWNER} ]; then
 +        CMD="$CMD -o '$OWNER'"
@@ -77,11 +72,11 @@ index 7175bc4..b5d1406 100755
      local rc=$?
      if [ $rc -ne 0 ]; then
          exit $rc
-@@ -41,7 +49,14 @@ INSTALL_MODULE() {
+@@ -45,7 +53,14 @@ INSTALL_MODULE() {
  }
  
  UPDATE_MODULE() {
--    $SYSREPOCTL -a -U $MODDIR/$1 -s $MODDIR -p $PERMS -o $OWNER -g $GROUP -v2
+-    "$SYSREPOCTL" -a -U $MODDIR/$1 -s "$MODDIR" -p "$PERMS" -o "$OWNER" -g "$GROUP" -v2
 +    CMD="'$SYSREPOCTL' -a -U $MODDIR/$1 -s '$MODDIR' -p '$PERMS' -v2"
 +    if [ ! -z ${OWNER} ]; then
 +        CMD="$CMD -o '$OWNER'"
-- 
2.20.1
