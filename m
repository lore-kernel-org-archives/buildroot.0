From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 15 Apr 2020 17:48:45 +0100
Subject: [Buildroot] [PATCH v2 4/5] download: Add SFTP support (not FTPS)
In-Reply-To: <20200415164846.122126-1-thomas.preston@codethink.co.uk>
References: <20200415164846.122126-1-thomas.preston@codethink.co.uk>
Message-ID: <20200415164846.122126-5-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add Secure File Transfer Program (SFTP) support using a simple wrapper.
SFTP is a common protocol used to transfer files securely between
enterprises, but it is not currently supported in Buildroot because all
of the packages are usually available via HTTP, git or some other
download method.

SFTP is similar to FTP but it preforms all operations over an encrypted
SSH transport.

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
---
 Config.in                   |  4 ++++
 package/pkg-download.mk     |  1 +
 support/download/dl-wrapper |  2 +-
 support/download/sftp       | 37 +++++++++++++++++++++++++++++++++++++
 4 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100755 support/download/sftp

diff --git a/Config.in b/Config.in
index 48fd36ff98..2050dd7a03 100644
--- a/Config.in
+++ b/Config.in
@@ -114,6 +114,10 @@ config BR2_SCP
 	string "Secure copy (scp) command"
 	default "scp"
 
+config BR2_SFTP
+	string "Secure file transfer (sftp) command"
+	default "sftp"
+
 config BR2_HG
 	string "Mercurial (hg) command"
 	default "hg"
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index de619ba90a..88790fe46e 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -15,6 +15,7 @@ export BZR := $(call qstrip,$(BR2_BZR))
 export GIT := $(call qstrip,$(BR2_GIT))
 export HG := $(call qstrip,$(BR2_HG))
 export SCP := $(call qstrip,$(BR2_SCP))
+export SFTP := $(call qstrip,$(BR2_SFTP))
 export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 DL_WRAPPER = support/download/dl-wrapper
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 3315bd410e..6cf0b89cba 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -88,7 +88,7 @@ main() {
         backend_urlencode="${uri%%+*}"
         backend="${backend_urlencode%|*}"
         case "${backend}" in
-            git|svn|cvs|bzr|file|scp|hg) ;;
+            git|svn|cvs|bzr|file|scp|hg|sftp) ;;
             *) backend="wget" ;;
         esac
         uri=${uri#*+}
diff --git a/support/download/sftp b/support/download/sftp
new file mode 100755
index 0000000000..8aeb91e0e8
--- /dev/null
+++ b/support/download/sftp
@@ -0,0 +1,37 @@
+#!/usr/bin/env bash
+
+# We want to catch any unexpected failure, and exit immediately
+set -e
+
+# Download helper for sftp, to be called from the download wrapper script
+#
+# Options:
+#   -q          Be quiet.
+#   -o FILE     Copy to local file FILE.
+#   -f FILE     Copy from remote file FILE.
+#   -u URI      Download file at URI.
+#
+# Environment:
+#   SFTP      : the sftp command to call
+
+verbose=
+while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
+    case "${OPT}" in
+    q)  verbose=-q;;
+    o)  output="${OPTARG}";;
+    f)  filename="${OPTARG}";;
+    u)  uri="${OPTARG}";;
+    :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
+    \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
+    esac
+done
+
+shift $((OPTIND-1)) # Get rid of our options
+
+# Caller needs to single-quote its arguments to prevent them from
+# being expanded a second time (in case there are spaces in them)
+_sftp() {
+    eval ${SFTP} "${@}"
+}
+
+_sftp ${verbose} "${@}" "'${uri}/${filename}'" "'${output}'"
-- 
2.20.1
