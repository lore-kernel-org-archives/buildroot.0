Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46308C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF4C360A4B;
	Mon,  8 Jul 2024 20:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GxwqAstzGda4; Mon,  8 Jul 2024 20:59:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1023960A45
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1023960A45;
	Mon,  8 Jul 2024 20:59:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B321E1BF20B
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC3B0405B5
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4QFqtOdJtfHw for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:59:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 11FF340544
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11FF340544
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11FF340544
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:59:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 617BDFF803;
 Mon,  8 Jul 2024 20:59:09 +0000 (UTC)
Date: Mon, 8 Jul 2024 22:59:08 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240708225908.44d5ba6c@windsurf>
In-Reply-To: <20240706065913.631436-1-bernd@kuhls.net>
References: <20240706065913.631436-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720472349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n3X/mvh+3ZLk5DOnluBsHnx3kt54P1enQt0GU4VQR8k=;
 b=jHBFnGWKxSh1F7vVhDtQHFGJZ9qXbzKk926vqJ0IYCz0WQPiT9/sQzLiono2mAtLwVmbim
 TZtCNI4czlpha5QZsP8N7pjj9XMEGEbOHDg5WeCse6+SXsMKm6z61DPR6IwLwi8yIvgaNA
 XaIpHmx/uFY/t6IPcFKNmRFHamRslx71T2r9P5IWzKBVg6Walp6YELQvRJg7LJSHIgLhhP
 eQ3z10vWcSwt3YpiOzDKyrJAyLTJDpNzFXuk9b/tTEOjSdljt1BgMftfkvEw1hSAZLUwWr
 A1iN5ZKB4+2n/M++FIiNcaTMA2J6P29eeoPAU6qp1JdEf5U9O/iVppxbz4D2xg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jHBFnGWK
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: security bump version
 to 2.4.61
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

On Sat,  6 Jul 2024 08:59:13 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes CVE-2024-39884.
> 
> Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.61
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/apache/apache.hash | 6 +++---
>  package/apache/apache.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
