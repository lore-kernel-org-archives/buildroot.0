Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC94C52D7F
	for <buildroot@archiver.kernel.org>; Sat, 17 Aug 2024 10:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C584B40978;
	Sat, 17 Aug 2024 10:08:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6NSEUH2JR_wy; Sat, 17 Aug 2024 10:08:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A541640824
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A541640824;
	Sat, 17 Aug 2024 10:08:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D05871BF57C
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 10:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD0834011D
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 10:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXYnLw8n270S for <buildroot@lists.busybox.net>;
 Sat, 17 Aug 2024 10:08:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7F758400D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F758400D2
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F758400D2
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 10:08:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06050C0002;
 Sat, 17 Aug 2024 10:07:58 +0000 (UTC)
Date: Sat, 17 Aug 2024 12:07:57 +0200
To: Sebastien Laveze <slaveze@smartandconnective.com>
Message-ID: <20240817120757.61bdc97d@windsurf>
In-Reply-To: <20240816151418.1648310-1-slaveze@smartandconnective.com>
References: <20240816151418.1648310-1-slaveze@smartandconnective.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723889279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h7KXPWYkzrysoAQVP/uukfSbvXd05F/a0SQ0bk08WG4=;
 b=jAqtMayK+4LseMYdhjJ20swFk2QhWdLcxJIhlMx+LfwvH40TYV7ePBVmdt8YqVVj96JggA
 c+oO/kwc4BusjORzRugyjvWt52EvnATMU9UoOwusysmjKXToc+s6Kf3FGrZWd1CH5ebBTz
 6RP9lDtJ2bffhaatauadR5girqTtQ0Och0CuobWPzSzsZnGYEyKsPba8cKeo+DRN75/1qb
 V2Be8i+robUKENl7vqqNrUFBWOjJYDiRX21iC37/ECe2KWe6JfJcLmjT/uCVz5e8lU9emW
 8vUxlyKH/pbgLGUZpvsbHJBNGXaLuM0rDJlP0hhZvrVkHQ0rGhGy82p/FKizGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jAqtMayK
Subject: Re: [Buildroot] [PATCH] package/rust: update to 1.80.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 16 Aug 2024 17:14:17 +0200
Sebastien Laveze <slaveze@smartandconnective.com> wrote:

> Signed-off-by: Sebastien Laveze <slaveze@smartandconnective.com>
> ---
>  package/rust-bin/rust-bin.hash | 128 ++++++++++++++++-----------------
>  package/rust-bin/rust-bin.mk   |   2 +-
>  package/rust/rust.hash         |   4 +-
>  package/rust/rust.mk           |   2 +-
>  4 files changed, 68 insertions(+), 68 deletions(-)

Applied to next, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
