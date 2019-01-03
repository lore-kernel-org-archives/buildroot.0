From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu,  3 Jan 2019 21:40:25 +0100
Subject: [Buildroot] [PATCH 10/11] support/download: implement source-check
 in cvs backend
In-Reply-To: <20190103204026.23512-1-patrickdepinguin@gmail.com>
References: <20190103204026.23512-1-patrickdepinguin@gmail.com>
Message-ID: <20190103204026.23512-11-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The implementation is the same as originally was present.
It suffers from the disadvantage that an invalid revision on a valid URL
will not be detected.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 support/download/cvs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/support/download/cvs b/support/download/cvs
index 9d0dc3cb3a..0ae7aa30d2 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -7,6 +7,7 @@ set -e
 #
 # Options:
 #   -q          Be quiet
+#   -C          Only check that the revision exists in the remote repository
 #   -o FILE     Generate archive in FILE.
 #   -u URI      Checkout from repository at URI.
 #   -c REV      Use revision REV.
@@ -20,6 +21,7 @@ verbose=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-Q;;
+    C)  checkonly=1;;
     o)  output="${OPTARG}";;
     u)  uri="${OPTARG#*://}";;
     c)  rev="${OPTARG}";;
@@ -57,6 +59,15 @@ if [[ ! "${uri}" =~ ^: ]]; then
 fi
 
 export TZ=UTC
+
+if [ -n "${checkonly}" ]; then
+    # Not all CVS servers support ls/rls, use login to see if we can connect.
+    # TODO this check only checks that the remote repository exists, not that
+    # it actually contains the requested revision.
+    _cvs ${verbose} -d"'${uri}'" login
+    exit ${?}
+fi
+
 _cvs ${verbose} -z3 -d"'${uri}'" \
      co "${@}" -d "'${basename}'" ${select} "'${rev}'" -P "'${rawname}'"
 
-- 
2.18.1
