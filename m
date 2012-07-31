From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jul 2012 21:32:25 +0200
Subject: [Buildroot] [git commit] pkg-stats: add license information,
	rework information displayed
Message-ID: <20120731193352.B0E9696FD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ed1a83f1c415a77ab23f74c7a909f331319facd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that most packages have been converted over to package
infrastructures, keep only one column to show the package
infrastructures.

A new column, showing of the package has license information, has been
added. This will help in increasing the number of packages having
license metadata.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/pkg-stats |  261 +++++++++++++++++++-------------------------
 1 files changed, 113 insertions(+), 148 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index ac5d8ec..ca2d0ec 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -36,53 +36,65 @@ td {
 td.centered {
   text-align: center;
 }
-tr.wrong td {
+td.wrong {
   background: #ff9a69;
 }
-tr.correct td {
+td.correct {
   background: #d2ffc4;
 }
+td.nopatches {
+  background: #d2ffc4;
+}
+
+td.somepatches {
+  background: #ffd870;
+}
+
+td.lotsofpatches {
+  background: #ff9a69;
+}
 </style>
+<title>Statistics of Buildroot packages</title>
 </head>
 
 <a href=\"#results\">Results</a><br/>
 
 <table>
 <tr>
-<td rowspan=\"2\">Id</td>
-<td rowspan=\"2\">Package</td>
-<td rowspan=\"2\">Patch count</td>
-<td colspan=\"2\" class=\"centered\">autotools-package</td>
-<td colspan=\"2\" class=\"centered\">generic-package</td>
-<td colspan=\"2\" class=\"centered\">cmake-package</td>
-<td colspan=\"2\" class=\"centered\">manual</td>
-<td rowspan=\"2\" class=\"centered\">Actions</td>
+<td>Id</td>
+<td>Package</td>
+<td class=\"centered\">Patch count</td>
+<td class=\"centered\">Infrastructure</td>
+<td class=\"centered\">License</td>
 </tr>
-<tr>
-<td class=\"centered\">host</td>
-<td class=\"centered\">target</td>
-<td class=\"centered\">host</td>
-<td class=\"centered\">target</td>
-<td class=\"centered\">host</td>
-<td class=\"centered\">target</td>
-<td class=\"centered\">host</td>
-<td class=\"centered\">target</td>
-</tr>"
-
-convert_to_generic_target=0
-convert_to_generic_host=0
-convert_to_target_autotools=0
-convert_to_host_autotools=0
+"
+
+autotools_packages=0
+cmake_packages=0
+generic_packages=0
+manual_packages=0
+packages_with_licence=0
+packages_without_licence=0
 total_patch_count=0
 cnt=0
-for i in $(find package/ -name '*.mk') ; do
+
+for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 
     if test \
+	$i = "boot/common.mk" -o \
+	$i = "linux/linux-ext-xenomai.mk" -o \
+	$i = "linux/linux-ext-rtai.mk" -o \
+	$i = "linux/linux-ext-ocf-linux.mk" -o \
 	$i = "package/efl/efl.mk" -o \
 	$i = "package/games/games.mk" -o \
 	$i = "package/gtk2-themes/gtk2-themes.mk" -o \
 	$i = "package/multimedia/multimedia.mk" -o \
-	$i = "package/customize/customize.mk" -o \
+ 	$i = "package/customize/customize.mk" -o \
+ 	$i = "package/pkg-autotools.mk" -o \
+ 	$i = "package/pkg-cmake.mk" -o \
+ 	$i = "package/pkg-generic.mk" -o \
+ 	$i = "package/pkg-utils.mk" -o \
+ 	$i = "package/pkg-download.mk" -o \
 	$i = "package/matchbox/matchbox.mk" -o \
 	$i = "package/x11r7/x11r7.mk" ; then
 	echo "skipping $i" 1>&2
@@ -91,78 +103,67 @@ for i in $(find package/ -name '*.mk') ; do
 
     cnt=$((cnt+1))
 
-    is_auto_host=0
-    is_auto_target=0
-    is_cmake_host=0
-    is_cmake_target=0
-    is_pkg_target=0
-    is_pkg_host=0
-    is_manual_target=0
-    is_manual_host=0
+    hashost=0
+    hastarget=0
 
+    # Determine package infrastructure
     if grep -E "\(host-autotools-package\)" $i > /dev/null ; then
-	is_auto_host=1
+	infratype="autotools"
+	hashost=1
     fi
 
     if grep -E "\(autotools-package\)" $i > /dev/null ; then
-	is_auto_target=1
+	infratype="autotools"
+	hastarget=1
     fi
 
     if grep -E "\(host-generic-package\)" $i > /dev/null ; then
-	is_pkg_host=1
+	infratype="generic"
+	hashost=1
     fi
 
     if grep -E "\(generic-package\)" $i > /dev/null ; then
-	is_pkg_target=1
+	infratype="generic"
+	hastarget=1
     fi
 
     if grep -E "\(host-cmake-package\)" $i > /dev/null ; then
-	is_cmake_host=1
+	infratype="cmake"
+	hashost=1
     fi
 
     if grep -E "\(cmake-package\)" $i > /dev/null ; then
-	is_cmake_target=1
+	infratype="cmake"
+	hastarget=1
     fi
 
     pkg=$(basename $i)
     pkg=${pkg%.mk}
+    pkgvariable=$(echo ${pkg} | tr "a-z-" "A-Z_")
 
-    if grep "^host-$pkg:" $i > /dev/null ; then
-	is_manual_host=1
-    fi
-
-    if test $is_pkg_target -eq 0 -a $is_auto_target -eq 0 -a $is_cmake_target -eq 0; then
-	is_manual_target=1
-    fi
-
-    tasks=""
-
-    if [ $is_manual_target -eq 1 ] ; then
-	if grep "/configure" $i > /dev/null ; then
-	    tasks=$tasks"<li>convert package to autotools ?</li>"
-	    convert_to_target_autotools=$((convert_to_target_autotools+1))
-	else
-	    tasks=$tasks"<li>convert to generic target</li>"
-	    convert_to_generic_target=$((convert_to_generic_target+1))
-	fi
-    fi
 
-    if [ $is_manual_host -eq 1 ]; then
-	if grep "/configure" $i > /dev/null ; then
-	    tasks=$tasks"<li>convert package to autotools ?</li>"
-	    convert_to_host_autotools=$((convert_to_host_autotools+1))
-	else
-	    tasks=$tasks"<li>convert to generic host</li>"
-	    convert_to_generic_host=$((convert_to_generic_host+1))
-	fi
+    # Count packages per infrastructure
+    if [ -z ${infratype} ] ; then
+	infratype="manual"
+	manual_packages=$(($manual_packages+1))
+    elif [ ${infratype} = "autotools" ]; then
+	autotools_packages=$(($autotools_packages+1))
+    elif [ ${infratype} = "cmake" ]; then
+	cmake_packages=$(($cmake_packages+1))
+    elif [ ${infratype} = "generic" ]; then
+	generic_packages=$(($generic_packages+1))
     fi
 
-    if test -n "$tasks" ; then
-	echo "<tr class=\"wrong\">"
+    if grep -qE "^${pkgvariable}_LICENSE =" $i ; then
+	packages_with_license=$(($packages_with_license+1))
+	license=1
     else
-	echo "<tr class=\"correct\">"
+	packages_without_license=$(($packages_without_license+1))
+	license=0
     fi
 
+    echo "<tr>"
+
     echo "<td>$cnt</td>"
     echo "<td>$i</td>"
 
@@ -171,86 +172,37 @@ for i in $(find package/ -name '*.mk') ; do
     total_patch_count=$(($total_patch_count+$patch_count))
 
     if test $patch_count -lt 1 ; then
-	patch_count_color="#00ff00"
+	patch_count_class="nopatches"
     elif test $patch_count -lt 5 ; then
-	patch_count_color="#ffc600"
-    else
-	patch_count_color="#ff0000"
-    fi
-
-    echo "<td class=\"centered\" style=\"color: $patch_count_color; font-weight: bold;\">"
-    echo $patch_count
-    echo "</td>"
-
-    echo "<td class=\"centered\">"
-    if [ $is_auto_host -eq 1 ] ; then
-	echo "<b>YES</b>"
+	patch_count_class="somepatches"
     else
-	echo "NO"
+	patch_count_class="lotsofpatches"
     fi
-    echo "</td>"
 
-    echo "<td class=\"centered\">"
-    if [ $is_auto_target -eq 1 ] ; then
-	echo "<b>YES</b>"
-    else
-	echo "NO"
-    fi
+    echo "<td class=\"centered ${patch_count_class}\">"
+    echo "<b>$patch_count</b>"
     echo "</td>"
 
-    echo "<td class=\"centered\">"
-    if [ $is_pkg_host -eq 1 ] ; then
-	echo "<b>YES</b>"
+    if [ ${infratype} = "manual" ] ; then
+	echo "<td class=\"centered wrong\"><b>manual</b></td>"
     else
-	echo "NO"
-    fi
-    echo "</td>"
-
-    echo "<td class=\"centered\">"
-    if [ $is_pkg_target -eq 1 ] ; then
-	echo "<b>YES</b>"
-    else
-	echo "NO"
-    fi
-    echo "</td>"
-
-    echo "<td class=\"centered\">"
-    if [ $is_cmake_host -eq 1 ] ; then
-	echo "<b>YES</b>"
-    else
-	echo "NO"
-    fi
-    echo "</td>"
-
-    echo "<td class=\"centered\">"
-    if [ $is_cmake_target -eq 1 ] ; then
-	echo "<b>YES</b>"
-    else
-	echo "NO"
-    fi
-    echo "</td>"
-
-    echo "<td class=\"centered\">"
-    if [ $is_manual_host -eq 1 ] ; then
-	echo "<b>YES</b>"
-    else
-	echo "NO"
+	echo "<td class=\"centered correct\">"
+	echo "<b>${infratype}</b><br/>"
+	if [ ${hashost} -eq 1 -a ${hastarget} -eq 1 ]; then
+	    echo "target + host"
+	elif [ ${hashost} -eq 1 ]; then
+	    echo "host"
+	else
+	    echo "target"
+	fi
+	echo "</td>"
     fi
-    echo "</td>"
 
-    echo "<td class=\"centered\">"
-    if [ $is_manual_target -eq 1 ] ; then
-	echo "<b>YES</b>"
+    if [ ${license} -eq 0 ] ; then
+	echo "<td class=\"centered wrong\">No</td>"
     else
-	echo "NO"
+	echo "<td class=\"centered correct\">Yes</td>"
     fi
-    echo "</td>"
-
-    echo "<td>"
-    echo "<ul>"
-    echo $tasks
-    echo "</ul>"
-    echo "</td>"
 
     echo "</tr>"
 
@@ -259,20 +211,28 @@ echo "</table>"
 
 echo "<table>"
 echo "<tr>"
-echo "<td>Packages to convert to generic target</td>"
-echo "<td>$convert_to_generic_target</td>"
+echo "<td>Packages using the <i>generic</i> infrastructure</td>"
+echo "<td>$generic_packages</td>"
+echo "</tr>"
+echo "<tr>"
+echo "<td>Packages using the <i>cmake</i> infrastructure</td>"
+echo "<td>$cmake_packages</td>"
 echo "</tr>"
 echo "<tr>"
-echo "<td>Packages to convert to generic host</td>"
-echo "<td>$convert_to_generic_host</td>"
+echo "<td>Packages using the <i>autotools</i> infrastructure</td>"
+echo "<td>$autotools_packages</td>"
 echo "</tr>"
 echo "<tr>"
-echo "<td>Packages to convert to target autotools</td>"
-echo "<td>$convert_to_target_autotools</td>"
+echo "<td>Packages not using any infrastructure</td>"
+echo "<td>$manual_packages</td>"
 echo "</tr>"
 echo "<tr>"
-echo "<td>Packages to convert to host autotools</td>"
-echo "<td>$convert_to_host_autotools</td>"
+echo "<td>Packages having license information</td>"
+echo "<td>$packages_with_license</td>"
+echo "</tr>"
+echo "<tr>"
+echo "<td>Packages not having licence information</td>"
+echo "<td>$packages_without_license</td>"
 echo "</tr>"
 echo "<tr>"
 echo "<td>Number of patches in all packages</td>"
@@ -283,3 +243,8 @@ echo "<td>TOTAL</td>"
 echo "<td>$cnt</td>"
 echo "</tr>"
 echo "</table>"
+
+echo "<hr/>"
+echo "<i>Updated on $(LANG=C date), Git commit $(git log master -n 1 --pretty=format:%H)</i>"
+echo "</body>"
+echo "</html>"
\ No newline at end of file
