Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1724CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 20:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A867980F6F;
	Sun, 18 Oct 2026 20:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q4HFG1OLW8J6; Sun, 18 Oct 2026 20:42:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 72A0880E81
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792356152;
	b=ehTUKDe6Cy4BM/yGFXIZCNnCMLkmizPSjJhi1VV6/yC2Du2iVrKHOTLVLbMeTGTBF1vm
	 r83naCaAkSLQbc8IC9JjKVfONVF8mz0QOy/pIGt7HkdDGWLzIlpwI6YS+jVK8lERKwciB
	 vEtd7rd4Fe3NcjiNe+dA9rSp6Biz3p15cZHM8ccBv9NWqIe3wY3+3NCJgJsl2hhreYNO4
	 Dae9NRDNuBgw4wAaTdog7njdTqEYsyltEjyswP2ZcjuoFkQ7Wl8+6OHLGsxicrjHoLJzH
	 8wWBV/AsDBWEbwcjh2N9fcG2KIUOnCq14hGOkd7DV9ZunZ/hsyFOtnmVvoikiVubAHQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792356152;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=04xicFGb7gUh38T139jOUjnbZDBZO5eQFfCs8jVBonc=;
	b=ShMyBl86cPV5TVlxH/Z9VWHHH4Aimcmf8KudgWMmB0B85BqaY4OwQuJDzzjaJDVDdYo1
	 MiC4cmg1cUZny9MxVkkyfbAwMr67SEB60oiEXqOhG5BdH4vndhw0PFqP+gxqIBs8Qr9y5
	 HU3Fonx+zAEvMpvBjNW6ZGMhZW++Pzvy8BSdGiQAp1MSkNT8V9RpWk6f5lVCYERMMW6sd
	 CC7qKpG3SpzPCUwMupYzFvDmhgxDdfvVMClk2wJJMjBnKckpzrpR63wV58iPk2Tfx4fHh
	 1gaj1BVNG3e9aF2qhFvgSRX1SMg4OJr0wi2yd8NLo+ebgQFbdYsJWPebUH/pufD76Ug==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792356152;
	bh=04xicFGb7gUh38T139jOUjnbZDBZO5eQFfCs8jVBonc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FlrTBUgd4eopsIuNzV8rMSUvp1ie+WrtlUlzTIHsDZUlO9K853CyEiGmK9GjX8z9F
	 PZ9/DC1fKsZghEM6pODAZYAvlrinPbZ5XOsEI2+rE4nkwgBbwGnXKiw0YOb4YN7dkF
	 ZiM/0Y+QxeTysnJffdlR141DLPSs5t0D8gfxASQyLZ32yMj9UCn/z1q1GiBe2U6wE9
	 N987XPG6Eiy6OdkQzb9ylUMH2Jq3ElMnSbnYgYgNoWJ/kmWUPjzmyAugAEJ2eptcvV
	 BfrRHDYPSqKdAKmW5kNasu0iNG5ZtuWgMw2PGJRr+4XivIBmdUKqHdpb/yNd2XvwM3
	 sV4jOisynmAmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72A0880E81;
	Sun, 18 Oct 2026 20:42:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 89DDC279
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 705DB406CC
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e96sGgoKSQxo for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 20:42:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 82C2D406CB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792356149;
 b=a+UCrWb032Z7eloCfTZ6B8nPM6J7LUDALlKmQ2L7C7BxbWFCx/OrvcRX73hGkQkx9Sis
 f/WYcdHtx2HUFnmLmyXLJ3mRES6GJfCnLQ+XFtGTS72KaLe63GV2fpIunylG//W6sqvuZ
 eOSFdFw3qh3pmfeGSEhWmqu2Cxd5vl8Qe8/Lh0i7eKgZ0Nsmb+TR5vNiZeQSmYNNmexbG
 osp22jMJ90vcMJTtz6eT6e//vISwLqiq1f13UyDBpwM2rMW5Cj+u7t4pbnA9qtXYlKJ22
 PVrlSJKnXYlXDsjkhg4bI5wsupTQz/NY4isfwmbqSguqYIuNaDhHx8f0fbFyQaIQm4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792356149;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=bEBn95BrmCt0vLSOfQe+hfq8o4vs0wyt3Cdih52+n1s=;
 b=Sg+PeA4kxXWoLeCWRkT0hDFyVGnE6f9/EL6ojjV+tNzIILeDmE+uZHxQkaoaUHpNkN5L
 4gD3/3sfZ4EgpVXlGZ8ytnaEVvuvK814a2aRstLyQr6uUP+NMBRwx0uX5ZS9E7tjOun0Y
 MZSn8wWHp+SDYxPMu9d9yNpp+hGzVYLse+t0+XKYbYu5oX0TiQDtv4FghST4ORXhl2wDA
 TfFnh8Hq2Lc20dn8hMrCyNxRxsv3l9lcZGSxpalIWJ9wRPJ0Go24Ovj7nMEbV5wdXpuDh
 0ogd5XHzdKhJah/HcnP4XBuQzbvvBD5WeWyOkV97nbWu0gM/7t5oZkhpNvki9DubmpA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=VgGKCPYA; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82C2D406CB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:42:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 538C44E41218;
 Sun, 18 Oct 2026 20:42:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1FAF660582;
 Sun, 18 Oct 2026 20:42:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 940C71032868C; 
 Sun, 18 Oct 2026 22:42:23 +0200 (CEST)
Date: Sun, 18 Oct 2026 22:42:23 +0200
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>, 
 Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>, 
 =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Jimmy Wesolowski <Jimmy.Wesolowski@mobileye.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Message-ID: <atUvKBNRsqHYsh7r@windsurf>
References: <20260828-xdp-tools-tleb-v1-0-463c25b5a99b@bootlin.com>
 <20260828-xdp-tools-tleb-v1-1-463c25b5a99b@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260828-xdp-tools-tleb-v1-1-463c25b5a99b@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/4] package/bpftool: disable feature
 auto-detection for host build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Aug 28, 2026 at 06:46:47PM +0200, Th=E9o Lebrun via buildroot wrote:
> On my system:
> =

>     $ readelf -d host/sbin/bpftool | awk '/NEEDED/ {$1=3D""; print}'
>     (NEEDED) Shared library: [libelf.so.1]     # ACK
>     (NEEDED) Shared library: [libz.so.1]       # ACK
>     (NEEDED) Shared library: [libcap.so.2]     # NACK
>     (NEEDED) Shared library: [libLLVM.so.22.1] # NACK
>     (NEEDED) Shared library: [libc.so.6]       # ACK
> =

> After:
> =

>     $ readelf -d host/sbin/bpftool | awk '/NEEDED/ {$1=3D""; print}'
>     (NEEDED) Shared library: [libelf.so.1]
>     (NEEDED) Shared library: [libz.so.1]
>     (NEEDED) Shared library: [libc.so.6]
> =

> Host bpftool auto-detects optional features by probing the system.
> In my case it finds:
>  - libcap which resolves to my system shared object because
>    BR2_PACKAGE_LIBCAP=3Dn.
>  - libLLVM which resolves to the BR2-built one thanks to llvm-config in
>    $PATH. But we don't have that marked as an explicit dependency.
> =

> Avoid the mechanism by hardcoding FEATURE_TESTS to the empty string.
> Goal is to make the host-bpftool more hermetic to the host system. If
> we ever need those features (future xdp-tools package doesn't), then
> we'll add the dependency explicitly.
> =

> Signed-off-by: Th=E9o Lebrun <theo.lebrun@bootlin.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
