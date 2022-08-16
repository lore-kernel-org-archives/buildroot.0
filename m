Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054F7C25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 21:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88264814B5;
	Tue, 16 Aug 2022 21:24:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88264814B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PrF33y1kjHPB; Tue, 16 Aug 2022 21:24:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F0528148A;
	Tue, 16 Aug 2022 21:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F0528148A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C74F11BF84C
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 21:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C93B8148A
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 21:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C93B8148A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q9SgTeuB5XkH for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 21:24:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D767B81439
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D767B81439
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 21:24:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 33E1D20002;
 Tue, 16 Aug 2022 21:24:07 +0000 (UTC)
Date: Tue, 16 Aug 2022 23:24:05 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220816232405.0ca636d9@windsurf>
In-Reply-To: <5bf3b48f-bfae-444c-3c2e-73235a0d523c@mind.be>
References: <20220816103710.1278-1-guillaume.bressaix@gmail.com>
 <5bf3b48f-bfae-444c-3c2e-73235a0d523c@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660685048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eTzLJKAJi9TDEIZJLQRR1ftuXLwdXy5rgxhpl3VmFFM=;
 b=Uj4zni0+J7bimMCAeHL7E08+sgJb6k2YHF/ioCFbxMX3OR+oS5fJM8AH2VqeOVenjVploJ
 g//MWi5M3659gYBIpmoP55an6HnqJ/hNrhzzeTVFA4Ly8WF4Akrg2r+Ip2FcdzbmsqM0o9
 6enrCZBvJkUOmlQGpofuSp2E2InhWHJBoKr5FZRrQB0lOW1ISl417ROK8K4aF4fBw51Dqg
 j7Li7A/wkrMSHy6GPQz7ZZGBfWdlxMRQBF5VyQTq0sj6aoVxlwCFOT8uRE2jdeE7SmrOoM
 pNKcAj3CGpsRYMxpcz6x8Sdp6NFkVntM1OpgAigcyoSrj+k/Uiafqt5LZmOhLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Uj4zni0+
Subject: Re: [Buildroot] [PATCH v1 1/1] package/pkg-meson.mk: handle
 possibly non existing compilers
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
Cc: buildroot@busybox.net, "Guillaume W. Bres" <guillaume.bressaix@gmail.com>,
 Yann Morin <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 16 Aug 2022 22:54:04 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > +# To avoid populating the cross-file with non existing compilers,
> > +# we tie them to /bin/false
> > +ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
> > +PKG_MESON_TARGET_CXX = $(TARGET_CXX)
> > +else
> > +PKG_MESON_TARGET_CXX = /bin/false
> > +endif
> > +
> > +ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
> > +PKG_MESON_TARGET_FC = $(TARGET_FC)
> > +else
> > +PKG_MESON_TARGET_FC = /bin/false
> > +endif  
> 
>   Perhaps we should do this in package/Makefile.in instead? I.e. define 
> TARGET_CXX itself as false.
> 
>   This does have rather heavy implications, but I *think* it should be fine... 
> And anyway, the autobuilders will tell us :-)

See the discussion on the RFC of this patch, where I proposed exactly
this, and Yann gave a recollection of historical details that showed
that no, it's not a good idea to do it in package/Makefile.in,
unfortunately.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
