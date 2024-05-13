Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37503C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 11:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDEEB4060F;
	Mon, 13 May 2024 11:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bNryrEj2x9_R; Mon, 13 May 2024 11:59:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC393405D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC393405D1;
	Mon, 13 May 2024 11:59:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 631FA1BF232
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 11:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FCC181F41
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 11:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TmJdEHWDpfhx for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 11:59:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2B8A8812E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B8A8812E0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B8A8812E0
 for <buildroot@buildroot.org>; Mon, 13 May 2024 11:59:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4C6920003;
 Mon, 13 May 2024 11:59:12 +0000 (UTC)
Date: Mon, 13 May 2024 13:59:11 +0200
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20240513135911.209d094b@windsurf>
In-Reply-To: <CAMdwsN9p5bpK48UqTBXFgXtB=3y0Vrr18HqLyYb6e8wU4YXZsA@mail.gmail.com>
References: <20240512114617.2564569-1-roykollensvendsen@gmail.com>
 <20240512114617.2564569-2-roykollensvendsen@gmail.com>
 <20240513084026.4513d1f6@windsurf>
 <CAMdwsN8eL5Urj5AyWn0RStgBmeZ0_afz7aRAgr5iwfxjhV_Vgg@mail.gmail.com>
 <CA+R_deoKLT7TYE5kKjD9pOUsVcNA-iJOfmekfBOTA=gN3z=YoQ@mail.gmail.com>
 <CAMdwsN9p5bpK48UqTBXFgXtB=3y0Vrr18HqLyYb6e8wU4YXZsA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715601553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z9Asx6zBSY6hfy5DPetiY0F9LQ+pp2RZLp8pHPfMRnw=;
 b=a9BsiGs572CFbC3SHlBKOcVz+csYwK+SzHZc3YZVVwarjnMhmI4VT9gdjHwfUrU6jhBIP4
 gbg4u6kXRLfksa61RBVQtYiqisQ+TmT9o4nogN0/PLeUPaT+dEkntd57zs1SRFF/Lpfjz4
 piZybaafOtAkQZzTefVb4ukEuMUTjlHMaqAoBkjanBa8IIYRaCCKChMprCl+2yDEDT//yO
 HmQplf9u49yc9i4yQqTcnWSK7Rc1Neo50jxdLm0gNvNXECV245SoOmbKX2Ld9Oy5AkBlcW
 2uu6j27hwNA6UV2hSXk5X+9UCJcI+qNbDKEeys3VK7BEM9isVRLchIWi9Qh1rA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a9BsiGs5
Subject: Re: [Buildroot] [PATCH v3 02/14] package/qt6/qt6base: patch
 CVE-2024-33861
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hell Jesse, Hello Roy,

On Mon, 13 May 2024 13:05:05 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> > I assume I should add this information to the commit message and make a v4
> > patch-set?
> 
> Personally I don't see why that would be necessary, it's applicable to your
> version bump only and it's a valid CVE identifier (even if reserved for the
> moment) that can be looked up, putting the exact same CVE info in the
> commit for the patch seems a bit redundant

Well, in fact in this particular case, the CVE fix should be directly
with the version bump, and indeed clarify in the commit log why it is
together with the version bump. Also, QT6BASE_IGNORE_CVES variable will
be needed in qt6base.mk.

I'd say no need to resend the full series for this at this point. I'll
try to apply some parts of it, and see if I have other review comments
for the rest.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
