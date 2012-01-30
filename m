From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Mon, 30 Jan 2012 13:00:21 +0100
Subject: [Buildroot] [PATCH v2 1/1] apply-patches.sh: check if there are
	rejects before applying patches
In-Reply-To: <96c0ec6a36f4772d4182be934a4e8675ccdf3a0e.1327508994.git.ludovic.desroches@atmel.com>
References: <96c0ec6a36f4772d4182be934a4e8675ccdf3a0e.1327508994.git.ludovic.desroches@atmel.com>
Message-ID: <1327924821-24628-1-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

Sorry missing fi into previous patch.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/apply-patches.sh |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 1aef47e..1ad7d1f 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -19,6 +19,12 @@ if [ ! -d "${patchdir}" ] ; then
     echo "Aborting.  '${patchdir}' is not a directory."
     exit 1
 fi
+
+# Check for rejects because if there are some, even if patches are well
+# applied, at the end it will complain about rejects into targetdir.
+if [ "`find ${targetdir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
+	echo "There are remaining reject files into ${targetdir}, please delete them."
+fi
     
 for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do 
     apply="patch -g0 -p1 -E -d"
-- 
1.7.5.4
