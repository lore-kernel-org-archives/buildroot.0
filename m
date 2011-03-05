From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2011 15:37:16 +0100
Subject: [Buildroot] [git commit master 1/1] pkg-stats: add statistics about
	number of patches per package
Message-ID: <20110305143807.743BC8E327@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b927b5f3020918b574474b5fd80969fad023a837
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 scripts/pkg-stats |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/scripts/pkg-stats b/scripts/pkg-stats
index 9607da2..7bb2928 100755
--- a/scripts/pkg-stats
+++ b/scripts/pkg-stats
@@ -51,6 +51,7 @@ tr.correct td {
 <tr>
 <td rowspan=\"2\">Id</td>
 <td rowspan=\"2\">Package</td>
+<td>Patch count</td>
 <td colspan=\"2\" class=\"centered\">AUTOTARGETS</td>
 <td colspan=\"2\" class=\"centered\">GENTARGETS</td>
 <td colspan=\"2\" class=\"centered\">CMAKETARGETS</td>
@@ -71,6 +72,7 @@ tr.correct td {
 convert_to_generic_target=0
 convert_to_generic_host=0
 convert_to_autotools=0
+total_patch_count=0
 cnt=1
 for i in $(find package/ -name '*.mk') ; do
 
@@ -163,6 +165,22 @@ for i in $(find package/ -name '*.mk') ; do
     echo "<td>$cnt</td>"
     echo "<td>$i</td>"
 
+    package_dir=$(dirname $i)
+    patch_count=$(find ${package_dir} -name '*.patch' | wc -l)
+    total_patch_count=$(($total_patch_count+$patch_count))
+
+    if test $patch_count -lt 1 ; then
+	patch_count_color="#00ff00"
+    elif test $patch_count -lt 5 ; then
+	patch_count_color="#ffc600"
+    else
+	patch_count_color="#ff0000"
+    fi
+
+    echo "<td class=\"centered\" style=\"color: $patch_count_color; font-weight: bold;\">"
+    echo $patch_count
+    echo "</td>"
+
     echo "<td class=\"centered\">"
     if [ $is_auto_host -eq 1 ] ; then
 	echo "<b>YES</b>"
@@ -256,6 +274,10 @@ echo "<td>Packages to convert to host autotools</td>"
 echo "<td>$convert_to_host_autotools</td>"
 echo "</tr>"
 echo "<tr>"
+echo "<td>Number of patches in all packages</td>"
+echo "<td>$total_patch_count</td>"
+echo "</tr>"
+echo "<tr>"
 echo "<td>TOTAL</td>"
 echo "<td>$cnt</td>"
 echo "</tr>"
-- 
1.7.3.4
