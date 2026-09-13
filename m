Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBD7C88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 15:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AB5D80D7A;
	Sun, 13 Sep 2026 15:36:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ePq5fw2bPJQ; Sun, 13 Sep 2026 15:36:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org ED95E80D7D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789313818;
	b=VaSqHLHOcfiwM3ktMy6s+uCtqLpXaCIc/RrApNTNWaIjfRPNwwtmSP8sN7Xkqptn1+u/
	 XbFUKPRVsd13CibkknJQgIxdpzrTF24VVHFc0m30GDY5LEPXPnTnWFzj4oJqJfFF3KCVF
	 XGoSBsi8l2mXzPLZrIuNtHSn60vbjVL+O3utPgjLr3f1ctXo5ft78M0//D8JZaKnPZcWw
	 GhOyyZoeHBIUfZ/9E+FBpEZFyb8MZOqLEL8DADOn0Qjx6syYs+hs4uqlkWmuZPy9/JQSc
	 8/dR8Is0xlLjrIrNtfp49T0nU8KfrzIQZvAMrmzviSOQPm2dxVrueRPVjPNbS9iOk7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789313818;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=iq6wXxL6jj/m2hPXJ6SDCzMh5wITFwe8B583jKH4uac=;
	b=P/4L9nwYD1gEByHUO+ICmOEagIn7pSn1Uv6OPT78EBGK9+SpKoDGQAYPpWGtDbX3Uz2s
	 Xi74E6twWhm30pzd8Ad2G3JamDAjxPaaWGpew6LlNNIO1VmD/uYq5QdAmgMkHxYfKb35S
	 M9+pl8NHp0DO7Enndfp0AtRZOeWhXNZxZloJH0WPdAUBTaM9eCGXJIv4HaZXDRtNcNcfQ
	 YMlgn5BABEoZrhwGHwvlYXnk650R8KV03O97IgAektTrsGRm3KA92VBLqZV1E5QkoGr+9
	 mIpn46cGXHcyygM09ir2zckzhqOyKs/lUUlPQI0nKHNVLlZgFcbKiz0P46bgNUzYVEQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789313818;
	bh=iq6wXxL6jj/m2hPXJ6SDCzMh5wITFwe8B583jKH4uac=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Jdx3sLtzDBGf6BWAYB4JO5d72Rw2p5HnXURjewYa4VpYux+680d2+xddM4s8s3osw
	 EVaXvelIA4QtIPDCHxHmRVnV0xyS1PEa/rYPtHstxI/LhVYcZEpgX3PkaGXXLX912Y
	 WU8F/VyCwTaFMwsvHxmZFG+pSliZcaIe7AROAXownVmuyrz+IYSDxEExqihluFN9zA
	 yLo2UTNXcp+QC/j4tU4jiOgd7OSOvjP+U5Qv6TvC0mzjtNqwW46/87Qtp6yJpQWscz
	 o9sJFLeQR/VUzI2tG/Bm6wNeiHoBrQrVSAM7RR26NmWJsD1RE6DRoOYqlSIA23eGzL
	 3uKI5nRjl0eZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED95E80D7D;
	Sun, 13 Sep 2026 15:36:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BEA024D
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 15:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49166605FF
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 15:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tyxr8ThgpRHT for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 15:36:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 573F8605F9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789313815;
 b=F4OYZu1vM8hGX0h3Ousq61msHAm/l+IVeSAkPrgfA98hYDDgIWQ/5Yzp2DlZZ1FAz2Ue
 mDKAWt2q06OXDtYdONNzSWkVK3P7uwcCkDzYtRw8gObAUcPKKZxMOk7xy+UFzZwT5uX+h
 ZKHgThWti1xcFad5fOJLDvuOvhkQwYvURt45Z0MTmMWBhbLMsWgoMH36m875KhKN7Yt1f
 KLfoT/D8UOUBYcsbMBKcr8ci1/GQAj70HbYuY988oYsE6Hw8UpugXkfRyWKO3eS60xukH
 Jv5hzRtCyZjyrPiHdlLuAQFeC3XHoluSVbgnWcRN3U6TqVfU+DocDgYPXixTtdO63mA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789313815;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=x0c9denmhzmhFtmtEfCYa1EJIiiQUoEL1z5nSN2Xsrs=;
 b=hz7yn5tZRTiVA4udh3XgMJL22N2Mis9067QqeGnSz1wSV241qeSzy382dmL2NXWz/i1v
 LckOeqT0rAGjfVY44SOwHE5ckhrcoISaiSPjRQRlBRlBA5oQB0xxnShu0yGloQigSX7Y0
 BohEYViD8OdD3puxOB38vK7ig74qv5Kad8ZvXugG3eEuYmqJSpyqccHC17g8Y5P/mAr88
 Hyi9lj2IUHU1rJ5MwYSAhjiePmwwcVUjpyHZc5+4wU355LCWd79Vo1GkKTePsCl2u4NLg
 T5eHFhFIfbrpE8ijOyEUtXbha74oXhqjJwZfLI5x1yvK9KFLtnMO9uAL3ejw5+8n1dA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UBqp+Rqx; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 573F8605F9
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 15:36:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E2F07B0057C;
 Sun, 13 Sep 2026 17:36:49 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 17:36:49 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 17:36:49 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20260913120729.1647806-1-thomas.petazzoni@bootlin.com>
References: <20260913120729.1647806-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <031430f63fb15e3b24b3627fb14bc16d@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/kodi: propagate mariadb
 dependencies to BR2_PACKAGE_KODI_MYSQL
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

On 13/09/2026 14:07, Thomas Petazzoni via buildroot wrote:
> Even though kodi itself has architecture dependencies (expressed
> through BR2_PACKAGE_KODI_ARCH_SUPPORTS, the option
> BR2_PACKAGE_KODI_MYSQL selects BR2_PACKAGE_MARIADB, which has its own
> architecture dependencies as well. Make sure to propagate those to
> BR2_PACKAGE_KODI_MYSQL, which doesn't require adding a Config.in
> comment as these are purely architecture dependencies.
> 
> We haven't replicate all dependencies of BR2_PACKAGE_MARIADB because
> all the others are covered by the top-level BR2_PACKAGE_KODI, and
> propagating them would require adding a Config.in comment for
> BR2_PACKAGE_KODI_MYSQL.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

> ---
> We don't have a super clear/strong policy on whether dependencies need
> to be replicated to a sub-option when the package top-level option
> already has them. I haven't done so in this case, but if people feel
> like it should be done, I'll be happy to send an updated patch.

I think most packages are not replicating top-level options.
When there is replication, it is sometime due to leftovers
after changes. This is why I applied this patch.

If we decide another policy, we'll have to realign all package
sub-options anyway.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
