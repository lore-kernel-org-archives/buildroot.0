From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  2 Jan 2016 16:06:42 +0100
Subject: [Buildroot] [PATCH] support/download: generate reproducible Bazaar
	archives
Message-ID: <1451747202-21873-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similarly to what has previously been done for the Hg download backend,
instruct bzr to generate the archive on stdout, so that we can generate
reproducible archives.

When instructing bzr to generate the output file by itself, it uses a
temporary file that is then fed to gzip, which in turn stores the
timestamp of that file in the generated archive, whereas when the output
is generated on stdout, there is no timestamp, so the archive is then
reproducible.

Bizarely enough, we can tell 'bazaar' not to generate a bazaar in the
archive. Cool, uh? ;-]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/download/bzr | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/download/bzr b/support/download/bzr
index cec9ce8..a8a8887 100755
--- a/support/download/bzr
+++ b/support/download/bzr
@@ -32,4 +32,6 @@ _bzr() {
     eval ${BZR} "${@}"
 }
 
-_bzr export ${verbose} --root="'${basename}/'" --format=tgz "'${output}'" "'${repo}'" -r "'${rev}'"
+_bzr export ${verbose} --root="'${basename}/'" --format=tgz \
+    --per-file-timestamps - "'${repo}'" -r "'${rev}'" \
+    >"${output}"
-- 
1.9.1
