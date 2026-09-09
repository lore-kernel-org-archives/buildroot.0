Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FBAC79FB7
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 21:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C93E60824;
	Wed,  9 Sep 2026 21:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QooybuVePruX; Wed,  9 Sep 2026 21:35:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1E924607F0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788989754;
	b=sby0c4V9s1aGgCeOT8b5XGzBbFZsoVDJU+tgFj1LrtD2j7u+nMmm6Kf9wQAi0diSoSjH
	 o8ppYhRNAEdz8awt/G13O0HNbmoIQczds2c4WaJ9xcGP6oA3AY+Z5cPDJ4+4+6ovEaCVp
	 Bmc+Vmq9bTKmVmfQ9FNqyHH1+uCjQm0+Bn9gUhVIKYcjfdLp7yTt+/IdS8EXIBGPYo7xP
	 amihbuXHxFIpbuaF2i6YmmjBAPPSHCbSBTjRLJXHt9FcyFNscRchTW4nXlO0YcNf5GFqH
	 X7KkUOl/ZlxpGaazj3wWPo3xbNOnVugbji54iF/YlHGYsJh9mi2G5vCc6srPeDDNKLw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788989754;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SpywlqTy5M3Ss/Op9q/H5wC3DjYiHQVYr6uZsyRUc40=;
	b=qD6P+R+D+0f4khCd6IgZohmp+5DF9t7rsHLn6a3UyXCcl2WG5orpdnMxJiV0AjgsonkZ
	 DpR9ny9Hq+33oZhifpvKoYr6zFb6eDmhy1lkbjEd3o2JBzLN0Vt462BTtJrQ5uhDIvNHA
	 vpyWi2spcuoB85YHvcAcOVVy4rjBnCJ0sI4LpKZlwNLQwT3deo10EvVKxC7STJv4BXLmh
	 7b6cj546tYFw4NlBg7sawgidubzjOT8Px04wOWWBAdfYwXvFV+z3yMx9B+MJyaiIt0caA
	 +E2P2EhJgbx8XqpK2IMGrPqnTUhWw7cuwLct6xNQo5zBpRkuOvMndsRtgEkQaAhDQWw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788989754;
	bh=SpywlqTy5M3Ss/Op9q/H5wC3DjYiHQVYr6uZsyRUc40=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K3Zy+u/xTUWSvc7mxnMR0mWasos2xU922bm+sAtUS+xuBgonjrnXDsRgPMZEdws8/
	 ZB75XX/w4slUgPgfYX5yPmB6MiVoBgHKzUg83rdKHWoQMUJlYOFqYJx/Kx8Vdvy4UX
	 WHUcx7sFyRLEB5Yj+XSB5oKeb4JIKBwh7p1gUgwtC9TvKL6NGxNgLj+YiocNWxJbyv
	 6Ins/5pIhpouazW92eVCwLcUbS6YJxlPX/jqtadIRfFY9nyUVshx/NMdvDxsYyQ2Sw
	 aT5ioDxtuIKrHpMYVD/2ISso6HFJ6fKAok7XbdRlB2vXIh88jyAhtFTuKWjM5wnAbC
	 OOqmfD2v55NXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E924607F0;
	Wed,  9 Sep 2026 21:35:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D1C8E724
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 21:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7B524026C
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 21:35:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-gFcYJEcOD8 for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 21:35:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 218FC400CB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788989751;
 b=PYMvm7Nj94OnzkHm6bu5xdHgNfcS2UkZv0aTbpIfKWH3/G008HlYjs/egOcH/sAi0E7O
 dsM1WkAE7LXJNGvqqLV6aHqh7GoanGPWzrDoHTN6mM26ntBVVGzk2Chkuz7pZLmLwjk6l
 5Wz0i+IZiv4o9zF/PSIYl31qmFECuW6X9EL0msDYP0IByRdC0ofdP6Jqm/oS7ItAzvxAx
 ivs8csk2tnibOQIBaQTCaxb3fo//EZ/1rPEmHfMkyJd5N1XlKRbGSLX5koyaYttdUsv5C
 7JcCGrV5EdwPtTtwqZCwtPyVS5BJR6Sh1PppQ4671Cdbq8JjqcDVydHz8eBKByrHnRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788989751;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=+SDfTrRtozTIaBDp+cX6eHVmRmgJHYpKr2AWdhvp6ss=;
 b=BF7mNMxvW5X595LoirjhPhZmruguRsytf6a4XGnBjmJ2RkjUx/s5dQJ4E0ZiaRWRaWST
 xYRnuIEQKvucNKRImU9vVpvHUp5TCEMfO3vykQFSswsoEI/VyoicgQhKzEd53Gy2HgheS
 t+YpJfXzfY+APDHJALqkDQnqe9I+g+pQaS0cpaxp3nI7T4vFcxwU7b1rjtf1ahKI4O3qN
 HhVk5KljTt555Kh9C+VloL6Yqv2t22zFSAXikSJ50+aVesKYBVZU4TViVbcAO4HP1vQiZ
 oHS3xCeTI3F1hR8eNRWq2MHTT9quODpQPjsl7X2AvXkEJyTW1E+Q5HQQeTOkR1pxqcg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ctTPDPl9; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 218FC400CB
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 21:35:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7C9755FFB7;
 Wed,  9 Sep 2026 23:35:47 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 09 Sep 2026 23:35:47 +0200
MIME-Version: 1.0
Date: Wed, 09 Sep 2026 23:35:47 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260909052843.18384-1-bernd@kuhls.net>
References: <20260909052843.18384-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <a3044fdf5013abd4c718944906fea399@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.12
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

On 09/09/2026 07:28, Bernd Kuhls wrote:
> https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.12/ReleaseNotes
> https://forum.torproject.org/t/security-release-0-4-9-12/22096
> 
> Fixes TROVE-2026-032, TROVE-2026-033, TROVE-2026-034, TROVE-2026-035,
> TROVE-2026-036, TROVE-2026-042 & TROVE-2026-043.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
