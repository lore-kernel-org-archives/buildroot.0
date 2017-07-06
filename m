From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 21:38:43 +0200
Subject: [Buildroot] [git commit] pkg-stats: allow to sort by column
Message-ID: <20170706195001.750217FBDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f762fb620f440a72af128b3455df3897d06fba1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With 2000+ packages it's not trivial to identify i.e.:
- all packages that don't have a hash file;
- all packages that have patches;
- all packages that have code style warnings;

User experience can be improved by dynamically sorting the resulting
table.

There is an open-source solution that does that in the client-side and
requires minimal changes to our script: sorttable.js.  The script is
MIT licensed as stated in its website.

Also add a hint to the user that the table can be sorted.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/pkg-stats | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 1956941..95a8afc 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -26,6 +26,7 @@
 #
 
 echo "<head>
+<script src=\"https://www.kryogenix.org/code/browser/sorttable/sorttable.js\"></script>
 <style type=\"text/css\">
 table {
   width: 100%;
@@ -59,7 +60,9 @@ td.lotsofpatches {
 
 <a href=\"#results\">Results</a><br/>
 
-<table>
+<p id=\"sortable_hint\"></p>
+
+<table class=\"sortable\">
 <tr>
 <td>Id</td>
 <td>Package</td>
@@ -428,4 +431,12 @@ echo "</table>"
 echo "<hr/>"
 echo "<i>Updated on $(LANG=C date), Git commit $(git log master -n 1 --pretty=format:%H)</i>"
 echo "</body>"
+
+echo "<script>
+if (typeof sorttable === \"object\") {
+  document.getElementById(\"sortable_hint\").innerHTML =
+  \"hint: the table can be sorted by clicking the column headers\"
+}
+</script>
+"
 echo "</html>"
