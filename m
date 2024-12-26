Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86C2E77188
	for <buildroot@archiver.kernel.org>; Thu, 26 Dec 2024 20:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A8F180E10;
	Thu, 26 Dec 2024 20:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_3waWmzF6JM; Thu, 26 Dec 2024 20:36:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F09A80E14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F09A80E14;
	Thu, 26 Dec 2024 20:36:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 974C5F1B
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 20:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7309360842
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 20:36:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EX0SeZ7jwnVn for <buildroot@buildroot.org>;
 Thu, 26 Dec 2024 20:36:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5A2B760825
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A2B760825
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A2B760825
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 20:36:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3C0C60004;
 Thu, 26 Dec 2024 20:36:09 +0000 (UTC)
Mime-Version: 1.0
Date: Thu, 26 Dec 2024 21:36:08 +0100
Message-Id: <D6LX599XS2MF.1JC5T1ZV0NEWQ@bootlin.com>
From: "Thomas Bonnefille" <thomas.bonnefille@bootlin.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Cc: "Thomas Bonnefille via buildroot" <buildroot@buildroot.org>,
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, "Mahyar
 Koshkouei" <mahyar.koshkouei@gmail.com>, "Eric Le Bihan"
 <eric.le.bihan.dev@free.fr>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241221-fix_mpv-v1-1-d7ba39606571@bootlin.com>
 <20241222161820.7c8b1081@windsurf> <D6IFV7MLF3EN.2NH20DP0JW6F@bootlin.com>
 <20241226160146.3a93f3c8@windsurf>
In-Reply-To: <20241226160146.3a93f3c8@windsurf>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735245370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2wAwlko+BqoOcW9jZAFYeSYjaqFAphkDevBYDAvlWwU=;
 b=RSAeGcki39Lbh65k43/6Y2XYVxu/ZE3rO1Si182m+9vD0AHd+cm9rsuZL5Kx7Q4DhXCS6m
 R3n3MM3/AtCecO3zggXiwBnT6yGfBU3VU0DpvLT50iYGaZund0iGFBZ292Wv1ZRcJEEoPm
 eUVFojxC7iEp/XcLdWzwhi7yeyITjhYKMuIw2gxpQvlXzgI7siKJ5U2f4kwcufn98WlMir
 p8drsjIedturzTGJ/ym8jetCVqhzkb1rGqTIJdTmga+h12vaW4KiC1YxH+1ME/fKgVQkXJ
 EpKuFvPEqGELd+SG3LmbRL2AjPCUm9V1LxPWzFvgykS9QGXZuXsvVO3/hmdWDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RSAeGcki
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

Hello Thomas,
>
> ...
>
> > Can you develop ? I'm not sure what kind of regression can be introduced
> > ?
> > I don't know if it answers the question but the meson build system has
> > been added to mpv with "waf-compatibility" in mind and so all the
> > options were translated from waf to meson. [1]
>
> When you switch to one build system (waf) to another (meson), there is
> a fairly high chance that the way dependencies are detected is going to
> be slightly different, causing some subtle differences in behavior.
> After all, all the dependency detection logic and all the build logic
> is completely changed. We have regularly seen regressions when switch
> from build system A to build system B. Of course, it doesn't mean it
> shouldn't be done, but it means that considering such a switch as a fix
> for our LTS branch is clearly not good.

Thank you for this explanation.

> In addition to this migration to meson, what about bumping to a newer
> version of mpv? Of course, in a separate commit.

Yes, it's totally possible but many things moved forward in mpv and a
bump is a little bit more complicated. 
I've already worked on this issue in my Buildroot's fork [1] and it
requires two more packages and therefore a significantly bigger patch
serie.

Thank you,
Thomas

[1] : https://github.com/Taumille/buildroot/tree/b4/bump_mpv
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
