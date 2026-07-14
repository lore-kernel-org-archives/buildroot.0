Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76929C44508
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 14:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60414409BE;
	Tue, 14 Jul 2026 14:36:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mel8ASM7L0Fj; Tue, 14 Jul 2026 14:36:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB69240975
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784039767;
	bh=SsZsJLGllhDTtkCMQGXOPdKdTVjgn4Jr5QKr5H7w87U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xja7/InmiZgTnZa5pV4Yv7Dzc6meTi1/D0Bu7iury1wLmV+vL9AB9r/3m7Lpbgsz8
	 KnpzmsVvLvrfEgekI5jSuy4ZLsyriGZFe0R1q0AiQsCLK5GhM/50U+KQLf48qTSsa2
	 CKM9XhWrsxYPCTu97n4ncS2WRRiDv2YCFLsiIQIyn+JLc4tIRPqkeGaF/lEsLW77E5
	 4aki0O9RDtLQR8NSp0TMba/fyXuxWKaY6huCDuLQiJhJI449eJm82lvupAVoBx1QiZ
	 8XHMcGs53ah0GQr8sfluhKDO+F22tppKsniHw2yT8jaNKdjGh2b5nqQr+7fmfogHDD
	 CtLG1TLqjhXDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB69240975;
	Tue, 14 Jul 2026 14:36:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E450A9CF
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 14:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA73E40975
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 14:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFWA79kYvwxW for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 14:36:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D64CA40743
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D64CA40743
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D64CA40743
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 14:36:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4B16013F86E;
 Tue, 14 Jul 2026 16:36:02 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jul 2026 16:36:02 +0200
MIME-Version: 1.0
Date: Tue, 14 Jul 2026 16:36:02 +0200
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260714131459.579633-1-shirokovalexs@gmail.com>
References: <20260714131459.579633-1-shirokovalexs@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <0ce1f241c2486661f6ca31f8acc4692a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784039763;
 bh=Sw4Sbgf9xVGn/oijSlpnRZsXW8DxHlYOH+o3gSM3m9Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z351Eqwpc9bFp03hygRHwQ4B9uEgxyBC4RICDbQdqZhd56ibd8oU9JGBTstn3lGB2
 BHpPCSTdsDcb1jB7KvgvKa4YoEYv+jPu7IjA1bzyFsm+Cn7JXBEqDscSeECDNZac5d
 DIF1Agb6EDd+mMPN8VVx/YuWw5JIWlCC/kNASXNlFw6e46nRgmyawcoIioZy/+s1H9
 81fvO/+V7NEy5GjklOGJPhm66UMzHIIqVlrS73l+dY07ubNSb48INi1zADSWHyGSks
 nCVRhhsLgU/bc302IbBYvpYxep7RiIuL8f9CafzLQYk4qSy3xRts+gjOEMlMP30bln
 A8FPcdeYBUfhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Z351Eqwp
Subject: Re: [Buildroot] [PATCH 1/1] package/zellij: bump to version 0.44.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 14/07/2026 15:14, Alexander Shirokov wrote:
> Changelog: 
> https://github.com/zellij-org/zellij/blob/v0.44.3/CHANGELOG.md
> 
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
