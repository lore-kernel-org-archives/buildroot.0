Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382D9C5AC80
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 11:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35C0F40544;
	Sun,  9 Aug 2026 11:03:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vpqiMrjE7Icu; Sun,  9 Aug 2026 11:03:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30B7D4053E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786273422;
	bh=kTULJo5OR+KxFpYp1iPXOcUOVsj8X0BfkoqlrBhQ0oY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KJXyidzq7UaVNQdeA5v1CXzIldxBM6CSZausRCeQEcWIiY8jLsptIJaYIWaR4vsPl
	 q76KnPgFG1O7j+0fAbxRil1kvFSjYYgAAbwJdjUWfVLwofj+AaE7w3Ow7ED9PToI/f
	 caNK4B6c1f3rrktJiKciIvzVmKdKr4//F2yBqkxMpvjQBWBGtRLyjSWtxUcfQ3voBp
	 1CUhTlDj2l5EagNur1lStcEWJpEFI/IWRPxV5DUwhA/fdkdAeB5nHj0gU3b5fmBM6p
	 uE8GzbyPZjlKpu1td8ZSj/vKr4o+NFttIiyjvtigLY1Lln5ukNr4VnSQM4/dwj7e1J
	 7TT0ALZTNWQkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30B7D4053E;
	Sun,  9 Aug 2026 11:03:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD33228A
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 11:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF01F4053E
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 11:03:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id av8H0aixZJcI for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 11:03:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A52EF4052B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A52EF4052B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A52EF4052B
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 11:03:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id B29BE60132;
 Sun,  9 Aug 2026 13:03:35 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 09 Aug 2026 13:03:35 +0200
MIME-Version: 1.0
Date: Sun, 09 Aug 2026 13:03:35 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>
In-Reply-To: <20260809103101.311957-1-thomas.petazzoni@bootlin.com>
References: <20260809103101.311957-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <ec3358e04cf2b8d6b510c70239e8ffcc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786273417;
 bh=ESMZVNG6UFGtIkGrFjhuqHXJR/iYk3cj6HWLyntV/l8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GGbHtuCexUYzUhdyzfFqLdMm55Thcg+hImlMk3IVMkW4q7gcNJXo2M4DguS1fJDSJ
 WvK7FbhgFmikoLECzdyXe9R3zV3afi0wA80JUMXr8RtDBdmZbRudbWegn2nRWPz3to
 Y6GlXEzaE+IkHfDVoefEYiZiSN5Z+ry/JjJQawMaoFRttO8QnBGi1Ch2OpunA5EQb1
 OXh6EiDo3W/jPzZuUKsCIl8pSuB9EBlhp484z8RtGlHSRU+vSM9Q4SiaP8nZpKZT80
 N+pzTlFY9KyXHq3uHgM4GeenLfi6eINSztHRq2F/QTWm0qhY3s80xJR3elQUEZyXWz
 zStv70EaVQCyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GGbHtuCe
Subject: Re: [Buildroot] [PATCH] package/libxmlsec1: fix Config.in comment
 dependencies
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

On 09/08/2026 12:31, Thomas Petazzoni via buildroot wrote:
> Commit fef9cad1fe84b4366e705adb03470e12199ffd25 ("package/libxmlsec1:
> bump version to 1.3.12") has introduced a gcc 7.x and atomic
> dependency, but the Config.in comment dependencies are not correct:
> 
> +comment "libxmlsec1 needs a toolchain w/ gcc >= 7"
> +       depends on  !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || 
> !BR2_TOOLCHAIN_HAS_ATOMIC
> 
> Indeed, we treat BR2_TOOLCHAIN_HAS_ATOMIC like an architecture
> dependency in Buildroot, so it should be:
> 
> +comment "libxmlsec1 needs a toolchain w/ gcc >= 7"
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC
> +       depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
> 
> so that the comment does NOT show up when BR2_TOOLCHAIN_HAS_ATOMIC is
> false.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
