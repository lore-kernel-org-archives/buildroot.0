From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Jul 2010 15:15:14 +0200
Subject: [Buildroot] [PATCH 1/1] Improvements to the package conversion
	status script
In-Reply-To: <cover.1280150104.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280150104.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7a132d5ce72cc2c04146ead8dfcd3b3ec8d9ab3a.1280150104.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 scripts/pkg-stats |  119 ++++++++++++++++++++++++++++++++++-------------------
 1 files changed, 77 insertions(+), 42 deletions(-)

diff --git a/scripts/pkg-stats b/scripts/pkg-stats
index 1174ef0..01af89d 100755
--- a/scripts/pkg-stats
+++ b/scripts/pkg-stats
@@ -36,6 +36,12 @@ td {
 td.centered {
   text-align: center;
 }
+tr.wrong td {
+  background: #ff9a69;
+}
+tr.correct td {
+  background: #d2ffc4;
+}
 </style>
 </head>
 
@@ -78,12 +84,7 @@ for i in $(find package/ -name '*.mk') ; do
 	continue
     fi
 
-    found=0
-
-    echo "<tr>"
-    echo "<td>$cnt</td>"
     cnt=$((cnt+1))
-    echo "<td>$i</td>"
 
     is_auto_host=0
     is_auto_target=0
@@ -92,18 +93,74 @@ for i in $(find package/ -name '*.mk') ; do
     is_manual_target=0
     is_manual_host=0
 
-    echo "<td class=\"centered\">"
     if grep -E "\(call AUTOTARGETS,[^,]*,[^,]*,host\)" $i > /dev/null ; then
 	is_auto_host=1
+    fi
+
+    if grep -E "\(call AUTOTARGETS,[^,]*,[^,]*(,target|)\)" $i > /dev/null ; then
+	is_auto_target=1
+    fi
+
+    if grep -E "\(call GENTARGETS,[^,]*,[^,]*,host\)" $i > /dev/null ; then
+	is_pkg_host=1
+    fi
+
+    if grep -E "\(call GENTARGETS,[^,]*,[^,]*(,target|)\)" $i > /dev/null ; then
+	is_pkg_target=1
+    fi
+
+    pkg=$(basename $i)
+    pkg=${pkg%.mk}
+
+    if grep "^host-$pkg:" $i > /dev/null ; then
+	is_manual_host=1
+    fi
+
+    if test $is_pkg_target -eq 0 -a $is_auto_target -eq 0 ; then
+	is_manual_target=1
+    fi
+
+    tasks=""
+
+    if [ $is_manual_target -eq 1 ] ; then
+	if grep "/configure" $i > /dev/null ; then
+	    tasks=$tasks"<li>convert package to autotools ?</li>"
+	    convert_to_target_autotools=$((convert_to_target_autotools+1))
+	else
+	    tasks=$tasks"<li>convert to generic target</li>"
+	    convert_to_generic_target=$((convert_to_generic_target+1))
+	fi
+    fi
+
+    if [ $is_manual_host -eq 1 ]; then
+	if grep "/configure" $i > /dev/null ; then
+	    tasks=$tasks"<li>convert package to autotools ?</li>"
+	    convert_to_host_autotools=$((convert_to_host_autotools+1))
+	else
+	    tasks=$tasks"<li>convert to generic host</li>"
+	    convert_to_generic_host=$((convert_to_generic_host+1))
+	fi
+    fi
+
+    if test -n "$tasks" ; then
+	echo "<tr class=\"wrong\">"
+    else
+	echo "<tr class=\"correct\">"
+    fi
+
+    echo "<td>$cnt</td>"
+    echo "<td>$i</td>"
+
+    echo "<td class=\"centered\">"
+    if [ $is_auto_host -eq 1 ] ; then
 	echo "<b>YES</b>"
     else
 	echo "NO"
     fi
+    echo "</td>"
 
     echo "<td class=\"centered\">"
-    if grep -E "\(call AUTOTARGETS,[^,]*,[^,]*(,target|)\)" $i > /dev/null ; then
-	found=1
-	is_auto_target=1
+    if [ $is_auto_target -eq 1 ] ; then
 	echo "<b>YES</b>"
     else
 	echo "NO"
@@ -111,9 +168,7 @@ for i in $(find package/ -name '*.mk') ; do
     echo "</td>"
 
     echo "<td class=\"centered\">"
-    if grep -E "\(call GENTARGETS,[^,]*,[^,]*,host\)" $i > /dev/null ; then
-	found=1
-	is_pkg_host=1
+    if [ $is_pkg_host -eq 1 ] ; then
 	echo "<b>YES</b>"
     else
 	echo "NO"
@@ -121,22 +176,15 @@ for i in $(find package/ -name '*.mk') ; do
     echo "</td>"
 
     echo "<td class=\"centered\">"
-    if grep -E "\(call GENTARGETS,[^,]*,[^,]*(,target|)\)" $i > /dev/null ; then
-	found=1
-	is_pkg_target=1
+    if [ $is_pkg_target -eq 1 ] ; then
 	echo "<b>YES</b>"
     else
 	echo "NO"
     fi
     echo "</td>"
 
-    pkg=$(basename $i)
-    pkg=${pkg%.mk}
-
     echo "<td class=\"centered\">"
-    if grep "^host-$pkg:" $i > /dev/null ; then
-	found=1
-	is_manual_host=1
+    if [ $is_manual_host -eq 1 ] ; then
 	echo "<b>YES</b>"
     else
 	echo "NO"
@@ -144,9 +192,7 @@ for i in $(find package/ -name '*.mk') ; do
     echo "</td>"
 
     echo "<td class=\"centered\">"
-    if test $is_pkg_target -eq 0 -a $is_auto_target -eq 0 ; then
-	found=1
-	is_manual_target=1
+    if [ $is_manual_target -eq 1 ] ; then
 	echo "<b>YES</b>"
     else
 	echo "NO"
@@ -155,22 +201,7 @@ for i in $(find package/ -name '*.mk') ; do
 
     echo "<td>"
     echo "<ul>"
-    if grep "/configure" $i > /dev/null ; then
-	echo "<li>convert package to autotools ?</li>"
-	convert_to_autotools=$((convert_to_autotools+1))
-    else
-	if [ $is_manual_target -eq 1 ]; then
-	    echo "<li>convert to generic target</li>"
-	    convert_to_generic_target=$((convert_to_generic_target+1))
-	fi
-	if [ $is_manual_host -eq 1 ]; then
-	    echo "<li>convert to generic host</li>"
-	    convert_to_generic_host=$((convert_to_generic_host+1))
-	fi
-    fi
-    if [ $found -eq 0 ] ; then
-	echo "<li>look manually</li>"
-    fi
+    echo $tasks
     echo "</ul>"
     echo "</td>"
 
@@ -189,8 +220,12 @@ echo "<td>Packages to convert to generic host</td>"
 echo "<td>$convert_to_generic_host</td>"
 echo "</tr>"
 echo "<tr>"
-echo "<td>Packages to convert to autotools</td>"
-echo "<td>$convert_to_autotools</td>"
+echo "<td>Packages to convert to target autotools</td>"
+echo "<td>$convert_to_target_autotools</td>"
+echo "</tr>"
+echo "<tr>"
+echo "<td>Packages to convert to host autotools</td>"
+echo "<td>$convert_to_host_autotools</td>"
 echo "</tr>"
 echo "<tr>"
 echo "<td>TOTAL</td>"
-- 
1.7.0.4
