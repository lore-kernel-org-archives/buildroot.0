Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8FBC531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01AAE81456;
	Fri, 23 Aug 2024 17:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gs6lXN4U9opU; Fri, 23 Aug 2024 17:38:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AEC281497
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AEC281497;
	Fri, 23 Aug 2024 17:38:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 898EA1BF3F3
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76F184015E
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eXPi7COt_jxf for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:38:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2CD1B40179
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CD1B40179
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2CD1B40179
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:38:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7CDC0FF806;
 Fri, 23 Aug 2024 17:38:16 +0000 (UTC)
Date: Fri, 23 Aug 2024 19:38:15 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240823193815.68b1fd9f@windsurf>
In-Reply-To: <ZsRKETwc6ShZJ4yX@waldemar-brodkorb.de>
References: <ZsRKETwc6ShZJ4yX@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724434696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BRnCRFgyi5sXQlKagZ4Ps2OOgLEDsnCBhRG15RgWz9k=;
 b=foEPYpeldyIK9XB3kzu8t6/MkdMJxZcRhNBDjrctU+KmhYPNQHgYYNi0LRstxdJzWG8xbT
 nMkU7VkyOG0N45xryCwz5ld5rKirRhtuwlY4vB2DVVIb/ZofEvcS/aGgSmthW4KI35U4i5
 InuxMffmCZ2mbFFDAssinqyHjABlAUQi16j2AUoQx+mzprbQyAMXfokObR9Gn9AIFjNI5d
 d3/O22esw2rSD7h3u1trfzC3cXJrtuLJLZ3UPhyngQeHT6cS/vpUyyvQSFFFSLLrWx8UbQ
 3bT6pVGO99J28oiZTtsaAl1zq1GP91wvAD2sAfb7EcqRDGYzzJA+QvNfhMd8vA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=foEPYpel
Subject: Re: [Buildroot] [PATCH next] package/binutils: update to 2.43.1
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

On Tue, 20 Aug 2024 09:47:29 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> See here the release announcement for changes:
> https://sourceware.org/pipermail/binutils/2024-August/136396.html
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/binutils/{2.43 => 2.43.1}/0001-sh-conf.patch          | 0
>  .../{2.43 => 2.43.1}/0002-poison-system-directories.patch     | 0
>  package/binutils/Config.in.host                               | 4 ++--
>  package/binutils/binutils.hash                                | 2 +-
>  4 files changed, 3 insertions(+), 3 deletions(-)
>  rename package/binutils/{2.43 => 2.43.1}/0001-sh-conf.patch (100%)
>  rename package/binutils/{2.43 => 2.43.1}/0002-poison-system-directories.patch (100%)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
