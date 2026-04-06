Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4399EEF4EC8
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 08:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23BB14099C;
	Mon,  6 Apr 2026 08:58:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6FPE9QtKURYH; Mon,  6 Apr 2026 08:58:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 716164095C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775465897;
	bh=PDZ1kXTEbpiPatOFkSgReytQ/CJfXpO1KSzSLmOFyM8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SMctRHnAc2/ErMZFr05ftIJBXCOYhjepeaTOTVLEOkwaIdnVhy+ztbzMArJgjgEU7
	 yKEGxQaziZUNVkpNPL74yZknaGJPPjhDA2snsx7wLcTt1fnrCJb5nuOZxa1M58rvR2
	 VZl5pLQxRbRj2rTxZVhphKOnLI7WVGc+eUFA7PdS/vuicoZ0yPlv0kY6QLSB2FlvV1
	 GOw/YQ53frDakyJDaFe5OjSBaPunlgqo1nQAYWHUsI95/cHFMRpajotoBTH3iTSU//
	 bqKtIt7rEnG4Ja9blsOHb+h6tsHFklnvWF8u84VA9lIhEz4OXZI88z2I6pqIG0qP/m
	 sNnH+lNh3f8mQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 716164095C;
	Mon,  6 Apr 2026 08:58:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 98FD22EF
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A7FE4025C
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMwXj6JXMRIg for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 08:58:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C96EA40084
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C96EA40084
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C96EA40084
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:58:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 9C9F1B0054C;
 Mon,  6 Apr 2026 10:58:10 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 06 Apr 2026 10:58:10 +0200
MIME-Version: 1.0
Date: Mon, 06 Apr 2026 10:58:10 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Maxim Kochetkov <fido_max@inbox.ru>, Zoltan
 Gyarmati <mr.zoltan.gyarmati@gmail.com>
In-Reply-To: <20260405121524.2590079-1-bernd@kuhls.net>
References: <20260405121524.2590079-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <24d2fc79b652d923cca384773a6f4c32@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775465894;
 bh=YdcA6tG93YDhx8Uua2Xra+FWyrDjH0+OLfybk4zqlww=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=E5Z/rRGdKJKfISnaNBVZiQZi6IenCjnGYzy+KFnaAxGq80CDzLl0cm/8s6vTo0hBH
 pVQ1IX61HjfG3bKmL1UyjHDcEtOhwRXzoE1m4hYP21zOR28n5Tmb+1OnUJVOj+yM0m
 +ebh9j1EZhmZz4vZUDmCUHtXp9zguwLkFMVQxjizB3iT3VOx8YsAUW4irEeNdGMyZM
 tGgIgWr00fo5yv+4LHnl49lXke3283hsE/kE/qhlac8sx6VoP/834rQSfvms2VFuMH
 JPQCaQDR13vnxupdkv7M2GCF1OfpTIUemFf+YwC8A7PXkjZsqVUWTOs7DCXOpsrV6j
 N8IqiMViGWq4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=E5Z/rRGd
Subject: Re: [Buildroot] [PATCH 1/2] package/proj: bump version to 9.8.0
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

On 05/04/2026 14:15, Bernd Kuhls wrote:
> https://proj.org/en/stable/news.html
> 
> Switched _SITE to https.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
