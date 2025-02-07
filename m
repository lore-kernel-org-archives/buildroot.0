Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1796C02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 13:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FC38606A7;
	Fri,  7 Feb 2025 13:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EXOswvMbxK3c; Fri,  7 Feb 2025 13:40:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CB566084F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CB566084F;
	Fri,  7 Feb 2025 13:40:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F20B2E4
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 13:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF53542A26
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 13:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mD_gYKiUPy-L for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 13:40:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=163.172.193.142;
 helo=mail0.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CE9C9429F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE9C9429F6
Received: from mail0.insia.net (mail0.insia.net [163.172.193.142])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE9C9429F6
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 13:40:33 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail0.insia.net (Postfix) with ESMTP id 631B01FB5C;
 Fri,  7 Feb 2025 14:39:27 +0100 (CET)
Received: from UDERZO.MYINSIA.INT (unknown [192.168.1.35])
 by smtp.insia.net (Postfix) with ESMTP id 931A15F497;
 Fri,  7 Feb 2025 14:39:53 +0100 (CET)
From: Guillaume Chaye <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Guillaume Chaye <guillaume.chaye@zeetim.com>
Date: Fri,  7 Feb 2025 08:38:51 -0500
Message-Id: <20250207133852.2858510-1-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail0; t=1738935567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Vr+q9fjVECULQIQFJcvSrH43y/gs3yZdips0sbuOQSY=;
 b=gTriVRqKF78Fm/Oq1QNM8P3R9eXY0nkQeTAId7eo2zLnrizC4snBNJgeX1R/QMzQ6tz5wH
 u+vU0Lq70nNgr5c07lgyVe50Id9ZOErxjb+6Ktoc5OGaXZ4nw+UJrUQOKC9byN2SjE8Yv4
 Y85S+GmXg4lKhQAuAV3g+1p0tGQRMrX07IaNrcLlnqVYSOmohbc8YIvMqSXmW889dJX+R+
 vZF/ewC3nN6V3Sc3dqMEyaT3CUTJk9nXbMN/xLQozQjglVZdOv2lqwCa31UQrvrlMHHH1H
 7cdEUjoOiEcmnDF5yYsv0OdkQfuVlO0P/gJLnmxyXrXBjEYxEzy38OotiBWkCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail0 header.b=gTriVRqK
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
