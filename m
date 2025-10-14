Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF61CCD192
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 13:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AFFF80592;
	Tue, 14 Oct 2025 13:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5vi-HFzxv1TL; Tue, 14 Oct 2025 13:44:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40814805A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40814805A3;
	Tue, 14 Oct 2025 13:44:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6424A294
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 13:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56716404A3
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 13:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ld0lmxBQyp50 for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 13:44:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B8B594005A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8B594005A
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8B594005A
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 13:44:22 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2907948c1d2so12480605ad.3
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 06:44:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760449461; x=1761054261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GJAs/whMH/DfZEljTxBboyO48+PKO/MeyBa/igmabgU=;
 b=gYRFfZYUE0ecWS0piulJ9IGwLuZQkVZsX+CesCfQt9qJU7DbIHK1B4SeI14t9EBJYp
 JkALtlDECmtDwanPoZp0lzs/z+MtrNKWXkot+p1YBApFYW/tYAEcpG/M+i3fLll01fTL
 98KPFGSJAHKdHs0ibsfmqmVKWicsJe8Uy9ovNGN5ewAk9VgdPuoWMYhmjzrGVjg8/gxu
 jkKDAujcH4NH5Q8vJpNysc0ZyrGTpdU9NUrDEA7ay5VNcR2uUuXx5rcPAt/Vk+OniYBs
 S3NOMorL+5reWkExI94r2r/jS4vqCOWJmIR69+BMjOA/DBWw416Uvnf6WlaERkuXCKlp
 nm0Q==
X-Gm-Message-State: AOJu0YyPvsCmqUnEiLxum/k9mYW1SXGRWgW2UkcMnGXuh83Xh1VDMPcI
 5QaOT8BkC0pWEcGUjVI/iQrnAq0PNPA6Zts+yF/5hKonCQvbm6gOWGl80PqOEw==
X-Gm-Gg: ASbGncvgE320hvgla57ffJmG/fjQmNg/YNDRp/ii3fju3NH2GD+p3UU/hHRpTktm8pz
 8dDyf6C0TxEHeGFCeDtiCPOhhiLYYZZuS/+pKPk9eBJgh2wgyzk6WLX4R9+iOGnU1pCupo6SIK/
 UtdIS5SgZxiUAtK1DRqk0BaG7ODIfH6RmT0XKFXIQnnWXtneIKrUCycI9QybM9HzPSR5hblrkfG
 uDvQgD7do7OSjs6G+Gl1bQWCHcMhIxzOna4X9wUtgjQZDU2a5tBuXziCtdrJtkV6FZ4fYhq+4/R
 UW9OsxLQ5OLxtCq7+po2AQNabRSspkAsQk6NEzmfmAZ37t1lM8xjt7wfBn+LQMX6F660Vd9yqQh
 Al93NdB6y3/iMomsnLyORH+FGclPUrdtAwRk3WQ==
X-Google-Smtp-Source: AGHT+IE1FpCRrXceZjf1xlj3r93gnbIach/RQdl6E+6Kt6PaPw9v4ZSR2/At5UtFxzMoTIufwv0S3w==
X-Received: by 2002:a17:902:ce81:b0:288:ea7a:56b5 with SMTP id
 d9443c01a7336-2902723b882mr358936105ad.15.1760449461486; 
 Tue, 14 Oct 2025 06:44:21 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f4ad6esm164773195ad.109.2025.10.14.06.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 06:44:21 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Lothar Felten <lothar.felten@gmail.com>
Date: Tue, 14 Oct 2025 21:43:49 +0800
Message-ID: <20251014134349.728861-2-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014134349.728861-1-fancp2007@gmail.com>
References: <20251014134349.728861-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760449461; x=1761054261; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GJAs/whMH/DfZEljTxBboyO48+PKO/MeyBa/igmabgU=;
 b=LS13B4CwLdy7t+eUIpgDUFRAOxEhtxsNyrFf9CM5HZJ+SFd+YoPiaSzdMmBzUseLSe
 DGJ5hNbe9xm4+D6JVpQgwj8NcdW7gCHGtTDlQO2DoVi3VjIAIea6ZFCQDrgF4pG1Z+td
 JzkbgGgu0G2dr/gsemopBc9vEOMYrVsm9dWqOtmdQqcmdHHbFGNq5Pu04g67u0eyFUqu
 7h+jDn0IcsrBzSYaXz/s/luFMnwTGOhN3PVt5FNJNvBMUKkIrA4zUbFijItbCvqqjJgE
 kDBYdEXNbe7jwoqdli4mfgdMZkyRLgK881izPP4oDc4a1vQEHgseQUAjUrVPlgE7bqxr
 lthw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LS13B4Cw
Subject: [Buildroot] [PATCH 2/2] board/beaglebone: fix shellcheck warning in
 post-build.sh
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

Remove entry from .checkpackageignore

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 .checkpackageignore                        | 1 -
 board/beagleboard/beaglebone/post-build.sh | 6 +++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4dde533e3a..847e1f1156 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -8,7 +8,6 @@ board/aspeed/common/post-image.sh Shellcheck
 board/asus/tinker/post-build.sh Shellcheck
 board/atmel/flasher.sh Shellcheck
 board/beagleboard/beaglebone-qt5/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch lib_patch.Upstream
-board/beagleboard/beaglebone/post-build.sh Shellcheck
 board/boundarydevices/common/post-build.sh Shellcheck
 board/boundarydevices/common/post-image.sh Shellcheck
 board/broadcom/northstar/post-image.sh Shellcheck
diff --git a/board/beagleboard/beaglebone/post-build.sh b/board/beagleboard/beaglebone/post-build.sh
index b7afd92ffe..dc84d26eca 100755
--- a/board/beagleboard/beaglebone/post-build.sh
+++ b/board/beagleboard/beaglebone/post-build.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
-BOARD_DIR="$(dirname $0)"
+BOARD_DIR="$(dirname "$0")"
 
-cp $BOARD_DIR/uEnv.txt $BINARIES_DIR/uEnv.txt
+cp "${BOARD_DIR}/uEnv.txt" "${BINARIES_DIR}/uEnv.txt"
 
-install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
+install -m 0644 -D "${BOARD_DIR}/extlinux.conf" "${BINARIES_DIR}/extlinux/extlinux.conf"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
