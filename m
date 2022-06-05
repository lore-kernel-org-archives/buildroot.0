Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886CEC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 21:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38FB660B3C;
	Sun,  5 Jun 2022 21:56:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id reaMvTn06iZu; Sun,  5 Jun 2022 21:56:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C5C960AAB;
	Sun,  5 Jun 2022 21:56:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 045D71BF290
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0058040112
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:56:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m6cuGOGvDDWO for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 21:56:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2F0B40104
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 21:56:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 056E760003;
 Sun,  5 Jun 2022 21:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654466208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UgZnkc3YYk6k+qg8Gznuaow0XJWdGjMFZb8UDr9KqRs=;
 b=OtUibNa9eXlsW9u0QPzlo+eE7ypx5Id70DYvg9pmMBRxUZOJKfogMIH9xwl9/jSpCbDcJk
 UySWiOphguk3b3a4SEjr6xFbpX9Zr0E/AclghoTD60WNUTxGuJcdQ4vjmEbVpr/khqzTA8
 dR3Ij6aMcztlPo6FhUW6nYBzYitIszNSx9h6Fw0su3+/IY66rR58oi0L5eEX2U8TYumIY7
 CbaQCUA6GLHD8LdcO2GkFv/LPnMR8dSYOiDD/Dlo8rbybv2HlGzMh0+bv4AqzjCop77DPP
 zHj8Fnisfhxvun79y1IRhjqIpArI9+JHBOq7+uDHg/Wg+MowsEmiHlsrjLgCJw==
Date: Sun, 5 Jun 2022 23:56:46 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220605235646.6057d743@windsurf>
In-Reply-To: <20220605202411.GU427639@scaer>
References: <20220605194259.2928568-1-thomas.petazzoni@bootlin.com>
 <20220605194259.2928568-7-thomas.petazzoni@bootlin.com>
 <20220605202411.GU427639@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 6/7] support/scripts/gen-bootlin-toolchains:
 properly take into account !BR2_STATIC_LIBS for glibc toolchains
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
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 5 Jun 2022 22:24:11 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> >          for arch, details in arches.items():
> > -            f.write("\tdefault y if %s\n" % " && ".join(details['conditions']))
> > +            conditions = details['conditions'].copy()
> > +            if set([t.libc for t in toolchains if t.arch == arch]) == set(['glibc']):  
> 
> What about:
> 
>     if 'glibc' in [t.libc for t in toolchains if t.arch == arch]

No, that would not work. We want to match if *only* glibc is available
as a C library, not if glibc is one of the supported C libraries.

If [t.libc for t in toolchains if t.arch == arch] contains glibc and
uclibc, we should *not* add the !BR2_STATIC_LIBS dependency, because
uclibc can be used in the BR2_STATIC_LIBS=y scenario.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
