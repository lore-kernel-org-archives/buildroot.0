From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Aug 2012 11:50:10 +0200
Subject: [Buildroot] [git commit] pkg-stats: statistics about license files
	information
Message-ID: <20120805095159.17D949702E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58dbdce29eaacd8a7d5bbc2eb6eebcd29efa7052
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since on some packages we are adding <pkg>_LICENSE but not necessarily
<pkg>_LICENSE_FILES, let's add a separate statistic to track these
informations. This will allow us to improve both the number of
packages covered by <pkg>_LICENSE and <pkg>_LICENSE_FILES.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/pkg-stats |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index a07af55..9c8ec49 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -66,6 +66,7 @@ td.lotsofpatches {
 <td class=\"centered\">Patch count</td>
 <td class=\"centered\">Infrastructure</td>
 <td class=\"centered\">License</td>
+<td class=\"centered\">License files</td>
 </tr>
 "
 
@@ -75,6 +76,8 @@ generic_packages=0
 manual_packages=0
 packages_with_licence=0
 packages_without_licence=0
+packages_with_license_files=0
+packages_without_license_files=0
 total_patch_count=0
 cnt=0
 
@@ -163,6 +166,14 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	license=0
     fi
 
+    if grep -qE "^${pkgvariable}_LICENSE_FILES[ ]*=" $i ; then
+	packages_with_license_files=$(($packages_with_license_files+1))
+	license_files=1
+    else
+	packages_without_license_files=$(($packages_without_license_files+1))
+	license_files=0
+    fi
+
     echo "<tr>"
 
     echo "<td>$cnt</td>"
@@ -205,6 +216,12 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	echo "<td class=\"centered correct\">Yes</td>"
     fi
 
+    if [ ${license_files} -eq 0 ] ; then
+	echo "<td class=\"centered wrong\">No</td>"
+    else
+	echo "<td class=\"centered correct\">Yes</td>"
+    fi
+
     echo "</tr>"
 
 done
@@ -236,6 +253,14 @@ echo "<td>Packages not having licence information</td>"
 echo "<td>$packages_without_license</td>"
 echo "</tr>"
 echo "<tr>"
+echo "<td>Packages having license files information</td>"
+echo "<td>$packages_with_license_files</td>"
+echo "</tr>"
+echo "<tr>"
+echo "<td>Packages not having licence files information</td>"
+echo "<td>$packages_without_license_files</td>"
+echo "</tr>"
+echo "<tr>"
 echo "<td>Number of patches in all packages</td>"
 echo "<td>$total_patch_count</td>"
 echo "</tr>"
