Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FC4CD6E77
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 20:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 557ED6F8D0;
	Thu,  4 Jun 2026 20:05:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bas6sTJf4cNu; Thu,  4 Jun 2026 20:05:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 866386F8DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780603553;
	bh=O3XpPMSb1qYNy7FTn6yBo1tjzWNbgL9pT2O08eVryBA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SbRGXZylDO2BIdKangZPb2CyyP/nvCs0FvYWuRQVXDVhLx8xaI3aQh0tDBxWYyPQS
	 BCqUsf2RlW9NFoFAFLee2feuhhIA74JuVUJitzVhq2VkMWtDC9I6B0iGXIaUha0Oyw
	 P7+1rg1mjdi0W7846tqYfmDb47bRpV7qKYQjDd8MpEAP8n6mFP8no3/W1VYovQTtpK
	 DxQTM3Lnrh6yLW6e1ACQNmjCP7nNbji2yYcFnuAvCP8qGSmrcHAdC4PMLiU0GKzEJP
	 qTAI2C8ZmJIy6kvED2dxL8VOK35s1tffLml4TvyD1xJF5072YckQdJY3rZYtLQOU6d
	 X7VR1v+ZbwqXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 866386F8DB;
	Thu,  4 Jun 2026 20:05:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A618826A
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 20:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B15042F66
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 20:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gbl2iOh6yhyF for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 20:05:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 87FEA4ECA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87FEA4ECA9
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87FEA4ECA9
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 20:05:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5656919F59C;
 Thu,  4 Jun 2026 22:05:42 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 04 Jun 2026 22:05:42 +0200
MIME-Version: 1.0
Date: Thu, 04 Jun 2026 22:05:42 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260604173707.2135315-1-bernd@kuhls.net>
References: <20260604173707.2135315-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <0992adec516f336fc517f6b69f58a81a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780603545;
 bh=FGl0y1r+jl1uFr9EnI+Ds/ahv1s+9B+SOsaGn+n6GU0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OwC5qkW4sDAwh+siv/PR5AqrHn9LVD9Vl/JcPeyVbrT66UDSJ3FkAnoKvCj7KE0n7
 yD4kTHhTCICHkx256KYRnzU9JvJ4uw361xdGpVXdI//IyggrBiiS0l2plGwiP4RUsV
 p2GkGC1/AXlewK3UwH1JpjqzKOW75EIAl2Xj4cVCVljXwCjbeYyOKdDbnfC9Y6nIip
 9Zm9wtT7xywTdTLEL6b9OA3IIaagzPtiqMOfTKh7Mcy6z7w7UhDw2RmmrV3wJJKRzc
 QJKOw6kPUisNptQAs3lqC9F0ALHGPwgCFgRSAk34/vf+CdozoqMuhAUC26gBrCShji
 1F/ZyWlKSbUxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OwC5qkW4
Subject: Re: [Buildroot] [PATCH 1/2] package/python3: add upstream security
 patch for CVE-2026-7774
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

On 04/06/2026 19:37, Bernd Kuhls wrote:
> https://mail.python.org/archives/list/security-announce@python.org/thread/4FU62L2M6RMMHT2QPGQNPEHHUND7CEX5/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
