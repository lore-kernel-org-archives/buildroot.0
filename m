Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30432C88E63
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 15:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99959405C4;
	Sun, 13 Sep 2026 15:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7rW6CJz19L-a; Sun, 13 Sep 2026 15:49:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E198240557
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789314594;
	b=gJrb57ZSAHcBrNkDjDuz3wir6kbwHrX5fHb4wsdTKKSbWpkuHlLbCPvMYZOz5CyTjJD1
	 PNNmLTVYZwvdLQfQ7TfxPwazXH75WFESTKPWjmD2U6lRhWdldN8ofWqFdiVk79U5Y/kYe
	 40BH64oqPuD6W0OqPErJzfEyrX/DClvUT8HzXB750o82KlBkAF6lqgp4b2HpDjJJnualG
	 18K2Rdc1djVupZqxAAlY2f35PHJ+r7zGRLTQpoWBYkCsAxccnfD5psjGPOheXJgJgBlnX
	 FaB8pXNi8pVEI1z6q4nBaPOG7eOI+6R7Ji6fVGudkDM5tf2V16C5e0xgOrz9SouWBzg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789314594;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=6V7VnGGX/7puRTnIEVTKGiweHyDPG8d0aoI7/sfvtAA=;
	b=Gsstpzob498SupHLlud7BSqp12gwGOduKhfdvCSG32wjydn9f1veS8wJ9QZCbYGZosZn
	 WIivzckbXuRLfK+rf1oavYiqjEjw+MKAYHrwUxdS83hUJoIEtF9OgZpHxXv7HFr8/xJVy
	 DLmLyXz2eQg8CGtOjOPc9wQ/v2juAiyGqbo4JEcutVnKKI5mQAzmZ4wv7MJRLN+R+xcV9
	 WMOSjCcKuUZL5QZkE0NJX0xsJ7pCxeU5GQKKkALgSY5z5/WqZ4RaNYhkZdyHA0W/Vr0Nk
	 fhuH9rxOZ8irBXw7HsC6pwlvfAw4Gwg3L464eKyxvINyAEjR5yfbCh7420xYhlPYbeg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789314594;
	bh=6V7VnGGX/7puRTnIEVTKGiweHyDPG8d0aoI7/sfvtAA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dXsQV6RuQprqZA1JDxE+ynshMKc++B0kXZWYM0qQTPQ1syZzBNaThfNxoOM2pHQjl
	 u1ffwH0Q7f2YiSwcoOEAk5bUtnLSfSwFr0+wto/m8pcFGh4MEwgOGAxEQjcD60nusp
	 6tMkhZj2LmR+Ou8M937JnLMnDG+AdCVkiW9R8NXVeBpIKLnRO2glC5hx7XOz350GFs
	 sGNqJxeYOOp1JSDteh7q7Kzr1DUUkaKLdUHgYq+mOG5Sl34PkUCRRJk6JmSqRmxbpj
	 QCceH5h9N3T7Lw4xmH4dCTLvuBLx/NE5NoU2iR+boVPMQCSOtqmuZMLVFTAkKHvqOi
	 +ewnU25AdkwXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E198240557;
	Sun, 13 Sep 2026 15:49:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F177362
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 15:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CE7A40076
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 15:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2EMlNzWZZ0Sx for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 15:49:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org CA42E40022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789314591;
 b=bMHtPcHTVwkZScP+qius68RspHd4BvfruIkRnUACIqW3lxzAX6ufoILCWvOrDBtPZQ+a
 JYatVxtdSgdDs9/RRvHD+ZCfiIQHltV4yyic3tpy/W0y6ekFaPXvZuwh8AjV55dmXb19g
 sB3QRkJi+gSwxtckpb/LXDbcAb2U+EgVQDrz33Q6lRbpVWqGQynTtsd2E2an3VSTnp36P
 1VAWUVm5xtKLokRM+bFjWOrZoRevXjpD9aodKHJURYDU6IpDrc80mrLzi6l8CjgJEtmfD
 NrcuL6POxAJ909cxNU1CLa4vaGmkb9CR5onr5Zn/wQF73vaqboTienEe6kpinPxjdgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789314591;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=6xIq1Gwk5oj0qnGkpKXQQS4kD+dZi+jAXOclgmy2ckM=;
 b=cR19qLkbcOVGlXWeUuy5FyI0HLEZRLswvVvSVo+q+PMylzYD8z783l76wAf4wxGBbL/5
 mXpTModm9Qgz2DfwwXH3biVhylOUefc8vmpRmubaROmovSppzHqVt0wuXKqNaBxnvG+11
 hi7KYXn8nJE6AJ7ATeXgQ/s+g4KF6kirbuI1TIpcLGMswEE5aB8w5DqGjaUYsv9CD26Pt
 r6/8GSZoOsltD5nXkiXTaZK8OwmgzUoSdvZdw9W2VRu5RDprGGaihI5G708sMkcoe8Mkg
 X7roVOH33/H/t7gM6hwrT3951t6XLIPP7a2ZjOoaM5vcEz14Fpyxll4RtEyPGw9c3Kg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cP9WXm0j; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA42E40022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 15:49:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 48E8B19F57B;
 Sun, 13 Sep 2026 17:49:46 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 17:49:45 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 17:49:45 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20260913121629.1650246-1-thomas.petazzoni@bootlin.com>
References: <20260913121629.1650246-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <229c9689aded324da35ea41abcee1fe2@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/kodi: fix definition of
 BR2_PACKAGE_KODI_ARCH_SUPPORTS
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

On 13/09/2026 14:16, Thomas Petazzoni via buildroot wrote:
> The definition of BR2_PACKAGE_KODI_ARCH_SUPPORTS is incorrect, it
> goes like this:
> 
>  	bool
> 	default y if BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
> 	default y if BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
> 
> so it means it would be "y" if either
> BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS *OR*
> BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS is true. While clearly what
> we need is for both to be true: ffmpeg should be available for the
> target architecture, and openjdk should be available for the host
> architecture.
> 
> One option was to change to:
> 
>  	bool
> 	default y if BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS && 
> BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
> 
> Or:
> 
>  	bool
> 	default y if BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
> 	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
> 
> But we preferred:
> 
>  	bool
> 	default y
> 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
> 	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
> 
> Fixes: b6a2f494290d85a26798564992ddd1ac46c1a48d ("package/kodi: depend 
> on host-openjdk-bin instead of selecting BR2_NEEDS_HOST_JAVA")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

> Note: I have no strong opinion on the different options to express
> this "AND" dependency. So if people don't like the choice I've made in
> this commit, I'm happy to change to one of other options proposed in
> teh commit log.

I applied the patch because:
1. there is no policy defined,
2. it fixes a dependency issue, and
3. I'm fine with the way you wrote it.

If we decide a policy, we'll realign all _ARCH_SUPPORTS.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
