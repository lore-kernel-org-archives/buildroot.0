Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2F1C3DA4B
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 12:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71C7C60708;
	Fri, 12 Jul 2024 12:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pi0Za29sgt_d; Fri, 12 Jul 2024 12:38:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EB3460615
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EB3460615;
	Fri, 12 Jul 2024 12:38:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 423661BF40F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 306ED60615
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2q_U5d4-SGy for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 12:38:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3661C605C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3661C605C8
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:38:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1EDE085DFD; Fri, 12 Jul 2024 12:38:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 13:12:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5543661bc0c1ebcd01e5e6bf5ac565fd0f1ac8d8
X-Git-Newrev: afece24a72728621449e45deeecae520e55c847f
X-Patchwork-Hint: ignore
Message-Id: <20240712123847.1EDE085DFD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download: introduce curl backend
 for FTP transfers
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=afece24a72728621449e45deeecae520e55c847f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Recent versions of wget, starting with wget 2.0, aka wget2 thereafter,
no longer support FTP (nor FTPS, aka FTP-over-SSL). wget2 is packaged in
Fedora 40, recently released; F40 does not even have the old wget
available in its repository anymore.

Introduce cURL as a download backend, that we use for FTP and FPTS
protocols.

Note that the -q flag does not means being quiet; it means that a curlrc
file should not be parsed. The long option is --disable, which meaning
is not much more obivous than the short -q. It also has to be the first
option on the command line.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in                     |  4 ++++
 docs/manual/prerequisite.adoc |  1 +
 package/pkg-download.mk       |  1 +
 package/pkg-generic.mk        |  2 ++
 support/download/curl         | 45 +++++++++++++++++++++++++++++++++++++++++++
 support/download/dl-wrapper   |  1 +
 6 files changed, 54 insertions(+)

diff --git a/Config.in b/Config.in
index bdf5fa8647..e0257ba3e8 100644
--- a/Config.in
+++ b/Config.in
@@ -103,6 +103,10 @@ menu "Build options"
 
 menu "Commands"
 
+config BR2_CURL
+	string "Curl command"
+	default "curl -q --ftp-pasv --retry 3"
+
 config BR2_WGET
 	string "Wget command"
 	default "wget -nd -t 3"
diff --git a/docs/manual/prerequisite.adoc b/docs/manual/prerequisite.adoc
index ab609c12be..5d3aa297a9 100644
--- a/docs/manual/prerequisite.adoc
+++ b/docs/manual/prerequisite.adoc
@@ -75,6 +75,7 @@ packages using any of these methods, you will need to install the
 corresponding tool on the host system:
 +
 ** +bazaar+
+** +curl+
 ** +cvs+
 ** +git+
 ** +mercurial+
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 7028d3917a..17c8a244c4 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -8,6 +8,7 @@
 ################################################################################
 
 # Download method commands
+export CURL := $(call qstrip,$(BR2_CURL))
 export WGET := $(call qstrip,$(BR2_WGET))
 export SVN := $(call qstrip,$(BR2_SVN))
 export CVS := $(call qstrip,$(BR2_CVS))
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a2749320c3..e1c16b7343 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1253,6 +1253,8 @@ else ifeq ($$($(2)_SITE_METHOD),hg)
 DL_TOOLS_DEPENDENCIES += hg
 else ifeq ($$($(2)_SITE_METHOD),cvs)
 DL_TOOLS_DEPENDENCIES += cvs
+else ifneq ($(filter ftp ftps,$$($(2)_SITE_METHOD)),)
+DL_TOOLS_DEPENDENCIES += curl
 endif # SITE_METHOD
 
 # cargo/go vendoring (may) need git
diff --git a/support/download/curl b/support/download/curl
new file mode 100755
index 0000000000..bea4485a6c
--- /dev/null
+++ b/support/download/curl
@@ -0,0 +1,45 @@
+#!/usr/bin/env bash
+
+# We want to catch any unexpected failure, and exit immediately
+set -e
+
+# Download helper for curl, to be called from the download wrapper script
+#
+# Options:
+#   -q          Be quiet.
+#   -o FILE     Save into file FILE.
+#   -f FILENAME The filename of the tarball to get at URL
+#   -u URL      Download file at URL.
+#
+# Environment:
+#   CURL     : the curl command to call
+
+quiet=
+while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
+    case "${OPT}" in
+    q)  quiet=-s;;
+    o)  output="${OPTARG}";;
+    f)  filename="${OPTARG}";;
+    u)  url="${OPTARG}";;
+    :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
+    \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
+    esac
+done
+
+shift $((OPTIND-1)) # Get rid of our options
+
+# Caller needs to single-quote its arguments to prevent them from
+# being expanded a second time (in case there are spaces in them)
+_curl() {
+    if [ -z "${quiet}" ]; then
+        printf '%s ' "${CURL}" "${@}"; printf '\n'
+    fi
+    _plain_curl "$@"
+}
+# Note: please keep command below aligned with what is printed above
+_plain_curl() {
+    # shellcheck disable=SC2086  # We want splitting
+    eval ${CURL} "${@}"
+}
+
+_curl ${quiet} "${@}" --output "'${output}'" "'${url}/${filename}'"
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 35428faeef..069b2c1c21 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -91,6 +91,7 @@ main() {
         backend="${backend_urlencode%|*}"
         case "${backend}" in
             git|svn|cvs|bzr|file|scp|hg|sftp) ;;
+            ftp|ftps) backend="curl" ;;
             *) backend="wget" ;;
         esac
         uri=${uri#*+}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
