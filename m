Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02F5C04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 16:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90C87605BD;
	Wed,  8 May 2024 16:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ABTdgGzj3t5w; Wed,  8 May 2024 16:37:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9011960D54
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9011960D54;
	Wed,  8 May 2024 16:37:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50FD11BF2B0
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E33E40125
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 73Bl8LPflPl9 for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 16:37:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 24A2B40147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24A2B40147
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24A2B40147
 for <buildroot@buildroot.org>; Wed,  8 May 2024 16:37:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0306F240002;
 Wed,  8 May 2024 16:37:27 +0000 (UTC)
Date: Wed, 8 May 2024 18:37:27 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20240508183727.5b2ca48c@windsurf>
In-Reply-To: <20240507214234.94186-1-christian@aperture.us>
References: <20240507214234.94186-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715186248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O2uYpt/REh7ZKgiNQGKIFUdZr2d1yES/8/Ww/LQXBg0=;
 b=oP9E4fu6FY8EOxsDpBy0R6tvHJqe2luE92iRfLA7+lq2Pi/QMTMYV/Y80UHS+g/s6WWnR1
 SufIpsxXJPzbgxlQh2O4FXblp37ZVdRTJLm8W615beYYF7InBDrcl8yqkWmE3qVexn+8bb
 OINqypbVUPEQ8bCwR13H8OXR1VXi3Ce71x508cS7pmGhdJ4QS9917NBvKMyTLCYH0h1q4H
 fy26tBs6LVrsOIWDjniCTmJD5K5iqxSfisjjPF8V7+PF966Ke26EnA1adoSGFJ5MU1woYx
 19Ae72mrWo2SLtvt9ztyYdHlGVIl61PL3d7MlTFW+m46nZ6fJXl3HUSVjPa0Lg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oP9E4fu6
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: security bump version to
 go1.22.3
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

On Tue,  7 May 2024 14:42:34 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Fixes CVEs:
> 
> CVE-2024-24787: cmd/go: arbitrary code execution during build on darwin
> CVE-2024-24788: net: malformed DNS message can cause infinite loop
> 
> https://go.dev/doc/devel/release#go1.22.3
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/go/go.hash | 2 +-
>  package/go/go.mk   | 2 +-
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
