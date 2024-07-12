Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5197AC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 21:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B5D44098D;
	Fri, 12 Jul 2024 21:10:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WZvdSy03G1HC; Fri, 12 Jul 2024 21:10:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D145D41D70
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D145D41D70;
	Fri, 12 Jul 2024 21:10:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8386C1BF3C4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 21:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71428400B9
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 21:10:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ku99tcfujDOY for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 21:10:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2AACF400A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AACF400A6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2AACF400A6
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 21:10:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E47620004;
 Fri, 12 Jul 2024 21:10:01 +0000 (UTC)
Date: Fri, 12 Jul 2024 23:10:00 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20240712231000.4da034a8@windsurf>
In-Reply-To: <20240703193329.6627-1-christian@aperture.us>
References: <20240703193329.6627-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720818601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UmhC0oxUM/KYVqr2unKxGDNbPDMvHAP5FxaKDUwEpyE=;
 b=IqkEAymFzqnhAVVAggiaO9cWzMHusHJKciKdEInVlMRpJKWI6H7N0ixwytER7335TlGV+4
 Mv8oBmd64lt+OcK0gV+Yk/yArhIDfcHyoAan+YbXYJjcybwvOKrG18gxEeiO8avwzmPL5V
 7zwaZJ5Dm533RQoQ5FeiRw9Sx5dLPC+GR0OIO4HaISeKQZYUsnbrafJOoeftTbCjo5T+Lt
 MiFFzDXj4FcotXLLJxvcxZpA27cNGk0qbPJr6ydLH6ZMxq8sbTkDBYKprT0z7eMd+r9nsh
 DqCminWTtjqTJSjy+iAYywF3hrfsZD42cn+IW+Uxwve64B1L39FGXFRyXjHKlA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IqkEAymF
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: security bump version to
 go1.22.5
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  3 Jul 2024 12:33:29 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Fixes CVE:
> 
> CVE-2024-24791: net/http: denial of service due to improper 100-continue handling
> 
> https://go.dev/doc/devel/release#go1.22.5
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/go/go-src/go-src.hash | 2 +-
>  package/go/go.mk              | 2 +-
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
