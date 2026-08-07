Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6871C5AC81
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 12:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A79440A8F;
	Fri,  7 Aug 2026 12:55:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NjMSr8biAuXJ; Fri,  7 Aug 2026 12:55:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FB6C40AAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786107328;
	bh=O11A7Y0r53MitVTOx5aXKm51rhSAboWLjAfVxkPJEJI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gld5QL7Wmte3TFScp8XtFrHX8/J/llssSejWFi/UCGwuDxpw9YGKBzxllj2wj8zYe
	 DXTXFgT2FppHbVV347sP3I6ffi9RsEasyieQ/JXHLk0Z3MVeY9OQI3hflnqv509vAJ
	 Nu78ivqaLJc4CWgWekgCNzEdCNduFxbMMi6qq+eIDDbDlBKRoaAuPk1M3jLja0qB+C
	 2tfkdqlSXD9wynOufmE4niZVnOriUYi9n5K8D0Jp+d+DEjUTyCqNUyDbDQ1apgU777
	 ipc68y4p2PWIU9jmUMTYe/J0+oEhzxKNOXkDmP0pt05BKEEyQz6HEm/gJ8ADobcXVB
	 xKXsdOSPjQDZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FB6C40AAA;
	Fri,  7 Aug 2026 12:55:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E8BCCD3
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA0C040A9F
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qyukzv_9QvvX for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 12:55:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E211440AA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E211440AA2
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E211440AA2
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:19 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-c160d8760e0so41296466b.0
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 05:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786107318; x=1786712118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oxa4czY/mgU2f9MEfCWGyB2ZkTR8cQwY+2DMqhQ9KjU=;
 b=AHdblSO5r390sz/OegEBACaYWX55tFqPHOp4vcMBvAmX/c+i21j0iSCsF+CB0XEIoE
 qioLR4kNvB82oj29IIQxiF90BzdMN2J+vxUjnUyf6nTPTuMvXdphHd0QYrYv+OIDbeg4
 mq/zR3NwdOhQO5WeV88fe7LfoH4T4GY0IMQV3MlwnS6KKPgWPsOfwJXvnsg9dSCSC3tu
 qtgBC3ej8fiDW9GWSDuZ2DlcOUEzjeLUiw8kDwVFg3sQ1dNKYdxIriuQ/fnEVs9oyhX1
 17sGZSsI2Jo8qEG5sIUMwH62IFXgOfMVLLsGTCk/go68JXdI/S5m9lCQPyrB5UIj9f7f
 cUOA==
X-Gm-Message-State: AOJu0YyFLC7REc4fJjI8sGxL+HqEtglVNaapw2IxDhGm0JBjxyJL/bdg
 oLcW9XKxHgXwkbOf3U/zhFQ4x8gCSZpMi1pF03etdxJ0ATswQWGxC7Fr7uWqsE85zaTt2ZZaMaR
 t6EP7Y+w=
X-Gm-Gg: AR+sD10FjZ/yxwRciTH9k9T11rqDBeaaNfgkHosm7SSSMwAjXwanSXWh1zseIPePfRJ
 5WBuLraENF8394wWLZ+pbktTA5CJkZFmVTGA70d9lIaMw2ZNxaiELam9gQmzSIz4d03/edlFIR3
 H2J1/pnRT4xwJ2DawzFXqhXALNUogAGMfA3RaQ+VCllTYG/xFwJu5QIMJd+QL2SggEtMPqRXlaV
 3anztx5ca7XqUxpoCnx0+Eh2IIM/DHLQVhRUr4FdfJSwhZkevg3IdkKRw3xbZxfKHCUQLAbLbIP
 phrrI9I+fG2A8IIzeEpZcLtiFeFst1qmt9z0SvQDn/Ihgv4spzyh5t6Xl40KSoxVNST9tZUHOYG
 l6Tt113jeoISUQ8wCbuXzxA603FZXaNwbeJ58xEqUStIA6pgYEYFFRByi+s/vVcORZNEp4sjJ6L
 tkop5/xFqpEMNtCLQGkb2QJRDLftU8eaJw4b0vxceDrU3od+oXySEjYQ4u6W1Wkbl2oF0JriZ6f
 tsuZsE8YY+rEOlC1ahPJgnW4I25XpO03C90AVA0l5V6sDBa3phRAbWVg7A9gslO11UT9JTRmFWX
 0nvfVCiUhl2KRyZdgBB36Y1iNcobCIfQcvD2M7RdW/llcok5NLkqHoM+kwmeQh0Pg3xM0p4vW28
 =
X-Received: by 2002:a17:907:c386:b0:c20:38e2:b355 with SMTP id
 a640c23a62f3a-c2039f6e614mr549556266b.4.1786107317779; 
 Fri, 07 Aug 2026 05:55:17 -0700 (PDT)
Received: from adam.amarulasolutions.com
 (2001-1c00-8183-9900-f185-b195-5f14-b7f0.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8183:9900:f185:b195:5f14:b7f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2080a29a8fsm49539866b.4.2026.08.07.05.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2026 05:55:17 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Fri,  7 Aug 2026 14:55:06 +0200
Message-ID: <20260807125510.1285300-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807125510.1285300-1-adam.duskett@amarulasolutions.com>
References: <20260807125510.1285300-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1786107318; x=1786712118;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oxa4czY/mgU2f9MEfCWGyB2ZkTR8cQwY+2DMqhQ9KjU=;
 b=CA0qB1eVcz+voBqvSFfnBOy98kiIAIZ50PgHYpndIXcijzEQFqzn5GlTd07yFkPldU
 2EDZ7YueO7Rwq/9y2sIukSAUdKymoLq6wjlflQY0/iDOuNzmwf903774lHmvxIoJsQhy
 Vnf/XWIdwUcKsiaDPsyd1OSYk0lXbL6GpXScw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=CA0qB1eV
Subject: [Buildroot] [PATCH 07/11] board/mender: change device type to
 compatible-types
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

Newer versions of mender-artifact echo deprecation warnings when using
the --device-type argument and tell users to use --compatible-types.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 board/mender/x86_64/post-build.sh              | 12 ++++++------
 board/mender/x86_64/post-image-efi.sh          | 18 +++++++++---------
 configs/mender_x86_64_efi_defconfig            |  2 +-
 .../tests/package/test_mender/post-build.sh    |  6 +++---
 4 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/board/mender/x86_64/post-build.sh b/board/mender/x86_64/post-build.sh
index 9e909e9281..3989b58b42 100755
--- a/board/mender/x86_64/post-build.sh
+++ b/board/mender/x86_64/post-build.sh
@@ -1,11 +1,11 @@
 #!/usr/bin/env bash
 set -e
-DEVICE_TYPE="buildroot-x86_64"
+COMPATIBLE_TYPES="buildroot-x86_64"
 
 parse_args() {
     local o O opts
-    o='a:o:d:'
-    O='artifact-name:,data-part-size:,device-type:'
+    o='a:o:c:'
+    O='artifact-name:,data-part-size:,compatible-types:'
     opts="$(getopt -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
     while [ ${#} -gt 0 ]; do
@@ -14,8 +14,8 @@ parse_args() {
             # Ignored to have same options as other scripts
             shift 2
             ;;
-        (-d|--device-type)
-            DEVICE_TYPE="${2}"; shift 2
+        (-c|--compatible-types)
+            COMPATIBLE_TYPES="${2}"; shift 2
             ;;
         (-a|--artifact-name)
             # Ignored to have same options as other scripts
@@ -42,7 +42,7 @@ mender_fixup() {
 main() {
     parse_args "${@}"
     mender_fixup
-    echo "device_type=${DEVICE_TYPE}" > "${TARGET_DIR}/etc/mender/device_type"
+    echo "device_type=${COMPATIBLE_TYPES}" > "${TARGET_DIR}/etc/mender/device_type"
 }
 
 main "${@}"
diff --git a/board/mender/x86_64/post-image-efi.sh b/board/mender/x86_64/post-image-efi.sh
index a3e262f8fe..a1dccb25b3 100755
--- a/board/mender/x86_64/post-image-efi.sh
+++ b/board/mender/x86_64/post-image-efi.sh
@@ -3,14 +3,14 @@ set -e
 BOARD_DIR="$(realpath "$(dirname "$0")")"
 DATA_PART="${BINARIES_DIR}"/data-part
 DATA_PART_SIZE="32M"
-DEVICE_TYPE="buildroot-x86_64"
+COMPATIBLE_TYPES="buildroot-x86_64"
 ARTIFACT_NAME="1.0"
 
 # Parse arguments.
 parse_args() {
     local o O opts
-    o='a:o:d:'
-    O='artifact-name:,data-part-size:,device-type:'
+    o='a:o:c:'
+    O='artifact-name:,data-part-size:,compatible-types:'
     opts="$(getopt -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
     while [ ${#} -gt 0 ]; do
@@ -18,8 +18,8 @@ parse_args() {
         (-o|--data-part-size)
             DATA_PART_SIZE="${2}"; shift 2
             ;;
-        (-d|--device-type)
-            DEVICE_TYPE="${2}"; shift 2
+        (-c|--compatible-types)
+            COMPATIBLE_TYPES="${2}"; shift 2
             ;;
         (-a|--artifact-name)
             ARTIFACT_NAME="${2}"; shift 2
@@ -55,7 +55,7 @@ generate_mender_bootstrap_artifact() {
     write bootstrap-artifact \
     --compression none \
     --artifact-name "${ARTIFACT_NAME}" \
-    --device-type "${DEVICE_TYPE}" \
+    --compatible-types "${COMPATIBLE_TYPES}" \
     --provides "rootfs-image.version:${ARTIFACT_NAME}" \
     --provides "rootfs-image.checksum:${img_checksum}" \
     --clears-provides "rootfs-image.*" \
@@ -65,14 +65,14 @@ generate_mender_bootstrap_artifact() {
 
 # Create a mender image.
 generate_mender_image() {
-    echo "Creating ${BINARIES_DIR}/${DEVICE_TYPE}-${ARTIFACT_NAME}.mender"
+    echo "Creating ${BINARIES_DIR}/${COMPATIBLE_TYPES}-${ARTIFACT_NAME}.mender"
     "${HOST_DIR}/bin/mender-artifact" \
         write rootfs-image \
         --compression none \
-        -t "${DEVICE_TYPE}" \
+        -c "${COMPATIBLE_TYPES}" \
         -n "${BR2_VERSION}" \
         -f "${BINARIES_DIR}/rootfs.ext2" \
-        -o "${BINARIES_DIR}/${DEVICE_TYPE}-${ARTIFACT_NAME}.mender"
+        -o "${BINARIES_DIR}/${COMPATIBLE_TYPES}-${ARTIFACT_NAME}.mender"
 }
 
 generate_image() {
diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
index f0a2088b8c..2f2e3e4f4a 100644
--- a/configs/mender_x86_64_efi_defconfig
+++ b/configs/mender_x86_64_efi_defconfig
@@ -6,7 +6,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_ROOTFS_OVERLAY="board/mender/x86_64/overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/mender/x86_64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/mender/x86_64/post-image-efi.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--data-part-size=32M --device-type=buildroot-x86_64 --artifact-name=1.0"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--data-part-size=32M --compatible-types=buildroot-x86_64 --artifact-name=1.0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.43"
diff --git a/support/testing/tests/package/test_mender/post-build.sh b/support/testing/tests/package/test_mender/post-build.sh
index 1afa231082..76698fb7d9 100755
--- a/support/testing/tests/package/test_mender/post-build.sh
+++ b/support/testing/tests/package/test_mender/post-build.sh
@@ -1,13 +1,13 @@
 #!/usr/bin/env bash
 set -e
-DEVICE_TYPE="buildroot-arm"
+COMPATIBLE_TYPE="buildroot-arm"
 ARTIFACT_NAME="RUNTIME_TEST_ARTIFACT_NAME"
 
 generate_mender_bootstrap_artifact() {
   "${HOST_DIR}"/bin/mender-artifact \
     write bootstrap-artifact \
     --artifact-name "${ARTIFACT_NAME}" \
-    --device-type "${DEVICE_TYPE}" \
+    --compatible-types "${COMPATIBLE_TYPE}" \
     --provides "rootfs-image.version:${ARTIFACT_NAME}" \
     --clears-provides "rootfs-image.*" \
     --output-path "${TARGET_DIR}"/var/lib/mender/bootstrap.mender \
@@ -17,7 +17,7 @@ generate_mender_bootstrap_artifact() {
 function mender_fixup() {
   rm -rf "${TARGET_DIR}"/var/lib/mender
   mkdir -p "${TARGET_DIR}"/var/lib/mender
-  echo "device_type=${DEVICE_TYPE}" > "${TARGET_DIR}"/var/lib/mender/device_type
+  echo "device_type=${COMPATIBLE_TYPE}" > "${TARGET_DIR}"/var/lib/mender/device_type
 
 }
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
