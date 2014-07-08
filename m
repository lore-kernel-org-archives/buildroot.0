From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jul 2014 10:53:39 +0200
Subject: [Buildroot] [git commit] support/download: fix the bzr helper
Message-ID: <20140708085415.F22419D0C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=84d798694090725eda9e9df37cbb4ba09b631d3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bzr uses the name of the extension of the output file to known what
output format to use: tar, tgz, tar.bz2... If no extension is
recognised, bzr will output to a directory.

Since we use 'mktemp .XXXXXX' to generate temporary files, it obviously
never ends with a recognised extension. Thus, bzr expects the output to
be a directory, and fails since it is a file.

Fix that by forcing the output format.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/download/bzr |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
