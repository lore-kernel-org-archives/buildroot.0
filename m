From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Feb 2019 22:07:57 +0100
Subject: [Buildroot] [PATCHv4 2/8] support/download/hg: implement
 source-check
In-Reply-To: <20190215210803.8969-1-patrickdepinguin@gmail.com>
References: <20190215210803.8969-1-patrickdepinguin@gmail.com>
Message-ID: <20190215210803.8969-2-patrickdepinguin@gmail.com>
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
 support/download/hg | 12 ++++++++++++
 1 file changed, 12 insertions(+)

v4: (feedback Yann E. Morin)
- use true/false as values to 'checkonly'
- always check revision, even if no source-check
- replace incorrect 'exit $?' by explicit 'exit 0'

v3: no changes

diff --git a/support/download/hg b/support/download/hg
index efb515fca5..8f7d1a5a90 100755
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
@@ -16,9 +17,11 @@ set -e
 #   HG       : the hg command to call
 
 verbose=
+checkonly=false
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
+    C)  checkonly=true;;
     o)  output="${OPTARG}";;
     u)  uri="${OPTARG}";;
     c)  cset="${OPTARG}";;
@@ -36,6 +39,15 @@ _hg() {
     eval ${HG} "${@}"
 }
 
+if ! _hg identify ${verbose} "${@}" --rev "'${cset}'" "'${uri}'" > /dev/null; then
+    printf "Commit '%s' does not exist in this repository\n." "${cset}"
+    exit 1
+fi
+
+if ${checkonly}; then
+    exit 0
+fi
+
 _hg clone ${verbose} "${@}" --noupdate "'${uri}'" "'${basename}'"
 
 _hg archive ${verbose} --repository "'${basename}'" --type tgz \
-- 
2.19.2
