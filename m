Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC44CAC598
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 21:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B10FE84789;
	Wed, 17 Sep 2025 21:16:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z4qt0mAhQKRV; Wed, 17 Sep 2025 21:16:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 724A784770
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 724A784770;
	Wed, 17 Sep 2025 21:16:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 91188199
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 21:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 772816175A
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 21:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M6J0NsLlbMB9 for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 21:16:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A7DC761759
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7DC761759
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7DC761759
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 21:16:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E3E132003C3;
 Wed, 17 Sep 2025 23:16:38 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 23:16:38 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 23:16:38 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250907160424.3546872-1-thomas.petazzoni@bootlin.com>
References: <20250907160424.3546872-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <6474f8594d0c2f6f0fd52d5008a8aac8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758143800;
 bh=2ZKVzQ8gwiOsIPBg44S0bGEZ5850nItfZjNc1aqchjw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mZIRS7WQG+WjkAL8OSXSbn/T8BOpqSjZ01yJW0E/OSPtYqPsISYSwD3JNNW/+ZJ7k
 +ZBrcBYd+4HypB+gD6YWE8d3Tsg2RIZwrzFYPd8Wusv1D5NRdYTagmSu9iqUIyOsWw
 J8dy3x5G1Yau8O4X/nxu6qilDL79XlXVQb9cVPGG2HTPfiB94jY3RkgSBjTiRmCD06
 tpIPNywefTwOmQ7TQXYg7AmpbrRNjOfY4ICHjed9/FxyGfdydNQLVzpu7FfygygCWk
 RrXn77Y5KRTNKgnSp2cX1IwFQborQDuqGMDR2WYzROYHOrxEJTXFigWnKpgzr+EKm1
 29R083BgTCx1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mZIRS7WQ
Subject: Re: [Buildroot] [PATCH 1/2] package/c-icap: add patches to fix GCC
 15.x build issues
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

On 07/09/2025 18:04, Thomas Petazzoni via buildroot wrote:
> Patches 0003 and 0004 are upstream backport. Patch 0005 isn't because
> the code has completely changed upstream in newer releases.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/e9b4d9033f0283b133b58049a03b5f0b595e30db/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
