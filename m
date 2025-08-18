Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA06FCA0EE4
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 21:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90C1C4050E;
	Mon, 18 Aug 2025 21:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNsC3K8MO9fe; Mon, 18 Aug 2025 21:06:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACDC940504
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACDC940504;
	Mon, 18 Aug 2025 21:06:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F3B2719E
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 21:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8C5140502
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 21:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oy5ceBFidLmd for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 21:06:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F3BC9404FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3BC9404FF
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3BC9404FF
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 21:06:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 18CFE4E40C1C;
 Mon, 18 Aug 2025 21:06:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D7FD1606A6;
 Mon, 18 Aug 2025 21:06:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AC3311C22C3CB; 
 Mon, 18 Aug 2025 23:06:12 +0200 (CEST)
Date: Mon, 18 Aug 2025 23:06:11 +0200
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20250818230611.7173e721@windsurf>
In-Reply-To: <20250818133632.862010-1-angelo.compagnucci@gmail.com>
References: <20250818133632.862010-1-angelo.compagnucci@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755551173; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=r6a9ve48D1BlPSMK5OkUeU5SBIFLU4hOjO3+AmNv4nI=;
 b=yrDYX9tf/E+hmxNqKuXhpdt2vyY2pkgA3r9PhfnmMPgUlD5oQLjg/+TxBtrF+4TyYwwe+z
 GIg2oX06A4vdwcc/Y3SRtHqdqA7mWCX6x7yIw4ual/zLfVyJ8AJ4vYZQ2ns+tuDPBd/m+V
 I2cTwpYYdkRBiov88/crX+pF1g87lWgvcJ4gAKQ7ZYDIfgQ/vvB/gPsnleAgsVcN2FQLkP
 TPJuIHziUASFUl06tJ0WCT5+bKef9paY/LxXy2nbSCIqsNMinRc0PK3yis0xmVa6fBmLCr
 NSt7rQl8G28R7H9EYurD7BsYys3ypSpFK1Ac/E0hG/M9S6Y/K+zLWyQqzve0ZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=yrDYX9tf
Subject: Re: [Buildroot] [PATCH] package/jq: security bump to version 1.8.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Angelo,

On Mon, 18 Aug 2025 15:36:32 +0200
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> Changelog:
> https://github.com/jqlang/jq/releases/tag/jq-1.8.1
> 
> Fixes the following security issues:
> 
> - CVE-2025-49014
>   Fix heap use after free in f_strftime, f_strflocaltime.
> 
> - GHSA-f946-j5j2-4w5m
>   Fix stack overflow in node_min_byte_len of oniguruma.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  package/jq/jq.hash | 2 +-
>  package/jq/jq.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks for the patch, however this commit breaks "make legal-info" for
the jq package:

ERROR: while checking hashes from package/jq/jq.hash
ERROR: COPYING has wrong sha256 hash:
ERROR: expected: ea9e53f5974239869c51ace8bb6849c9751dee7c9d592180957987a1a133caff
ERROR: got     : ad2b4a266b2268939c1446979759706077421cf906a203aa188c6f396e8cfd74
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
make: *** [package/jq/jq.mk:29: jq-legal-info] Error 1

Could you have a look?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
