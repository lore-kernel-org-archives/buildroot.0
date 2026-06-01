Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45032CD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 19:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D3EE60685;
	Mon,  1 Jun 2026 19:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EtK95E4b5Eav; Mon,  1 Jun 2026 19:11:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D74F606A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780341060;
	bh=b4ve6/fz0kLZEjevqYohb8lRYqv3iMwF1yBVPT7YXXA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QXDzevCfMSL+RC2nb3NjFIFEBVhPx0UthWaGTiT/JZkwgG+xpvw1/Q/cQmvdCClOl
	 mi3xVdwHVJSqZkT7SXH2ZV8nCRwC616eRIk587hog2J7T/UoGw2zekVzUwGotcT248
	 fE1tmmbXR1wQECCVeG9zVC7hBq7WQ/dzIe85oJItOgkIMS+TAYES3Qbhjl0DqvmQaQ
	 WFhvoRa24S/6Wn49WvodvCiSqeKePizRF26KvUSmt3vpYDMIKd8NWqLfuTrfxd68/d
	 8ZUOp7qFC+Sfd3o1O/1y/gj+17OApq0N9z8nb679O++HWFX8LOM5GqzqafOc/Ht0+1
	 TWomWFbuUi8dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D74F606A0;
	Mon,  1 Jun 2026 19:11:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C5626F4
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B66B5409A9
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0xiroxga36ot for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 19:10:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 98AAA409A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98AAA409A8
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98AAA409A8
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:10:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 4FC2B2003C1;
 Mon,  1 Jun 2026 21:10:52 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 01 Jun 2026 21:10:52 +0200
MIME-Version: 1.0
Date: Mon, 01 Jun 2026 21:10:52 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Phil Eichinger <phil.eichinger@gmail.com>
In-Reply-To: <20260601085852.1792002-1-peter@korsgaard.com>
References: <20260601085852.1792002-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <3d92c2c9bc922be7586ba5dd861c871b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780341054;
 bh=D4lUsGWFmYPvuxpGOerUK+Q8PGC3FHHTpIjjjrwi/9I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KZnYM4AHQ8rlGpgm8m8Kd4cnvlbVfrr3SDednq+q3h9Wg0TpI5pCfCbno/5KuA9TD
 Qg+85AaqDg+XQvB65gWQYNcCRmHP7R6NSg7rN7Jl9iYoYNLtFCekxnAfGiEljK7G67
 8kAL4ErBvcD1FRhV6rY+eiCSLeAbfiLkiWtwd7iUVyW21OohqBqs2qPEZNuLIgChvW
 Fx4L0JFE25Mi/mM1AU1Ygz6wB2poJU+zhSKwIb8ISkVYc67aKNTqKhgMcqfkNzwHSI
 6QhOnZqQQ3gDovRLQZntHIFgXm0QJoGSjvTG0PHKPdBh3+ixH8p7HqRBZQszZm2Sbm
 oUOQdnnD8gx5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KZnYM4AH
Subject: Re: [Buildroot] [PATCH] package/zsh: correct download URL after
 5.9.1 release
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

On 01/06/2026 10:58, Peter Korsgaard wrote:
> Fixes:
> https://autobuild.buildroot.net/results/9f0f50858b2f41c306f172bf011a34d2c0ad65dc/
> 
>>>> zsh 5.9 Downloading
> wget -nd -t 3 --no-check-certificate -O 
> '/home/autobuild/autobuild/instance-42/output-1/build/.zsh-5.9.tar.xz.FpXHXy/output' 
> 'http://www.zsh.org/pub/zsh-5.9.tar.xz'
> URL transformed to HTTPS due to an HSTS policy
> --2026-06-01 01:46:35--  https://www.zsh.org/pub/zsh-5.9.tar.xz
> Loaded CA certificate '/etc/ssl/certs/ca-certificates.crt'
> Resolving www.zsh.org (www.zsh.org)... 94.142.241.90
> Connecting to www.zsh.org (www.zsh.org)|94.142.241.90|:443... 
> connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2026-06-01 01:46:36 ERROR 404: Not Found.
> 
> zsh-5.9.1 was released on 2026-05-31 and 5.9.0 release tarball moved 
> under
> old/, so update ZSH_SITE to match.
> 
> https://zsh.sourceforge.io/News/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
