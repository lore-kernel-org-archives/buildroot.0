Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC40EF4EA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 08:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5A2780FAE;
	Mon,  6 Apr 2026 08:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qY_dTod2LRl4; Mon,  6 Apr 2026 08:38:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 873DD808C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775464728;
	bh=URa+EjR4gPVEo6ZjBE+AcIwRZzP5/ILZta6/Y/iQGDs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DgBZfUYJqGrZk4JhW/RSVM2iKMo6CtDJYjJoHeIDvoV8zw7GUi2ebrx1WlbHbKlXe
	 7WYYhj2vP0xiAolsMTHJywzgMXHnp7iJyE9uNPASz+5lp0Lj2l/aVlBQu2oaxZ6I2M
	 89b+ftcSgk8gCxhxKu5L8scNIgmxL3p2Lv9J2nRa5D1pAj94J9JNRadWC3Qn7aoptr
	 PvxXx17sq6FOt6OT+KlGAxv4QgaZ2DeuFggBArAC+mBedvMBQD68j6ebjENs2c2YST
	 LIBqYdZe1q5crHeGA12XXcxS56yrnJPlqHEHwDBp/ELQRGyflOo4NWf69HCgkXCWN+
	 RM1sijzggAMPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 873DD808C5;
	Mon,  6 Apr 2026 08:38:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EF72A219
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5C184094B
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vtggHs7WUxie for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 08:38:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2AA104094A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AA104094A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2AA104094A
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:38:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 04A86B00592;
 Mon,  6 Apr 2026 10:38:42 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 06 Apr 2026 10:38:42 +0200
MIME-Version: 1.0
Date: Mon, 06 Apr 2026 10:38:42 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260405115738.2469253-1-bernd@kuhls.net>
References: <20260405115738.2469253-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <e53e26d3ee8de86094fca14c64bf7252@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775464724;
 bh=R4ob6iVbtVJZ6865S63Y6XzQq5o1Jrew1XRUd3zxUXk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Wzsi9Cjdbgm7finP6r+9oLlIKuE91KiRY2IvUk/nnmE5cozWwoBX9j8NiyoAoe6+u
 HmJIFAj+tYvBC5AaqyJY8oy9sRjw1dRsluETg9SnKxr7IRWlqocftZIT91xIYE+gIJ
 mWSwl3ALMrc3Fa8WLl/KmlAFL4ExtvLWL3PSHMmpcozb7cl+JpZOlV0kVS9yVZ6kbG
 T4d7EJT3zxzdUJViX/B15KaWgfJdgmfQLnBpFD2eJUwCBu5/E209ZE0eik3GPHsnaw
 N0QBM6rEt94bn96rrCKZEYzwsMhyN+7VwsrFcgGPJeO9EIWurnGvXmCmKAehMFoetx
 Iw6rzIhjuSEog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Wzsi9Cjd
Subject: Re: [Buildroot] [PATCH 1/1] package/luvi: update help text
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

On 05/04/2026 13:57, Bernd Kuhls wrote:
> Buildroot commit 00317f0aff243986983650671fd220ab040af50f switched the
> package from pcre to pcre2 but forgot update the Kconfig help text.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
