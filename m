Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1F6D24454
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F72A416EB;
	Thu, 10 Oct 2024 21:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1jCI9IPS6jg; Thu, 10 Oct 2024 21:38:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A67C416DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A67C416DF;
	Thu, 10 Oct 2024 21:38:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6C601BF98E
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD10C81F71
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gmGYfSqBQ7pj for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:37:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A6A3181F76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6A3181F76
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6A3181F76
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:37:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DC3C40007;
 Thu, 10 Oct 2024 21:37:11 +0000 (UTC)
Date: Thu, 10 Oct 2024 23:37:10 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20241010233710.21bc72d1@windsurf>
In-Reply-To: <20241010082301.1058555-1-buildroot@bubu1.eu>
References: <20241010082301.1058555-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728596232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gZuXpwGyuskUHjm3+lx693dJn1HAcxz9MUhWH9t7URg=;
 b=LMPM6TjISYZeJGs2IXy78icIXxH5Z6cDjZg/VcXr0n0acO3CifNFr+WvASY/lGUUyP75mT
 JYGs9NWknuvvwqhzLZUl6KCptZixXNYGrlMNQE3xSBrngznuLlsWNVavR14FStqGsF1B+t
 whgN27pjAU5y/m94RhUj4V4+aZzpjufP9AZXGG17+w0jlJ5k67c+Vl+CK3weCUg5qydL5y
 6ivAYGBqg2paQL1rQB029tMItWEFbtiUvv235Q+SAvbJhR9xhWyRzuHREGuKo30XENNiFM
 Xgh9GvPkgoNTumeKXdqDPgi1rXIaZoexMWbQkl05zWqIp+wPpoSjBT04QGy07Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LMPM6TjI
Subject: Re: [Buildroot] [PATCH] package/python-uvicorn: bump to 0.31.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 10 Oct 2024 10:23:01 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Changelog:
> 
> * https://github.com/encode/uvicorn/releases/tag/0.31.0
> * https://github.com/encode/uvicorn/releases/tag/0.31.1
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-uvicorn/python-uvicorn.hash | 4 ++--
>  package/python-uvicorn/python-uvicorn.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Since I applied James patch before seeing this one, could you rebase on
top of the latest master? Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
