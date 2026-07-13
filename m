Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88B1C43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 10:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95D7781036;
	Mon, 13 Jul 2026 10:33:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id za8-n1OQoxKq; Mon, 13 Jul 2026 10:33:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D00C81022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783938823;
	bh=r8BxX8KElT9qteu5fnSp2XnZuAzynHl9V9+mGBwuSBw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Z/mQvvNaSHZHSauOdRyzEN93ydgaJDhROOnKTT6GgY7y8xIGjk8Fp/FGreFOrVTs4
	 D8HeOi7xbUKSRHjhsoWwxd2zZMYM/t0fXaV6Ojej1nQacTAHoJVM4K9jm3P1G4/CWP
	 a6IvB0p22zQ49oFCGcf/9TR3agTV6gK/QdzbehPYv8V4iBiWTo2CVLbqiHRJDqgAuY
	 Oq1p3NN7RGYz3k7dNiKf37+pM6xXm7TRhl+h52rxEFdc5iKtCfzlHxyXFrNbPIpde2
	 wW3KKgwt8c1nkkZBlsxwKrC9KtoaEPhlrMGCaf0E35qYxQyINCCrNUT/dELFfubyPw
	 dPbXwsGitTy8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D00C81022;
	Mon, 13 Jul 2026 10:33:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D42E22EE
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 10:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1A8B4008D
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 10:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U2xwXucCDMUv for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 10:33:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0EFAD401B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EFAD401B9
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EFAD401B9
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 10:33:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E69EE2003DC;
 Mon, 13 Jul 2026 12:33:36 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 13 Jul 2026 12:33:36 +0200
MIME-Version: 1.0
Date: Mon, 13 Jul 2026 12:33:36 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <20260712113058.1579954-1-bernd@kuhls.net>
References: <20260712113058.1579954-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <84f3b85c0749a5d1dd4e9ecf71f1fbb4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783938819;
 bh=t4D2sYmTFm7VCogt25HFwssckIdPFMeWJnTzqApI/K0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KT4WWz+KKEZhluI/VVJjQ4XARraqtotYZBpD4gpDjLF2GxniHUDNQqoWzkfJ5MTE+
 n7BV40jpLHOX+BWQpKuWOKaP3fC/t0NXcECGPo8vUkChcGFGPFBGLOK5fA37x+HQGN
 7HdlXRozGgGQUOO45rri4jXD3VKIc4JUDeCwM8AtsIrnjZHBzvw1GgtUEeY3FqpxcT
 /2FG6mv6ZOhZeAE+Ub57gMxjAuUQKh8uRLHY8nKyf8SDJxsG4fT1UpvlPxAtZr6d7v
 M2wOLelNnjS1+i443SxWRtxxEaXKWk4ZrqS95efwGhdpk9zZcxCSYeI780OB0+7F2L
 CQgJgW1lAU7Ow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KT4WWz+K
Subject: Re: [Buildroot] [PATCH 1/4] package/x11r7/xwayland: fix uClibc build
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

On 12/07/2026 13:30, Bernd Kuhls wrote:
> Copy patch from xserver_xorg-server to fix build errors with uClibc.
> 
> Fixes:
> https://autobuild.buildroot.net/results/c03/c03d57ad7ed3feac008091a38ea50bfccfa62b08/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
