Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FBEC021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 12:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A138180B1A;
	Sun, 23 Feb 2025 12:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5PVupy5il4MU; Sun, 23 Feb 2025 12:59:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C678D80B1C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C678D80B1C;
	Sun, 23 Feb 2025 12:59:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B0316920
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 12:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F9CA4033A
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 12:59:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYLq3KVkKzCs for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 12:59:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 62A6C40339
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62A6C40339
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62A6C40339
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 12:59:30 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4399a1eada3so31058785e9.2
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 04:59:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740315568; x=1740920368;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xJU5w75wqz7P1HpACJBhbSBS4h6BGg2xThMm2xUxqNY=;
 b=jNR07XZf7I6tIGyozowGXJbvZHHGizxtTW1KlQouUoCZct3goHnCWJdCzez1GQDUGD
 SEgcRT9M+nME12KUMARmuj6z1FO0A2V1qLe4FQpFkJgHTTgXqqg7u3ifIeAlUINXEwje
 Ugx0KtT8mJ4ejCw56UI9Xji+TIJz+X1q7+tPveGXuTkBtPD/vbC4IhK1fMC74SnErfQQ
 XIZGgbDb6HFH4sQVp6I1YeQYjfWfkT/m5JuD0CogVJ40OL2cOxelRzpNxky80yy+xmfU
 6v/kGCvi93cZlGkfAhf/rZun9WAUJAqShUtfJc+mmpjYnOiTY0ql2TTPBoG7RMHHLK1R
 Bixw==
X-Gm-Message-State: AOJu0Yz8/MSDU2EwlFyckar7F+0KiaRjKY1zu4VsReeAFwBRNmua7xYl
 tG7w/15PgEZqka6ufOkZ5kmC/iNi94zCt2hUuoITNQvXXeVqR3X5B4Ys6Q==
X-Gm-Gg: ASbGncsQp7LOW2yqV2aFhyE6ehJ/mAGcyWewhpSybSg92KBPolfbHn80+9oDraZOglj
 J7x47hlejcdXieSDp4Gdl11+3llnTDIE3WZnH7jwICPsNPT1KaJGUXykMLQ5FiVEIBeCGq/c54D
 7MwXClVoBxwEHj/xtROs54dVcVvkMqQO27uKxL/aWn1b3f7Yl1/izIjB4zOB/HM5ly/VhyACneE
 6w62BTSjbd2YoFMvAVe6MHOOoS0x8GTtbst5AfnX9OY0ULBrKpod2pM3Fo+o+BlfE12hn44EOiG
 xrkD/AlGmgzLh1JLgdHD9uuRPqNcw2DARQVh
X-Google-Smtp-Source: AGHT+IFQ+FvvR+RLiVv0FphqalsHldsKPtkUofjXVmzPGWFrDljzXnVkiDtKbw1/IDTzD4+3CppWyQ==
X-Received: by 2002:a05:600c:468a:b0:439:87d2:b0fd with SMTP id
 5b1f17b1804b1-439ae1e8dc2mr81775295e9.12.1740315567937; 
 Sun, 23 Feb 2025 04:59:27 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02e6cf4sm76444475e9.19.2025.02.23.04.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 04:59:27 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Feb 2025 13:59:26 +0100
Message-ID: <20250223125926.3645897-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740315568; x=1740920368; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=xJU5w75wqz7P1HpACJBhbSBS4h6BGg2xThMm2xUxqNY=;
 b=gtSlJfpr8tjVpVjx1EK6jH+EXnWwqyqMaN5ak/i2ELFWHmLNUnNP1q6LgNbsOeQAwF
 zhJ0KDwtdnIrCCkzJTC/Jgi5GBJOwZndUNG7+uPtiCFWSnfIxMaTd/VKRz0qKRMfRN1J
 6X+2g4TYAATXkvSU1fYY7afsVssb6ieYGaMI32+DlzB2AclpOEGnohEwOhYYWreTHA40
 Mi/LYRmX9mUAB5Hd7vopBmiEvuejcwCfb5stUu9uB/gIMkIH/NwJhvGqnnvA8+LSEBCr
 Qv3G9rv7vXf34+2fNE5YO5/EHRrXwB7Tududf6Pg3mfaSBBELZbpHjFW003C9IGOG7cX
 GXqg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gtSlJfpr
Subject: [Buildroot] [PATCH] DEVELOPERS: fix cyclonedx script name
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit dbab39e2d908 (support/scripts/generate-cyclonedx.py: add
script to generate CycloneDX-style SBOM), the script was renamed while
applying thr patch, but the entry in DEVELOPERS was not updated
accordingly:

    $ ./utils/docker-run ./utils/get-developers -v
    WARNING: 'utils/generate-cyclonedx.py' doesn't match any file, line 3179

Fix that.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9a220359e7..61b531f424 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3176,7 +3176,7 @@ F:	package/xorcurses/
 
 N:	Thomas Perale <thomas.perale@mind.be>
 F:	package/go/
-F:	utils/generate-cyclonedx.py
+F:	utils/generate-cyclonedx
 
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
