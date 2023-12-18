Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FFCC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 21:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CFE641738;
	Mon, 18 Dec 2023 21:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CFE641738
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bYpSOrpy0yRd; Mon, 18 Dec 2023 21:27:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 584D9408B4;
	Mon, 18 Dec 2023 21:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 584D9408B4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10ACC1BF344
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 21:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F27BD611C0
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 21:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F27BD611C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ifqkgnzFdWGz for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 21:26:23 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59944611F8
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 21:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59944611F8
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6d774533e73so1507292b3a.1
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 13:26:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702934782; x=1703539582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SDdIdfKAYsgrrxiTh6lZuc+r8XNZmhE3wtTHSA3i+Jo=;
 b=HEWEoBRiszMdUdIZHKkJeH5ti5MQuKvx1dadGV4tHzldXqbzrOpK65uY8y18iEtlMD
 Rg8nxNrYRf46/JtT81L+OvUdimz52hB9U/xVZsQDjrEx8zrR8NxWlzhWhJ3XJER250Sy
 UFRO+7sqNtqHdHYigdlNYtchsYaI2Dj8B+nkKAp+MJckxz87AEHJ4Z8kcexi3NA/mZ6A
 ga3nR9TzDlioPizynnCUwY0GKBMi0TMgEAaFFHuSLlIggWYuMdvE+1P742d5khPbXq2T
 0mG3Qadij6dQEGBBczOrcY/2vLCc4WmpvmEpW79f3nHkO7/S7+y2rRr+G1tkOeSrcF9J
 C5uw==
X-Gm-Message-State: AOJu0YwcCfkMdCcNzQY57pyO597kwuEF2jOltP5FG0SWnZl/D8qhrMNZ
 isQoyjrMb8cFvQc/g/nj5U14Ot6Xud4PlRwyHzg=
X-Google-Smtp-Source: AGHT+IGP0+X3AtcjyEZNF8oHKoMPxILcngh7AE0fbBK7+FJBs2epUBCbUyrKrTnlscgia4Y9OMIbsA==
X-Received: by 2002:a05:6a00:2fcb:b0:6d8:ebb3:91eb with SMTP id
 fn11-20020a056a002fcb00b006d8ebb391ebmr984428pfb.57.1702934781888; 
 Mon, 18 Dec 2023 13:26:21 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a63e452000000b005cd7dd8708dsm4364264pgk.52.2023.12.18.13.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 13:26:20 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 14:26:12 -0700
Message-ID: <20231218212613.1201821-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218212613.1201821-1-adam.duskett@amarulasolutions.com>
References: <20231218212613.1201821-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702934782; x=1703539582;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SDdIdfKAYsgrrxiTh6lZuc+r8XNZmhE3wtTHSA3i+Jo=;
 b=lJV+m2dzEYsiorw7lu28Z22SOf/dLGmjOdUmP1jSuD2xAffXAUpvjkQP/llp+P/zEo
 OzWVz6x9c+03cVA1ZcfCdu6X12iec/xk79ipa6IEvRt3sF6M9ST9tdKxBYYkF94RMDps
 cusgsPgVj59tiP5zghrca6/RFKWPcQz+ERQtg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=lJV+m2dz
Subject: [Buildroot] [PATCH v2 5/6] package/mender-connect: bump version to
 2.1.1
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

Uppdate LICENSE sha256sum due to year change

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Add patch to series

 package/mender-connect/mender-connect.hash | 6 +++---
 package/mender-connect/mender-connect.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mender-connect/mender-connect.hash b/package/mender-connect/mender-connect.hash
index da4ec5fbbd..0712e38260 100644
--- a/package/mender-connect/mender-connect.hash
+++ b/package/mender-connect/mender-connect.hash
@@ -1,13 +1,13 @@
 # Locally computed:
-sha256  96b81bb4c72eb8c1756febb94101c0dea5a6d4884591824e61a5f2509cd9ca9b  mender-connect-2.1.0.tar.gz
-sha256  78b3954421ec6499c3f9735b96d52288574ae80c747416a52548d7f526f26e8c  LIC_FILES_CHKSUM.sha256
+sha256  397cc1dab70e6e33713c7c7e826b09312949299608f4c1d41f7acd29b9693e92  mender-connect-2.1.1.tar.gz
+sha256  ace94839998c417db1e61034b316f343a25272cbefeacb29b65735157ebe3d57  LIC_FILES_CHKSUM.sha256
 
 # Vendor licenses
 # Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
 
 #
 # Apache-2.0
-sha256  1033348db7606a7e61b6484f293847cf8d7a35766efebb97e304d4bd5d7f3f6b  LICENSE
+sha256  52b2497ce07650b825015e80ca7a5d40c360c04c530234ca6d950b0f98bca23a  LICENSE
 sha256  3eb823230e5d112e1bd032ccc82ae765cf676d0d6d46a1a1daa2d658b3005b67  vendor/github.com/mendersoftware/go-lib-micro/LICENSE
 #
 # BSD-2-Clause
diff --git a/package/mender-connect/mender-connect.mk b/package/mender-connect/mender-connect.mk
index 36ddd5f7db..52a4077ab8 100644
--- a/package/mender-connect/mender-connect.mk
+++ b/package/mender-connect/mender-connect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_CONNECT_VERSION = 2.1.0
+MENDER_CONNECT_VERSION = 2.1.1
 MENDER_CONNECT_SITE = $(call github,mendersoftware,mender-connect,$(MENDER_CONNECT_VERSION))
 MENDER_CONNECT_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
