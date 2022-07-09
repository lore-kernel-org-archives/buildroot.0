Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D879C43334
	for <buildroot@archiver.kernel.org>; Sat,  9 Jul 2022 15:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65C6340524;
	Sat,  9 Jul 2022 15:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65C6340524
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j6MbjvfGwMYK; Sat,  9 Jul 2022 15:56:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67BD34049E;
	Sat,  9 Jul 2022 15:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67BD34049E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 329041BF27A
 for <buildroot@lists.busybox.net>; Sat,  9 Jul 2022 15:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DF02846CE
 for <buildroot@lists.busybox.net>; Sat,  9 Jul 2022 15:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DF02846CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0q7wEQe9Q_xT for <buildroot@lists.busybox.net>;
 Sat,  9 Jul 2022 15:56:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39AB7846CA
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39AB7846CA
 for <buildroot@busybox.net>; Sat,  9 Jul 2022 15:56:24 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id q9so1903650wrd.8
 for <buildroot@busybox.net>; Sat, 09 Jul 2022 08:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P9/LucTL04E3JzK+hTzeDKPdTs5OPSoj6tzb5urzepE=;
 b=ZnANoZHyeF7iT7htb28xZHn34QyPcvxMiotp+FVms70y9ixoo1fZOe2OoP2JiQ4aq8
 qo0dUjA7uLstkELa4q0J17xVO7mCZIebZxhv+KYuzjmd3L+Zq4m35l2qcswWT86byJFm
 Kyz/wnlLWd/3gSWrPSOIb8imUuK02gz4BTkjs2iyB17peA60cegKhjU82DbtP9F6rzug
 i5bfHMB9hPGGz3DxgLMygx3k2szeZaOgxyqMYEDO3p5WD/40aOP4tHvrdFenkjX9+Vng
 CWt7AChtPhZ+eeDoSb2S4BkDwv3KsJYdDr05De1aiuLZn1dWCswBEs/bsoAGXqlElgiZ
 9o+w==
X-Gm-Message-State: AJIora9Hlyso/B0VPf8WgoS9eh1p77r8EWNFdXPtAVBmFYBPs92QsqsA
 694MnVEwJasNEfI8tWlN8JktUiFg6KA=
X-Google-Smtp-Source: AGRyM1seHmXc+nhJYkkap+JGUr1Vr61LEcGD7jqUjp9xg+DPtdPcqz3jelY7OZGKQQKcOYL6toGBXg==
X-Received: by 2002:a5d:47a7:0:b0:21d:12fe:6203 with SMTP id
 7-20020a5d47a7000000b0021d12fe6203mr8931304wrb.638.1657382182371; 
 Sat, 09 Jul 2022 08:56:22 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a05600c0a4900b0039c4ba160absm16891163wmq.2.2022.07.09.08.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jul 2022 08:56:22 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  9 Jul 2022 17:55:57 +0200
Message-Id: <20220709155557.2907518-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P9/LucTL04E3JzK+hTzeDKPdTs5OPSoj6tzb5urzepE=;
 b=esaPXHr8SV/z3aM40hiGTSE7M+pbJDSagr9TnVhu+Z30WV/ZS7B9Tco9cH5buY8Ft+
 7DR/FHMC7BQ8jCpKM900Zgv2G6qNBk+A0c5r5qNToYd5aRt6WykID9wapoDZ+sYpOsDQ
 w2fGrSvvFyQbj3tTp/hXFf/HpTexJWhhWC7zCiaYVIZM+49vJcC5C5O9nR1BW6b2BQMf
 VGYb6WEN18d6R37E62Sj2103N1RQguwGaZUTgrvt9fth3Rdw/pJFQyBAEwy3Bl7Qyfcn
 2Y89N51TdHUGtgB7SFekDIv+/ptuMtzt89DWXLtVWoCVPTqfZUlTrUuLA99JWH7+PTjt
 dRDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=esaPXHr8
Subject: [Buildroot] [PATCH] package/mstpd: fix install path
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

note: the current configuration works only if BR2_ROOTFS_MERGED_USR is enabled
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/mstpd/mstpd.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mstpd/mstpd.mk b/package/mstpd/mstpd.mk
index 907d09424..22c91a639 100644
--- a/package/mstpd/mstpd.mk
+++ b/package/mstpd/mstpd.mk
@@ -10,4 +10,7 @@ MSTPD_AUTORECONF = YES
 MSTPD_LICENSE = GPL-2.0, RSA Data Security (md5)
 MSTPD_LICENSE_FILES = LICENSE hmac_md5.c
 
+# mstpd requires that it is installed into /sbin, not /usr/sbin
+MSTPD_CONF_OPTS = --sbindir=/sbin
+
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
