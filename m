From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Feb 2011 23:24:29 +0100
Subject: [Buildroot] [PATCH 1/2] pkg-stats: support CMAKETARGETS and update
	list of .mk to ignore
In-Reply-To: <cover.1298931858.git.thomas.petazzoni@free-electrons.com>
References: <cover.1298931858.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1ff216b789067d58c96775d8d1db2c11a7fda31e.1298931858.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 scripts/pkg-stats |   36 ++++++++++++++++++++++++++++++++----
 1 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/scripts/pkg-stats b/scripts/pkg-stats
index 01af89d..9607da2 100755
--- a/scripts/pkg-stats
+++ b/scripts/pkg-stats
@@ -53,6 +53,7 @@ tr.correct td {
 <td rowspan=\"2\">Package</td>
 <td colspan=\"2\" class=\"centered\">AUTOTARGETS</td>
 <td colspan=\"2\" class=\"centered\">GENTARGETS</td>
+<td colspan=\"2\" class=\"centered\">CMAKETARGETS</td>
 <td colspan=\"2\" class=\"centered\">manual</td>
 <td rowspan=\"2\" class=\"centered\">Actions</td>
 </tr>
@@ -63,6 +64,8 @@ tr.correct td {
 <td class=\"centered\">target</td>
 <td class=\"centered\">host</td>
 <td class=\"centered\">target</td>
+<td class=\"centered\">host</td>
+<td class=\"centered\">target</td>
 </tr>"
 
 convert_to_generic_target=0
@@ -71,14 +74,13 @@ convert_to_autotools=0
 cnt=1
 for i in $(find package/ -name '*.mk') ; do
 
-    if test $i = "package/mtd/mtd.mk" -o \
+    if test \
 	$i = "package/java/java.mk" -o \
-	$i = "package/database/database.mk" -o \
-	$i = "package/editors/editors.mk" -o \
 	$i = "package/games/games.mk" -o \
 	$i = "package/multimedia/multimedia.mk" -o \
 	$i = "package/customize/customize.mk" -o \
 	$i = "package/gnuconfig/gnuconfig.mk" -o \
+	$i = "package/matchbox/matchbox.mk" -o \
 	$i = "package/x11r7/x11r7.mk" ; then
 	echo "skipping $i" 1>&2
 	continue
@@ -88,6 +90,8 @@ for i in $(find package/ -name '*.mk') ; do
 
     is_auto_host=0
     is_auto_target=0
+    is_cmake_host=0
+    is_cmake_target=0
     is_pkg_target=0
     is_pkg_host=0
     is_manual_target=0
@@ -109,6 +113,14 @@ for i in $(find package/ -name '*.mk') ; do
 	is_pkg_target=1
     fi
 
+    if grep -E "\(call CMAKETARGETS,[^,]*,[^,]*,host\)" $i > /dev/null ; then
+	is_cmake_host=1
+    fi
+
+    if grep -E "\(call CMAKETARGETS,[^,]*,[^,]*(,target|)\)" $i > /dev/null ; then
+	is_cmake_target=1
+    fi
+
     pkg=$(basename $i)
     pkg=${pkg%.mk}
 
@@ -116,7 +128,7 @@ for i in $(find package/ -name '*.mk') ; do
 	is_manual_host=1
     fi
 
-    if test $is_pkg_target -eq 0 -a $is_auto_target -eq 0 ; then
+    if test $is_pkg_target -eq 0 -a $is_auto_target -eq 0 -a $is_cmake_target -eq 0; then
 	is_manual_target=1
     fi
 
@@ -184,6 +196,22 @@ for i in $(find package/ -name '*.mk') ; do
     echo "</td>"
 
     echo "<td class=\"centered\">"
+    if [ $is_cmake_host -eq 1 ] ; then
+	echo "<b>YES</b>"
+    else
+	echo "NO"
+    fi
+    echo "</td>"
+
+    echo "<td class=\"centered\">"
+    if [ $is_cmake_target -eq 1 ] ; then
+	echo "<b>YES</b>"
+    else
+	echo "NO"
+    fi
+    echo "</td>"
+
+    echo "<td class=\"centered\">"
     if [ $is_manual_host -eq 1 ] ; then
 	echo "<b>YES</b>"
     else
-- 
1.7.0.4
