From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Fri, 20 Nov 2015 19:45:04 -0600
Subject: [Buildroot] [PATCH v2 1/2] apply-patches: only use first field of
	line for series file
Message-ID: <1448070305-10768-1-git-send-email-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A series file for quilt has a valid syntax of:

  fixes/autoconf.diff -p1
  fixes/doc-html-local-css.diff -p1
  fixes/gnu-inline.diff -p1

However, with the current way that a series file is handled, it will
error out because the -p1 is tried as a file. This is because in the
for loop that iterates the files, we only look for invalid lines. Then
each line is used within a bash for loop which uses spaces a
delimiter. In order to fix this, we should only use the string that
comes before a space in the series file.

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
CC: Arnout Vandecappelle <arnout@mind.be>
---
 support/scripts/apply-patches.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 2edf054..6525f94 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -115,7 +115,10 @@ function scan_patchdir {
     # If there is a series file, use it instead of using ls sort order
     # to apply patches. Skip line starting with a dash.
     if [ -e "${path}/series" ] ; then
-        for i in `grep -Ev "^#" ${path}/series 2> /dev/null` ; do
+        # Some series files for quilt contain a '-p1' at the end, handle this
+        # by only using the first word from series file
+        series_patches="`grep -Ev "^#" ${path}/series | cut -d ' ' -f1 2> /dev/null`"
+        for i in $series_patches; do
             apply_patch "$path" "$i" series
         done
     else
-- 
1.9.1
