Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C35FCFB440
	for <buildroot@archiver.kernel.org>; Mon,  7 Oct 2024 10:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4C83405FD;
	Mon,  7 Oct 2024 10:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3MHKK_ydH6fo; Mon,  7 Oct 2024 10:52:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6477B405F4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6477B405F4;
	Mon,  7 Oct 2024 10:52:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 59DDD1BF3EE
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 10:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4857C401D5
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 10:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o9bZWi1pVDfP for <buildroot@lists.busybox.net>;
 Mon,  7 Oct 2024 10:52:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 011A5405F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 011A5405F4
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 011A5405F4
 for <buildroot@buildroot.org>; Mon,  7 Oct 2024 10:51:59 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a994c01e77aso3978666b.1
 for <buildroot@buildroot.org>; Mon, 07 Oct 2024 03:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728298318; x=1728903118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OsOkSw2tlty6/wrLMMoa9wRi2nNVGytTpvuxtzU2DiI=;
 b=wUOO3L1oxofxn20dHjAnFIBVPrBLy4T83hqLsVYGnBek8KU9O9VbkgVO0UIjhY1nJH
 apkJp9PnlHNgOTjJta2us7D2YURv+9x427khFEPHVroPJcEqGosD0IllzwRhPrBIKLRD
 WDg6uY65VOrtAg0aX0Tb+FMwGmIUNmM70ikKP7YwL03v+4KTiebv2XUpFGki5vWVhSCY
 5mk+y2KOjO4NhT++nUC9mlIhVP957ks4SNIb0KMFy5R1i9qZrcF/fpDMZYtmGCM2OyMR
 eQxnyOB9PCd47zqtdFzHAil/MIyuq15gwa3Tq0e+gV664uLl1boTY4r0znc106X9iZLf
 8pPg==
X-Gm-Message-State: AOJu0Yy0Tc0/5MRadk5NLqywRMqBtY96lKSIyCe7Axf4izKxuFqQkei5
 DEcuyIgAtcToQW/YNdkeQ8MaiuA5yBGtcxyWCwpGjTyWqz5bR89o4yH+9fRDwMVfPmH6HkN7ATs
 mqIM=
X-Google-Smtp-Source: AGHT+IEJnDycxbtFe01pny4UE2RctBJETM6RjeOdlXF6Z7isWxNYspao5dS1Omtr5yRe+XsgZqrlBQ==
X-Received: by 2002:a17:907:3d87:b0:a99:5fef:4a08 with SMTP id
 a640c23a62f3a-a995fef4ff6mr44726866b.9.1728298317815; 
 Mon, 07 Oct 2024 03:51:57 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:e642:fe3c:c003:b424])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e5bb208sm365515266b.22.2024.10.07.03.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 03:51:57 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  7 Oct 2024 12:51:44 +0200
Message-ID: <20241007105145.1206538-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241007105145.1206538-1-adam.duskett@amarulasolutions.com>
References: <20241007105145.1206538-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728298318; x=1728903118;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OsOkSw2tlty6/wrLMMoa9wRi2nNVGytTpvuxtzU2DiI=;
 b=dd8cYnY9UWzH9YrzVbtKfpzdBjIgVOE9K6gyKnkOPEOgTjhYvsKy9vJV/c38CuFoKF
 5sDoJe8lRVM4AWJ27SIxhQSnRtlK3H8ZXarfIyyL4pTF72fyInlP9Crek67X2c9jVuIl
 lthX3lnb6d+b9CoP8vG2UjDOF8jW/iLPX83+k=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=dd8cYnY9
Subject: [Buildroot] [PATCH 1/2] board/mender/x86_64: clean up post build
 and image scripts
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  - Use function_name() {} instead of function function_name {}
  - Use consistent double newlines between methods.
  - Un-indent the comment aboe the mender_fixup method.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 board/mender/x86_64/post-build.sh     | 11 +++++++----
 board/mender/x86_64/post-image-efi.sh | 12 +++++++-----
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/board/mender/x86_64/post-build.sh b/board/mender/x86_64/post-build.sh
index 23d1120d45..254b0a21fd 100755
--- a/board/mender/x86_64/post-build.sh
+++ b/board/mender/x86_64/post-build.sh
@@ -3,7 +3,8 @@ set -e
 DEVICE_TYPE="buildroot-x86_64"
 ARTIFACT_NAME="1.0"
 
-function parse_args {
+
+parse_args() {
     local o O opts
     o='a:o:d:'
     O='artifact-name:,data-part-size:,device-type:'
@@ -28,8 +29,9 @@ function parse_args {
     done
 }
 
-  # Create a persistent directory to mount the data partition at.
-function mender_fixup {
+
+# Create a persistent directory to mount the data partition at.
+mender_fixup() {
     pushd "${TARGET_DIR}"
     if [[ -L var/lib/mender ]]; then
         rm var/lib/mender
@@ -44,7 +46,8 @@ function mender_fixup {
     popd
 }
 
-function main {
+
+main() {
     parse_args "${@}"
     mender_fixup
     echo "device_type=${DEVICE_TYPE}" > "${TARGET_DIR}/etc/mender/device_type"
diff --git a/board/mender/x86_64/post-image-efi.sh b/board/mender/x86_64/post-image-efi.sh
index 97b9e06d21..c7c848e453 100755
--- a/board/mender/x86_64/post-image-efi.sh
+++ b/board/mender/x86_64/post-image-efi.sh
@@ -7,7 +7,7 @@ ARTIFACT_NAME="1.0"
 
 
 # Parse arguments.
-function parse_args {
+parse_args() {
     local o O opts
     o='a:o:d:'
     O='artifact-name:,data-part-size:,device-type:'
@@ -31,8 +31,9 @@ function parse_args {
     done
 }
 
+
 # Create the data partition
-function make_data_partition {
+make_data_partition() {
     "${HOST_DIR}/sbin/mkfs.ext4" \
         -F \
         -r 1 \
@@ -44,7 +45,7 @@ function make_data_partition {
 
 
 # Create a mender image.
-function generate_mender_image {
+generate_mender_image() {
     echo "Creating ${BINARIES_DIR}/${DEVICE_TYPE}-${ARTIFACT_NAME}.mender"
     "${HOST_DIR}/bin/mender-artifact" \
         --compression lzma \
@@ -56,12 +57,13 @@ function generate_mender_image {
 }
 
 
-function generate_image {
+generate_image() {
     sh support/scripts/genimage.sh -c "${BOARD_DIR}/genimage-efi.cfg"
 }
 
+
 # Main function.
-function main {
+main() {
     parse_args "${@}"
     make_data_partition
     generate_image
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
