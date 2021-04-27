From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 27 Apr 2021 21:45:44 +0200
Subject: [Buildroot] [PATCH] support/download/hg: fix broken method
Message-ID: <20210427194544.15861-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Commit 54d3d94b6e3846447b5796ef8587b08b537cd348 broke the 'hg' download
method, in a similar way as it broke the 'git' download method (later fixed
with commit b70ce5665126246bd6b6bf804c6d9eea1fc599cf), by introducing extra
output on stdout in a case where the output is redirected.

In the case of 'hg', the 'hg archive' step uses shell redirection rather
than directly letting hg write the output file, since commit
76b51f90c0e393349dd0c71d7e6cf82fbc094282.

As a result, the extra print added by the _hg function is prepended to the
actual archive, causing an invalid archive.

Fix by using the _plain_hg function instead. The disadvantage is that the
command for 'hg archive' is no longer printed.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 support/download/hg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/hg b/support/download/hg
index a7542e5c84..768a27e06f 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -45,6 +45,6 @@ _plain_hg() {
 
 _hg clone ${quiet} "${@}" --noupdate "'${uri}'" "'${basename}'"
 
-_hg archive ${quiet} --repository "'${basename}'" --type tgz \
+_plain_hg archive ${quiet} --repository "'${basename}'" --type tgz \
             --prefix "'${basename}'" --rev "'${cset}'" \
             - >"${output}"
-- 
2.26.3
