Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66175D715DB
	for <buildroot@archiver.kernel.org>; Sat, 24 Jan 2026 11:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1720740A88;
	Sat, 24 Jan 2026 11:23:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VRAjd6Y4b5bE; Sat, 24 Jan 2026 11:23:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FD4A40A35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769253824;
	bh=APloHG5ItJ8bDkgqWvY15UfpgrQamSsPnHiKVpEIP+4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Vh67Ics71owmrPWBXLzVlhLtj20f5RsluHmWoyciHwMknnnWeiPWTjE0JH4P3Vk9m
	 tuQjWiaICFzcbOyagZFn+KJLnEVajU5rgHvxcxqqL0NFhKzrkueFgAcNPj3sS6EKrN
	 WmZxj1ft1CzvpwILwfE1Wu6qTmVfPNUELgBDefZc0YWU1MAqAUsBGv4K2qH1hdpxgl
	 CwqaGckyFyQHzg0oGlnWSotq00mc40gPENf5lDIsLfT4c8uQUApfGmmHIcy5yD+Y1n
	 f4MjlAxiTgXAvN7iyKddx+2B0YY+Hcq2fcvqm3WEqzm8pxyxhb0w6ZgGiXq709/wHb
	 TcoUuIHZyVkEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FD4A40A35;
	Sat, 24 Jan 2026 11:23:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BCFDC358
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 11:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC85C401D6
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 11:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8TfOcxj4GY7C for <buildroot@buildroot.org>;
 Sat, 24 Jan 2026 11:23:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7415740025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7415740025
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7415740025
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 11:23:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 48AD019F5B2;
 Sat, 24 Jan 2026 12:23:37 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 24 Jan 2026 12:23:37 +0100
MIME-Version: 1.0
Date: Sat, 24 Jan 2026 12:23:37 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260123221719.13020-1-bernd@kuhls.net>
References: <20260123221719.13020-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <c904009b8f8c27af334bd44057cd1e02@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769253819;
 bh=DhjCxHgwbzurOi4/fw8OFSV2WxaNhTP524PpI+PMa5k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PgPN1FDzWJpoN/+BAaUhe1RsNavVWdowp9OgjtBdlxkd/5JCXAG0VEitNC0S5IW1L
 LkKCbuuR2XW10PO+8IJNRRkkA1xvbwzGskeEYk4IQICwykby15mIwZEgOwYYH4jNxw
 7r4IqIO4RPM8lbdqt532E6aut7YW8wolTUt+UsxhX4kZkGsbC3CootY9U+OcrYRbQ8
 Xd2SpSw1nlI76Bbg2m5SojbM62oJQGpvPkbhLsFlYH6wvLjWREeF6cVyfuqC0o6RQR
 Y6hk5LpyJsl2dk40m/qDfq0Pk12H/0Imeoc2mWqgTE1wB0/nABSP5Sr0/XyNdJhMLp
 WdMMko1U6rXcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PgPN1FDz
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.3.4
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

On 23/01/2026 23:17, Bernd Kuhls wrote:
> https://lists.freedesktop.org/archives/mesa-announce/2026-January/000834.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
