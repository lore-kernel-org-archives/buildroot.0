Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E04CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABCF080C73;
	Tue, 13 Oct 2026 16:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2E2VQOq6gQY1; Tue, 13 Oct 2026 16:43:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D0B4480D4A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909790;
	b=pu01gDPtkmL+5f5KVZ+vXr2owOwvM39pB4OVgGazu9S+qDLwWQtE9fTbLyAXKLzy7hMQ
	 Z81DIVo7xOPNGlBy7z9rYQF7dy9vbAAV/GqUSRJPDSAwy9p3/buNv7qjcl6DohZp2gEbW
	 lPxSznOw/aQPKFXwAcPPqKqvQLBQMVFAvPob55CEsdFFeILDdh6QvEfbbrIjl3mne4Nya
	 BhWk/RyxcIGeubhHSFupkC1xmM5Sxk3ehEalWipppPtH5nFRFmkcOgStupOUpDPpwfxnI
	 W13x5PKUaODblTMwn2R/kwVbWVF4OSx5jbS4WiciEl7xlnjoE8WRMNBdDSSTSWvKi/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909790;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=AXzqULW6Gb/3MrE++HYVQ5YMasNZfyHAziShukdE5IY=;
	b=nXC22n1p03WRP0zhq2HnAGs6RVL0s2M2LQETbEPvIOMB9Jkbd/pERPv2IF38l0OX5A3n
	 qtnHMB1zfJkEClXUlrguQsSbYz2x7qeQLLbuC4akSOIfen/0CAD0JsoIKcVp1zqnNVEno
	 ao/rX0zcXHnm/oiFVlwo+Oc0p4O91P5OtJ4ixh4Ub/P5Y3INsTPH2cuaGvpZsDYkdbP1j
	 FVSMQHdjADrRfZmbupM16VJl13Ushfv6n2wAudAlTxhuqdUrkRVd0B79v0lJoDfjF7tf1
	 yMz5kcLR5RTgmO+bcHsdJ8Xm6sgvwnU6OjecjYfWtYADLnMM34TuQ6NypteKdlzE/+Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909789;
	bh=AXzqULW6Gb/3MrE++HYVQ5YMasNZfyHAziShukdE5IY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=qn1E3Xmz1F8/OhICCE5zzVM45dlh0pHaSRYirvmtc6vYB/olm3IuyAqLka7/s3cfb
	 DFNSezx2yHRkpyvTp2DaapEzMObjRwpiz5dHptcOjQtBY4XYtTvpof+Vn/Uo7TifzO
	 iS9vP+dJJvSeiEg7nY6o2kDW91LC2bleQ6aBo5PzjNoHhBsO1uepaPBh+5h6GClHOI
	 PSErzXF1ML2nVmRndxVE+PqSxXmFdtoeko3FIlnsCLu5s0dlyPTbrOM+O+iqkgeL/c
	 bV5c3yuP4w9JOCXlhWoDd95J71hIs/h4CiVDn1jjKLAkCfFzIhSHMYpIYvjWnwEoHj
	 VJJsZlSu1kPGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0B4480D4A;
	Tue, 13 Oct 2026 16:43:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A75751DE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DFB04009D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_GAk08FsJlD for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D6CA940049
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::33"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909785;
 b=dRKX0RSwMO9ef2AHCziimKbknFual6upgFNvz7LGywFYBKvT5LWgTZW9xId9uM5a5XSO
 y6MzD/HYEoWlWKa1h6OBPiwCoRiOu3j/MBDdSO0/2gNb3VFM+BbZhjy2RxM+mirhkDkiG
 q5bQXkl6pu7hxOjU8Kkbo1IeilhMpErth2Ub5ozeg1jCYJVQu1qMnrQYeXs6IMPMv81SD
 FgRqwmjjyHqwjSn5HMgEeTf4yEAg5zA+cbol0TmIVObrGoUnvTxG2pjDAO3zNmRHY/8w9
 NUKJKoSDbpAk846VSmCSuq7IRzfa1zROqIOQ8UsatYWuq73Hp3J0X+/e99NN9GfN+vQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909785;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=tnZAsnUAwI9YasGJSmaq61h4obIfuKRk0mFFbIhWkf4=;
 b=T8vyac5NDSiu+k1uvfed08+8r3eVBabgt1Da/qX1bOWtLtfUkSm14H9T6Liu1zlu/4CR
 0UpWePAVK+u085q/r9fxGwoiABlR8H5h4ZOCSWS5iHu5+4StQlqDYY1Z9/4NVXmC9ZSxc
 r4lVUR/aoTGjoiSN94dpOIwbLISea3Jl7zP0+H737ENhcDBqjZV7nDpbBNNJllWh8bBZ+
 z7Ve9cQoxI3wUA6g09B0kzeogIlToUw6+bxieBVZfQPz2n60eOYm2+ydTQojhSanBYtsB
 SmPxF27L6koWgM0U6ArrtZccscuKSgLmk73IZpXG1XOprQobBMeBitR9aGO0Yx4aQ/A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=AXjDgFP8; 
 arc=none smtp.remote-ip="2001:4860:4864:20::33"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::33; helo=mail-oa1-x33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=AXjDgFP8
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6CA940049
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:04 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-49ddddefadbso1426227fac.1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909783; x=1792514583; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tnZAsnUAwI9YasGJSmaq61h4obIfuKRk0mFFbIhWkf4=;
 b=AXjDgFP8pY7tJQgH+iSaY2elPpTr0qeUlmqluQB6ftfQ92CJAAiYHv0VRi20lSPP6s
 SHpX0gFfopEK9VYx3MEuClehQdvBnB/L1gWOMjnXTLDqSfMV9UQC9JJnyj01CZBVKEwZ
 3oyK01srzzUA6qifBIvGpWOjiJJOVpMHcLyadMpouw91RiWaXK202Udzy5QSLe9hS6Kw
 A5O/BHXk9TPQ6ACwfgQ+xGbxbYlNhSU1jmlckISnicoKC5G76+EOel5tpqOQc3Eq7Y9L
 Ak1+YO+gFji42cTW9NJ544XdTgwMaC+HoIBzcMyyE7nDlG0muBkGJpj7WxR38bubphZX
 Ba7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909783; x=1792514583;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tnZAsnUAwI9YasGJSmaq61h4obIfuKRk0mFFbIhWkf4=;
 b=BUcp9geaRBH+wODgxBUclyunD8qSIvSx9dw6dv/VkyT/9gbHyNd8hiV5dpDmu8psNG
 9cGN5Xasf+qRTnAsLt8KN0GgGZPgo4456f8zhSSUx1sxZLAyb7D9Pje7LHQwb0leNGwy
 wJ8VfLCqLCxpFJHVQg5e+x4vEcEWF89Y3oJIKVnCw4uLMRi/7sAd6qTRFqfoLkwU7QFU
 /pKD6pi7zv5qdYteX6LlxSc2JV0ZHXONUPuBq6KSvaQ/gqt7IU8EI9QUWnaG4vmu/dHX
 hE9eqPrXCL29VvmSl+H5fR3uNBcAT15vxdoDUSwiog72M2yGFs9c5blzpe3ix0b3DugS
 KYYw==
X-Gm-Message-State: AFq9FYLs2n+ToecyVgLsdzQJfVyr8XEbQ0qL5qX+Rj3Ttt3Y9FYbiVsK
 Roi2Gw6FDkCQY9sSdC7JVqjH6LT74utdv7VtRsJdBS8HOV62z+vsZbVZGIQ7UA==
X-Gm-Gg: AYBFou2OvLftk3WuskcdzPnsfRX+p1Z/7PI4pusjV+a8vszjdQd93dSN2RxYV4YzxWI
 G7LveS+pDWo7rHjVHKp8T8aLUhsxScj654DLYucgtoJ3dERperH4lx+HIEpibYDRBIFHZErS2PU
 EdGXfD+5nmJ4ycLn/zl+4gOC+vYTR9wqt3fo+acoAeho6caRtr+sW2Ek4IWN+og+DhA1a1+yyOH
 TrGIhaxn9mMnFpWcPChpvtS2NDrjF2R+ZcUZ+ivdgLGItyUBn1Jcnt7+gI1C39BfSOYj+Xyb8Md
 V3zMVN/bWB+ddTVf77YIrPHMSvcVsMNu3HcBsCeKtALTry7FnsP04fF4FQaZAgsD3P/ZCUFZw9H
 fHg7K5LWGSuhPl6j7mN+qofiraHQeIjXtwpJUtR1VFwSs72i2gSgO+enqraxswshU7hBkM8os5d
 LQQFW9v9SSXM7j4D4PJ3dPiksQgye/DBDCnxUzpXawSpABYo2uBwbsh56+WQUJDm6Yb8wZ450SY
 uyhqvwE+S2HN4be2VF9axKZOIi32O+P6FoLe6mR/lJBcODCkEqn97bbY6kKRe8wOfumrxkVbDIG
 OpMthOIUcStaJAbnndeGoY6PwvbC78GALwuPAaNTXWLLSU1tAW1z10vUw05qA7Ez/TvmEcD1Dj+
 uhDEznpSlix1Eci9Hq8jPsngBSEZry1Yre5oxQMsUlBRRbiKnYpxLxg==
X-Received: by 2002:a05:6870:4ccc:b0:485:d31b:775b with SMTP id
 586e51a60fabf-4a2a886b9f9mr10404970fac.25.1791909783447; 
 Tue, 13 Oct 2026 09:43:03 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:41:52 -0600
Message-ID: <20261013164254.1476592-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-cramjam: bump to version 2.14.0
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
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cramjam/python-cramjam.hash | 2 +-
 package/python-cramjam/python-cramjam.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-cramjam/python-cramjam.hash b/package/python-cramjam/python-cramjam.hash
index 5459d63f16..694d373262 100644
--- a/package/python-cramjam/python-cramjam.hash
+++ b/package/python-cramjam/python-cramjam.hash
@@ -1,3 +1,3 @@
 # Locally computed sha256 checksums
-sha256  10892f279948fe9a2dd5f2c559ef78aae1ebf4b5d5825e1eaf68b03787fde402  python-cramjam-2.11.0-cargo6.tar.gz
+sha256  5918f1d51a7d114d56c9f49afd2f303a77c4bab13f90b6c949da2736c0082f84  python-cramjam-2.14.0-cargo6.tar.gz
 sha256  b4f882bfc80d27a3732789bd883a8c1d342e8ffea7f622a71b3dfded834205ff  LICENSE
diff --git a/package/python-cramjam/python-cramjam.mk b/package/python-cramjam/python-cramjam.mk
index e1e060bfba..f908a48728 100644
--- a/package/python-cramjam/python-cramjam.mk
+++ b/package/python-cramjam/python-cramjam.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_CRAMJAM_VERSION = 2.11.0
+PYTHON_CRAMJAM_VERSION = 2.14.0
 PYTHON_CRAMJAM_SITE = $(call github,milesgranger,cramjam,v$(PYTHON_CRAMJAM_VERSION))
 PYTHON_CRAMJAM_SETUP_TYPE = maturin
 PYTHON_CRAMJAM_LICENSE = MIT
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
