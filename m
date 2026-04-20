Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A9AF5A8A1
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 17:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DC85610EB;
	Mon, 20 Apr 2026 17:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hkPizySO3WN6; Mon, 20 Apr 2026 17:38:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 218A761018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776706736;
	bh=14gKgHOcpswxud0GjNzuOiI1hjev8LFBklvD8PpVWhg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ai7y6ABDlg+lDfaxoLnuav2xig8UkaMMJwC00r+3iP3S/2XVJNSCkTGy7zon54cF8
	 NIHhYXYQwr1/5+SyIpSvqk7/3KpMFZoKBB3hONhX3AcEind3TPTTXilk62vhUVccXe
	 dhLG1aONt4PnEp/SUFNYCpSqnJBz17d3PFE6YO4yRY/IvNv0guZMgnmwy9hzkCRq66
	 KJzqpJXaTjfcXWAj7Xa9yGAPT+cw4EKRS6eDXm7N31dR9+DBnFd/RZYfLXecHyhukE
	 zdGJV56kZwmQBN+MrFQFq+q7QHzMyVCd1kZcQcNX/gkYTf3ggSruxDTlpMXvlyNhCv
	 XYfBrnmG2HDGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 218A761018;
	Mon, 20 Apr 2026 17:38:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F54724D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C42261018
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 811Qi487zmZw for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 17:38:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 58EC461010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58EC461010
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58EC461010
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:38:53 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43fe62837baso2025448f8f.3
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 10:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776706731; x=1777311531;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MpfNy6Rt+yRhY+EqMhNptj+Rqi92JzZzJ7q/GLVV6nk=;
 b=aZNlacfK1VAWDQh5vSqk76NJ3z8BRF7lRWIRr8RYKRhKb2M2VgE8GCrb7NU66Ukrzp
 DYPO+FHIh/FsuNzIcbrE3szygvBmUadsS83G39NVmb1FR/SP19FUqTHLIcGkQIkpi8WO
 okb+c/5od4Bd2u42bob0tA1oypuAHSWaMalbeowmcg/lHe6tysHpBer/Yy2cRaFkV7pO
 eHvZ13azrNd+Nl2kMN57LrY0OlgF1dfWkYr6dtYM1jeoJnz6CLIga/nx+5xRCGOo3dKp
 IQBng2kEpMhz5rv8FA1DCCvMf7cf56mJGGlB4mAG/iJnudJrS22hCEasZVcgwqtXw/vL
 ha4w==
X-Gm-Message-State: AOJu0Yx42scr229EYDrYgHU5z7WPPYtvWcQFz3qBEEKIUpCXgQZq3+wf
 7qi4AYOXt019ryf0p/t4EmcXIE20yUsaIng0lPPDbHBaXk5mYJE4LnMabpa41dpWqljycgAz4Oo
 D1KjC
X-Gm-Gg: AeBDiet/4ruNXs0wk7SAXTRIlXeYqgtZYtUVWGH97RX7wlfntO9RNYkYJVzVVLaFDbv
 1HSEFZ5Fx5VsAgBMar3soDWElrwe1Bkch+gBuwMtSrGZ1nyYm7uUgwduKq2v2NHMOzvlDDkW9Rk
 kCiOdiXeu6XcuMUcRqEz9RewefpuSrjrWCAwf+9/H+jSSrrYOr+0trM4//37clDaSImiJhlElnT
 LXkUCjo8o6L5V+kTkMXVYZ5gdjxBvQxjNMq67tS+hr12JxBLXy5+WYDlLeOw2p55qRhtW2BRHFN
 LqCFItClgA9pYELxznDXQcccCZ3om41rvVG4Js2h27BRRGM8u6vaf8jYVM3P0wrWBehVNcHcuPv
 suSRCtT8v0b+z/9BAhPwN0nKtbDMWAurAPl1dVj+XthAvm4/tSfcK4tMGrU7wzwJujtxeyKgNLv
 7uj4u5qhuaiGmavImqYgSAHlcopVu5DEijA5/OkqSO9de54/ty5nNXyCJX8O1w0jdMp1nS6HOkl
 cEiLwpnXHdE58M7tywMi0O1lcK7JqtfkYfwIq8bRqU10iF85LyauLpYANr8B9nhTnXi13fLdYae
 A9jVsiWyKQ4eqR5kaPVeNjYsKSRlDOfwxyM=
X-Received: by 2002:a05:6000:2906:b0:43b:8f38:3b88 with SMTP id
 ffacd0b85a97d-43fe3df22bdmr22874520f8f.25.1776706730378; 
 Mon, 20 Apr 2026 10:38:50 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-4-101-145.retail.telecomitalia.it. [87.4.101.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4d5b1sm34251607f8f.30.2026.04.20.10.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 10:38:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon, 20 Apr 2026 19:38:47 +0200
Message-ID: <20260420173847.2353616-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1776706731; x=1777311531;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MpfNy6Rt+yRhY+EqMhNptj+Rqi92JzZzJ7q/GLVV6nk=;
 b=ZTOagaZpi0ewjWKMdMuV5Z53n26mzxkntMAikQTnD3jiWjIdGYrkc14m9J/iU/HJLm
 Fg9iBRDHp/3a5salSyEfmonTfDS/c5Gd2GKr+sibppk06Ki6QidY4PdSNhJ77hyQiyXM
 djr61FHwu0CpAcwD25YH4EFgQBdRWnVArdGGs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ZTOagaZp
Subject: [Buildroot] [PATCH 1/1] package/armadillo: bump to version 15.2.6
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

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index bc6a19a13146..b0bc621113d3 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  bb03a16da6b2cca43962b65a2890faf4e6b16607220cf60270436a11e09e6f46  armadillo-15.2.4.tar.xz
+sha256  97cb8ef708541f632e861d005a462dd0367240f81ff96f8e63ebbdd75c8ce55f  armadillo-15.2.6.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 8c9c44f89ab5..194af02e0038 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 15.2.4
+ARMADILLO_VERSION = 15.2.6
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
