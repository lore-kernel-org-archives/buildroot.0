Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C47ED10C15
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 09:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DA668134F;
	Sun, 27 Oct 2024 09:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nU4VCJh5378C; Sun, 27 Oct 2024 09:33:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B49158135F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B49158135F;
	Sun, 27 Oct 2024 09:33:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 709C3971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 09:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5150A40403
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 09:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XohI6ygtVXxz for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 09:33:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F129403E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F129403E3
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F129403E3
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 09:33:11 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4315baa51d8so34182295e9.0
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 02:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730021589; x=1730626389;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i/7R6fpprOSMzT5r4vJvghmtqvkkKZKOeQdlbfH9Ipk=;
 b=Vf/7SrE/K1Z7Jb2czsnQ4uGo8TVomwLgvU/IociK8V25xXnKhS5QIGourYasp/7wQi
 lTdwVRQZHxyrLxPe77PNPQONPsqyBnsyUYashSzNhZnvwu1aJgcexc1l07xGO7ZGSWnk
 EISVwYvd/QXYqpFdNzuNzXWCVVHj9fgjgqFyX5CYp1yXzbdAPIAEbgTSE5559hCH2fcd
 WQs9GhV/cKz0jY7hrx8yAaesJ5ruYmPZgku6b+es4doitUYtcjX4B1uq3AOEvMJOi6kL
 Gzi1LMMzHmrzR4pMRYdsCppMXgH7T2l7coAAxQuRfmFZHL86R5t51x8FbPYQE5xJB+hk
 O6gQ==
X-Gm-Message-State: AOJu0YzAx48iQ7BG2Cwk25bCizGQmEGrFY8wtj6Ao0JtARwl7xjgc1pD
 WN8M2M6GiaHZoKxCbPxbmHwQqFE/WnU0lDLCJbNueQ/v18TU4o4XbAVAPt7w+LlbycMJ0UMbsRP
 6
X-Google-Smtp-Source: AGHT+IH1Yt4XXR9+M3zAJTN/5c4TgAljnbq2CXUbBXP+h6GrK/5gAs4thhnoQm55+DafsBZ1k5n/zA==
X-Received: by 2002:a05:600c:1d19:b0:431:5655:1ef3 with SMTP id
 5b1f17b1804b1-4319ad0d11dmr31417395e9.23.1730021589422; 
 Sun, 27 Oct 2024 02:33:09 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43193595baesm69662135e9.17.2024.10.27.02.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 02:33:09 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun, 27 Oct 2024 10:33:04 +0100
Message-ID: <20241027093306.2271872-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730021589; x=1730626389; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i/7R6fpprOSMzT5r4vJvghmtqvkkKZKOeQdlbfH9Ipk=;
 b=yRdZmodGimUZ5EViZkhS4NoVjG+GPSm3KoC4A66CewTxrnZlg53S/lklfwdtLUsQXm
 70h8v4f4G66uhXiDlMoU87dPgsuNzJlzKBHUSNZIPvGUcncFRh+XYHE09qF4fo48Ki2m
 1NRli2oVQnIALkZX09jvTObWgoylzYf2x12I8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=yRdZmodG
Subject: [Buildroot] [PATCH 1/3] configs/qemu_aarch64_sbsa_defconfig: update
 ATF to v2.11
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

qemu_aarch64_sbsa_defconfig doesn't boot since the qemu version bump to
9.0 [1]. Sync the ATF version with the one (v2.11) used by Qemu tests
[2].

Since we use a released version of ATF, we switch to ATF custom version
to use the official ATF repository instead of the read-only mirror on
ARM-software's github.

This doesn't fix yet this defconfig due to a bug in edk2 as mentioned
in the qemu commit log [2].

With the edk2 version bump applied, this defconfig doesn't boot with
ATF v2.10-lts but boot successfully with ATF v2.11.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/103a55028c75dace312470ba05a197886c6b6100
[2] https://gitlab.com/qemu-project/qemu/-/commit/24a7cd6a7c21f82f1ce9bd5ecf6fb54eb7bf4602

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 configs/qemu_aarch64_sbsa_defconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
index 8da4331b30..23d274b529 100644
--- a/configs/qemu_aarch64_sbsa_defconfig
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -17,9 +17,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu_sbsa"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_EDK2=y
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
