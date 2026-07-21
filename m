Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFC9C4451C
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 19:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DA5E809C1;
	Tue, 21 Jul 2026 19:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IRSRYzox2KvQ; Tue, 21 Jul 2026 19:50:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FF6D80C44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784663441;
	bh=+DMk9m97GXSEpUrYlQWdD4m/WtNxYJsbBFFAFPtl/Qw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LQK+46P3YvnucrRcKSiGduDNv1peqrbk4Y2cGICUp+zTe3hKcEZjd5AilqkGVHjYM
	 b3qz1ygrfCVQDdKJbvlFp/UQrx7vzaHxj+EVblXtH7Yu72drm/pyuOZ+lsSlr2pw9D
	 d7wvuSW4HNIYfYaNocAuytc3t0NQ0ZgMC0LHQ+RjWnShJaN9oi41ydwOG76pVg849d
	 4LNiBJwJZK3X1ldXHTWMeGnWHUTL5J/Xm5tZhWP/75glpbW6Tncu3qC83QRUOR5vTO
	 LCkQyKpNW+E7lbs6bmZYA6VXTOMp2C/Op4sNCDEgiFct+u/v+P6nBmeEvcMLiY4aD3
	 e5LqImQLd523Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FF6D80C44;
	Tue, 21 Jul 2026 19:50:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C543142A
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 19:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB0D160632
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 19:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GcysRzPyrEus for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 19:50:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A4ED2605D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4ED2605D3
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A4ED2605D3
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 19:50:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 82F35780372;
 Tue, 21 Jul 2026 21:50:34 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 21 Jul 2026 21:50:34 +0200
MIME-Version: 1.0
Date: Tue, 21 Jul 2026 21:50:34 +0200
To: yann.morin@orange.com
Cc: buildroot@buildroot.org, Aleksander Morgado <aleksander@aleksander.es>
In-Reply-To: <aedfb2053549dcdb73c7b124ffe9fd8f93f2af8d.1784609165.git.yann.morin@orange.com>
References: <cover.1784609165.git.yann.morin@orange.com>
 <aedfb2053549dcdb73c7b124ffe9fd8f93f2af8d.1784609165.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <6bcd6c80cad1b5bfda8d58339f231ab5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784663436;
 bh=JvogVp2B4leC2jiyBcARwqsprAoqhoF965jZh+gqsP0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=b2u5UgrBdGvj8YxDQGXyKV5Nt49zes8OkVPrOMhjdWZaDd9+wOftDnMywCs1xd4cj
 f4cNripP9JgKGqIRP8/GTAYXqXLUv6N/hhfUZ/iYRGTdjs0oxKX/caNM9idEEjrvPT
 MyCc6Nehvn3u6Q6DNXdcVc8HNMh0XbikGOMRCPoEd5wIWczcOrCOERKEVtMcgBcrum
 oFhEWacfeA2hiIN3lFYq2AWJDdJhkwDgmpGTGm3eMchi/s8D/WoNmhENzaMaTqtEBy
 XxJ5MXu/vinb2Wtx6Qn5m5LS3AMMZ1krbN7XjUS09z6lI5+gc/o7KIV76ZVsX/U/Sm
 BPyAXKbHuBQMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b2u5UgrB
Subject: Re: [Buildroot] [PATCH 1/2] package/libqmi: bump to version 1.38.0
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

On 21/07/2026 06:46, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Aleksander Morgado <aleksander@aleksander.es>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
