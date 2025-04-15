Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7F8C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 14:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 284A982B5E;
	Tue, 15 Apr 2025 14:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJy5qEvMWy8R; Tue, 15 Apr 2025 14:22:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57C5E8221D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57C5E8221D;
	Tue, 15 Apr 2025 14:22:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 39C8E109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 14:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C762411F5
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 14:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8KV_9xzmWXWt for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 14:22:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.44.123;
 helo=mail1.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 333AF40BF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 333AF40BF2
Received: from mail1.insia.net (mail1.insia.net [188.165.44.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 333AF40BF2
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 14:22:46 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail1.insia.net (Postfix) with ESMTP id 09EEA3FA8C;
 Tue, 15 Apr 2025 16:22:39 +0200 (CEST)
Received: from UDERZO.insia.net (unknown [192.168.1.35])
 by smtp.insia.net (Postfix) with ESMTP id CFC5C5F497;
 Tue, 15 Apr 2025 16:24:22 +0200 (CEST)
From: Guillaume Chaye <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Guillaume Chaye <guillaume.chaye@zeetim.com>
Date: Tue, 15 Apr 2025 10:22:08 -0400
Message-Id: <20250415142208.165435-1-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail1; t=1744726959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=p90eBFKdiegisYTfu0orHOKA3Uol9jcBwgvGu1Id6u0=;
 b=dWemx4wMaXiEEsTgsamONn80I3bl/gjij4iRwhsv7tQOeJneyvPwDIGLrlnW/UcU/om/h/
 4V658qmLMUkhT76igiPhylP5YfcsHd17CmZVId3CGWWxmubE6V3EbLoYpzQi/rOAMx3NR+
 ZlcPAv5Mu2LZ1bRyp0Wwj+KO2tCdbJytlczlQH+fn/AVfONq0P13Dlnq8u0EDopS8cUdEB
 sy8QfJj/fo2jrSINnZ6FPpiQ+GyjtW+9GUdaO1A0NgomA7YPyPgl+/wpdZjVt0TvHjP3yM
 IzjaddRpCgOtyKSwxG/1xaZIcK2R4XKTCKJH5J8BPiFB84lRFB95FOSpbZ5jrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail1 header.b=dWemx4wM
Subject: [Buildroot] [PATCH 1/1] support/download/smb: Add basic support for
 smb download.
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This method requires samba to be installed on the host machine since it uses smbget command to fetch remote files.
Curl also support basic smb download but currently the curl script does not support -u option.

Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
---
 Config.in                   |  4 +++
 package/pkg-download.mk     |  1 +
 support/download/dl-wrapper |  2 +-
 support/download/smb        | 51 +++++++++++++++++++++++++++++++++++++
 4 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100755 support/download/smb

diff --git a/Config.in b/Config.in
index a543091d4f..c562310c2b 100644
--- a/Config.in
+++ b/Config.in
@@ -144,6 +144,10 @@ config BR2_SCP
 	string "Secure copy (scp) command"
 	default "scp -o ConnectTimeout=10"
 
+config BR2_SMBGET
+	string "Server Message Block (smbget) command"
+	default "smbget"
+
 config BR2_SFTP
 	string "Secure file transfer (sftp) command"
 	default "sftp -o ConnectTimeout=10"
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index cf5959ea95..e1f64eb392 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -114,6 +114,7 @@ define DOWNLOAD
 	LOCALFILES="$(call qstrip,$(BR2_LOCALFILES))" \
 	SCP="$(call qstrip,$(BR2_SCP))" \
 	SFTP="$(call qstrip,$(BR2_SFTP))" \
+	SMBGET="$(call qstrip,$(BR2_SMBGET))" \
 	SVN="$(call qstrip,$(BR2_SVN))" \
 	WGET="$(call qstrip,$(BR2_WGET))" \
 	BR_NO_CHECK_HASH_FOR="$(if $(BR2_DOWNLOAD_FORCE_CHECK_HASHES),,$(BR_NO_CHECK_HASH_FOR))" \
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 5445aad5a7..f7aa82fb9f 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -95,7 +95,7 @@ main() {
         backend_urlencode="${uri%%+*}"
         backend="${backend_urlencode%|*}"
         case "${backend}" in
-            git|svn|cvs|bzr|file|scp|hg|sftp) ;;
+            git|svn|cvs|bzr|file|scp|hg|sftp|smb) ;;
             ftp|ftps) backend="curl" ;;
             *) backend="wget" ;;
         esac
diff --git a/support/download/smb b/support/download/smb
new file mode 100755
index 0000000000..98136081d6
--- /dev/null
+++ b/support/download/smb
@@ -0,0 +1,51 @@
+#!/usr/bin/env bash
+
+# We want to catch any unexpected failure, and exit immediately
+set -e
+
+# Download helper for smbget, to be called from the download wrapper script
+#
+# Options:
+#   -q          Be quiet.
+#   -o FILE     Save into file FILE.
+#   -f FILENAME The filename of the tarball to get at URL.
+#   -u URL      Download file at URL (up to the directory).
+#
+# Environment:
+#   SMBGET   : the smbget command to call (default: smbget)
+#   SMBUSER  : the SMB username (default: guest)
+#   SMBPASS  : the SMB password (default: empty)
+
+quiet=
+while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
+    case "${OPT}" in
+    q)  quiet=-q;;
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
+SMBUSER="${SMBUSER:-guest}"
+SMBPASS="${SMBPASS:-}"
+
+_smbget() {
+    if [ -z "${quiet}" ]; then
+        printf '%s ' "${SMBGET}" -U "${SMBUSER}%***" -o "${output}" "${url%/}/${filename}"
+        printf '\n'
+    fi
+    _plain_smbget "$@"
+}
+
+_plain_smbget() {
+    full_url="${url%/}/${filename}"
+
+    # shellcheck disable=SC2086
+    eval ${SMBGET} ${quiet} -U "'${SMBUSER}%${SMBPASS}'" -o "'${output}'" "'${full_url}'"
+}
+
+_smbget "$@"
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
