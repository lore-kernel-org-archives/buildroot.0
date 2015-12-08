From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  8 Dec 2015 23:27:56 +0100
Subject: [Buildroot] [PATCH 1/2 v2] apply-patches: only use first field of
	line for series file
In-Reply-To: <cover.1449613577.git.yann.morin.1998@free.fr>
References: <cover.1449613577.git.yann.morin.1998@free.fr>
Message-ID: <aed789ed32d5218482a5850d86daa74747f10318.1449613577.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ryan Barnett <ryanbarnett3@gmail.com>

A series file for quilt has a valid syntax of:

  fixes/autoconf.diff -p1
  fixes/doc-html-local-css.diff -p1
  fixes/gnu-inline.diff -p1

However, with the current way that a series file is handled, it will
error out because the -p1 is tried as a file. This is because in the
for loop that iterates the files, we only look for comment lines. Then
each line is used within a bash for loop which uses spaces a
delimiter. In order to fix this, we should only use the string that
comes before a space in the series file.

Note that the format allows for any arbitrary depth to the -pN field.
But since we'll have only one package with -pN fields, and all will be
-p1, we for now always assume -p1. This will have to be fixed whenever
we get a package with other values.

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
[yann.morin.1998 at free.fr: expand comment about the format of a series
file and how we interpret it]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
CC: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
  - adopted by Yann by lack of time from Ryan
  - expand comment
  - fix commit log (we filter out comment lines, not invalid lines)
---
 support/scripts/apply-patches.sh | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 2edf054..aa13e88 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -115,7 +115,13 @@ function scan_patchdir {
     # If there is a series file, use it instead of using ls sort order
     # to apply patches. Skip line starting with a dash.
     if [ -e "${path}/series" ] ; then
-        for i in `grep -Ev "^#" ${path}/series 2> /dev/null` ; do
+        # The format of a series file accepts a second field that is
+        # used to specify the number of directory components to strip
+        # when applying the patch, in the form -pN (N an integer >= 0)
+        # We assume this field to always be -p1 whether it is present
+        # or missing.
+        series_patches="`grep -Ev "^#" ${path}/series | cut -d ' ' -f1 2> /dev/null`"
+        for i in $series_patches; do
             apply_patch "$path" "$i" series
         done
     else
-- 
1.9.1
