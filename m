From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Wed, 14 Mar 2012 16:33:52 +0100
Subject: [Buildroot] [PATCH 1/6] apply-patches.sh: check if there are
	rejects before applying patches
In-Reply-To: <1331739237-29872-1-git-send-email-ludovic.desroches@atmel.com>
References: <20120314120310.13e0ea3a@skate>
 <1331739237-29872-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <1331739237-29872-2-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Tested-by: Ludovic Desroches <ludovic.desroches@atmel.com>
with an armadeus_apf9328_defconfig build
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/apply-patches.sh |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 1aef47e..b145b46 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -19,6 +19,13 @@ if [ ! -d "${patchdir}" ] ; then
     echo "Aborting.  '${patchdir}' is not a directory."
     exit 1
 fi
+
+# Check for rejects because if there are some, even if patches are well
+# applied, at the end it will complain about rejects into targetdir.
+if [ "`find ${targetdir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
+	rm -f "${targetdir}/*.rej" 2> /dev/null
+	echo "Remaining reject files in ${targetdir} have been removed"
+fi
     
 for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do 
     apply="patch -g0 -p1 -E -d"
-- 
1.7.5.4
