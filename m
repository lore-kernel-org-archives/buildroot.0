Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE70CD5BB8
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 19:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0290C80BE8;
	Thu,  5 Sep 2024 19:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNav-5ouW3Rz; Thu,  5 Sep 2024 19:17:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0490281329
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0490281329;
	Thu,  5 Sep 2024 19:17:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14E081BF423
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0275440391
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qUFyv4X9hhi for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 19:17:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5C30A40114
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C30A40114
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C30A40114
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 19:17:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 574141C0002;
 Thu,  5 Sep 2024 19:17:08 +0000 (UTC)
Date: Thu, 5 Sep 2024 21:17:07 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240905211707.612bbd6b@windsurf>
In-Reply-To: <20240904202836.2645949-1-bernd@kuhls.net>
References: <20240904202836.2645949-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725563828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LcQB5r9y10YYk9m8vFFjq5G4xMKNHfEWn0c5HAm5P2o=;
 b=Di7cwukAVFMs7x/Lthp9JG7hjz3sp5/HUw36vnOyOIRICBQ6ZfIHxj+wCTaXW/zrVp50YR
 EqYAGn4eAblioJST8j2Q0Ww2uZVLjQ1QozCBZ98yVJf5P4P6oHWfkHqmphp6epu3qlrtNP
 rAydButWhmXTYdPQodAU45OV50xVa33y8XRPuibvAiUsERDUc0gzV5BzTWvlgdZTe9ajQ6
 7JLAhul2rLrEFQ5emC5aw1yNrjGWwbq+9xYnx6hoGq0XyPXpFHOk1efV+B2VLM/TmXvD5t
 8wTStlMAK+HQ2xRlkH5tj/3cBJoLqaElUUit2CswDfZeX11opbYPSruUyioHYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Di7cwukA
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: security bump version
 to 1.0.7
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  4 Sep 2024 22:28:36 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes CVE-2024-20505 & CVE-2024-20506:
> https://blog.clamav.net/2024/09/clamav-141-132-107-and-010312-security.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/clamav/clamav.hash | 2 +-
>  package/clamav/clamav.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
