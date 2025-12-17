Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505A5D66B85
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 19:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13A8683BC3;
	Wed, 17 Dec 2025 19:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1r-pWqzv7Dmu; Wed, 17 Dec 2025 19:48:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 444FE83BBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766000884;
	bh=24KD9LyRiQdA13KGlO+No8V7V9OdoeN6wIhh0Fa4MyE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FEoxBLtOHanD72eX+Fp3jDwSZwDSvDa0FR1/VwnxQ76nYWadSQKMExdoANXRmRZmR
	 N6IpBm0F+0Ni1xnzuwzLw/3979vByv8vyi1S1RXoMnAH5zUbnOZGi09IpPY2lD6O+5
	 QYycSF+9yvBVZdj8Sup9jdmUNVsGpDwVTdQMvy9y6Gxy8OoVHp2R5PVXNvNuJjlz7y
	 nQh7sm8p8TlR8emFG8wmRyxTIJZw1/19J2QVMJA4tKaHZVhriSLDh9lz535eZsEJ9r
	 F2FXMajyBmjN5XfAhR43u7Ws5zDDPbYPuejzs0meYdeqDd3JES2+6iz2Ro7DtU/+ei
	 h6u9LtoSn4C5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 444FE83BBC;
	Wed, 17 Dec 2025 19:48:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BD38375
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9980340F2D
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VbiPP9s9tFmK for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 19:48:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CB4DB40F29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB4DB40F29
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB4DB40F29
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:48:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id AEEDFB0054E;
 Wed, 17 Dec 2025 20:47:57 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Dec 2025 20:47:57 +0100
MIME-Version: 1.0
Date: Wed, 17 Dec 2025 20:47:57 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Thomas Devoogdt <thomas.devoogdt@barco.com>
In-Reply-To: <20251217110219.64233-1-thomas@devoogdt.com>
References: <20251217110219.64233-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <0c1f43b8d3d9784a13a7d84797786061@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766000879;
 bh=RFWTtn3rIMPDGy5DbRE62iTGGFchn+WF2d+jyckvPlg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=c/tddbjXZRCWi9xK/Go0xIuQd+wBcoCygpyMGdpqUNqOb7Eb+E8at4rFQNMmTLpHW
 COCCgSbM0zKr9pagPPvboSjvBG0SrLE8auO3MwrPdlWO5J1Fd/nAsPyqd8VrIK83aN
 unyJOi4emBQzQxCTn0dZg5ClaVjvoERI1hZhQEy/vyGNMypBPmCxyp2RU/O4+8dxot
 ozpwbY79JIIP39JswpjMjYvl29KJHHce8Kf87YdDzZW/PovQVQwB3BePyeuHtK2BYD
 GJ4aOK7gcxEF2D3Q3Yj1sEBmijwBkfcG878DLmLZCI7DIw4NyTLPhBND1Wm70akvbM
 K3OG2jsBTU89A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=c/tddbjX
Subject: Re: [Buildroot] [PATCH] package/libfcgi: security bump to 2.4.7
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

On 17/12/2025 12:02, Thomas Devoogdt wrote:
> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> This is a security bump to fix CVE-2025-23016.
> 
> See https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.4.7.
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
