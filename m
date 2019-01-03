From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu,  3 Jan 2019 21:40:22 +0100
Subject: [Buildroot] [PATCH 07/11] support/download: implement source-check
 in scp backend
In-Reply-To: <20190103204026.23512-1-patrickdepinguin@gmail.com>
References: <20190103204026.23512-1-patrickdepinguin@gmail.com>
Message-ID: <20190103204026.23512-8-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Note that this reintroduces BR2_SSH removed with
db9473bf6cd7bd12aa1f9faad0a917c973c33827 ("core/download: drop the SSH
command").

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 Config.in               |  4 ++++
 package/pkg-download.mk |  1 +
 support/download/scp    | 13 +++++++++++++
 3 files changed, 18 insertions(+)

diff --git a/Config.in b/Config.in
index f965e9d6d8..03e4eb3928 100644
--- a/Config.in
+++ b/Config.in
@@ -136,6 +136,10 @@ config BR2_SCP
 	string "Secure copy (scp) command"
 	default "scp"
 
+config BR2_SSH
+	string "Secure shell (ssh) command"
+	default "ssh"
+
 config BR2_HG
 	string "Mercurial (hg) command"
 	default "hg"
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index cc04e316e2..e9506ae2a5 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -15,6 +15,7 @@ export BZR := $(call qstrip,$(BR2_BZR))
 export GIT := $(call qstrip,$(BR2_GIT))
 export HG := $(call qstrip,$(BR2_HG))
 export SCP := $(call qstrip,$(BR2_SCP))
+export SSH := $(call qstrip,$(BR2_SSH))
 export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 DL_WRAPPER = support/download/dl-wrapper
diff --git a/support/download/scp b/support/download/scp
index 55f588e157..c8fa58f952 100755
--- a/support/download/scp
+++ b/support/download/scp
@@ -7,17 +7,20 @@ set -e
 #
 # Options:
 #   -q          Be quiet.
+#   -C          Only check that the file exists remotely
 #   -o FILE     Copy to local file FILE.
 #   -f FILE     Copy from remote file FILE.
 #   -u URL      Download file at URL.
 #
 # Environment:
 #   SCP       : the scp command to call
+#   SSH       : the ssh command to use for checkonly
 
 verbose=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
+    C)  checkonly=1;;
     o)  output="${OPTARG}";;
     f)  filename="${OPTARG}";;
     u)  uri="${OPTARG}";;
@@ -33,6 +36,16 @@ shift $((OPTIND-1)) # Get rid of our options
 _scp() {
     eval ${SCP} "${@}"
 }
+_ssh() {
+    eval ${SSH} "${@}"
+}
+
+if [ -n "${checkonly}" ]; then
+    domain="${uri%%:*}"
+    path="${uri#*:}"
+    _ssh ${verbose} "${@}" "'${domain}'" ls "'${path}'" > /dev/null
+    exit ${?}
+fi
 
 # Remove any scheme prefix
 uri="${uri##scp://}"
-- 
2.18.1
