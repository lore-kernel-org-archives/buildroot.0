Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D6DE77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 18:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4531B42989;
	Sun, 22 Dec 2024 18:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jEybrD77cIuc; Sun, 22 Dec 2024 18:25:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 139524298C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 139524298C;
	Sun, 22 Dec 2024 18:25:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A2AE5E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 18:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17EB38221C
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 18:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPZGWm3Ga18O for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 18:25:47 +0000 (UTC)
X-Greylist: delayed 90361 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 22 Dec 2024 18:25:46 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DA7C28221B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA7C28221B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA7C28221B
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 18:25:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47A0040002;
 Sun, 22 Dec 2024 18:25:43 +0000 (UTC)
Mime-Version: 1.0
Date: Sun, 22 Dec 2024 19:25:42 +0100
Message-Id: <D6IFV7MLF3EN.2NH20DP0JW6F@bootlin.com>
Cc: =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, "Mahyar
 Koshkouei" <mahyar.koshkouei@gmail.com>, "Eric Le Bihan"
 <eric.le.bihan.dev@free.fr>
From: "Thomas Bonnefille" <thomas.bonnefille@bootlin.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Bonnefille
 via buildroot" <buildroot@buildroot.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241221-fix_mpv-v1-1-d7ba39606571@bootlin.com>
 <20241222161820.7c8b1081@windsurf>
In-Reply-To: <20241222161820.7c8b1081@windsurf>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1734891944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O7aHBEEoJfddUWmtP1LgZaQt2VNUqpF5RgtdKoFCPtA=;
 b=WEy1paZ9gGi+imZB66V6qCa/W1qZWYptCrLni9UQz6ys7ecZQ4mBCE+zjW7OLPXP1S6Hk0
 aJzttyy9rMFY1++dDdkV3UjAQpk6227kwd1MELm957q5Dv9z9AfkcQ6c8ZS2t6RbdRxX1S
 KnJEUIwT2z2X97lAmBxxlr6D1gY+8m+60Tply+uGXi1EkW7eENuEwWh8UzmO+66hisIXrS
 aX5J5VOI0C6xeFU1OFUphz370eqOoBJqkmj7iSi/D+Qx6DQ315bFidM033m9t4w5AaZVTG
 2MqpL0v9xBc242gsuOffMSZ+jba3OG+pzACEmdQEyhYJCHMwc9EUoofW+w5GrA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WEy1paZ9
Subject: Re: [Buildroot] [PATCH] package/mpv: use meson instead of waf
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun Dec 22, 2024 at 4:18 PM CET, Thomas Petazzoni wrote:
> Hello Thomas,
Hello Thomas,
>
> On Sat, 21 Dec 2024 18:19:21 +0100
> Thomas Bonnefille via buildroot <buildroot@buildroot.org> wrote:
>
> > Waf has been entirely removed from mpv since commit f2cce5f [1] in favor
> > of meson.
> > 
> > This commit is a rework of mpv makefile to use meson.
> > 
> > Note that the meson package compilation itself supports the
> > static/dynamic compilation setting.
> > 
> > Fixes:
> >     https://autobuild.buildroot.org/results/68d42441fc0da34e1bf2a4247726f5f4ec3b8e77/
> > 
> > [1]: https://github.com/mpv-player/mpv/commit/f2cce5f38f4031bf1a4b4919ec90e4e8f8c66a77
> > 
> > Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
>
> Thanks for the fix. However, do you have an analysis of what the
> problem is, and since when it started occurring?

I don't have an in depth analysis of the problem however, what I can say
is that the error appeared with commit
fd5623150dcc23441c4f0bd586378daeb91d66ea which bump waf from v2.0.26
(August 2023) to v2.1.1 (July 2024).
I would think that waf isn't backward compatible and as the mpv version
we're currently using is pretty old (November 2022), it broke with the
new Waf version.
>
> Indeed, we want to know if we want to backport the fix to our stable
> 2024.02.x branch or not. 

I think that, as far as the waf version get still stuck on
v2.0.26, the mpv package will not break (at least not this way).

> Also, your fix is far from being "minimal":
> such a conversion from waf-package to meson-package can potentially
> introduce other regressions.

Can you develop ? I'm not sure what kind of regression can be introduced
?
I don't know if it answers the question but the meson build system has
been added to mpv with "waf-compatibility" in mind and so all the
options were translated from waf to meson. [1]

>
> What was the issue with the waf build system?

I don't know why they get rid of waf but it was first deprecated and
then remove in favor of meson, so I thought this was a mandatory step to
operate this switch in Buildroot.

Thank you for your review,
Thomas

[1] : https://github.com/mpv-player/mpv/blob/release/0.35/DOCS/build-system-differences.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
