Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6548CD3442
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 10:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D28883B89;
	Thu,  7 May 2026 10:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-Li4g-06nvg; Thu,  7 May 2026 10:11:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 675C683653
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778148679;
	bh=ruqcmjRIKMAjdpAluo+sJcm8N0mIDffp+7E7mUDMxdc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NwIz17tBWnT9OscmnDQ1qJ8/zN1R7q9r7O3C8sK2Omh7lg9JtsxgoYKfeT1QzV/ah
	 hypZjKSF5V/psATKb3wyhyPj/8da5YIHYETqmr66QcUH1wr1lcHToKVcRA4lj+DGUv
	 ND6MwyQnf5bsRCqARPBP1Ki1O11gBWKqW+gX82t3enNhl33m7GgBqFGt2AcdchSXv5
	 06AC5kZnpAvRdGQxZI/cydelyJ00mnoydbmnkqn5KJFUOSAvjGISC/NP/YhoizNYqV
	 Z5JZ2YaGHLjDjvJaoel4UWrROBXc8eFwi40THriLG7jqPThXArzRnPl7MwxvuvovFj
	 tMJdKF+WS3V/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 675C683653;
	Thu,  7 May 2026 10:11:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7632E317
 for <buildroot@buildroot.org>; Thu,  7 May 2026 10:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BC2483653
 for <buildroot@buildroot.org>; Thu,  7 May 2026 10:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sFatlAtzhBxP for <buildroot@buildroot.org>;
 Thu,  7 May 2026 10:11:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=andrea.ricchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 69EA883579
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69EA883579
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69EA883579
 for <buildroot@buildroot.org>; Thu,  7 May 2026 10:11:17 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4891c00e7aeso5584765e9.2
 for <buildroot@buildroot.org>; Thu, 07 May 2026 03:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778148675; x=1778753475;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=txoYei4F+ukXYm9HYlmYV/jLYDIFaUqqg0vN21gpor8=;
 b=jK+r8Gdza2Y+NF3Wmoc7zFsM4k42V6iGMWldqynI3tyfPfP7nMoxa3MjdrKn14Jeoi
 1xwWRrhwx/meCJK/V2oomxLr5vnbV0cvuWinmn92thwg/hClNOz8dZRTTB3Hb/Nt/8WT
 QBw4xhZtUzfdEizjWgr8wNlxn0kRZlhbgICyyrcz1VCFtXIdVeoTVrThh1zr45+gs9+u
 sEuFOBt9f7XK5duWzbjZXSdjBITh/+/8hJr8gA/YdxMTKeKZ/LiwodEpETdXekEaMXVh
 IbxOOexuiL/GLPEDTlg+zxR4MHYPJhQra5s9xK37YxKTVqNV6rTmwpkzjPPrrzGE6/av
 8/Pg==
X-Gm-Message-State: AOJu0YzR9e1l99kiiARSS5KLLL5DcLfCwbDYYxbRer0F9/WGTAus7nV9
 DJmK+cpAPNAKkSUSQ/p5Q1j3RfaMZvDWKwCU16YVMNOps3B57tvhDCSenJVb0iiJ45w32ieCoIN
 gmR4C
X-Gm-Gg: AeBDietn1cJeRkBX9SBT7cemxw/ndxGBGuS5Ouce4MDaF51UGrNr6V0084+2+Yy4myg
 CeySbAV1mahmVpfXfnjmMZ4hAqB9rYyugSq/I1tnSTKHThI2gi23hXltKTwjeBByAAQ21hPXsTV
 HqyG0konYbNIxt+dV0J7rBTVFbo78PGNqbsBHRcmLUxxXIWpDUiAm0XptdpfTrNIY8w8zdV9XXc
 YbOqhggVnnbCHqcjcXctjHpLtXljiRS+lW2PZ2iz8ng8llKIW0c8F/4kyglYg4HatrjULUeQOto
 mrBwrkpY7AchpfBFcrKFDOjii3wQ+X/OPjPboyb8VimzbAbPjqcXoKZVenH1TUo9B7Omyehqw1R
 RRoNih28KgMK8yXR9JSC+MTVsVM3BunQKlto5R7FkLdNCVs875Rkvb+PEXAUqIvIm1xi3Ef1JrW
 bG/80VKDEluEUMJ9gcNi2tbDtfeRwuWWWlnCg3MoxnsH4RJl4s0HpcrCVOOlgABlAXTlvT0F7KS
 cstJtg8meQXnKVEufP+L/xLA7jSgz9IgLb8J4VcNpxpfGFP6K/hdUx54bqaEKYYx9Le2d8rXvbe
 icQr5J1/24BI
X-Received: by 2002:a05:600c:4881:b0:485:3ff1:d5ed with SMTP id
 5b1f17b1804b1-48e51e0a697mr75439135e9.1.1778148675005; 
 Thu, 07 May 2026 03:11:15 -0700 (PDT)
Received: from localhost.localdomain (93-47-52-235.ip111.fastwebnet.it.
 [93.47.52.235]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e53891163sm124431445e9.2.2026.05.07.03.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 03:11:14 -0700 (PDT)
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu,  7 May 2026 12:11:10 +0200
Message-ID: <20260507101111.40390-1-andrea.ricchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1778148675; x=1778753475;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=txoYei4F+ukXYm9HYlmYV/jLYDIFaUqqg0vN21gpor8=;
 b=NbyAIFMCZZdSmdfsIMM/sAIgk0g7Bmx16TtfwzVN6zQpAhVjmjqzhCcEjbgPQfn88d
 MqKwwHvDRpCE/ZbGYbBIt19xL7odEMw1/3j1aLt2EoPbd3VlvnoqKxChuJ4FYWtqubJa
 582sV/lwN6DMPooEHX7jP8nCFzv3g3gMZS9c4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=NbyAIFMC
Subject: [Buildroot] [PATCH RESEND 1/1] package/cutekeyboard: bump version
 to 1.6.0
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

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
---
 Resending this patch as it has been a couple of months since the original submission.
 No changes have been made.

 package/cutekeyboard/cutekeyboard.hash | 2 +-
 package/cutekeyboard/cutekeyboard.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cutekeyboard/cutekeyboard.hash b/package/cutekeyboard/cutekeyboard.hash
index 5800865230..acd2017056 100644
--- a/package/cutekeyboard/cutekeyboard.hash
+++ b/package/cutekeyboard/cutekeyboard.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5ac0521f89ee9b7a2793150f09a77693b797301d12b8a65fe214387d8e8c0845  cutekeyboard-1.5.0.tar.gz
+sha256  5e00ab346038e41e11662016b56c4e95fa08e7efeb7ca61aeab5b863a0bb7300  cutekeyboard-1.6.0.tar.gz
 sha256  bdde6ec2ae2686623c0bb414bfb8bd731b314beff2264c602116ea60dd65964d  LICENSE
diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
index 9a29f5df02..12a6573d52 100644
--- a/package/cutekeyboard/cutekeyboard.mk
+++ b/package/cutekeyboard/cutekeyboard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUTEKEYBOARD_VERSION = 1.5.0
+CUTEKEYBOARD_VERSION = 1.6.0
 CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,v$(CUTEKEYBOARD_VERSION))
 CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
 CUTEKEYBOARD_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
