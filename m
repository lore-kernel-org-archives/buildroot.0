Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F74BF99C63
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 20:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AAD960F71;
	Fri, 17 Apr 2026 20:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rpwVINsZ6ZbB; Fri, 17 Apr 2026 20:56:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47E8A60E50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776459360;
	bh=ePcXtvqt4jaz39LfS9p4ZaPI4d9ytIWwQxASNn7Udh0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PNfxIVg3lkRJFNRZ2ODd6+DVTh+qbUHoTg8qq0iCvtFU6Ktu5eQsDCycLq65wss/z
	 LcqNrq1PMs1ec/2Uvd0bMSIjyejqq1AUvUu9ERTcQRhPY3y+cP4KA5xW8HuI29d8+p
	 CPBEfJBamX/2mHv+9zTynFTsN7jejR66S8078sarT7BKsP0RuCYAj3J/M1/n3U0UYw
	 VrQG15lwTLxmd2qy3yeEE5MNZZt77B+/w5gkIsIHiZsnFQ4TOWO8t1YKMlccyBRsM5
	 sXzqr+lmLVPG0Q69LHHSYHDSCn/1Z/yvYPau1QO2StiiJ/hogNXYqL8KwfrFqR4MQy
	 KQ9ObXKL4Vy1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47E8A60E50;
	Fri, 17 Apr 2026 20:56:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D26E3396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 20:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3ADB60E50
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 20:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d35SkbCLAo4w for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 20:55:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E19D860A3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E19D860A3E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E19D860A3E
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 20:55:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9C1AA5FFA3;
 Fri, 17 Apr 2026 22:55:52 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 17 Apr 2026 22:55:52 +0200
MIME-Version: 1.0
Date: Fri, 17 Apr 2026 22:55:52 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Thomas Devoogdt <thomas.devoogdt@barco.com>
In-Reply-To: <20260417142244.18803-1-thomas@devoogdt.com>
References: <20260417142244.18803-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <0777e8c0dce396881234d11c9556f324@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776459355;
 bh=oRlqGornVqRQhk46iIUVwcJogD/j1YyR/Qurw5vWPIg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gAoFN8xVjwAGB+0OMk59iR/ZlQGJH3sBNfvrc/+IXFBa11ALaI8ndm7g/TxBOZeH6
 ELmk+AND1ES+mGT5ZVQ9kiemO2OiB2wVLytA+TpWNzG44E3VumFPqvqm/EDBVX0qpl
 IPOIwDWtN+bpjGEdvhldnaWRbGdYYydDMaA+UX88/ZE30czloE2gcdVwdKDO+LSeWZ
 Le0h7eVrQ3pHTZywUZZxGrClEIUeG6ar3NoJifvvdecf5zTEitMr5GyXqH0DqrXJXC
 d1sjTUxhpnnXnsOl1MhlJPvKk8yva+/3EXaIA+6wuIPAVCjkp2a6TaRuKCkljD1vWv
 8EKY9T8I/YG+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gAoFN8xV
Subject: Re: [Buildroot] [PATCH v1 1/2] package/wayland-protocols: bump to
 1.48
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

On 17/04/2026 16:22, Thomas Devoogdt wrote:
> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> Announcement:
> 
> - 1.46: 
> https://lore.freedesktop.org/wayland-devel/AzTKh6JewwfUBFKaOS86DT4obISpv5b5bjFghXGwYrMPyk6Wxpz6H4_trRcEOyF9VpVV-0p1-UTNv7_esjO6ppw5SyIyGxWB8R5xI_SJYfA=@emersion.fr/T/#u
> - 1.47: 
> https://lore.freedesktop.org/wayland-devel/aUAqqkhyv6-OKvUo@gmail.com/
> - 1.48: 
> https://lore.freedesktop.org/wayland-devel/ac0NAPBFafhcgzE3@gmail.com/
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
