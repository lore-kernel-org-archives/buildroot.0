Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56430C36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 14:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE62E8211A;
	Mon, 24 Mar 2025 14:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ZoSV-OEu5pr; Mon, 24 Mar 2025 14:19:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12C1082111
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12C1082111;
	Mon, 24 Mar 2025 14:19:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 08ACA1B8
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 14:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEECD4027F
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 14:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id czLmCsBRdG5o for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 14:19:18 +0000 (UTC)
X-Greylist: delayed 388 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 24 Mar 2025 14:19:18 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 478B240438
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 478B240438
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=163.172.193.142;
 helo=mail0.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
Received: from mail0.insia.net (mail0.insia.net [163.172.193.142])
 by smtp2.osuosl.org (Postfix) with ESMTP id 478B240438
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 14:19:18 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail0.insia.net (Postfix) with ESMTP id A665D1FCFB;
 Mon, 24 Mar 2025 15:12:44 +0100 (CET)
Received: from UDERZO.insia.net (unknown [192.168.1.35])
 by smtp.insia.net (Postfix) with ESMTP id F2E815F497;
 Mon, 24 Mar 2025 15:14:05 +0100 (CET)
From: Guillaume Chaye <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Guillaume Chaye <guillaume.chaye@zeetim.com>
Date: Mon, 24 Mar 2025 10:12:22 -0400
Message-Id: <20250324141223.9427-1-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail0; t=1742825564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Vr+q9fjVECULQIQFJcvSrH43y/gs3yZdips0sbuOQSY=;
 b=rU60VJrGRV6rfO6/D4GZfAKksPiUbO5WBLiJRfryxkTShyZ2MiXQWMSooH3K8B/GUG+eGg
 U5/ke0PAatPMj5egJB6wGNLz0jMrTXN54m/pa8qtrXUlJ/qcCydeVPnGFP77WmrZXWGpQt
 foU7U7kZM+gdzVHrGKTaGybkMu/CX38M12Qf+Vkmy2l/NBXdb9j9hRew66T80QDDyVBvOP
 x0GHkYp3G3NSa5CstFt1F5gRykkDAMhpbXihSDZM+AE3U1b0gINwdmxEcU2Apm4ASy9m97
 sDbwUPz+ghGqO2C/NeX0T1ktLRlspd0d6ZGnnbhedXu74LAcIuQSQEEHYF2s9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail0 header.b=rU60VJrG
Subject: [Buildroot] [PATCH 1/2] support/download/cargo-post-process: add
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
index 12198051a4..4f75349541 100755
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
