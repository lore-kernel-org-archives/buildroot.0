Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541E5C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 21:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1964410E7;
	Sun,  5 Jun 2022 21:57:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qh_VhD2fmPW2; Sun,  5 Jun 2022 21:57:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D39E641A4B;
	Sun,  5 Jun 2022 21:57:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 48C271BF290
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4615560AE6
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:57:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cd1vVJW8SWTc for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 21:57:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F35460AAB
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 21:57:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2E5C1200004;
 Sun,  5 Jun 2022 21:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654466232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6EHwGjsisfiX5jLcRbzbZpUhS6UXL/0O0Fu9j/V+iXw=;
 b=lKqU3/HBpfCVspvurBb57FR0pB7KxOayAbV+N64X4Zw7axcPnVBqd091GoGoL8E51NjRSZ
 7Qh5tiJ9FChNh8MIinIB1RfD4K0hWNOK5GxDO6N657bc+Dk8Q82ppHNcE5Um9PhiLUCVgR
 3+EYxvHuSAp7JTDle0ocs6pDKUDBNPHMz8Kj/eSC4owSQoe7npaeXhJs1m+fGMQmoDOkaQ
 6TnRxbiGR+VGkkan1MMZ/1XY53TtTdBDuHMpcK8I1iMoR1ju4HT/EnAChNYemeb0YCkNIg
 RmMxoMF0RBECK2WyhlYqaMs9/1InEjIE6cn7xiM6G24bAEC5Y8J067VMIpZo7g==
Date: Sun, 5 Jun 2022 23:57:11 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220605235711.70a0b978@windsurf>
In-Reply-To: <20220605202803.GV427639@scaer>
References: <20220605194259.2928568-1-thomas.petazzoni@bootlin.com>
 <20220605194259.2928568-7-thomas.petazzoni@bootlin.com>
 <20220605202411.GU427639@scaer> <20220605202803.GV427639@scaer>
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

On Sun, 5 Jun 2022 22:28:03 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > What about:
> >     if 'glibc' in [t.libc for t in toolchains if t.arch == arch]  
> 
> Nah, that does not test that there is *only* glibc; forget it...

Ah sorry, you realized separately. I had already replied to your
previous reply :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
