From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed,  5 Jul 2017 22:36:31 -0300
Subject: [Buildroot] [PATCH v3] pkg-stats: allow to sort by column
In-Reply-To: <20170701043555.25851-1-ricardo.martincoski@gmail.com>
References: <20170701043555.25851-1-ricardo.martincoski@gmail.com>
Message-ID: <20170706013631.19238-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With 2000+ packages it's not trivial to identify i.e.:
- all packages that don't have a hash file;
- all packages that have patches;
- all packages that have code style warnings;

User experience can be improved by dynamically sorting the resulting
table.

There is an open-source solution that does that in the client-side and
requires minimal changes to our script: sorttable.js.
The script is MIT licensed as stated in its website.

Include instructions to download the third-party script and adapt our
script accordingly, following the example in the tool's website.

Also add a hint to the user that the table can be sorted.
Display the hint when all these conditions are met:
- the browser has JavaScript support enabled;
- the sorttable.js script is loaded;
- the page is loaded.

Usage (static table):
./support/scripts/pkg-stats > /tmp/pkg.html

Usage (sortable table):
./support/scripts/pkg-stats > /tmp/pkg.html
wget https://www.kryogenix.org/code/browser/sorttable/sorttable.js \
  -O /tmp/sorttable.js
Open /tmp/pkg.html using a JavaScript-enabled web browser and click on
the headers of the table to sort it.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
Changes v2 -> v3:
  - use 'wget -O' instead of 'wget -O - >' (Arnout);
  - add a hint to the user that the table can be sorted (Arnout);
  - improve commit message (based on Arnout's question about sourcing
    from upstream URL);
Changes v1 -> v2:
  - point to the file to download instead of adding it to the git tree;
  - minor improvements to the commit message;

TESTS
The downloaded .js file I tested has this md5:
3809d26cbae145842e56f374192e56d9

I tested the output html with and without the .js file using:
Mozilla Firefox 54.0
Chromium 58.0.3029.110
Microsoft Edge 25.10586.672.0

I tested that the output html displays the hint above the table only
when JavaScript is enabled using the QuickJava add-on for Firefox.
---
 support/scripts/pkg-stats | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 1956941f37..15b957c1ea 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -24,8 +24,13 @@
 #
 #  ./support/scripts/pkg-stats > /tmp/pkg.html
 #
+# If you want the table to be sortable also install this 3rd-party JavaScript:
+#
+#  wget https://www.kryogenix.org/code/browser/sorttable/sorttable.js \
+#    -O /tmp/sorttable.js
 
 echo "<head>
+<script src=\"sorttable.js\"></script>
 <style type=\"text/css\">
 table {
   width: 100%;
@@ -59,7 +64,9 @@ td.lotsofpatches {
 
 <a href=\"#results\">Results</a><br/>
 
-<table>
+<p id=\"sortable_hint\"></p>
+
+<table class=\"sortable\">
 <tr>
 <td>Id</td>
 <td>Package</td>
@@ -428,4 +435,12 @@ echo "</table>"
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
-- 
2.11.0
