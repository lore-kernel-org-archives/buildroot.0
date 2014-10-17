From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Oct 2014 15:34:12 +0200
Subject: [Buildroot] [PATCH] pkg-stats: add statistics about hash files
Message-ID: <1413552852-28279-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed during the Buildroot meeting, this commit extends the
pkg-stats script to include statistics about the number of packages
having vs. not having the hash file.

As of today, we have 104 packages with the hash file, and 1274
packages without.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/pkg-stats | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index f5d6ec8..f6d10bb 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -67,6 +67,7 @@ td.lotsofpatches {
 <td class=\"centered\">Infrastructure</td>
 <td class=\"centered\">License</td>
 <td class=\"centered\">License files</td>
+<td class=\"centered\">Hash file</td>
 </tr>
 "
 
@@ -82,6 +83,8 @@ packages_with_licence=0
 packages_without_licence=0
 packages_with_license_files=0
 packages_without_license_files=0
+packages_with_hash_file=0
+packages_without_hash_file=0
 total_patch_count=0
 cnt=0
 
@@ -191,6 +194,7 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
     fi
 
     pkg=$(basename $i)
+    dir=$(dirname $i)
     pkg=${pkg%.mk}
     pkgvariable=$(echo ${pkg} | tr "a-z-" "A-Z_")
 
@@ -231,6 +235,14 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	license_files=0
     fi
 
+    if test -f ${dir}/${pkg}.hash; then
+	packages_with_hash_file=$(($packages_with_hash_file+1))
+	hash_file=1
+    else
+	packages_without_hash_file=$(($packages_without_hash_file+1))
+	hash_file=0
+    fi
+
     echo "<tr>"
 
     echo "<td>$cnt</td>"
@@ -279,6 +291,12 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	echo "<td class=\"centered correct\">Yes</td>"
     fi
 
+    if [ ${hash_file} -eq 0 ] ; then
+	echo "<td class=\"centered wrong\">No</td>"
+    else
+	echo "<td class=\"centered correct\">Yes</td>"
+    fi
+
     echo "</tr>"
 
 done
@@ -335,6 +353,14 @@ echo "<td>Packages not having licence files information</td>"
 echo "<td>$packages_without_license_files</td>"
 echo "</tr>"
 echo "<tr>"
+echo "<td>Packages having hash file</td>"
+echo "<td>$packages_with_hash_file</td>"
+echo "</tr>"
+echo "<tr>"
+echo "<td>Packages not having hash file</td>"
+echo "<td>$packages_without_hash_file</td>"
+echo "</tr>"
+echo "<tr>"
 echo "<td>Number of patches in all packages</td>"
 echo "<td>$total_patch_count</td>"
 echo "</tr>"
-- 
2.0.0
