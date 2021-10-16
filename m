Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145D2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:43:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0CEF600D4
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0CEF600D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A61C83B7E;
	Sat, 16 Oct 2021 08:43:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h6PWxZHKbcN5; Sat, 16 Oct 2021 08:43:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEA3383B73;
	Sat, 16 Oct 2021 08:43:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF0801BF873
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F253404F6
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:43:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wYUqQnm0kM-d for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 08:43:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FC50404ED
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 08:43:08 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 a140-20020a1c7f92000000b0030d8315b593so4873484wmd.5
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 01:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aYJJshmstILa7u3lrSLTQ4rcaTuTibf0DfElii+mKvY=;
 b=lIOtS0PJJD0qzVaM9O9MKjwDuFkbn4iaUY2KV+EC/wimfjOJFuSrWHQUwCuJw9bncN
 vRKpfVuYOmiRMULUBvd+WuWAZinPDOO9AAMygHL0C43pyeh3dCAlFOS7OlFJHBQkkyJl
 UNwcvJ2E9scVy0mdbUTgodAG9+icEofCkDNHE7wed1NnW8cL/Biz2BS0C5xVzoF1dix0
 SSaW8aLUUYGjdxRKpRZ6Are8XrKk9e1SWt3WUBB1DDkfcrvTBSeDUiEriGvSyEuB6KxA
 fw53NeMpanxSK83Cqcoqrpn3SV3BfW+52hIz2VrDfghfvhra9Uh5W3kOq77JjrBFNBMt
 3QFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aYJJshmstILa7u3lrSLTQ4rcaTuTibf0DfElii+mKvY=;
 b=Cr8D4utI2kGGlmjh3tTC/9SjUge9qrjBWhLPWuGT6EKMylmnke+iDMa1g3tTTAz0/I
 o3pkTg3D6c2ac1yvtJ81WacaYYu5/nzaJryfuUfMXcFXu1X9mXULF3mcviLP5FFF72om
 F/mKs2slAgvqKkYCVJ+7h5nRiJFUB2EIaNE3H6bFa4W6EqIKYAL4K4vlm1SVGht3IhJZ
 B2kaHP9Bnjl5PVBNjVNYyuLZa1aI/wujgk3/q4guGJpwk8JYLVn0n2GElLkO8T2pMIzW
 WGiehPtGp6XwwFyzh/hsbcL2bbMqUJvion3emhVrjF9hfFS6o6IQi+kF+k2ICbbpA1cv
 Dsfg==
X-Gm-Message-State: AOAM532Brll7Gk+I2d4QlGsMjk7kO6cJJZA+3DC/K+6352ynwl2OfDpN
 BZv5FIjv6tWyhK6THXmTFDNltqMRFOM=
X-Google-Smtp-Source: ABdhPJxpaOerWFDMpjotEdHliLxgioH75bd2XdJLls/cV1Vt46gh3bCRP+PRJM8JeZCmXfojwbkCeQ==
X-Received: by 2002:a05:600c:3b17:: with SMTP id
 m23mr17039413wms.80.1634373786392; 
 Sat, 16 Oct 2021 01:43:06 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id z5sm15660029wmp.26.2021.10.16.01.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 01:43:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 10:41:36 +0200
Message-Id: <20211016084136.2475297-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wireguard-linux-compat: add missing
 comment about kernel dependency
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

Add a comment when kernel is not enabled (missing since the addition of
the package in commit de591c5c3a93a40d049a32bd79c30cc66daf5fb2)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireguard-linux-compat/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/wireguard-linux-compat/Config.in b/package/wireguard-linux-compat/Config.in
index 5a323a35e5..4e8e95bdc3 100644
--- a/package/wireguard-linux-compat/Config.in
+++ b/package/wireguard-linux-compat/Config.in
@@ -21,6 +21,9 @@ config BR2_PACKAGE_WIREGUARD_LINUX_COMPAT
 
 	  https://www.wireguard.com
 
+comment "wireguard-linux-compat needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
 comment "wireguard-linux-compat needs a toolchain w/ headers >= 3.10"
 	depends on BR2_LINUX_KERNEL
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
