Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5719C531F7
	for <buildroot@archiver.kernel.org>; Thu, 23 Jul 2026 17:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE23781000;
	Thu, 23 Jul 2026 17:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7-Om1HwcGMYd; Thu, 23 Jul 2026 17:00:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EDC080FD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784826039;
	bh=SGW6S1QRhFeCY9nOgjq17WG/XTzKCMPDb1/xpgVCC/0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c0ufedWiHViM8TeBSEy0uMPi84m87CUFOyp+b3mfKHkQK/QbKIS0XusWb1BVk2frF
	 tAml5STLtAyQTk4b6fBDBCDioT85XpXyFJ3+NjPVQEfOYn6nXdW1CT4GKoarfsF5SP
	 g5LcJbq+ZjCrcxCI0jNOqhFxfm9IE3HSo2GfDmuzE9YGzjIDtseUyX8h0AXh13d3F9
	 EN/8uO32KQmwHYU8Hbfbad7zA7DC2BkL8jWMCDxFWe3Hzi27HVbUIUAiWlvNiCKNL1
	 lhG5s4IHrOLTCiP0WbhAe4eh9mzeMz8NGClULsqBgeCUcwxMUEIh7/HDN4ed0rsaG/
	 eNfL2ClQ4Hg7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EDC080FD8;
	Thu, 23 Jul 2026 17:00:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E311429
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 17:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F0CA40443
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 17:00:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OeQY7_wjY9k9 for <buildroot@buildroot.org>;
 Thu, 23 Jul 2026 17:00:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2C0E440442
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C0E440442
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C0E440442
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 17:00:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 2E4FDB0055E;
 Thu, 23 Jul 2026 19:00:32 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Jul 2026 19:00:32 +0200
MIME-Version: 1.0
Date: Thu, 23 Jul 2026 19:00:32 +0200
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <20260723111451.705361-1-fido_max@inbox.ru>
References: <20260723111451.705361-1-fido_max@inbox.ru>
User-Agent: Webmail Free/1.6.17
Message-ID: <dd5d6eeb9950203f8a29d1be13f6f64f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784826034;
 bh=bgNa1npgUuBziP0o4+VgpIrvo3/uM7z5N6Vad4/FLv4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NvFIggDHk8NiFtqlCQ36h2++Z/gJbR63KNtyrp5/NRpHmVhxhZ/hXUKQumDyLG0OU
 tSS1IYFarQ35gnAgbBjpwfmEXJYTUlB4SBRRyUx7Kfh0aOyrTDZvYfq4vDGJDQQLJ+
 brv9tOYuEyiCs6IbjYpdeAokGGd8Cl8jdE87SE5m6DgfcKLjLhSmd16GB0ctn7NGWC
 UHeSZ/dUIE2txziR0cjAwGBRtcwKsXMFlp2NwjULEgDBhToxvdbgUFsoxmhJX97Hhg
 xf7qgFrSL5RPlQ6qr0j7tS/JuA1e92D5RdJZpzJC4n5+1VwIYnm3HCDjXEgoXryTXu
 F4niobE6PV93A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NvFIggDH
Subject: Re: [Buildroot] [PATCH 1/1] package/postgis: bump version to 3.6.4
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

On 23/07/2026 13:14, Maxim Kochetkov via buildroot wrote:
> Changelog:
> https://github.com/postgis/postgis/blob/3.6.4/NEWS
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
