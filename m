Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400D3C021BB
	for <buildroot@archiver.kernel.org>; Tue, 25 Feb 2025 10:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6C0A40BB6;
	Tue, 25 Feb 2025 10:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qqqjlsnpIAuY; Tue, 25 Feb 2025 10:09:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9E1440BC6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9E1440BC6;
	Tue, 25 Feb 2025 10:09:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D26A2292
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 10:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1244E6083F
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 10:09:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vaOCZPux5WAX for <buildroot@buildroot.org>;
 Tue, 25 Feb 2025 10:09:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 214A0607F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 214A0607F5
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 214A0607F5
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 10:09:16 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ab7dd005cb0so77835566b.3
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 02:09:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740478154; x=1741082954;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8PjOK0tRtxOoX4o5n11NAi3BUbp5WYNI/CLrMqfBvtE=;
 b=kNr4N88LpWuBVf0LIpi5Qyo0q/aE9Kz+EfyYtBj0sEn/TMCXHcy1T/rNDZxCcGsRxP
 rd/Ma0aNN+yBlzsFphxWXMRu/B7pIKW2IYWdC9LbqRmUl1swWuGrZLyb5RDXFzRfYtRq
 /M6O0yOgZHViPxpZrwb0rAiGq2wspMlOzf0VTYFA4PKpEkCkhXJ10aCVG1bW6P5AbuZE
 ON7vYbTCpRPxTCIFn52U4q7laYdqNdnqeIjH5jkIHyjl+Yaf4eX1jFEDbS/fC+12aacJ
 BPHk1rticrdjOiwmpMJYDFrwVX1WhbkmX5hncsyxpvmCdgsTeEdkLpNLct0aTXhGsZhk
 RPGw==
X-Gm-Message-State: AOJu0YzccxtO1vGP+fWI2+4DPVzBi7x4UD1NitZ7zNuPhbkSxgtwHBE9
 Iw+a8YEiGfAQNgDwHvQuohqwy30S7YpkwsQOOodGNisV0adFSszgLg1UXPmSwq+QYJzY2qQb6ts
 P/AMScA==
X-Gm-Gg: ASbGncsAh72J5pswD+lrM4QA8MooSnJgctZSIxhQ1jKbe+/ucifOTMW4TUPem3EFTJt
 13TISMFSYsIr+um5jBeYJrywT8v16T5CJrhTloTGuw+hHpaqGi+7KQPSwuhKfaK7yJIhC8r8rrG
 ov1mJy1VYwqjx/KO6AbkkPntHFewOER2XYqWE4WRtIfZEi4V4RyOh1gOfMldG3ARPe1Ju7U0b7w
 2n9fsN2p8kJgjhtRHuCvrt/GYGcyDQ6zWoG7zom3++d8gRsvhD75zoAl1ZcqRyKwX2InjlzeD4U
 ihr1M4wC2ZZy3lY+qqxgT86Oe52uPVf2Kh6QPdz4S7p+vernnUtcPoCEH51bMBJDGCnD5gTH1nd
 FH753fbL5M0lEPP5hruRQrEXkJmw1u/ewLgKx1FZygXIoqsp0gctoLKeSlcM81IVI6lc=
X-Google-Smtp-Source: AGHT+IE18m+y0TQ8pKqvMv8tvkK3qDzouBO4EMEfUBFmQpznViB/H2cvnHputnXZTPonmpRqDQQ/wQ==
X-Received: by 2002:a17:907:2ce3:b0:ab7:cb76:1b0f with SMTP id
 a640c23a62f3a-abc09c13ac8mr625715366b.12.1740478154329; 
 Tue, 25 Feb 2025 02:09:14 -0800 (PST)
Received: from fedora.arnhem.chello.nl
 (2a02-a211-a140-6480-ea4e-3e0b-5fd4-931c.cable.dynamic.v6.ziggo.nl.
 [2a02:a211:a140:6480:ea4e:3e0b:5fd4:931c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed2053e88sm114512966b.134.2025.02.25.02.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 02:09:14 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 25 Feb 2025 11:09:11 +0100
Message-ID: <20250225100912.1623970-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1740478154; x=1741082954;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8PjOK0tRtxOoX4o5n11NAi3BUbp5WYNI/CLrMqfBvtE=;
 b=CeiBW0is0oDMT9/pSegxvswdvdLwIo6t6FIK+PmikkZsvUvylFLsiiNk6XgMYxrVNW
 br8P6TCZ29tr3CdHIaK79gL6D37nEpnlMNLWp+QU1y4VRsI2tF2YF+hKhngerJ6I7hGP
 QR4qPc84jtoYYqk546/PD7VO8W+HBCG981adw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=CeiBW0is
Subject: [Buildroot] [PATCH 1/2] board/mender/x86_64/post-build.sh: fix
 device_type location
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

Currently, the post-build.sh script adds device_type to /var/lib/mender,
however, this doesn't work for two reasons:
 1) /data/ mounts to /var/lib/mender
 2) The device_type location in mender.conf points to /etc/mender/device_type.

This leads to an error during the bootstrap process because mender reads the
default device_type file installed by mender.mk in /etc/mender, leading to the
following error:

```
Error while handling bootstrap Artifact, continuing: invalid bootstrap
Artifact: readHeaderV3: handleHeaderReads: image
(device types [buildroot-x86_64]) not compatible with device BUILDROOT_DEVICE
```

Set the creation of the device_type file in board/mender/x86_64/post-build.sh
to /etc/mender/device_type to fix the error.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 board/mender/x86_64/post-build.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/mender/x86_64/post-build.sh b/board/mender/x86_64/post-build.sh
index 5e6967ebd1..9e909e9281 100755
--- a/board/mender/x86_64/post-build.sh
+++ b/board/mender/x86_64/post-build.sh
@@ -42,7 +42,7 @@ mender_fixup() {
 main() {
     parse_args "${@}"
     mender_fixup
-    echo "device_type=${DEVICE_TYPE}" > "${TARGET_DIR}/var/lib/mender/device_type"
+    echo "device_type=${DEVICE_TYPE}" > "${TARGET_DIR}/etc/mender/device_type"
 }
 
 main "${@}"
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
