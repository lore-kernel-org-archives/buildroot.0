From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu,  3 Jan 2019 21:40:24 +0100
Subject: [Buildroot] [PATCH 09/11] support/download: implement source-check
 in bzr backend
In-Reply-To: <20190103204026.23512-1-patrickdepinguin@gmail.com>
References: <20190103204026.23512-1-patrickdepinguin@gmail.com>
Message-ID: <20190103204026.23512-10-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The implementation is the same as originally was present.
It suffers from the disadvantage that an invalid revision on a valid URL
will not be detected.
If someone is proficient in bzr-speak, please improve.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 support/download/bzr | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/support/download/bzr b/support/download/bzr
index 5289a421cd..2f13a607c9 100755
--- a/support/download/bzr
+++ b/support/download/bzr
@@ -7,6 +7,7 @@ set -e
 #
 # Options:
 #   -q          Be quiet
+#   -C          Only check that the changeset exists in the remote repository
 #   -o FILE     Generate archive in FILE.
 #   -u URI      Clone from repository at URI.
 #   -c CSET     Use changeset (or revision) CSET.
@@ -20,6 +21,7 @@ verbose=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
+    C)  checkonly=1;;
     o)  output="${OPTARG}";;
     u)  uri="${OPTARG}";;
     c)  cset="${OPTARG}";;
@@ -37,6 +39,13 @@ _bzr() {
     eval ${BZR} "${@}"
 }
 
+if [ -n "${checkonly}" ]; then
+    # TODO this check only checks that the remote repository exists, not that
+    # it actually contains the requested revision.
+    _bzr ls --quiet "${@}" "'${uri}'" > /dev/null
+    exit ${?}
+fi
+
 # --per-file-timestamps comes with bzr-2.2 (released August 2010),
 # so only pass it if bzr is recent enough. We compute versions as:
 # major*1000 + minor
-- 
2.18.1
