Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB93CD6E57
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 21:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B66DD61BD3;
	Wed,  3 Jun 2026 21:56:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vcsNXfTEARsI; Wed,  3 Jun 2026 21:56:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC91961BCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780523767;
	bh=Y6jsVi4u9qR7qUze91zmg4DZVbXJYgh6Q4mSVSLBKlM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jmgqpFUNQBuKmgXP7hlFpsbBZaGaSRCrz/SmUvQqNV69BYqHc7yxBKbKPIKmaZH64
	 bXdFlUi5VZA58SAf/GEN7XPZJ5p1ndeN/JvuHsV54YwPbJsrCNJLJsrNpe1mkYrXmi
	 2abwNMoHpbSRZaw4LUFOcJGgXJmYl7LOPQ2vcwTte4j7cFEygrrpR/YA+vv2WAttxe
	 l/RnuoL2InMyPkNfLo9YifniYhiUD117l3l/H9cSZPBZ5lneDy0uQgTYgi0TUrZ3kE
	 I6s8GleSyMxaYUlP/LRoB/NlqVGtPLFuFxvGuysY4oHjMl98rxPVeK+uENWRcOdrz+
	 EuR3f0tKlJPfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC91961BCB;
	Wed,  3 Jun 2026 21:56:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4CFA192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A63B784874
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:56:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ukNloMQ-A0L for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 21:56:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D86C784871
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D86C784871
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D86C784871
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:56:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 9BD0313F8B5;
 Wed,  3 Jun 2026 23:56:00 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 03 Jun 2026 23:56:00 +0200
MIME-Version: 1.0
Date: Wed, 03 Jun 2026 23:56:00 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260603135353.3482326-1-bernd@kuhls.net>
References: <20260603135353.3482326-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <28771125be82fc1accc21f18f1c0b2ab@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780523761;
 bh=zfaCz9bcrx5b4Vvbs/3qdj/svfAqV2/jKaVfLu1dk/A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vXFTj4QppcniXOujW1MpEeabDNNCoFG8+NOVEoTQpn0TRIJ8mzftYMiLb2o6KNHvB
 BMQ4f7pWQ0wEGGRr8VxfFkmc4X508ITRGPykYXmF9FD0k7rATZ+5aglekfn+VJOl3I
 taTOmFGxTq7dR/Qmm61S09xX6y2LuUVSqblE7bNlVqy0WN3cL0BruGymRH2oCQ8MoV
 swyi9Frek7OB0tK6N48cT9bQdb7StUpc4JySxKyYbVNOjhWvrjhU8DqkvLUVpzOWN2
 jtC5oVf2JJmiY2i1N53a0uM3IPTG7jG5TpBwtR/Dqf8aUZLx6MOIiHt1f7MOIBwGyY
 oJd2H4NNCUXUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vXFTj4Qp
Subject: Re: [Buildroot] [PATCH/next 1/3] package/spirv-{headers,
 tools}: bump to version 1.4.350.0
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

On 03/06/2026 15:53, Bernd Kuhls wrote:
> https://github.com/KhronosGroup/SPIRV-Tools/blob/vulkan-sdk-1.4.350.0/CHANGES
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
