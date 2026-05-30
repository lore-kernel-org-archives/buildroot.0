Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF10CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 15:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D42B85394;
	Sat, 30 May 2026 15:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4P3PzLZHs-2Y; Sat, 30 May 2026 15:25:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E36B784D26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780154724;
	bh=fShbZORH8srgmTxR4HuQTQtJ45Rid4ggxJlgs7+yoD8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Pc++PK6BFTTF79juwvNqSshQtHVsMSpCauLhc7kzIou+RH867Hl/6EdKL3KeMZUD/
	 +tYlwkH1BhNOG1/OHaNnJf/TsCJExyNfRUHx/QV/42PRpd70YOduw0BcuwnXuFwfWT
	 54258UhbbgpW13vv/kuek4H5RBKku05sDaeuOXVaXH6rNm63vBrG8LSusFn44dW+5L
	 LQtsqrnPiX0oh6nowscaqpAxmeeR6gLAkWgD4fuJe+t+lSyAExr+EVg2pG1lU/Mypc
	 tQbWvQOoVoQy6upr+QnvEQxSIhIJry1ANUB2juD9u0pZjxYn0RonaqTf2vGWBTkNtE
	 6j34+xA9n06Vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E36B784D26;
	Sat, 30 May 2026 15:25:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 63839D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49E376F5A4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-46TKoOLY0c for <buildroot@buildroot.org>;
 Sat, 30 May 2026 15:25:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 05BBA6F5A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05BBA6F5A1
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05BBA6F5A1
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:25:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 08F292003E0;
 Sat, 30 May 2026 17:25:13 +0200 (CEST)
Received: from 2a01:e0a:1015:b940:caf0:d340:4af7:8ed3
 via 2a01:e0a:1015:b940:caf0:d340:4af7:8ed3 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 30 May 2026 17:25:13 +0200
MIME-Version: 1.0
Date: Sat, 30 May 2026 17:25:13 +0200
To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Yann E . MORIN"
 <yann.morin.1998@free.fr>
In-Reply-To: <20260530143523.438058-1-petr.vorel@gmail.com>
References: <20260530143523.438058-1-petr.vorel@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <1151af2a7192b4aff21a37b51c2b5592@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780154718;
 bh=Zgp5xu7aDm207GuVyEMaWaKB20YhA+3A4cfI27knRss=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ATjY4cgs60LpTeGQeAy8Y3l1AIyC1BFn+tV9OheC1q4ug7kmAfatswzhxJ+b83JwP
 aOfwR0bKFK8D6tBGvyvWb4iLs8QttXulr3JTujSqQtvHydOUL44j50oMpkob1JT7Z1
 5QDEbTVgDIFZUOvgIIlp+gq6nA8BXmmg7aabnN538kUXqVpf99mSNS4xoC1WTnsH4e
 2nl/DWYMxuoII4BQhxDtj2RlnLsMWKdh8UbCjuSFZxZkoKORFwqAcgdiJH4/ILVHRS
 jhEU7x+HrRv94v2qxdWYP6OdAFncIqD9Pb6Lx4PA7VTuYEN9J1DiDnqgCUNJYZBeLQ
 swvgbd9w/IVkA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ATjY4cgs
Subject: Re: [Buildroot] [PATCH 1/1] package/ltp-testsuite: bump version to
 20260529
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

On 30/05/2026 16:35, Petr Vorel wrote:
> Changelog:
> https://github.com/linux-test-project/ltp/releases/tag/20260529
> 
> Removed patch backported from this release.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
