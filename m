From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  6 Jul 2014 23:27:12 +0200
Subject: [Buildroot] [PATCH 1/5] support/download: fix the bzr helper
In-Reply-To: <cover.1404681878.git.yann.morin.1998@free.fr>
References: <cover.1404681878.git.yann.morin.1998@free.fr>
Message-ID: <7397ced020b7a64534c6a240304998d2bf11c961.1404681878.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bzr uses the name of the extension of the output file to known what
output format to use: tar, tgz, tar.bz2... If no extension is
recognised, bzr will output to a directory.

Since we use 'mktemp .XXXXXX' to generate temporary files, it obviously
never ends with a recognised extension. Thus, bzr expects the output to
be a directory, and fails since it is a file.

Fix that by forcing the output format.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/download/bzr | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/bzr b/support/download/bzr
index 3f52ee9..19d837d 100755
--- a/support/download/bzr
+++ b/support/download/bzr
@@ -26,7 +26,7 @@ tmp_output="$( mktemp "${output}.XXXXXX" )"
 # - finally, we atomically rename to the final file
 
 ret=1
-if ${BZR} export "${tmp_dl}" "${repo}" -r "${rev}"; then
+if ${BZR} export --format=tgz "${tmp_dl}" "${repo}" -r "${rev}"; then
     if mv "${tmp_dl}" "${tmp_output}"; then
         mv "${tmp_output}" "${output}"
         ret=0
-- 
1.9.1
