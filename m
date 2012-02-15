From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Thu, 16 Feb 2012 00:09:59 +0100
Subject: [Buildroot] [RFC PATCH v2 6/6] apply-patches.sh: change archive
	management
In-Reply-To: <20120215165405.GJ4723@ldesroches-Latitude-E6320>
References: <20120215165405.GJ4723@ldesroches-Latitude-E6320>
Message-ID: <1329347399-25541-1-git-send-email-ludovic.desroches@atmel.com>
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
 support/scripts/apply-patches.sh |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index d239943..a075afd 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -41,10 +41,6 @@ function apply_patch {
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
@@ -66,6 +62,12 @@ function scan_patchdir {
     for i in `cd $path; ls -d $patches 2> /dev/null` ; do
         if [ -d "${path}/$i" ] ; then
 	    scan_patchdir "${path}/$i"
+	elif echo "$i" | grep -q -E "\.tar(\..*)?$|\.tbz2?$|\.tgz$" ; then
+            unpackedarchivedir="$builddir/.patches-$(basename $i)-unpacked"
+	    rm -rf "$unpackedarchivedir" 2> /dev/null
+	    mkdir "$unpackedarchivedir"
+	    tar -C "$unpackedarchivedir" --strip-components=1 -xaf "${path}/$i"
+	    scan_patchdir "$unpackedarchivedir"
         else
             apply_patch "$path" "$i" || exit 1
         fi
-- 
1.7.5.4
