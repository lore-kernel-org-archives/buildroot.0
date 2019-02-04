From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon,  4 Feb 2019 19:05:48 +0100
Subject: [Buildroot] [PATCHv2 3/8] support/download/hg: implement
 source-check
In-Reply-To: <20190204180553.18394-1-patrickdepinguin@gmail.com>
References: <20190204180553.18394-1-patrickdepinguin@gmail.com>
Message-ID: <20190204180553.18394-4-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Note: the implementation is different (better) than what used to be in
Buildroot before source-check was removed.

The original implementation:
    hg incoming --force -l1 <URL>
would only verify that the repository exists, not that the requested
revision is present.

An already better implementation is:
    hg incoming --force -l1 -r <revision> <URL>
but compared to the next solution it has a large resource consumption on the
local machine. In the background, the full repository is first downloaded.

The implemented solution is:
    hg identify -r <revision> <URL>
which operates directly on the remote repository.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 support/download/hg | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/support/download/hg b/support/download/hg
index efb515fca5..ed8dcfbcff 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -7,6 +7,7 @@ set -e
 #
 # Options:
 #   -q          Be quiet.
+#   -C          Only check that the changeset exists in the remote repository.
 #   -o FILE     Generate archive in FILE.
 #   -u URI      Clone from repository at URI.
 #   -c CSET     Use changeset (or revision) CSET.
@@ -19,6 +20,7 @@ verbose=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
+    C)  checkonly=1;;
     o)  output="${OPTARG}";;
     u)  uri="${OPTARG}";;
     c)  cset="${OPTARG}";;
@@ -36,6 +38,11 @@ _hg() {
     eval ${HG} "${@}"
 }
 
+if [ -n "${checkonly}" ]; then
+    _hg identify ${verbose} "${@}" --rev "'${cset}'" "'${uri}'" > /dev/null
+    exit ${?}
+fi
+
 _hg clone ${verbose} "${@}" --noupdate "'${uri}'" "'${basename}'"
 
 _hg archive ${verbose} --repository "'${basename}'" --type tgz \
-- 
2.19.2
