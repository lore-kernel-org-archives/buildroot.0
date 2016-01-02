From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  2 Jan 2016 12:35:49 +0100
Subject: [Buildroot] [PATCH] support/download: generate reproducible Hg
	archives
Message-ID: <1451734549-27492-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When hg directly creates the output file, the hash for that file changes
everytime.

However, if we just tell hg to output the archive on stdout and we do
the redirect to the file, then the archive is reproducible.

(The reason is that in the first case, a temporary file is created and
then compressed, and gzip is adding the filename and its timestamp in
the gzip header, while in the second case, there is no temporary file,
and thus no timestamp and thus it is reproducible.)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>

---
Note: Yegor, you'll now be able to use the 'hg' method to download
reproducible archives! Hehe! ;-)
---
 support/download/hg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/hg b/support/download/hg
index 5bdbbc8..25cb4e9 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -35,4 +35,4 @@ _hg clone ${verbose} --noupdate "'${repo}'" "'${basename}'"
 
 _hg archive ${verbose} --repository "'${basename}'" --type tgz \
             --prefix "'${basename}'" --rev "'${cset}'" \
-            "'${output}'"
+            - >"${output}"
-- 
1.9.1
