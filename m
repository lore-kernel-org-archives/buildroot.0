From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 11:47:35 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] support/download: fix scp
 downloads
Message-ID: <20190124104713.B5F868E4AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f331b23934837f287870776b67ca5879702e9af8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

scp download is broken, because scp is called without filename argument and
only the server is specified. The call is:
    scp <server> <outputfile>

but should be:
    scp <server>/<filename> <outputfile>

Instead of assuming '-u' lists a full URL including filename (which it is
not), align with the wget helper where -u is the server URL and -f gives the
filename.

With this commit, an scp download can work if FOO_SITE_METHOD is explicitly
set to 'scp' and the server does not have a scheme prefix 'scp://'.
The next commit will handle the case where a scheme prefix is present.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: s/URL/URI/, as noticed by Yann.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry picked from commit 4d6e20ff46661d4f02fdd8595295f5496e8d64a8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/download/scp | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/support/download/scp b/support/download/scp
index 8ecf2f4b22..49cfff2b9f 100755
--- a/support/download/scp
+++ b/support/download/scp
@@ -8,7 +8,8 @@ set -e
 # Options:
 #   -q          Be quiet.
 #   -o FILE     Copy to local file FILE.
-#   -u FILE     Copy from remote file FILE.
+#   -f FILE     Copy from remote file FILE.
+#   -u URI      Download file at URI.
 #
 # Environment:
 #   SCP       : the scp command to call
@@ -18,6 +19,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
     o)  output="${OPTARG}";;
+    f)  filename="${OPTARG}";;
     u)  uri="${OPTARG}";;
     :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
@@ -32,4 +34,4 @@ _scp() {
     eval ${SCP} "${@}"
 }
 
-_scp ${verbose} "${@}" "'${uri}'" "'${output}'"
+_scp ${verbose} "${@}" "'${uri}/${filename}'" "'${output}'"
