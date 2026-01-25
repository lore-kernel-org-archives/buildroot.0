Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B42BD7237B
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 21:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EAD140330;
	Sun, 25 Jan 2026 21:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aOVSIalNcJ1r; Sun, 25 Jan 2026 21:49:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F42A402E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769377777;
	bh=/HjhmieU7fBQrQldrSrK0w5zvaSlUveFzv9cVpN/nXw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XkxiQ4AfTedDJTNkndsw/HPeb4VMfTvlibsh37k7E07RIV+Ir+dDiPG/KiXJ+pf43
	 FSds5veWcpVhtJOFTq36ny5bPXKjzh7V4dxz/e7C4HHTUEGGfHUj7TwQnguS4/KP0+
	 Lre6oBeTpVvmGtwCkWRpHalWVwk218WPRsGh1ZWtTouluaEN646WTRwWLE/eHX+IyU
	 Qzh1k7ZQyTaKr7LxLj4PWMsJchg/HfZnkb8Wc6bmC1dvg3ZQurRUVxcqK/7ooFysC0
	 u2GusxmmEJSvp9SEJWa/3Pymd38WinfhQUfkRQO0I/xsZwnOzIgSJbFCNqbsD/ShOJ
	 rYCynV5kw52fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F42A402E1;
	Sun, 25 Jan 2026 21:49:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 166FD1CE
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F14D260883
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:49:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IpMKoW9F9KyQ for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 21:49:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3549D605AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3549D605AF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3549D605AF
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:49:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 4BE33B00539;
 Sun, 25 Jan 2026 22:49:30 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 25 Jan 2026 22:49:30 +0100
MIME-Version: 1.0
Date: Sun, 25 Jan 2026 22:49:30 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Michael Trimarchi
 <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20260124154145.1085049-1-dario.binacchi@amarulasolutions.com>
References: <20260124154145.1085049-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <8c29fc67e5fee00a3dee5e3b31522f9b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769377773;
 bh=OLqow0om60xxGRb21pLitboAYtbwTv+exl8H2TKT3As=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h8TEWmBEQuRbvAGQDlVzIrEz0xMaccdHtIhGgDK8bY8zqfWeGlJxIN1RbFL6aPXfd
 Xry4yb9+ORVDabNCSqN8DIZzw+C0sW7dg9ZT/YoghDoeBYVHk5KBmo3QIwSYpi0DvJ
 MVAw7J2sHKEQmfQM5gLXdiVm2qbv1RPoyA+rPpHCZWVhYo7iBMc/bHxPDdm3kdPWX1
 Fcw9B+djvVFTHc0YWjcmInVnd53zj3CXbYZY55FyWKsBUl7NQ7k1T04MH6RBOX+V/E
 02fzC+P28Buj/IOizbZm2YBMeADOh6981HSeD4PaObU5B/3l7xcLn0PVvoBMb8ttFQ
 nLUeQW4AAObbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=h8TEWmBE
Subject: Re: [Buildroot] [PATCH 1/1] board/bsh/imx8mn-bsh-smm-s2-pro: exit
 post-build.sh on error
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

On 24/01/2026 16:41, Dario Binacchi wrote:
> Add 'set -eu' to ensure that command failures or unset variables are
> properly reported to the 'make' process. This prevents silent failures
> during the image generation phase.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
