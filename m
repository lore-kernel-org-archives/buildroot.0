From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Wed, 25 Jan 2012 17:33:47 +0100
Subject: [Buildroot] [PATCH 1/1] apply-patches.sh: check if there are
	rejects before applying patches
Message-ID: <96c0ec6a36f4772d4182be934a4e8675ccdf3a0e.1327508994.git.ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/apply-patches.sh |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 1aef47e..4763106 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -19,6 +19,11 @@ if [ ! -d "${patchdir}" ] ; then
     echo "Aborting.  '${patchdir}' is not a directory."
     exit 1
 fi
+
+# Check for rejects because if there are some, even if patches are well
+# applied, at the end it will complain about rejects into targetdir.
+if [ "`find ${targetdir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
+	echo "There are remaining reject files into ${targetdir}, please delete them."
     
 for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do 
     apply="patch -g0 -p1 -E -d"
-- 
1.7.5.4
