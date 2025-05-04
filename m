Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6594FC369DC
	for <buildroot@archiver.kernel.org>; Sun,  4 May 2025 16:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D62B660745;
	Sun,  4 May 2025 16:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hLcw4Q0qk7Jb; Sun,  4 May 2025 16:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D84B56073B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D84B56073B;
	Sun,  4 May 2025 16:36:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A50916B
 for <buildroot@buildroot.org>; Sun,  4 May 2025 16:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BD0B4016C
 for <buildroot@buildroot.org>; Sun,  4 May 2025 16:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RwX2vrJB6rAi for <buildroot@buildroot.org>;
 Sun,  4 May 2025 16:36:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=stefan.nickl@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DE0F940140
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE0F940140
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE0F940140
 for <buildroot@buildroot.org>; Sun,  4 May 2025 16:36:15 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3913d129c1aso2155573f8f.0
 for <buildroot@buildroot.org>; Sun, 04 May 2025 09:36:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746376573; x=1746981373;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5Sti3LGLG96Nguq8k3g7q8QUsX8Oo51GULMFYyu35m8=;
 b=VUVNlvQwuV4Pps9eNwIRW79Ifg2PdUSUzmPFWJn7XJGb/0BcGIHijHq6kfr6ELNzVZ
 gOagsmO9YkmF4t1mEqMqjCEGM2ul8JOTrPtOTwRTSG85XsLoQX/JfAPbihC0jcC2UOQK
 qra8XjS+Fuzc2n5raGAOFHCSvKLhxXyblsMXMp9ZRMxKYIj0OgGOt3wSDdVpA+YgPjG0
 wUfT6mFkno2r3LyTlG3KIc8HdlFU/PSCBNzv6WtvrEDMfMAsYhG9a6H6SWNWoBL35Fky
 h7yAwCpCvyfkVpb8JgUHwrdl0MkoqtCyEQYNfptOgpd9tyAAfz/tJUzwiTSDgBZkqLTa
 c4rA==
X-Gm-Message-State: AOJu0YxxDPyAqPQCIFAURfOLvuHU/wvIxucO4YjN25d6i0QseiEEdhku
 jgscQkPBMxTRzymCMSKyUPXJjN6tz7M8eqpzONIc57kQDCqFu4m+TYET2w==
X-Gm-Gg: ASbGnctlZaH/7y8HWIijrBOD2gO3LBiw0TONEEUzrtL5Yg0BpEFQPKC27nr/l6cZc5o
 YUow24JU5+7xxgN7GGAiiHRp+wAp68hrmv0s23IMvl4VaID0P/RtiMyVmlgJQudYiMU/7ZLWxbK
 itlmHKa8732cJXiTzuJ7q8q0QvE0vZqwFe7Lwp8cYYpCVmu9oetELKnSVtibaR1G47SlRjSuoO2
 emFargZ9jazc+EvhzUd2qIosu6F+dfJjmAORloaxeToM9T92/6mbhnYAAVKjL87rUWkS8gtQ5hf
 hqPmcY1gLiJmGCgKH1ON7YqCMgs7YQFTnhySc+ry3mbA4f+R6/xYXSsqJtwBArlMo+cjkOICspY
 ri4XgBnaXTmJouMNH2ctUvO8Ng9g7U4e6BP+7MKsxNxYZ1o4=
X-Google-Smtp-Source: AGHT+IEW/DCmkD4YA4XeU8Va3HEo1vmnLjQxN9qTP4ebP5rj2F/O/WpColhxEIaUWj0PgnYvBCBATg==
X-Received: by 2002:a5d:59ad:0:b0:39c:30f7:b6ad with SMTP id
 ffacd0b85a97d-3a098464114mr7320056f8f.18.1746376573251; 
 Sun, 04 May 2025 09:36:13 -0700 (PDT)
Received: from tiger.fritz.box
 (p200300d1973ff60028794b0019d2def9.dip0.t-ipconnect.de.
 [2003:d1:973f:f600:2879:4b00:19d2:def9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae0bb5sm7681087f8f.7.2025.05.04.09.36.11
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 09:36:12 -0700 (PDT)
From: stefan.nickl@gmail.com
X-Google-Original-From: Stefan.Nickl@gmail.com
To: buildroot@buildroot.org
Date: Sun,  4 May 2025 18:36:11 +0200
Message-ID: <20250504163611.141654-1-Stefan.Nickl@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746376573; x=1746981373; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=5Sti3LGLG96Nguq8k3g7q8QUsX8Oo51GULMFYyu35m8=;
 b=ToGayEs9COJYhbcFeTwr+8OxQ5BbNFFwzFKcGGMa1qA8TcGWh56/OboTDyh3dZGVpr
 Zv3MlQardgx+NPzoNYSeqwcSvBKrklK494m5O0DqSmjD++LrpJDc9iYNKJNF/xyy3O0i
 rd48FvdTMyYWy9oOVtfzehmM4ZjbaniKc7DTHqHw7WaNIL1rLyeSM1WR30ukh5LHEeti
 uL84gMKr/DjSJjJzM2kzoGbbJ7WCh8eG4wx8xWbBoUMSb6hpfsAP2TAT7NWMIeBpRZdk
 GxK7e5noagCBibsD5V805rOmeV6KoACpZX/wpLjvPeB0CUAZ84qI+Lb4oztcTzt9T6Mn
 s24A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ToGayEs9
Subject: [Buildroot] [PATCH 1/1] Add gh site method for GitHub cli
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

From: Stefan Nickl <Stefan.Nickl@gmail.com>

Hey there,
I would like to propose adding a download/site method "gh" based on the
GitHub CLI tool https://cli.github.com/

The main advantage is that it also works for private GitHub repositories
after logging in with "gh auth login".

It is intended as an alternative to pulling with the "git" method, which
has the drawback of requiring separate ssh keys and resulting in
different archives depending on the buildroot version, and passing an
authentication token on the wget command line, which risks leaking the
token to third-party servers.

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
---
 Config.in                   |  4 ++++
 package/pkg-download.mk     |  1 +
 support/download/dl-wrapper |  2 +-
 support/download/gh         | 43 +++++++++++++++++++++++++++++++++++++
 4 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100755 support/download/gh

diff --git a/Config.in b/Config.in
index d730f2034b..cb178ee8d2 100644
--- a/Config.in
+++ b/Config.in
@@ -172,6 +172,10 @@ config BR2_HG
 	string "Mercurial (hg) command"
 	default "hg"
 
+config BR2_GH
+	string "GitHub cli command"
+	default "gh"
+
 config BR2_ZCAT
 	string "zcat command"
 	default "gzip -d -c"
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index cf5959ea95..08b0d420c7 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -111,6 +111,7 @@ define DOWNLOAD
 	CVS="$(call qstrip,$(BR2_CVS))" \
 	GIT="$(call qstrip,$(BR2_GIT))" \
 	HG="$(call qstrip,$(BR2_HG))" \
+	GH="$(call qstrip,$(BR2_GH))" \
 	LOCALFILES="$(call qstrip,$(BR2_LOCALFILES))" \
 	SCP="$(call qstrip,$(BR2_SCP))" \
 	SFTP="$(call qstrip,$(BR2_SFTP))" \
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 5445aad5a7..a209665b0f 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -95,7 +95,7 @@ main() {
         backend_urlencode="${uri%%+*}"
         backend="${backend_urlencode%|*}"
         case "${backend}" in
-            git|svn|cvs|bzr|file|scp|hg|sftp) ;;
+            git|svn|cvs|bzr|file|scp|hg|gh|sftp) ;;
             ftp|ftps) backend="curl" ;;
             *) backend="wget" ;;
         esac
diff --git a/support/download/gh b/support/download/gh
new file mode 100755
index 0000000000..5c36855ccf
--- /dev/null
+++ b/support/download/gh
@@ -0,0 +1,43 @@
+#!/usr/bin/env bash
+
+# We want to catch any unexpected failure, and exit immediately
+set -e
+
+# Download helper for GitHub CLI, to be called from the download wrapper script
+#
+# Options:
+#   -o FILE     Save into file FILE.
+#   -f FILENAME The filename of the tarball to get at URL
+#   -u URL      Download file at URL.
+#
+# Environment:
+#   GH        : the gh command to call
+
+quiet=
+while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
+    case "${OPT}" in
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
+_gh() {
+    if [ -z "${quiet}" ]; then
+        printf '%s ' ${GH} "${@}"; printf '\n'
+    fi
+    _plain_gh "$@"
+}
+# Note: please keep command below aligned with what is printed above
+_plain_gh() {
+    eval ${GH} "${@}"
+}
+
+_gh api -H "'Accept: application/vnd.github.raw+json'" "${@}" \
+    "'${url}/${filename}'" ">'${output}'"
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
