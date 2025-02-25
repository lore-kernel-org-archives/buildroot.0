Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67E1C021BC
	for <buildroot@archiver.kernel.org>; Tue, 25 Feb 2025 10:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C3F080FAD;
	Tue, 25 Feb 2025 10:09:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9oJOecBNt7U; Tue, 25 Feb 2025 10:09:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EBE2810F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EBE2810F1;
	Tue, 25 Feb 2025 10:09:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A490F2292
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 10:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9440740BC6
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 10:09:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFohAYyEKivS for <buildroot@buildroot.org>;
 Tue, 25 Feb 2025 10:09:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4EBA540BB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EBA540BB6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EBA540BB6
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 10:09:17 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ab7098af6fdso70337666b.2
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 02:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740478155; x=1741082955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CT8yzRZzyNubxHq4bk/ZunE+DYLHe7IbT/QxfcXhnHA=;
 b=sITpoZkMkDZXCHoTrdHyM9ls31uIU83q4stT/dwbb8k5hwStEw/8ogx+GG4e8U/tKp
 F8w4rr2u/Nk3+HUkH865GUgfyNgTFcykgePaMT7iov4nghEOmnhSfCSjzgrHvisQVDQg
 swJIP+T3RS77fOjHkhT1LHKZ7v1pcTxnX3Vg50TxZHHwLcuJV7yGvhl9VIbTWrl62xx0
 osOIVfGPAbSC+iAy5SxxzaOEq0bz6mM1k33naRIud/yGiSq+FcT6SCyYz6owGxPttm9u
 kEwGoSpqpjRR12NkEz5s8yvA9slm8l1P1R8tpuZna9cvo6SEaHeIbOT34W/v5CQLOY1b
 UcrA==
X-Gm-Message-State: AOJu0YxRJM+PLj1QgLHNpFhGbzfKs7ewopW81V3Mb9IQ2+lByT8hxZOj
 mHQIdZz4kwk05tZgho57N+lm/yWpEgcBSIyGfrueCbBMcJbU+AgynDYB/PWq21T7AniwrrsvaiR
 NQTfokQ==
X-Gm-Gg: ASbGnctJ9y9gq914Tynps9oavEMcaNwblgtfTDFaJvuZx94a0IEglEHQ7byHiAZaVXR
 HmwLRSWwc2yQNnnml7MfPyyRTM0tdRqZmz9qAhb8F539+dh7Xln/Q697WOym6/J5HOIYNW4dhvu
 X5ApzY3ekD+HiHLtHEygFxtHhx6CE4qnW46E4J1FyDEbmMcoYiTY4jJ59skas53qtOboBfD9xVP
 fuQAJyxzx7lMTkBCudKNCZIm+MGaGaNwKHoq8YcgUlQlpXZz7ufk2oM8kR/9fpw9rmsotaYfEUk
 9knjUjiFxsFqdyqJ3Si57WJVRjyyTiy+G3kivlCROEPAIaYDFsYJ2miTi/i3u5upzh5CUJRiVk8
 C21AjvUH3kVra2mTYjlJstO3+J8OJUkyxFTq3YMnf1J3dHNCO3ABki7X9ln60eZD/Ehc=
X-Google-Smtp-Source: AGHT+IHMpvwbx1BTxPpmqKElAs/5YFqX3ekht5c93tJN0tsAfaqYWq5jCSVxsgUovzDsJtoggN0ETg==
X-Received: by 2002:a17:906:6a0f:b0:aac:619:6411 with SMTP id
 a640c23a62f3a-abc09c24753mr672364366b.11.1740478154757; 
 Tue, 25 Feb 2025 02:09:14 -0800 (PST)
Received: from fedora.arnhem.chello.nl
 (2a02-a211-a140-6480-ea4e-3e0b-5fd4-931c.cable.dynamic.v6.ziggo.nl.
 [2a02:a211:a140:6480:ea4e:3e0b:5fd4:931c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed2053e88sm114512966b.134.2025.02.25.02.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 02:09:14 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 25 Feb 2025 11:09:12 +0100
Message-ID: <20250225100912.1623970-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225100912.1623970-1-adam.duskett@amarulasolutions.com>
References: <20250225100912.1623970-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1740478155; x=1741082955;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CT8yzRZzyNubxHq4bk/ZunE+DYLHe7IbT/QxfcXhnHA=;
 b=LFCAqzJIhw61gWiSt779xK2Rwezdif+koDhjZJIN/Rmq5uLvhORoJ9QohfjRE5L6Ja
 IWCeJ50nLG+/cRNAhMGc/SPmejx0p6tincghNtz3Am8gecBiTebyy4xNjUPWdiWMKEjs
 u0wAgwb4x0NFNeqQRZj5WF2u0bwwmD819BpUU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=LFCAqzJI
Subject: [Buildroot] [PATCH 2/2] board/mender/x86_64/post-image-efi.sh: fix
 bootstrap creation
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

As the mender_x86_64_efi_defconfig does not build the xz package, creating a
boostrap image with a lzma compression results in the following error on boot:

```
Error while handling bootstrap Artifact, continuing: invalid bootstrap
Artifact: readHeaderV3: handleHeaderReads: readHeader: readNext: Failed to get
next header: reader: error reading archive: unexpected EOF
```

This also results in the same error for the generated mender image, as it's
also created with lzma compression unconditionally.

Set the compression to none to resolve the above error.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 board/mender/x86_64/post-image-efi.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/mender/x86_64/post-image-efi.sh b/board/mender/x86_64/post-image-efi.sh
index 3d4ef1176a..a3e262f8fe 100755
--- a/board/mender/x86_64/post-image-efi.sh
+++ b/board/mender/x86_64/post-image-efi.sh
@@ -53,7 +53,7 @@ generate_mender_bootstrap_artifact() {
 
   "${HOST_DIR}"/bin/mender-artifact \
     write bootstrap-artifact \
-    --compression lzma \
+    --compression none \
     --artifact-name "${ARTIFACT_NAME}" \
     --device-type "${DEVICE_TYPE}" \
     --provides "rootfs-image.version:${ARTIFACT_NAME}" \
@@ -68,7 +68,7 @@ generate_mender_image() {
     echo "Creating ${BINARIES_DIR}/${DEVICE_TYPE}-${ARTIFACT_NAME}.mender"
     "${HOST_DIR}/bin/mender-artifact" \
         write rootfs-image \
-        --compression lzma \
+        --compression none \
         -t "${DEVICE_TYPE}" \
         -n "${BR2_VERSION}" \
         -f "${BINARIES_DIR}/rootfs.ext2" \
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
