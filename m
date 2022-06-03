Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825A7C43334
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 14:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A794405FA;
	Fri,  3 Jun 2022 14:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qfb0iQjH8DWj; Fri,  3 Jun 2022 14:03:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 538D4405DD;
	Fri,  3 Jun 2022 14:03:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 099F71BF2F6
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 14:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0639183FE8
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 14:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Imf3Yn4QgeAX for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 14:03:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7114283FB9
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 14:03:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F0DDFFF803;
 Fri,  3 Jun 2022 14:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654264988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nomnm72Aj5v+pLdrXnk19YTCJtfKCK+xyBvagmRpuUM=;
 b=Dk5gw287bWtLYnipPnVrX4ixyAwwmdaJ24dJ7Y9RdT4KSMYHt+tWOVk16S1b3ZR47KCtXW
 ECLpcqhuk7sJmUwG5Jr5tqRe4HU8lxyusy6YgYyIPiFKW5cJICPPyuUY5VNBaV/fRM4qfO
 Cs5C/qbjV/CFrcrVIfwY0eynVv1G2NUewsMnkz9eLM7abftOJZJbKwzE51lvuwX4JiCUnb
 x1WpbSUv5FGBcu//02gfLtEMu9qKK5+XYDoLGWoAGR1yil+k93tGdIpCEsQq8oNGC1lXEA
 7LLNEjJ1bfJJHiQVRKnwiIJ911CB6It4iFL5YbI04bxR4hajSOUA79JWfFKwuw==
Date: Fri, 3 Jun 2022 16:03:06 +0200
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20220603160306.00960433@windsurf>
In-Reply-To: <871qw5eu1l.fsf@tarshish>
References: <CALtfCQaLxNdrKhSjMfShjb-nQWUnqa3DSOwbyZm1+Q0fU1UUqQ@mail.gmail.com>
 <87zgjapr8a.fsf@tarshish>
 <CALtfCQaBG_p15ASxYKSyZhYOePW5uE-BW8F1KG7DkPeJ8bjLiw@mail.gmail.com>
 <87r14kq55b.fsf@tarshish>
 <CALtfCQY1a6sjLNUh42zsrsu1hPLTMHNDj4+5v5k8w8kv8u6tmg@mail.gmail.com>
 <87ilpwp82x.fsf@tarshish>
 <CALtfCQauLNMOfBb6Zm8M8v-VHakY_Bs+p6CeQh0tVuTtfKyUDg@mail.gmail.com>
 <87a6b6pwqf.fsf@tarshish>
 <CALtfCQZPYEJBT=2hx6XJ1FH=ESHhw2N_LaqYbd+xdGkXxT503g@mail.gmail.com>
 <875ylup27u.fsf@tarshish>
 <CADvTj4r=46JdJUPSzOXgmXVDBWYDM3v5wsFjymbzGF1xoyzO4Q@mail.gmail.com>
 <871qwiozwd.fsf@tarshish> <20220602190001.0c4c9f35@windsurf>
 <871qw5eu1l.fsf@tarshish>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] How to select python-cryptograhy package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Oscar Gomez Fuente <oscargomezf@gmail.com>,
 Baruch Siach via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 03 Jun 2022 16:47:21 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> > I think this comment would be misleading. Indeed, based on this
> > comment, you could think that for this configuration (BR2_arm &&
> > BR2_ARM_CPU_ARMV8A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC) we
> > would use the armv8-unknown-linux-gnueabihf variant of rustc, but
> > that's not the one we would be using.  
> 
> So what should be put in that comment? Just
> 'armv7-unknown-linux-gnueabihf' like we do for BR2_ARM_CPU_ARMV7A?

Maybe a bit more, to clarify that it's ARMv8 used in 32-bit mode, so we
use the armv7 Rust toolchain.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
