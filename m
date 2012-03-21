From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Wed, 21 Mar 2012 14:26:27 +0100
Subject: [Buildroot] [PATCH] apply-patches.sh: add recursivity when scanning
	patchdir
In-Reply-To: <1332336387-3434-1-git-send-email-ludovic.desroches@atmel.com>
References: <87k42e5nt8.fsf@macbook.be.48ers.dk>
 <1332336387-3434-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <1332336387-3434-2-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

Recursivity is needed with some tarballs containing debian patches:
.
  debian
    changelog
    control
    patches
      02-COPYRIGHT.patch
[...]

Since we can find some files which are not patches in those directories, only
consider .patch* and .diff* files as valid patches.
Due to recursivity, strip-components option is no more necessary so it has
been removed.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 support/scripts/apply-patches.sh |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 968e2a4..e4b98bc 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -40,8 +40,14 @@ function apply_patch {
 	type="zip"; uncomp="unzip -d"; ;; 
 	*.Z)
 	type="compress"; uncomp="uncompress -c"; ;; 
+	*.diff*)
+	type="diff"; uncomp="cat"; ;;
+	*.patch*)
+	type="patch"; uncomp="cat"; ;;
 	*)
-	type="plaintext"; uncomp="cat"; ;; 
+	echo "Unsupported format file for ${patch}, skip it";
+	return 0;
+	;;
     esac
     echo ""
     echo "Applying $patch using ${type}: "
@@ -67,12 +73,12 @@ function scan_patchdir {
     else
         for i in `cd $path; ls -d $patches 2> /dev/null` ; do
             if [ -d "${path}/$i" ] ; then
-                echo "${path}/$i skipped"
+                scan_patchdir "${path}/$i"
             elif echo "$i" | grep -q -E "\.tar(\..*)?$|\.tbz2?$|\.tgz$" ; then
                 unpackedarchivedir="$builddir/.patches-$(basename $i)-unpacked"
                 rm -rf "$unpackedarchivedir" 2> /dev/null
                 mkdir "$unpackedarchivedir"
-                tar -C "$unpackedarchivedir" --strip-components=1 -xaf "${path}/$i"
+                tar -C "$unpackedarchivedir" -xaf "${path}/$i"
                 scan_patchdir "$unpackedarchivedir"
             else
                 apply_patch "$path" "$i" || exit 1
-- 
1.7.5.4
