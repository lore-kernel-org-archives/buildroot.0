Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF236FED2F3
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 09:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7252E41BE9;
	Thu, 12 Mar 2026 09:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id is-RJb3leKI8; Thu, 12 Mar 2026 09:24:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A3CF417AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773307468;
	bh=GkoBXAxS4C/vOvlachQLK/sGzaNRxeyznPqu4kXZWu4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=dH2jeBfa2ErHqjk+Zgg7/oAfVbioa+117JQ2ukriMAqyMDX6UBJoUMEZcca1Wrhjs
	 p7WVFOBMweGY6rhTmJKYI5szW06gOsnvnJQew4ga12y0SGNuNEHvr6eKiBUhqbHyOd
	 Lipu5nTvNGVAjktQsY58q6DPTXoDD5lEZKSVe8tr11cFM4Ijok/Jgqy3CrbapgQE56
	 Kf0lnnnoNvVDSAEWHc+i1iQzHqZrxDRhpyW5VikBPtXu75ankDiylso8lGhywsvUzw
	 svKpHC/i6y5Rn9O3j9zuTNIwtSMQUQhjCZCHlSTHmZVRMMgd4Tr9BNV6XYihZ0Bhs4
	 idhISnZiSvZzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A3CF417AD;
	Thu, 12 Mar 2026 09:24:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CB97228
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 09:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0290861C3C
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 09:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XNogrWVgouXh for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 09:24:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E1ACB61C2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1ACB61C2C
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1ACB61C2C
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 09:24:24 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4853510b4f3so9706615e9.0
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 02:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773307462; x=1773912262;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w7B56kuXTzO0q4Rv6vxEc/ghhRU9mpLNBOFPp3AfW68=;
 b=ixpYaV/BtCuNUk2v7qQCOAv+GHpIv4CIdpnRYap5oJ5lhTch4e2Yn0W30eFZUgYRRR
 67cN8UNLeKYbBthmkqnUwyKdjsDTToU1+9FThQY0gc9tFQ4xxFT75NarI4JBzq4ApZfC
 ONEHyNVakAznSq6fO/gAQZTvaCmYMeDR8/w1thyExNb7tYEnGoy188gwuzdYwHQssdJA
 4elIBL3zS4FRmczon0hxl6sdrPNpsa1MrD5SjY8hpageHcgVys7QoZuWH9f3HYXUk+WS
 DbFZCMRmwHofuIVDnY9h97FDwtKQxAu3bKn1+c3lL+ZSnI+FCWRogJaVWIIgapbKVtEW
 d7kw==
X-Gm-Message-State: AOJu0YxwZ/Mykqe0bBuAcUV8uvIfJy2m7u2oeUavbrShPlaZ1gwyDPEq
 K92oZoNny2ocSYmIg7Jm5F8gBTLe30h5qhFen17dCrHktdL7SiZO/vFZEW9jjtkTwxAdXkcvgk4
 OxoPFlIc=
X-Gm-Gg: ATEYQzzK/XgcueaMZMYlbv7KiPEo25Te0BgGR9+PAT+Ul9B0sv0WjJGjoym+nt0j3rs
 M0v/sYyA3nYcF0rBJUUrykZPbv9p73SYHFU9je64h90eNlnFKfnuyYqP4ooh0QH+Q4xx+owxBEY
 3sY1auLrabusTDyIS9z75Gap70wZLV+QCfs2spH5P35QKxjvREQFEg+3dG1vAFAfkyMz6d7dara
 vdAcqQ/PwCr41tR4hj+m6BigvY3zSVN1mtv+ux2vIWV4JliZJv9shJN8svPeHC27l/qWR5uQK48
 FnVbzXCzLGsknmnESlOV0iSe1TNK0GzN6u6e+WCJ+aFR4qCKO28CoqbX7zGWrzyjD2oNM4WIXr0
 qcOdO1C9pPuREmXi1xzup5Eb0Z7Bekb0EfS+UgnGfUfgOjHG3Wjvj5p8rm8c8SICBAWuOjXJmVw
 IcsShCD3Z3QKfQpNmnCfgfkgmXEi7ca8XvGoQr24a77XGsJiEs8H9z81m2729XzMp/Pha23RtxW
 6iGwG3WL9iU6N9NHap+
X-Received: by 2002:a05:600c:a44:b0:485:4100:1eee with SMTP id
 5b1f17b1804b1-4854b10c539mr91013335e9.24.1773307462168; 
 Thu, 12 Mar 2026 02:24:22 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541b7f3cdsm243996485e9.14.2026.03.12.02.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 02:24:21 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Thu, 12 Mar 2026 10:24:10 +0100
Message-ID: <20260312092413.545638-1-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773307462; x=1773912262; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w7B56kuXTzO0q4Rv6vxEc/ghhRU9mpLNBOFPp3AfW68=;
 b=odf0s07XUxbhvrBe24IrE8pU6LQH8XB4H9ut91IvVkbEHMF6trPsNY0KTT4URhRCr1
 EANqwZo9ONGjeawZUywSuXMLrMjZKFSY06XCDrj+rdi78eP/8Rm++gaJt5N5EGW0auB0
 Qv4DjyyTJpVpcvGFytdckGhyl9nEDBFQCYdtc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=odf0s07X
Subject: [Buildroot] [PATCH v3 0/3] Update the ARM external toolchains to
 the latest 15.2.rel1
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This involves:
- Updating the version, site URL, and source filename in .mk
- Updating the SHA256 hash in .hash
- Updating the display name and GCC version dependency in Config.in

---
v3: Separating the commit in 3 different commits

Dowan Gullient (3):
  toolchain/toolchain-external/toolchain-external-arm-aarch64: bump to
    15.2.rel1
  toolchain/toolchain-external/toolchain-external-arm-aarch64-be: bump
    to 15.2.rel1
  toolchain/toolchain-external/toolchain-external-arm-arm: bump to
    15.2.rel1

 .../toolchain-external-arm-aarch64-be/Config.in           | 8 ++++----
 .../toolchain-external-arm-aarch64-be.hash                | 4 ++--
 .../toolchain-external-arm-aarch64-be.mk                  | 2 +-
 .../toolchain-external-arm-aarch64/Config.in              | 8 ++++----
 .../toolchain-external-arm-aarch64.hash                   | 8 ++++----
 .../toolchain-external-arm-aarch64.mk                     | 2 +-
 .../toolchain-external-arm-arm/Config.in                  | 8 ++++----
 .../toolchain-external-arm-arm.hash                       | 8 ++++----
 .../toolchain-external-arm-arm.mk                         | 2 +-
 9 files changed, 25 insertions(+), 25 deletions(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
