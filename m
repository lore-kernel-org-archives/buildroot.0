Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04259EDA6B2
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 17:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4B9441B5A;
	Tue,  3 Mar 2026 17:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FndE6LadJC4D; Tue,  3 Mar 2026 17:27:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B4E241950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772558860;
	bh=FiNCpfUkyq3s3vn/hDU6lgiPvBcmOHorQc7CYmDjoKU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KppEFVDnrj8stRIcUHrkXBu2YqfN1mFDgM3TrbJnHt+d/oN8FzwnD55H8i0nYx2n9
	 JDRTjz9ZjfzF4wqj/K5OnxGkjHygnxU3vw1s+BjO5L9kAQWpFXjGME0YOddLYoQQuL
	 KmlrLPrZjtTvUZpxW3BQ5PqoRflm6Idu3HNYh8wlxqfKv+h2Ivm0OO7MPrK32pFbKc
	 /6Q0nijFnlGWl5D4IffzObPo2vt65aS1S4RKE2CaFHHHw89ZwAa4imvw2HNoN9K0nq
	 8n0rM5Z6sDtnnMGTaQLmg/sdzmjJw348jC3ld3ZP3LkJFPnoh9pPH4C0HPPK7nG0Q7
	 y7+0bo4AepxOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B4E241950;
	Tue,  3 Mar 2026 17:27:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F181525B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E30C040087
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:27:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5DaAFoFGqL0V for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 17:27:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0893640028
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0893640028
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0893640028
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:27:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B2C9A78034D;
 Tue,  3 Mar 2026 18:27:34 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 03 Mar 2026 18:27:34 +0100
MIME-Version: 1.0
Date: Tue, 03 Mar 2026 18:27:34 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260303101254.192225-1-thomas.perale@mind.be>
References: <20260303101254.192225-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.13
Message-ID: <8f0a13bcd108a1a9e140b3d148ad0a70@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772558855;
 bh=J0xFqXCUJHXDZd1mzEaJl/8iw7lrsIWbd/xFfw3bo+4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L/pQ5oqxk248+SRI8ISVG9T2b9G4V+t+wyFW+xojOyp2t7gKlvQY0PTP2HNbRP341
 NXhpsnTbzJKVBLaG/sa+OOFEu4niP/aKKSgIi38PDiadVY2aJvUcYgMsvwpgXbgK1+
 ZhPdOPYSannxPrX3Ahcu9csX+Fly/zNoZy3jAlvr3G8NYY8LIw3yPYZ0lsUYGGKskg
 qjCPj17ruueu4p70Y6/yfDKbgUBSbHvi0d5iUEU6bma/gLYsrbH7wazg12YEwWgzWs
 OcpdkqmzCJkMAbVyDQvsbmt9sAcqATCmVYUKwGoVNxAzrvUrhEffYfJl3Mw6rOuH8n
 Tv7k4+zmqIL2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=L/pQ5oqx
Subject: Re: [Buildroot] [PATCH 1/4] package/freerdp: bump to v2.11.8
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

On 03/03/2026 11:12, Thomas Perale via buildroot wrote:
> For more information on the release, see:
> 
> - 
> https://github.com/FreeRDP/FreeRDP/commit/9b678b6d5a40ce01607d8c3b1b1416437c8416c4
> - https://github.com/FreeRDP/FreeRDP/releases/tag/2.11.8
> - https://github.com/FreeRDP/FreeRDP/compare/2.11.7...2.11.8
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
