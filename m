Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03EBC43458
	for <buildroot@archiver.kernel.org>; Sat, 11 Jul 2026 17:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2978560DCA;
	Sat, 11 Jul 2026 17:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x7zOBQHHF7PR; Sat, 11 Jul 2026 17:37:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 163B26064A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783791474;
	bh=AkZ5+kmkHxauZU1PBuEN4H/UC34eTBftml9QPEVOcyU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RlHt5KsIQHVjxWGUK0YxCb933W7Zvuyy7oZGp0o3ad9dP2bbuKiLoGa3E+dnZ+tkt
	 PbwTeIgooB8TCy76NsyWKqJfbKmRw/OZ7P3FfZUDdOu7DmKie/dseddiD1R995ld+B
	 ONlq3udx6Z8RtXPhU9+J9gIDzhuEtapijjaqE7907Apabbyn1uZJU/Z/OhiNE9Hn6N
	 A0V03nJpIg1G3rzmTIx8B+vfiEmaVQrEtGGu0mTL48p31EgZNa5zzUKhiQIWij+R7/
	 lVFY2hcKMs3nSzFSLzHG0VpXcb/pW1Ayw8hFMXOqdRZjC1ayttVoHm2g5e8WwO62LQ
	 acPYJnHCQzKEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 163B26064A;
	Sat, 11 Jul 2026 17:37:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 022A02EE
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 17:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E87536064A
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 17:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AqG0DpM8A1Vp for <buildroot@buildroot.org>;
 Sat, 11 Jul 2026 17:37:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A93C260618
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A93C260618
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A93C260618
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 17:37:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 38D31780389;
 Sat, 11 Jul 2026 19:37:46 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jul 2026 19:37:46 +0200
MIME-Version: 1.0
Date: Sat, 11 Jul 2026 19:37:46 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260624114538.1705870-1-romain.naour@smile.fr>
References: <20260624114538.1705870-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.17
Message-ID: <253f57e5354df78ebbf9047b57374301@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783791467;
 bh=FxJm1WhrB6bHOTXXjyYsK7Kmn1oM0IaHfA4oLsz8Ii8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YbdZdBzmTeUuFrlJBUutRnIhKESz8u78dg9GOKKVyMqRuu9qiptua0aGo9WpyL945
 8uJ5vKe4HqTjvg1bW6h3yJJqOEXOrGuvh31H2u9zDmaMt1W55/8MjLLgZSPJV0y6j8
 CKXzJxDV7MFOtexOUltrJ9W5D5w1epI4/+lujDPP7F8YspalDzIwdDc0PEpt6OHacG
 kzIriNmpQZl47SPWT/SlfTAnHMC3/bi0AH6DYbLEQP44zUZQFE8C97cyVMR935f7nX
 V7AIvoU10HL4kD/yLB7PiGSEEd3BK1SSJyME+LzVlCZF898o50ieUeFOF5Glx9zM2n
 n9UYLjEB2wO9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YbdZdBzm
Subject: Re: [Buildroot] [PATCH] configs/qemu_arm_vexpress_tz_defconfig:
 bump tf-a and u-boot versions
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

On 24/06/2026 13:45, Romain Naour via buildroot wrote:
> - Bump TF-A LTS 2.12
> - Bump u-boot to version 2026.04.
> 
> smhload command has been removed from u-boot 2022.07 [1], use
> "load hostfs" generic command as suggested by the documentation [2].
> 
> [1] 
> https://source.denx.de/u-boot/u-boot/-/commit/dcc4f9623e27b92a1e0b97326631b0d5841c49cb
> [2] 
> https://docs.u-boot-project.org/en/latest/usage/semihosting.html#migrating-from-smhload
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.

For info, I added BR2_TARGET_UBOOT_NEEDS_DTC=y and also removed
BR2_TOOLCHAIN_BUILDROOT_CXX=y. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/1dfcb841f9021310bc81a2d0bb3c52c90050a325

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
