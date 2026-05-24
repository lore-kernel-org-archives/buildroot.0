Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E747CD5BB1
	for <buildroot@archiver.kernel.org>; Sun, 24 May 2026 17:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E496A83B46;
	Sun, 24 May 2026 17:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ICejWCTvxTw7; Sun, 24 May 2026 17:48:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27EE083AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779644898;
	bh=U0TAnmGSN1S3Mz+IxEzdQnbmzQqyqszK2ou/MyP5dI8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XeXyypgq9N3MVLTfswpIEWBXjt9I81pfS0CnzdNOBNayKeuwaFkFh09+wb/dzYGs+
	 YVpb3AkHYtBw0pTyibalKbRQuZ9ajOXe7ER+n6csp+A2EfV6W4dIRepgW8eZjVqcQB
	 JNgiorpfG5D4MyWowqesjM9m/jCljOx8s4QcN1CkzqX9o4O33yk5Hpl+Not5ZCzFGZ
	 0b82h+bmoo43vaDUWebqh8o2Nf5NUuoBeq1ILbia9ThTiFKMjQnAxyR8a7NJNTGvx0
	 DcfxidL4eBhr2X7UjHa6rS7sotWK5AbznLaQz5esWDC2+i9dulcKC0ghy45f9sRzuv
	 DTaJfnUNcFW8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27EE083AE9;
	Sun, 24 May 2026 17:48:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4407169
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 412F860AED
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCj5JFGLhAsp for <buildroot@buildroot.org>;
 Sun, 24 May 2026 17:48:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6BDC960ABB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BDC960ABB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BDC960ABB
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:48:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 126812003B4;
 Sun, 24 May 2026 19:48:11 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 24 May 2026 19:48:11 +0200
MIME-Version: 1.0
Date: Sun, 24 May 2026 19:48:11 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260524170129.3211403-1-bernd@kuhls.net>
References: <20260524170129.3211403-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <1d6d983c28af4e8cf0a0f35f2b7b1bfe@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779644893;
 bh=QYK1PxF3FUeKAVhFBY+8IyXJNL1nkUnq9agSX+5U9N0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UJTkV5Wq37mYKY4lrrVk/MXUPWdYNrAFvReBclorASv00H2AtWNFlRE4xza36kEL0
 awp5u5EvK/fkeQc6Qnc7DAb5I+Bi9PMKWH7qy/BbEuK6emnruFBy8V2HSNksZXQI4I
 scovYIrZ7yEX+12V9/04LkYceMTKon68vexCusWxqOqY/nKZta70qTVaXkf1BerTF+
 sr6JNeGJwmkpRu/FD942Uc6suBGkLaWAiYUbm171pXFqPK+ZvELueaCp447gG8zQr5
 fXUNx00QiGqBP5Lodse827qe6wnSJZHMLQGXwEgLxPZBa4RFoLsmenXihAmaoroAw5
 bTPyhaEYSgE1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UJTkV5Wq
Subject: Re: [Buildroot] [PATCH 1/1] package/kexec: fix powerpc build
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

On 24/05/2026 19:01, Bernd Kuhls wrote:
> Added two upstream commits to fix build errors on powerpc.
> 
> The build error also occurs with kexec 2.0.30 on the 2025.02.x branch
> so a backport to LTS branches should be considered:
> https://autobuild.buildroot.net/results/2ec/2ec0d85c658f8264fcc4eef2deb6c67671e3e7ae/
> 
> Fixes:
> https://autobuild.buildroot.net/results/53b/53bafc454533aeafc21116a99d87391b3049e12a/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
