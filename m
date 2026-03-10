Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8616AFD88C3
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 22:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CAB0606EB;
	Tue, 10 Mar 2026 22:08:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IbJ2qw8LgGNy; Tue, 10 Mar 2026 22:08:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73C2660789
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773180522;
	bh=CljWF7hg+ZhNQCT5qVbN48JFMzNIORKeHxJFB1Lpsoo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=djqo4Ji/NWRQrDMKD+Ec+ufhNVela9tF/a9+7BQs8quvtADIgSmyU0Fmq5QYobzJ7
	 J1yTKF27t6JuJX7XUX0Y55FnCl4WXgEtT6HR6Z4BscIASZxMGlSG0AzNzD+M8dnHvp
	 LC/9NQ41eRiw8YJ1m6WkzKONLLDcqrsvgn/4DMFWMt1djwr3WzC+RggHrNOElJysmg
	 o9WLZuey3pOvZ4xESMu3uVMCksMDKGVe2+1/OPpWSdkNJvqHQTdAAOfHDww5q1ZJPZ
	 7IieE+a/PpslJPovx3l/WRnwRXiBsddIScm3uDdXlBaxz4M4ZNWD5F0sEik12EEwcx
	 L/TBRxNgzknnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73C2660789;
	Tue, 10 Mar 2026 22:08:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 096AF33A
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06D23811AF
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:08:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5CkfIXjpNtq9 for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 22:08:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 42A18811AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42A18811AD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42A18811AD
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:08:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 4EE255FFAA;
 Tue, 10 Mar 2026 23:08:35 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 10 Mar 2026 23:08:35 +0100
MIME-Version: 1.0
Date: Tue, 10 Mar 2026 23:08:35 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, Manuel Diener <manuel.diener@oss.othermo.de>
In-Reply-To: <20260310101037.470940-1-buildroot@bubu1.eu>
References: <20260310101037.470940-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.13
Message-ID: <a808fba4e54c0f7345859079ba1c2196@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773180517;
 bh=/41hSG+Rv2K9ARNYrurI1OmaMYeaazh2IURCnOWLyUc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oLuHRAb3UEUY+mHZx2OC63Naa4rM02qt9NXCQr39HQXRVLjz/X42dVTKLsIAQu9fW
 rOKXGJHSnFgQJlYkB7jGkdKoZmaCjz56RygBNnhVlYKsLeVzHqL6GdijeFl5Zy3svv
 0jxheCcBpzMUFL4TU6Q+iNydBsQzD4rTnizmLm+4L0utLd+rh5EXQiRqg51F78O2kP
 aAyZDeL+0ZUy57IKkRWlzl3Km0S1hsGFPrM5vGK6bgyHmz0hmcx6DFM57s5FNktL2l
 lhdFXA8E9wAxCgo4L2ynjyRV1BgB4w7CWNNJN4bIPtjwDHHCoR3xkcYqO8p/jKOmLd
 PsZi6MvkaK/+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=oLuHRAb3
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: remove Marcus Hoffmann from no
 longer used packages
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

On 10/03/2026 11:10, Marcus Hoffmann via buildroot wrote:
> Remove myself from packages that I'm no longer personally interested 
> in.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
