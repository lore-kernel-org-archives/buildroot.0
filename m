From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 21:35:33 +0200
Subject: [Buildroot] [git commit] pkg-stats: add new column with
	check-package warnings
Message-ID: <20170408193641.3B8948267C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1e102d1ab0b9179e882c8517a6d1843dd3b954f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This allows the page at http://autobuild.buildroot.net/stats/ to show
how many warnings returned by check-package affect each package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/pkg-stats | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 421fa5c..2870662 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -68,6 +68,7 @@ td.lotsofpatches {
 <td class=\"centered\">License</td>
 <td class=\"centered\">License files</td>
 <td class=\"centered\">Hash file</td>
+<td class=\"centered\">Warnings</td>
 </tr>
 "
 
@@ -323,6 +324,14 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	echo "<td class=\"centered correct\">Yes</td>"
     fi
 
+    file_list=$(find ${package_dir} -name '*.mk' -o -name '*.in*' -o -name '*.hash')
+    nwarnings=$(./support/scripts/check-package ${file_list} 2>&1 | sed '/\([0-9]*\) warnings generated/!d; s//\1/')
+    if [ ${nwarnings} -eq 0 ] ; then
+	echo "<td class=\"centered correct\">${nwarnings}</td>"
+    else
+	echo "<td class=\"centered wrong\">${nwarnings}</td>"
+    fi
+
     echo "</tr>"
 
 done
