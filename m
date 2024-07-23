Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BC3C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 13:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9DE540374;
	Tue, 23 Jul 2024 13:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cNFvHncuJF1Y; Tue, 23 Jul 2024 13:01:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1DAE40A0B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1DAE40A0B;
	Tue, 23 Jul 2024 13:01:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 547441BF83C
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 421A481254
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TYROXnapBqoA for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 13:01:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 54B5E80E00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54B5E80E00
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54B5E80E00
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 13:01:26 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52f008aa351so3307607e87.0
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 06:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721739683; x=1722344483;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cPrGLcsPeCt1vhwbE76vJbRMB5N6/xgLv2oInvGDvnw=;
 b=eYKNbwpJJAz+Xa4j/9q3kzPHxUS0kVXmDIwnYLmrWZZQae6NlOVi/smaQJJ2bftdxU
 KE+du0MzFzmYP0JBiMsLSNnif2CmMM7ti6xcS3x7vTJ0cjshxNxFu6WKm4SJmeQ3tTZ6
 cQ0c0QE4uaUodcSVrZBek7eG/zrjwpNhaBjgcdARJzshO40U9hIth5zh4vNWnsQqZrqW
 3LKU7ZMFQBarZe/DQfhq1JvsMIkcsaDAIpm18dgq8Pteu22z2vmMb1MyT6og95VdItBe
 YbgJe/Nt3MNKiejH3/iL2RLqi1jB8jGZp525EQeVKAD78vBCeaONeX+hnkHlu4rh84Nc
 GHXw==
X-Gm-Message-State: AOJu0YwTDugUSXA2qUEJN096Sis/FgUZSA9PO1nfNTGhViR/ZYWlzBaB
 cNJDDXolR05G39xlx5HXRWJQGzhSSWsb8VPLUvStbtseF8CktPdm9mwRkQ==
X-Google-Smtp-Source: AGHT+IFS+SLVMkSLVjoRn6NmjKZNfon/UnAZc8UyxVhH1Jd25fz1yT0NV5H7fx/p1nrZOSddn2OqMw==
X-Received: by 2002:a05:6512:3e01:b0:52e:a7a6:ed7f with SMTP id
 2adb3069b0e04-52efb84ea35mr4703937e87.60.1721739683153; 
 Tue, 23 Jul 2024 06:01:23 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d690152esm171932005e9.13.2024.07.23.06.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 06:01:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 15:01:19 +0200
Message-ID: <20240723130119.485036-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721739683; x=1722344483; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cPrGLcsPeCt1vhwbE76vJbRMB5N6/xgLv2oInvGDvnw=;
 b=cQd50oylW7bd7uAvlgaAOYNW3CsRuC7UbBGRw2/ttZ3D/vWBJtpr9Fc+aGRmmIp5uq
 G4ri8RaUTB79iYOpgqMRspePH9kCnidkvRbSgydBOHAuUtmDlvCvLgrr9yhrNRyCoaop
 81a7Iga/rO2L/22PXpH/E7gXlXcaSbiGbY1AMLqtUD5lrzc+wY6pPS6ZGuJQ72TOGn/R
 weOIDv+IJ8Z9VqKWmOe2/KEjwfG2Pqw0OjaPBx5T6pVSYjIsJvLL+ASfoVulGvNSN6/L
 A1mY8z9ybwSh+P9xH3BobGQd9i6Q4KbwS5NRlSr1mN0ZgSk52v4PMAo6DuMCAMOq0XpT
 D3Gw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cQd50oyl
Subject: [Buildroot] [PATCH 1/1] package/Config.in: drop gamin
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit ce00b93d5ad9691b73bba1501847eac8679e3c01 forgot to drop gamin
from package/Config.in

Fixes: ce00b93d5ad9691b73bba1501847eac8679e3c01

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 7528374711..1b314ca965 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1642,7 +1642,6 @@ endif
 endmenu
 
 menu "Filesystem"
-	source "package/gamin/Config.in"
 	source "package/libconfig/Config.in"
 	source "package/libconfuse/Config.in"
 	source "package/libfuse/Config.in"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
