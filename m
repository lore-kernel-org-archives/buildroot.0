Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A59C44536
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 19:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CB5881082;
	Wed, 22 Jul 2026 19:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1QBQ9-J9R_y; Wed, 22 Jul 2026 19:33:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0719480FA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784748835;
	bh=dguHRw5YUybCvDg5e5Eb+/S16/RH7Du9Z6SPhSFUHm0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rsdFMOaIBahXlU6uKBZBspG4vrY+DRU1tClO7Lgns8bQ7cYA2uJSosxGN6b2EHIQG
	 jfbg0QX8z6rJvjpoPvwwfHVVbRAEADPoBFAgziPzGw6d2u7boxjFNJXwQwOJIptme0
	 bsng9vU/bDoqiHUjZVieB8SkXuXX495r/GVdvGnmb2WwyPWDFt1I8gdH907ipoHFOI
	 GbU1fAiELD5USPwpMMiHVwBTWc51leyo5Y+BfF6MceVi+ZA5hpBQCTLZYOmjhEJ4Oy
	 3JkvuhvoveQbkh4Ff3n2wq5ChaPHfn1dXV6z8DZ7Ke5gs2hfDZxZWU/ZVuGGekCdf9
	 vrxfnnsX0Fypg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0719480FA8;
	Wed, 22 Jul 2026 19:33:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1293439E
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 19:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED23340A86
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 19:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4GamRIIi4Jdt for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 19:33:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 84D3940A7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84D3940A7E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84D3940A7E
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 19:33:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id CC5D05FFB1;
 Wed, 22 Jul 2026 21:33:45 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 22 Jul 2026 21:33:45 +0200
MIME-Version: 1.0
Date: Wed, 22 Jul 2026 21:33:45 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Michael Trimarchi
 <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20260722174028.3910046-1-dario.binacchi@amarulasolutions.com>
References: <20260722174028.3910046-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <c628a04f2565dc137ca02e0b6e76b6eb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784748829;
 bh=xNB1nytbGOqEuzzwkg4hsLFcqbGUqBkpksKDwGNcEao=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GE9EH9DAfri2CFY9FDIHjT+uCOHUbYHSY4EldzpT/TJa+IQEYgN25HI6/XaQYPz+Z
 n0QvSyggTBm4hrwxYjqaLhhWItQW7sXxgQxPt5+G4+eFxx7TeYk4Mn65ZukLJDNe20
 RPds8ipPTpspLIvJtOJdyAgE3JS6XpxTWYFvd7be3HZoRc/T2L7fTWAldYvMpHaQvm
 L1NCzp40JmitugCDWA/BguZxnZyC5yvOCtQA4uWukmLX8xOwqeQSH9Axhw+FMPC/co
 vl9okR9UX5i/l+7nAnSH9/iiW/iwhECZ0QrlFvOZx0HCSc8a6tC+LmVNOyihsUno1s
 72Zr+czE60ozw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GE9EH9DA
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx6ulz_bsh_smm_m2: bump Linux
 to 6.12.96 and U-Boot to 2026.07
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

On 22/07/2026 19:40, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.12.96 and U-Boot to
> version 2026.07.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

Could you consider switching the defconfig to use a Bootlin
external glibc stable toolchain, please? See:
https://gitlab.com/buildroot.org/buildroot/-/commit/dd3ef914867dca5e429bb25ee14445fb0c87baa5

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
