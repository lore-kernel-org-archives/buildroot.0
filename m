From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 15:23:01 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-stats: better heuristics
In-Reply-To: <cover.1274448176.git.thomas.petazzoni@free-electrons.com>
References: <cover.1274448176.git.thomas.petazzoni@free-electrons.com>
Message-ID: <beafd2073059499f612cf6e68b2228b87c0325c6.1274448176.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Slightly improve the package type detection heuristic, and fix a small
bug about package/multimedia/multimedia.mk exclusion.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 scripts/pkg-stats |   27 +++++++++++++--------------
 1 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/scripts/pkg-stats b/scripts/pkg-stats
index 0ed420d..1174ef0 100755
--- a/scripts/pkg-stats
+++ b/scripts/pkg-stats
@@ -70,7 +70,7 @@ for i in $(find package/ -name '*.mk') ; do
 	$i = "package/database/database.mk" -o \
 	$i = "package/editors/editors.mk" -o \
 	$i = "package/games/games.mk" -o \
-	$i = "package/multimedia/multimedia" -o \
+	$i = "package/multimedia/multimedia.mk" -o \
 	$i = "package/customize/customize.mk" -o \
 	$i = "package/gnuconfig/gnuconfig.mk" -o \
 	$i = "package/x11r7/x11r7.mk" ; then
@@ -144,7 +144,7 @@ for i in $(find package/ -name '*.mk') ; do
     echo "</td>"
 
     echo "<td class=\"centered\">"
-    if grep "^$pkg:" $i > /dev/null ; then
+    if test $is_pkg_target -eq 0 -a $is_auto_target -eq 0 ; then
 	found=1
 	is_manual_target=1
 	echo "<b>YES</b>"
@@ -155,18 +155,17 @@ for i in $(find package/ -name '*.mk') ; do
 
     echo "<td>"
     echo "<ul>"
-    if [ $is_manual_target -eq 1 ]; then
-	echo "<li>convert to generic target</li>"
-	convert_to_generic_target=$((convert_to_generic_target+1))
-    fi
-    if [ $is_manual_host -eq 1 ]; then
-	echo "<li>convert to generic host</li>"
-	convert_to_generic_host=$((convert_to_generic_host+1))
-    fi
-    if grep "\./configure" $i > /dev/null ; then
-	if [ $is_manual_host -ne 1 ] ; then
-	    echo "<li>convert package to autotools ?</li>"
-	    convert_to_autotools=$((convert_to_autotools+1))
+    if grep "/configure" $i > /dev/null ; then
+	echo "<li>convert package to autotools ?</li>"
+	convert_to_autotools=$((convert_to_autotools+1))
+    else
+	if [ $is_manual_target -eq 1 ]; then
+	    echo "<li>convert to generic target</li>"
+	    convert_to_generic_target=$((convert_to_generic_target+1))
+	fi
+	if [ $is_manual_host -eq 1 ]; then
+	    echo "<li>convert to generic host</li>"
+	    convert_to_generic_host=$((convert_to_generic_host+1))
 	fi
     fi
     if [ $found -eq 0 ] ; then
-- 
1.6.3.3
