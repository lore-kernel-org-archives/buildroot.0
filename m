Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0912EE9A04B
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 20:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D31254040F;
	Wed, 18 Feb 2026 20:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 621p4fWRstKN; Wed, 18 Feb 2026 20:52:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04C9340501
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771447945;
	bh=Jipjjgq8QZiAlO0Od7aMNI3Bh/y7YId16OVX1xAzUH4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=G4bVDjdRc8xEcJqt4ajgQNSl1hrNJEjrl7wMtR2wrnnWG6jTYu9xHAZa5v0FXFJJf
	 sFq1lCC2MoAtQLI0+XVNv58DUqVrWHAsg6Lart1oDYhpc+h1o9ZP16hp+148gsl52C
	 /IkYmXuCBg+Akx5Ri9UgiTxvTw80rOXah7Ih9MDFnb2kKWAJlv9VejyAj5MERH4tpd
	 aBAQDiCxyh7n9TfjkpSSbiArGFulqryj7jalBKaxcGERt73FdkmW6ICmRoBVPkMW5+
	 bPpdTB6WMTuG0PUDtCl2NqLKL85e/QPkPZxIaRD4Fq4o/WqV/vbGQprkQ9Q6EClyrQ
	 0TXvRvXCHQErg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04C9340501;
	Wed, 18 Feb 2026 20:52:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A9CF1CE
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3F1B60A8D
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1jXe4TZoweFU for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 20:52:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 21A8360A6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21A8360A6E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21A8360A6E
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:52:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C42225FF95;
 Wed, 18 Feb 2026 21:52:19 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Feb 2026 21:52:19 +0100
MIME-Version: 1.0
Date: Wed, 18 Feb 2026 21:52:19 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260218190918.2574524-1-bernd@kuhls.net>
References: <20260218190918.2574524-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <c30e3e0dc9f4258e25824269460d9d0c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771447940;
 bh=4C/93e56j10SKzZR1bD5+wNUj27exXT+A8zim2M+RLc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gt8KbV4hUaWkDylgua5W/Ur5KHlDo/jnr2itrPlgnR9R3cFz5U+ADxNdHrUnZ7Bpl
 XFF0meH2dMTTfXqQASCN93fh0JCgHqaxldCi44Cv3L7gEddZv7NO9BqbOprEPRY8hF
 s6t3DeaT/4Fw+nL5bQlGoNiEabalmKDFmFGG58xZXMiy6HmA8MEOvehgHVobNzkydK
 +XY9kyxqkAuB/gozvSgaOowL+KxcF8+y3WQMTJbcW1MMiot/uItxN+wjktOgTvpwfJ
 9eEpFbdm6ktRSVUQZxOgN5jszYqYwmHZuNLB8SG/t2exOd9wXb1ofthbqeBcHD6wb4
 WzrLZOhaKqjLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gt8KbV4h
Subject: Re: [Buildroot] [PATCH 1/1] package/libzlib: security bump version
 to 1.3.2
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

On 18/02/2026 20:09, Bernd Kuhls wrote:
> https://github.com/madler/zlib/releases/tag/v1.3.2
> https://github.com/madler/zlib/blob/v1.3.2/ChangeLog
> https://7asecurity.com/blog/2026/02/zlib-7asecurity-audit/
> 
> Updated license hash due to copyright year bumps:
> https://github.com/madler/zlib/commit/570720b0c24f9686c33f35a1b3165c1f568b96be
> https://github.com/madler/zlib/commit/9e35567064baded660f61732b247ef5abc809014
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
