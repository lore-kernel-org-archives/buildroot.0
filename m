From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 7 Nov 2015 00:27:12 +0100
Subject: [Buildroot] [PATCH] apply-patches.sh: use everything from the
	series file
Message-ID: <1446852432-30582-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a series file exists, we should use every file mentioned in it,
not just the ones ending with .patch or .diff. Also, there's no need
to uncompress anything if it's mentioned in a series file (the tools
that manipulate series files don't support compressed patches).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Doug Kehn <rdkehn@yahoo.com>
---
 support/scripts/apply-patches.sh | 55 ++++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index af6df9e..2edf054 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -16,8 +16,9 @@
 # '*'. Pattern(s) describing the patch names you want to apply.
 #
 # The script will look recursively for patches from the patch directory. If a
-# file is named 'series' then only patches mentionned into it will be applied.
-# If not, the script will look for file names matching pattern(s). If the name
+# file named 'series' exists then the patches mentioned in it will be applied
+# as plain patches, regardless of their file name. If no 'series' file exists,
+# the script will look for file names matching pattern(s). If the name
 # ends with '.tar.*', '.tbz2' or '.tgz', the file is considered as an archive
 # and will be uncompressed into a directory named
 # '.patches-name_of_the_archive-unpacked'. It's the turn of this directory to
@@ -64,28 +65,32 @@ find ${builddir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print0 | \
 function apply_patch {
     path=$1
     patch=$2
-    case "$patch" in
-	*.gz)
-	type="gzip"; uncomp="gunzip -dc"; ;; 
-	*.bz)
-	type="bzip"; uncomp="bunzip -dc"; ;; 
-	*.bz2)
-	type="bzip2"; uncomp="bunzip2 -dc"; ;; 
-	*.xz)
-	type="xz"; uncomp="unxz -dc"; ;;
-	*.zip)
-	type="zip"; uncomp="unzip -d"; ;; 
-	*.Z)
-	type="compress"; uncomp="uncompress -c"; ;; 
-	*.diff*)
-	type="diff"; uncomp="cat"; ;;
-	*.patch*)
-	type="patch"; uncomp="cat"; ;;
-	*)
-	echo "Unsupported file type for ${path}/${patch}, skipping";
-	return 0
-	;;
-    esac
+    if [ "$3" ]; then
+        type="series"; uncomp="cat"
+    else
+        case "$patch" in
+	    *.gz)
+	    type="gzip"; uncomp="gunzip -dc"; ;;
+	    *.bz)
+	    type="bzip"; uncomp="bunzip -dc"; ;;
+	    *.bz2)
+	    type="bzip2"; uncomp="bunzip2 -dc"; ;;
+	    *.xz)
+	    type="xz"; uncomp="unxz -dc"; ;;
+	    *.zip)
+	    type="zip"; uncomp="unzip -d"; ;;
+	    *.Z)
+	    type="compress"; uncomp="uncompress -c"; ;;
+	    *.diff*)
+	    type="diff"; uncomp="cat"; ;;
+	    *.patch*)
+	    type="patch"; uncomp="cat"; ;;
+	    *)
+	    echo "Unsupported file type for ${path}/${patch}, skipping";
+	    return 0
+	    ;;
+        esac
+    fi
     if [ -z "$silent" ] ; then
 	echo ""
 	echo "Applying $patch using ${type}: "
@@ -111,7 +116,7 @@ function scan_patchdir {
     # to apply patches. Skip line starting with a dash.
     if [ -e "${path}/series" ] ; then
         for i in `grep -Ev "^#" ${path}/series 2> /dev/null` ; do
-            apply_patch "$path" "$i"
+            apply_patch "$path" "$i" series
         done
     else
         for i in `cd $path; ls -d $patches 2> /dev/null` ; do
-- 
2.6.2
