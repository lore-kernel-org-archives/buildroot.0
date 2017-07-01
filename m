From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat,  1 Jul 2017 01:35:55 -0300
Subject: [Buildroot] [RFC PATCH v2] pkg-stats: allow to sort by column
In-Reply-To: <20170630212442.9565-1-ricardo.martincoski@gmail.com>
References: <20170630212442.9565-1-ricardo.martincoski@gmail.com>
Message-ID: <20170701043555.25851-1-ricardo.martincoski@gmail.com>
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
script accordingly.

Usage (static table):
./support/scripts/pkg-stats > /tmp/pkg.html

Usage (sortable table):
./support/scripts/pkg-stats > /tmp/pkg.html
wget -O - https://www.kryogenix.org/code/browser/sorttable/sorttable.js\
  > /tmp/sorttable.js
Open /tmp/pkg.html using a JavaScript-enabled web browser and click on
the headers of the table to sort it.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
  - point to the file to download instead of adding it to the git tree;
  - minor improvements to the commit message;

Lots of doubts:

USEFULNESS
Do anyone else think this is useful? If not, please feel free to mark it
as Rejected.

LICENSE
I trusted both the header that uses the alternate name X11 for the MIT
license (the source file is 10 years old) and links to the website, and
the website that says MIT.
I don't know the author.
I didn't contact the author directly. Should I?

The license text seems equivalent to me:
https://kryogenix.org/code/browser/licence.html
https://spdx.org/licenses/MIT.html
but it does not include this sentence:
"The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software."

HOW TO HOST IT
Also I am not sure if the JavaScript file should be placed in the git
tree or not. It just needs to be present in the same directory as the
*output* of the script in order to turn the table sortable.
We would need to host a copy in the same server as [1].
[1] http://autobuild.buildroot.net/stats/

TESTS
The downloaded .js file I tested has this md5:
3809d26cbae145842e56f374192e56d9
I tested the output html with and without the .js file using:
Mozilla Firefox 54.0
Chromium 58.0.3029.110
Microsoft Edge 25.10586.672.0

PATCH
The JavaScript file has some special characters in line 172.
While using git-send-email 2.11.0 to send v1 I got this warning:
>The following files are 8bit, but do not declare a Content-Transfer-Encoding.
>    outgoing/0001-pkg-stats-allow-to-sort-by-column.patch
>Which 8bit encoding should I declare [UTF-8]?
and I accepted the default value. Patchwork seems to refuse the patch.
---
 support/scripts/pkg-stats | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 4cf1f82518..e2162d2381 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -24,8 +24,13 @@
 #
 #  ./support/scripts/pkg-stats > /tmp/pkg.html
 #
+# If you want the table to be sortable also install this 3rd-party JavaScript:
+#
+#  wget -O - https://www.kryogenix.org/code/browser/sorttable/sorttable.js \
+#    > /tmp/sorttable.js
 
 echo "<head>
+<script src=\"sorttable.js\"></script>
 <style type=\"text/css\">
 table {
   width: 100%;
@@ -59,7 +64,7 @@ td.lotsofpatches {
 
 <a href=\"#results\">Results</a><br/>
 
-<table>
+<table class=\"sortable\">
 <tr>
 <td>Id</td>
 <td>Package</td>
-- 
2.11.0
