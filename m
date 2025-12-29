Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C47E8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 12:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14C256085A;
	Mon, 29 Dec 2025 12:16:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ONFS-lafVvwY; Mon, 29 Dec 2025 12:16:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E05B26083B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767010591;
	bh=vu6zPEFhj20ffeWfSa/y8GsuTukdFMBA7Zbw8OARbCQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BPSGswN3g7wNqq60DonwBrgV9TvkRTWbvAN6Kj7sI0lIXiTd9qOadIMoYleW+7afR
	 y0UN04Xt+nsZ9uDi8wNpvpnSo6ATXKD4rhX52o7elKxoDr0uE2w4e7QlNkuXYNEiP7
	 zDG7a+rns9ecLS+p2bz1ExCe0mbXLVXgUFc8Qh337wqNv4W5B4S2FY5at2I/xVbrFi
	 Ma6ZJoyKU72ccN31m7PotbinYWEAovNLi2DBYzkgrNOy6Dlwh8uP6Fyk24izLrPvG1
	 faYoUcBDbxW7q1qLHZYyk0PYpkpZ4nkZD+mRZHhi6+BuUaQsbGbzX+KG7I02p8QkCt
	 cdFUD0Gs9FqVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E05B26083B;
	Mon, 29 Dec 2025 12:16:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB92ED8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 12:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C853C6085A
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 12:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NvEktzv0iJ7Z for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 12:16:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 03FEE6068B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03FEE6068B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03FEE6068B
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 12:16:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 5BA38780383;
 Mon, 29 Dec 2025 13:16:24 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 29 Dec 2025 13:16:24 +0100
MIME-Version: 1.0
Date: Mon, 29 Dec 2025 13:16:24 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20251229105850.50502-1-dario.binacchi@amarulasolutions.com>
References: <20251229105850.50502-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <f8a84bfd16afa973497145137ff4d2fe@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767010586;
 bh=qllvGCFM2tUhj207NVljuTELmRvbY35qyQM91h7jwEw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Sp5CxNj7O0u7x5tnYp3y1+w0hLebjhmIFD8skDX5gio3/KHkdr5v7hFf2BJLXdAso
 yuUH+9UEgiLC2BA6n25o8D8YH7rhqTn1k5IBN/Rf2YRlLYV0Hv9zm8i2OqfiQ1eI83
 E0/5hPjc0+ycVulCY/wVDtmp3MmnMMOJ3+E96fKRcfkbJV/Og6o1zu8hyX2qNPXag/
 quVJ0dKsq+xQAg/CgNyUorRFA/P3jFyLMin0SGkafUq390YG2NJs8awopiWwxCN/+q
 KQLM+6MICTKWS42G/TOv7Mh/BrGjyu70IcXkh5SMIM+hTk5gkZ440XU8mJm30PBe1H
 m/aiDfp3TvZ1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Sp5CxNj7
Subject: Re: [Buildroot] [PATCH 1/1] package/pocketpy: bump to version 2.1.6
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

On 29/12/2025 11:58, Dario Binacchi wrote:
> Release notes:
> https://github.com/pocketpy/pocketpy/releases/tag/v2.1.6
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
