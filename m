Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3826CFC538
	for <buildroot@archiver.kernel.org>; Mon, 14 Oct 2024 10:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 997D360789;
	Mon, 14 Oct 2024 10:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L_wRyIdF0V9G; Mon, 14 Oct 2024 10:21:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 937496078D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 937496078D;
	Mon, 14 Oct 2024 10:21:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 161131BF2F0
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 10:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0444340296
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 10:21:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IeAZG7WWWN1g for <buildroot@lists.busybox.net>;
 Mon, 14 Oct 2024 10:21:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E801A40373
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E801A40373
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E801A40373
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 10:21:30 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-431198c63cfso4001915e9.1
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 03:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728901288; x=1729506088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U2uQAp7wvUVaTCAYFp/24MvDbY6QTZR4LOdCLJT88VY=;
 b=i4+W+oRmfOokOxZgPvNAhOvP3AV3e1hPOuA5xx9JnA0eN8YFrgLnjb8BQaNRw+bCpc
 kkK739ngJFWVpDStyqfijgnCKiQAUFceI6Ny32iYBRMWzVbImaRRQHrBy5SSQ0tgK9gC
 b/8U8lY/CtFG+MlkBoy974192ntFk6JTT6Qe7tzgYOrlFIv6Kf9RYYVuFWqmJMSDM115
 iq+TUjr91DSgVOyCgfpPpwzCAimoSu5YyxdoM7SPC9kbHUZyagENhSU79CGrt78JrVaY
 fjTitVzkcis9I5bLr2r+pkk/hYk8dSb082xDTnS84VcO+e84S3EHPHoWI5nrdFBVaJF4
 zRDg==
X-Gm-Message-State: AOJu0YxrsWsQ91IrpXcKw1DO43COmDg0Fe1sR8uiohTqPcxXOu4SL4ph
 5BsGxFhyJbC0Me9ol3So+LIuWZOspYx75+PU5dtGAMeA0yfryJUo0VOLOE5fol21ICDkT2HL9i+
 C7n4=
X-Google-Smtp-Source: AGHT+IGSK2zSBVxZSUI/5Sv5Upf7JI0j28pxapAb6nvox1HiL3f8ZPRH5YmZ0hsxNKCdMIh2sG3aYw==
X-Received: by 2002:a05:600c:4e8e:b0:42c:b172:8c53 with SMTP id
 5b1f17b1804b1-4311df39dbemr42270225e9.5.1728901288350; 
 Mon, 14 Oct 2024 03:21:28 -0700 (PDT)
Received: from adam-laptop.amarulasolutions.com
 ([2001:b07:6467:4426:e642:fe3c:c003:b424])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431182d7ca3sm116402605e9.2.2024.10.14.03.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 03:21:28 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 14 Oct 2024 12:21:18 +0200
Message-ID: <20241014102123.3727883-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241014102123.3727883-1-adam.duskett@amarulasolutions.com>
References: <20241014102123.3727883-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728901288; x=1729506088;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U2uQAp7wvUVaTCAYFp/24MvDbY6QTZR4LOdCLJT88VY=;
 b=hH0avwzZ7nMrH3xYxcnjx3Ge4ZrLuYius3govn5jrsVpry2N7MckyGqzUfrfRdtaNb
 qQVXuvcmY4WooLj5GQTNhCt6uO0nQg3i/BRGzV+9Nnw9PL+eb1QIwDrgZJDWFeQo/SfG
 SCll/87S6m0GZP+PF8ok37TuuQCDH8O5wffOw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=hH0avwzZ
Subject: [Buildroot] [PATCH 1/6] board/mender/x86_64/post-image-efi.sh:
 re-arrange write rootfs-image args
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

Put the write rootfs-image argument before the compression argument.
This change makes the logic easier to follow.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 board/mender/x86_64/post-image-efi.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/mender/x86_64/post-image-efi.sh b/board/mender/x86_64/post-image-efi.sh
index 073b18c972..c2706a8df6 100755
--- a/board/mender/x86_64/post-image-efi.sh
+++ b/board/mender/x86_64/post-image-efi.sh
@@ -45,8 +45,8 @@ make_data_partition() {
 generate_mender_image() {
     echo "Creating ${BINARIES_DIR}/${DEVICE_TYPE}-${ARTIFACT_NAME}.mender"
     "${HOST_DIR}/bin/mender-artifact" \
-        --compression lzma \
         write rootfs-image \
+        --compression lzma \
         -t "${DEVICE_TYPE}" \
         -n "${BR2_VERSION}" \
         -f "${BINARIES_DIR}/rootfs.ext2" \
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
