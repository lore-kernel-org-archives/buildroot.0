From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jan 2016 21:50:38 +0100
Subject: [Buildroot] [git commit] support/download: generate reproducible Hg
	archives
Message-ID: <20160103210633.69399822D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=76b51f90c0e393349dd0c71d7e6cf82fbc094282
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Tested-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
