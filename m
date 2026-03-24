Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B522F532EC
	for <buildroot@archiver.kernel.org>; Tue, 24 Mar 2026 07:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D873A8249E;
	Tue, 24 Mar 2026 07:37:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6-2pxxZsXO6; Tue, 24 Mar 2026 07:37:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4191B80972
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774337841;
	bh=tPPla0iWbhB+gzAN5Ygx2E8KR4NdF8IDhuRIkJiia7s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=rKCi0ZjdGLkLtObfqbOJ7+GSbWLqql7xkvWHJoMd4aDUT+708sygDEPIvbxs7BTPj
	 GjZLYCgaTUm+nS2+Kt8eBxqXKbuEJFcjysCmSw2BDdKVsTpOWFlql11KEyXhI+1Apg
	 i9kp2Rsu4ZO32zDZdbM8mxgE14kaUVxdEU3hjs8RrKk5BYj8eP//D1Ge+2do7WdvAY
	 fq4Xq6OowNuM1t2YMSSjGl7ghPm03MgR1qcNZ3JVxsBHU0Hu4j9TCRzUsfeDW0cNQB
	 cPC8EKFW16hL6mK7hj/e4l2gf3l76gNRsO/DWaH84id+vrhf+tbdzwnsHwpsyV5fjd
	 cJIt9JlJgePWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4191B80972;
	Tue, 24 Mar 2026 07:37:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C894F4
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 07:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CF4F4075D
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 07:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PiBAILTAG547 for <buildroot@buildroot.org>;
 Tue, 24 Mar 2026 07:37:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AB73C40621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB73C40621
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB73C40621
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 07:37:15 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43b4fd681c2so754410f8f.3
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 00:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774337834; x=1774942634;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qblpz+Uuvvqs0jm1KwyXAWWiHbvjtM2yXcv8zXt0kSY=;
 b=le/OKqfJTALCkw1wgTYo29OQ87Qm+BUyydhtOe26j7i/s8y22D6OSgSfvjGVUE2ZEA
 ITwAeWrTBZNT+EhCMayN164r5Fwl7ksdTPDmmCHTW6b/ddFnFF4XVrbgRehDpwiqWP2U
 6FmamnYoLzBOS+NGFEyzxHWHbqHNMw0xC8Jv2Mt7o+EBX/dM7zsq9mLYSyLpILBUB0fg
 /YWiywTSCMxLbT+YgD+OhxOAEw26LLBs1UtCFjJcEL1qO0OlPeCphBmsaGZ8WcbploIV
 HzcVhI6gvWpkikWQRf2+3oM4H+loEARXZHW/p7gHmWepMQCMq/vFkrruK0uHcaSDQiTv
 3pwg==
X-Gm-Message-State: AOJu0Yy+3ct4xP8S8W6ZMaTqU+URtrmefo5tQM2+cdLBLbrTJRhxotwv
 7WK0yhMPb7Mpqg67aLXIG9684LKF+FHhf0FtsuGyK0psk3XSu2FOnq5iU89iHPyDb5YBTGIJGMT
 1IARb
X-Gm-Gg: ATEYQzzeny3nan7qFPefu6gWaohb13CjjBy+zfknVxZinf3pNx4x82iK1NpFou+1XIV
 zwtNsePIaGEj/1NsaHoGGeyQlYqZ8r17R+tsNDrBxd8ppAFFx22kwx9vVPjdr4BP9dM0DFsgZ5d
 OBCR9DxjaAyGXJyQB+d15HDITICylC4CIB8Lg0GBsJx72YHIpD+nNsLw7n42AyMtmL/1zpGVCTI
 FEJVE18zCDFvY+xUT5z3yrb7RHwcomjmC6klXxFa/+LkaPQGiCzT9zpWp1FxAudTk+ldLl0PAeq
 1sRGDFg1lyizZVWESoaYA5dJZ4dMBbphRdpu2aVWu4lTDa7f5RBgEhtIWvelqJxl8ODO+eR8cO8
 TU37w++sgMeJvPm6fO54Tg1SoNlwbOWnuWILXula0561ckjSQIOZv6U89uIbu71EpXjHLQTxE5P
 5GV6pImNeMHy5cQKvEqLADgPUR5blVj3wR7YMJXruhtFrkk2WEvmTWi8g=
X-Received: by 2002:a05:6000:420c:b0:439:c62a:6dc2 with SMTP id
 ffacd0b85a97d-43b6427973bmr23465933f8f.41.1774337833915; 
 Tue, 24 Mar 2026 00:37:13 -0700 (PDT)
Received: from dragon (ptr-94-109-29-81.dyn.orange.be. [94.109.29.81])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b644bdaf8sm41100137f8f.13.2026.03.24.00.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 00:37:13 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 24 Mar 2026 08:37:04 +0100
Message-ID: <20260324073706.654995-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774337834; x=1774942634; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qblpz+Uuvvqs0jm1KwyXAWWiHbvjtM2yXcv8zXt0kSY=;
 b=JFBOJUKr+1BMcPJDr2vTF5R0DpEdcBgImHmBG8aPxDfbipF5Jxf/9huaJF/hxLM99U
 vFiNFgqDfWLC1QwC7tIOgV9jP6QJ0xGDIDa07+bvYWvnVPvv5dUNNapvticQuHqoGGul
 TFz2iGF6pDir5A9mmSMIBYQVompPkbQHhxUCSuqMJyY3gZdSyLnt6F5HfsNngOyAsM0k
 Oh5Ol2I1IchshVoL7gUU4wCECPSPFp5tkdqatnpCj3O894iCSFil77aOYEsPhlJm+t+j
 3ZgCMzpXeI8hIpnHYUEbed2eXq4tZuKUNpzwBhP8a4OVWpATas8QhcPPIgl67ZCmoLpx
 dqlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JFBOJUKr
Subject: [Buildroot] [PATCH RFC 0/2] Add security policy information
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Thomas Perale <thomas.perale@mind.be>,
 Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add basic security contacts for the Buildroot project, as per this
requirement from OpenSSF Best Practices:

> While active, the project documentation MUST contain security contacts. [OSPS-VM-02.01]
> Create a security.md (or similarly-named) file that contains security contacts for the project.

Titouan Christophe (2):
  docs/website: add security contact information on the homepage
  SECURITY.md: add new file

 SECURITY.md             | 16 ++++++++++++++++
 docs/website/index.html | 11 +++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 SECURITY.md

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
