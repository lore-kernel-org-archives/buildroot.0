Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B40FC36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 17:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8C0B4097A;
	Mon, 24 Mar 2025 17:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOyjDWf1qF_f; Mon, 24 Mar 2025 17:33:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCF0A408F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCF0A408F3;
	Mon, 24 Mar 2025 17:33:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3AE6E0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 17:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C995400CE
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 17:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6LyLGsd38Eo for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 17:33:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.44.123;
 helo=mail1.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D38EF403DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D38EF403DE
Received: from mail1.insia.net (mail1.insia.net [188.165.44.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D38EF403DE
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 17:33:04 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail1.insia.net (Postfix) with ESMTP id 9294A3F897;
 Mon, 24 Mar 2025 18:32:57 +0100 (CET)
Received: from UDERZO.insia.net (unknown [192.168.1.35])
 by smtp.insia.net (Postfix) with ESMTP id 181715F497;
 Mon, 24 Mar 2025 18:34:19 +0100 (CET)
From: Guillaume Chaye <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Guillaume Chaye <guillaume.chaye@zeetim.com>
Date: Mon, 24 Mar 2025 13:32:45 -0400
Message-Id: <20250324173246.100112-1-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail1; t=1742837577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=RD+J67mIHQ7w27qriePhMd661GiP49pER1NKE/MHe9s=;
 b=IaBY/+xM/9OB4fePk/RdpOV5/4Bww/p2FOrfcTa4qhlzxffhm3IxzNNV3YU/AVquQlf499
 9AWLl9pS1tsZrbK0J6HQ/mwddsR2fajd2LLuBsQ7a+DxE7/iLB9ovLPaSpxqpRoKJlnuZj
 zj/+g/CFrcC0Y7wLEK6K8qbu7aTYMwTGqH3KWl0rRpao+ybxz3IH2b1C07mfAvwZIuZZb+
 udIyYhNPUoqYA64GBa6XM8FhLZwBnsJLYmKtroMN50MRQDTnpj30P5ltTCsQuiri688Ir/
 S9WWBTYVe6crwpyMLCwRYcsI7F2PmMg7gnPZiATCIq2k8ebuBdtd57jxh35lOw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail1 header.b=IaBY/+xM
Subject: [Buildroot] [PATCHv2 1/2] support/download/cargo-post-process: add
 support for hook scripts before and after cargo vendoring.
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

Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
---
 support/download/cargo-post-process | 31 ++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index 12198051a4..54c8853267 100755
--- a/support/download/cargo-post-process
+++ b/support/download/cargo-post-process
@@ -5,17 +5,42 @@ set -e
 # shellcheck source=helpers source-path=SCRIPTDIR
 . "${0%/*}/helpers"
 
+run_scripts() {
+    local scripts_errors=0  # Initialize error counter
+
+    for script in "$@"; do
+        # Ensure script exists and is executable before running
+        if [[ ! -x "$script" ]]; then
+            echo "Error: Script '$script' not found or not executable."
+            scripts_errors=$((scripts_errors + 1))
+            continue
+        fi
+
+		echo "Running script '$script' ..."
+        if ! "$script"; then
+			echo "Error: Script '$script' exit status is non zero."
+           scripts_errors=$((scripts_errors + 1))
+        fi
+    done
+
+    # Return the number of errors encountered
+    return $scripts_errors
+}
+
 if [ "${BR_CARGO_MANIFEST_PATH}" ]; then
     printf 'Setting BR_CARGO_MANIFEST_PATH is no longer supported; use post-process options.\n' >&2
     exit 1
 fi
 
 manifest=Cargo.toml
-while getopts "n:o:m:" OPT; do
+declare -a pre_vendoring_scripts post_vendoring_scripts
+while getopts "n:o:m:v:V" OPT; do
     case "${OPT}" in
     o)  output="${OPTARG}";;
     n)  base_name="${OPTARG}";;
     m)  manifest="${OPTARG}";;
+	v) pre_vendoring_scripts+=( "${OPTARG}" );;
+	V) post_vendoring_scripts+=( "${OPTARG}" );;
     :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
     \?) error "unknown option '%s'\n" "${OPTARG}";;
     esac
@@ -31,6 +56,8 @@ post_process_unpack "${base_name}" "${output}"
 # Do the Cargo vendoring
 pushd "${base_name}" > /dev/null
 
+run_scripts "${pre_vendoring_scripts[@]}" || exit 1
+
 # Create the local .cargo/config with vendor info
 mkdir -p .cargo/
 mkdir -p "${CARGO_HOME}"
@@ -46,6 +73,8 @@ cargo vendor \
 # gets confusing, so instruct the user that it's been handled.
 printf '(note: .cargo/config.toml automatically updated by Buildroot)\n\n'
 
+run_scripts "${post_vendoring_scripts[@]}" || exit 1
+
 popd > /dev/null
 
 post_process_repack "$(pwd)" "${base_name}" "${output}"
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
