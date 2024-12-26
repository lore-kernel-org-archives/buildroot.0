Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC6DE77188
	for <buildroot@archiver.kernel.org>; Thu, 26 Dec 2024 20:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAC3860797;
	Thu, 26 Dec 2024 20:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HZ8KlLM7iLED; Thu, 26 Dec 2024 20:46:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4E96607A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4E96607A3;
	Thu, 26 Dec 2024 20:46:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6345EE0
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 20:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DDBD400F2
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 20:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lskW9JHdo9a4 for <buildroot@buildroot.org>;
 Thu, 26 Dec 2024 20:46:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E1350400E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1350400E2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1350400E2
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 20:46:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9922C20003;
 Thu, 26 Dec 2024 20:46:07 +0000 (UTC)
Date: Thu, 26 Dec 2024 21:46:06 +0100
To: "Thomas Bonnefille" <thomas.bonnefille@bootlin.com>
Cc: "Thomas Bonnefille via buildroot" <buildroot@buildroot.org>,
 =?UTF-8?B?TWlxdcOobA==?= Raynal <miquel.raynal@bootlin.com>, "Mahyar
 Koshkouei" <mahyar.koshkouei@gmail.com>, "Eric Le Bihan"
 <eric.le.bihan.dev@free.fr>
Message-ID: <20241226214606.6ec4524b@windsurf>
In-Reply-To: <D6LX599XS2MF.1JC5T1ZV0NEWQ@bootlin.com>
References: <20241221-fix_mpv-v1-1-d7ba39606571@bootlin.com>
 <20241222161820.7c8b1081@windsurf>
 <D6IFV7MLF3EN.2NH20DP0JW6F@bootlin.com>
 <20241226160146.3a93f3c8@windsurf>
 <D6LX599XS2MF.1JC5T1ZV0NEWQ@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735245967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sAEvbImC4MZevYe15AGkRhmoBaMokr6DPLTDRsOVV94=;
 b=eYua52d+odngvqhNcxiYITbpAk6TIzUd6mqiPt4dQsIYp7nhHNr26ZS+eDcG4E1nHfqyOr
 FH2/8u2Q9rsC7jM3LyyPHM1XGr7QR85iHVTOvkxmeW5y4Z/eC3Y9Sv9as9W+EUrasEva+s
 iN4XIT6yh3kGTEdd5FryWq9gsA5jRwvtS596qLzCNpMUcSbKm+KvhzBWtJDuYqn9sTqknW
 1m63RJMMGfr3YhDpI6Bb13F88GkyA/ZzPLI/afh9Jv6Y8H4bL3QddMyejFTYVU46wxdkUq
 xF+fsJ3V3V0bKNH87wjvWdZMAHs0pnF1c+tNscpuWyBbJKjn7EF6qYAXi31Z/A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eYua52d+
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 26 Dec 2024 21:36:08 +0100
"Thomas Bonnefille" <thomas.bonnefille@bootlin.com> wrote:

> > When you switch to one build system (waf) to another (meson), there is
> > a fairly high chance that the way dependencies are detected is going to
> > be slightly different, causing some subtle differences in behavior.
> > After all, all the dependency detection logic and all the build logic
> > is completely changed. We have regularly seen regressions when switch
> > from build system A to build system B. Of course, it doesn't mean it
> > shouldn't be done, but it means that considering such a switch as a fix
> > for our LTS branch is clearly not good.  
> 
> Thank you for this explanation.

Could you resubmit a new iteration, with an improved commit log, and
taking into account the two other topics I raised in my review of the
patch today?

> Yes, it's totally possible but many things moved forward in mpv and a
> bump is a little bit more complicated. 
> I've already worked on this issue in my Buildroot's fork [1] and it
> requires two more packages and therefore a significantly bigger patch
> serie.

Glad to hear that you started working on this! No rush, you can
resubmit the bug fix separately from the version bump.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
