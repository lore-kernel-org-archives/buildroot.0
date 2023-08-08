Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABB7C001DE
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 07:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F49C40562;
	Tue,  8 Aug 2023 07:43:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F49C40562
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uW2aRDY9GCgk; Tue,  8 Aug 2023 07:43:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA91C402CE;
	Tue,  8 Aug 2023 07:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA91C402CE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 552271BF82F
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 07:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E854402CE
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 07:43:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E854402CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jPZAMZ5ZZ3ex for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 07:43:53 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5C77400CB
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 07:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5C77400CB
Received: by mail.gandi.net (Postfix) with ESMTPSA id 997BDE0002;
 Tue,  8 Aug 2023 07:43:49 +0000 (UTC)
Date: Tue, 8 Aug 2023 09:43:48 +0200
To: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Message-ID: <20230808094348.1c7a8650@windsurf>
In-Reply-To: <20230808050122.6788-1-kilian.zinnecker@mail.de>
References: <20230808050122.6788-1-kilian.zinnecker@mail.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691480630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yYDTxsKXbZMrd5BwgsXDjP9AZrlynmlafLCHi0ihjkw=;
 b=lRBPvHEMpgLSA7DqfmBoA1UXz+PNlcUoig137Gd7bqn7mXCLJ147xvW5/fnVH8WxC6YLsM
 KyryFDNHpVfs01VcnUMt0LDTt2UPf1tQuDOLBDAF+MH4DY8GirQQJ39lA74aeDLxk3vnN8
 727YCWvkadWLoQh0NYVFzdkQ/SdwpCwQwJezqBOzSXt/87ak4eLEsdoR/stfYtLnhTV6ak
 oO1f35s8iDuvVGaheRbd/OMkROT5t1rsMAhXzut2atDWyaujYYsa9frKNRja8+wLHBfS2Y
 ffPsJtc+g2wbJLhLYVMimRLM1ZG/R32TwrepLWReFJBWFaqmv9lMQBnw6PdRYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lRBPvHEM
Subject: Re: [Buildroot] [PATCH 0/2] Fix Rock 5B build,
 broken by gcc 12 warnings
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
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Kilian,

Thanks for your work. See below some comments/questions.

On Tue,  8 Aug 2023 07:01:20 +0200
Kilian Zinnecker via buildroot <buildroot@buildroot.org> wrote:

> Building the image for the Radxa Rock 5B currently breaks: The gcc
> version was recently changed to version 12 and gcc 12 seems to stop
> compiling, if certain warnings occur. See the broken build here:
> 
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673759
> 
> This patch series adds two patches from the mainline Linux kernel,
> which fix two of the warnings. However, also custom code parts of the
> used custom kernel break due to warnings from gcc 12. The best
> solution would be to fix those issues as well. However, until they are
> fixed, the version of gcc used for the Rock 5B is set to the previous
> version, gcc 11.
> 
> Kilian Zinnecker (2):
>   configs/rock5b: Freeze gcc to version 11
>   board/radxa/rock5b: Add patches for gcc12 warnings

I'm not sure to understand the reasoning for the second patch. Does it
fix all gcc 12.x issues or not? If not, what is the motivation for this
second patch?

Also: gcc 11.x is currently the oldest version supported by Buildroot,
it means that as soon as gcc 14.x is released, we will drop support for
gcc 11.x. So clearly, the solution of sticking to gcc 11.x is not going
to work for a very long time.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
