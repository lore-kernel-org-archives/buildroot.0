From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Mon,  6 Feb 2012 02:47:19 +0100
Subject: [Buildroot] [RFC PATCH 6/6] apply-patches.sh: change archive
	management
In-Reply-To: <1328492839-13657-1-git-send-email-ludovic.desroches@atmel.com>
References: <1328492839-13657-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <76267ac6ba3ddac4379b9896f72875dedd455ebd.1328492511.git.ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

The way archives were managed was incorrect because the uncompressed archives
were sent directly to patch command. It means that alphabetical patch orderwas
not respected.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 support/scripts/apply-patches.sh |   15 +++++++++++----
 1 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 3a73ab9..9c2fbb3 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -25,10 +25,6 @@ function apply_patch {
 	type="zip"; uncomp="unzip -d"; ;; 
 	*.Z)
 	type="compress"; uncomp="uncompress -c"; ;; 
-	*.tgz)
-	type="tar gzip"; uncomp="gunzip -dc"; apply="tar xvf - -C"; ;; 
-	*.tar)
-	type="tar"; uncomp="cat"; apply="tar xvf - -C"; ;; 
 	*)
 	type="plaintext"; uncomp="cat"; ;; 
     esac
@@ -50,6 +46,17 @@ function scan_patchdir {
     for i in `cd $path; ls -d $patches 2> /dev/null` ; do
         if [ -d "${path}/$i" ] ; then
 	    scan_patchdir "${path}/$i"
+	elif echo "$i" | grep -q -E "tar\.bz$|tbz$|tar.\bz2$|tbz2$|tar\.gz$|tgz$" ; then
+            unpackedarchivedir="$builddir/.patches-$(basename $i)-unpacked"
+	    rm -rf "$unpackedarchivedir" 2> /dev/null
+	    mkdir "$unpackedarchivedir"
+	    if echo "$i" | grep "tar\.bz$|tbz$|tar\.bz2$|.tbz2$" ; then
+	        tar_options="-xjf"
+	    else
+	        tar_options="-xzf"
+	    fi
+	    tar -C "$unpackedarchivedir" --strip-components=1 $tar_options "${path}/$i"
+	    scan_patchdir "$unpackedarchivedir"
         else
             apply_patch "$path" "$i" || exit 1
         fi
-- 
1.7.5.4
