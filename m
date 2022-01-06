Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A42BC433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 08:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2C6082950;
	Thu,  6 Jan 2022 08:39:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v6fo4XOQU3UJ; Thu,  6 Jan 2022 08:39:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02694829F2;
	Thu,  6 Jan 2022 08:39:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1EE371C1148
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 08:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CAAF6FBA2
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 08:38:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hm048ZmmgZ31 for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 08:38:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CF106FB76
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 08:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C847383456; Thu,  6 Jan 2022 08:32:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 6 Jan 2022 09:34:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5d2400950fc053119bae0ceff047b3c9b4afa45
X-Git-Newrev: 16f660f8ceaa2a6aa0c256a77f08149b449e5a3b
X-Patchwork-Hint: ignore
Message-Id: <20220106083242.C847383456@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download: Add SFTP support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=16f660f8ceaa2a6aa0c256a77f08149b449e5a3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add Secure File Transfer Program (SFTP) support using a simple wrapper.
SFTP is a common protocol used to transfer files securely between
enterprises, but it is not currently supported in Buildroot because all
of the packages are usually available via HTTP, git or some other
download method.

SFTP is similar to FTP but it preforms all operations over an encrypted
SSH transport using a specific protocol. This is unlike ftps, which is
traditional FTP over an SSL/TLS connection.

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
[Arnout:
 - update documentation with sftp everywhere scp is mentioned;
 - rename "verbose" variable to "quiet";
 - print the sftp command, similar to wget and scp helpers.
]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in                               |  4 ++++
 docs/manual/adding-packages-generic.txt |  4 +++-
 docs/manual/prerequisite.txt            |  1 +
 package/pkg-download.mk                 |  1 +
 support/download/dl-wrapper             |  2 +-
 support/download/sftp                   | 41 +++++++++++++++++++++++++++++++++
 6 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 3db2c8dcab..f0cd6f48ed 100644
--- a/Config.in
+++ b/Config.in
@@ -119,6 +119,10 @@ config BR2_SCP
 	string "Secure copy (scp) command"
 	default "scp"
 
+config BR2_SFTP
+	string "Secure file transfer (sftp) command"
+	default "sftp"
+
 config BR2_HG
 	string "Mercurial (hg) command"
 	default "hg"
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 2d8a1a71ce..1384466f9b 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -256,7 +256,7 @@ not and can not work as people would expect it should:
   +scp://[user@]host:filepath+, and that filepath is relative to the
   user's home directory, so you may want to prepend the path with a
   slash for absolute paths:
-  +scp://[user@]host:/absolutepath+. +
+  +scp://[user@]host:/absolutepath+. The same goes for SFTP URLs. +
   If +HOST_LIBFOO_SITE+ is not specified, it defaults to
   +LIBFOO_SITE+.
   Examples: +
@@ -291,6 +291,8 @@ not and can not work as people would expect it should:
      +ftp://+.
   ** +scp+ for downloads of tarballs over SSH with scp. Used by
      default when +LIBFOO_SITE+ begins with +scp://+.
+  ** +sftp+ for downloads of tarballs over SSH with sftp. Used by
+     default when +LIBFOO_SITE+ begins with +sftp://+.
   ** +svn+ for retrieving source code from a Subversion repository.
      Used by default when +LIBFOO_SITE+ begins with +svn://+. When a
      +http://+ Subversion repository URL is specified in
diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 4e614cfa1b..40071491f8 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -78,6 +78,7 @@ corresponding tool on the host system:
 ** +mercurial+
 ** +rsync+
 ** +scp+
+** +sftp+
 ** +subversion+
 
 * Java-related packages, if the Java Classpath needs to be built for
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 2527ba5c60..5c2bdfdb23 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -15,6 +15,7 @@ export BZR := $(call qstrip,$(BR2_BZR))
 export GIT := $(call qstrip,$(BR2_GIT))
 export HG := $(call qstrip,$(BR2_HG))
 export SCP := $(call qstrip,$(BR2_SCP))
+export SFTP := $(call qstrip,$(BR2_SFTP))
 export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 # Version of the format of the archives we generate in the corresponding
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
index 0000000000..0a44be7e61
--- /dev/null
+++ b/support/download/sftp
@@ -0,0 +1,41 @@
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
+quiet=
+while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
+    case "${OPT}" in
+    q)  quiet=-q;;
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
+    if [ -z "${quiet}" ]; then
+        printf '%s ' ${SFTP} "${@}"; printf '\n'
+    fi
+    # Note: please keep command below aligned with what is printed above
+    eval ${SFTP} "${@}"
+}
+
+_sftp ${quiet} "${@}" "'${uri}/${filename}'" "'${output}'"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
