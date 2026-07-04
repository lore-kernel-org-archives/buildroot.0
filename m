Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4C3C43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 16:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A069408E6;
	Sat,  4 Jul 2026 16:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9CSWZURCuOwK; Sat,  4 Jul 2026 16:02:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EA62408D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783180929;
	bh=LHOEY29tWV5L5ceGF4KicPRgwHqEFQXtuFNqPHJiH+A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PIqouhF75jsRB5zWxrkWbx6oYyNunHgAHZIK3wtKxNxzXURKTwELgLQBwmD7PSlIa
	 BF+d3nYcU1Wh1OcWg+l3ZR22ucZng8xpTOiEgUOvMioSbHpnJv9y9MLI8Jnx8Pm6xE
	 zXjbuc8VMebcosyKYaRsa06r4OmqORTRgfG+nwC9yfmDePqi1UR0ZfG25OfvqkhBze
	 VIiwuGJkKZhrYXBP0ABN3JWM8XhsXDjnm13a1vu0IikJFUjVDv+bZV4+J/haRPpHOy
	 xr3iDBBClgaTRApgbPzmZ60YHYK6cHaL+/xQU0lnsHNAT8giGj0uwW/DapuOkTDjyH
	 b3WZiLTJG1RIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EA62408D0;
	Sat,  4 Jul 2026 16:02:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06553316
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 16:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 042AF408D0
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 16:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0tvlVJR_MZIt for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 16:02:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2FF60408CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FF60408CC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FF60408CC
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 16:02:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id F3D8CB00548;
 Sat,  4 Jul 2026 18:02:00 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 04 Jul 2026 18:02:00 +0200
MIME-Version: 1.0
Date: Sat, 04 Jul 2026 18:02:00 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260703191731.3691858-1-bernd@kuhls.net>
References: <20260703191731.3691858-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <96e106a9a43492bb219e283433ebe3aa@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783180924;
 bh=Eg3EYFJ4zaeKkfAoDpIZfykhvfWDV6x6SlFebW384uE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=a4ZJvgv3iI1gf4Xa9EeS/t5YbLbEpw1Fga95sPfZctjMJtdcqvzh2ifGhoxZLAU8r
 p06RrSu78OUFSBsMn6kcEGF3caOcaVOJrifw8C0s8Eb+ZLp+JJJ3N/Wz5jS1czkgjp
 YNhMGT9CzsqZS48i6qaO6jvWedV+pmC3mjrczTW9nPY3dz6vxrVkoSm2INczFmBdJG
 eR+3zytMoMHcEQTGOX70Nud1RTX2U98SMG6dCxKVGEdTd6RxmxFffFQPnnEQFkyR5R
 DkJ8ZL4ANdyn0sL8TnACiDLuna6s1bQjxmhZI4dWdbZuKJRUcqoRBkf6coXRw31pOa
 bDX+rM1eC1oxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=a4ZJvgv3
Subject: Re: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: security bump to version
 2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674
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

On 03/07/2026 21:17, Bernd Kuhls wrote:
> Removed patch which is included in this bump.
> 
> Fixes CVE-2026-5435, CVE-2026-6238 & CVE-2026-6791.
[...]
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
