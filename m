From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Fri,  6 Jan 2012 13:47:02 +0100
Subject: [Buildroot] [RFC PATCH v3 2/2] apply-patches.sh check if they are
	rejects before applying patches
In-Reply-To: <1325854022-32258-1-git-send-email-ludovic.desroches@atmel.com>
References: <201106290542.26383.minimod@morethan.org>
 <1325854022-32258-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <55a000639a0ddd382ee3b94f1d440f060f0c40f9.1325851860.git.ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

If we don't do it, the rejects' check at the end of the script can complain
about rejects not deleted by the user from a previous try.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 support/scripts/apply-patches.sh |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 0492e01..4dafacb 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -63,6 +63,13 @@ if [ ! -d "${builddir}" ] ; then
 	echo "Aborting: ${builddir} is not a directory."
 	exit 1
 fi
+# check for rejects because if there are some, even if patches are well
+# applied, at the end it will complain about rejects into buildir
+if [ "`find ${builddir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
+    echo "There are remaining rejecting file into ${buildir}, please delete them"
+    exit 1
+fi
+
 
 # parse patch list, extract archives, apply patches
 for i in $patchlist ; do
-- 
1.7.5.4
