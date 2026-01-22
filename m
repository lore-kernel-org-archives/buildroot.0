Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34A5D6CFA1
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97C056074D;
	Thu, 22 Jan 2026 19:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vTnlmULIEGUC; Thu, 22 Jan 2026 19:58:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C53266074E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769111885;
	bh=sN4DlSpjRCrZOGOAO8Mx4/JHTDsQ6DUiuRfjr3kGzNk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OLs3PPgmPgC6hxIx0UKX7arvTyo4G60a4h+b84uX6iJraOOZDRWNNVKoT1+Os6c4P
	 VI6DOUoeg7DkyAX9l3elhN19YOqNDq08B4eggZWJTjeyoPS8oppqcImzt37kCUBoun
	 /1AUKH6PJGHZDvIDoEbAxq/02veVNMOKblPGWd8h9tMPBIqfom7/BmjLS2/yMWKx8N
	 TXRNQY8JCzatm1Xsrn2JfdoJHVZJpqWmqg7pQJx763xNOLQDTg45sTWUCxa7yqvPhc
	 5am0/dqYGBuUKvpHnKgTwXdv8LPVV1Z7WJ7YFAxfWGlZ2H28gBePb1YLJJbELCRD5D
	 JmeXo3PsOMhSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C53266074E;
	Thu, 22 Jan 2026 19:58:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DE397122
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C25D5408CD
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:58:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CL5nOI9jPDWH for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:58:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 251DB408CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 251DB408CC
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 251DB408CC
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:57:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E0D502003CC;
 Thu, 22 Jan 2026 20:57:39 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 22 Jan 2026 20:57:39 +0100
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 20:57:39 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260116213319.2747698-1-bernd@kuhls.net>
References: <20260116213319.2747698-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <4aa7dc4d95073258b29f266c06bd0f68@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769111861;
 bh=oFcMQOqXkMoXnNehQ7KaPfEJ2nimBeQt7YNr5EBXJHQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lRQjsilt43EVfDb23DY3De1yc9D6pSaBictmGNwW3dq7GZEEuKH+iqIgWqHOFDRne
 EZ8MKEjlEBsnhIJNFk01x8zEJc40cHQkugALcxoK/fna696RuyooCdtK/p+uYroNBr
 UKb23ho2VG4B4oDIMK0rcAOOkjWfaI8f86O6OFxNNb2qJO1piFO+fp6onJga2RU2uZ
 lgV6PDa+eyRQIeE53ChcqkuUTBcTq+4vkrNrBDVIo9ZQCVBRHFNMHPNOvM8DSWOHUu
 0Ry8lPKVaD+tYCW7/rdYtsrXqKkcExFFN58fdDGAhZYDUcCl55OSQ4uoR7RKSnCtsp
 ODY/qFy0oc3/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lRQjsilt
Subject: Re: [Buildroot] [PATCH 1/1] package/alsa-lib: bump version to
 1.2.15.3
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

On 16/01/2026 22:33, Bernd Kuhls wrote:
> https://www.alsa-project.org/wiki/Changes_v1.2.15.2_v1.2.15.3
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
