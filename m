Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF311C3DA41
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 10:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F17D4104E;
	Thu, 11 Jul 2024 10:04:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7BFNbgOWE6h; Thu, 11 Jul 2024 10:04:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD7794101A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD7794101A;
	Thu, 11 Jul 2024 10:04:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 509191BF40D
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 10:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E88F60752
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 10:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EN0RYC9dczn4 for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 10:04:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA03A60678
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA03A60678
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA03A60678
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 10:04:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B85B62000E;
 Thu, 11 Jul 2024 10:04:41 +0000 (UTC)
Date: Thu, 11 Jul 2024 12:04:39 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20240711120439.3c5eb010@windsurf>
In-Reply-To: <29a51211-e273-4b28-ba3c-648df58b83c3@mind.be>
References: <20240711070525.1406612-1-dario.binacchi@amarulasolutions.com>
 <20240711105200.292f5783@windsurf>
 <29a51211-e273-4b28-ba3c-648df58b83c3@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720692282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=alMvmy4DADQflMKUuUM750WabdPAyKloKfVQCsmnVMM=;
 b=BrslN5PFwW6/ZVZma1bzfp4X7LngcA9FRkLh9h6Y4XkKzQEbFE2g2iaIPvvwLd2EYTQZsc
 8six0RRsMfdXGAdCCXhuoy5VRIPHPbf7AqKXj5I3mHeP50PsNCPbjTzzxSVa3xnF2M70AC
 aq1abRU8Qu/9gHPoVZNA/b8KHO0wPiPbf2ti8rFGK664FkTO3roerjoCqiqz5EsgZWTwTT
 3+YgqEVRGKEMK/p1FvsPwH48/sJ1C1AEX9/h6LlYWwjlDbzXqZwCpVm1WQLVy9HNUTCI70
 tPswyl7/NVALgi+wubY1KdhEMAy9ogRAMjpR26v1HAkHHlzT/3F+Vezxo2f6Ag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BrslN5PF
Subject: Re: [Buildroot] [PATCH 1/1] package/sunxi-mali-utgard-driver: fix
 patch fuzz
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Arnout,

On Thu, 11 Jul 2024 11:51:11 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > Thanks for the patch, but I'm not entirely sure that's how we want to
> > fix this issue. Indeed, apply-patches is used in quite a lot of
> > packages to apply patches from Debian. Do we want to fix all those
> > patches, like you did for the sunxi-mali-utgard-driver? I'm not sure.  
> 
>   AFAIK, Debian patches should apply without fuzz (unless we do stupid stuff 
> like applying our own patches first).

Is this "should" based on actual experimentation/validation, or just
some general assumption?

>   I think this is the only case where we are downloading patches that have 
> incorrect fuzz - or did you encounter any other case, Dario?
> 
>   And in this specific case, upstream is Giulio, so I expect that the PR will be 
> accepted soon and we can simply bump.

Ah, I didn't realize we had an active upstream for this package.
Indeed, it means we will be able to drop our patch.

>   I agree, but only if we actually encounter a situation where this is the case. 
> Note that the implementation will not be super trivial (will require something 
> like FOO_APPLY_PATCHES_FUZZ).

Well, no, I was assuming $(APPLY_PATCHES) that is used in packages
would default to accepting fuzz, and only the $(APPLY_PATCHES) call in
our package infra, which applies our patches, would pass an option to
disable fuzz.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
