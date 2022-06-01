Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC2AC43334
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 19:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0032B40521;
	Wed,  1 Jun 2022 19:21:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pHi-IWqT6ln8; Wed,  1 Jun 2022 19:21:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EECF405BB;
	Wed,  1 Jun 2022 19:21:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBF0F1BF333
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 19:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB67282F3D
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 19:21:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R2Z8fRiQ55Au for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 19:21:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6E8882F14
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 19:21:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B4365E0004;
 Wed,  1 Jun 2022 19:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654111273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ozwXNzVbm8qCQQ+6fZcdZm7kJC3+0AA4LjrHI5ZnikQ=;
 b=i/Ujt7E71kaAAPF0O0Hg6ITmIkLZQEIQmC28aWTH1QRwdbkRXPCJvKus45UZ5JeGCZn0XX
 jfZWcilMqn8TjZ27+8XpbgccCBnwtslLWX74Me+u8ubRC7RZ7c8Hn4aTofZup0mdO04/x5
 fVRzYAp4F3apvpA6/7SgnAynZPMvVQERJPLtQ6A9aIHCywtj+0QeAnBylQ9sD4i4TZelPG
 CbnZi70PbzDaIDn1ZohdFqNM/1h+TfM3fBtrJF5UZIR3qh5XBPK8BNX3qSJZTpfATNFRnd
 ReqD5R6Wlipj1Fy2wjHC1w/bF6puAzwB9cFTy5ZXdGn5yNFAzqbdconNvr+c5g==
Date: Wed, 1 Jun 2022 21:21:11 +0200
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20220601212111.716a33cd@windsurf>
In-Reply-To: <20220527103335.1968203-2-angelo@amarulasolutions.com>
References: <20220527103335.1968203-1-angelo@amarulasolutions.com>
 <20220527103335.1968203-2-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/4] package/wpa_supplicant: fixing "Invalid
 configuration line"
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
Cc: jagan@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 27 May 2022 12:33:32 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> Default configuration file is wrong for the default compiling options.
> 
> Fixes:
> 
> Successfully initialized wpa_supplicant
> Line 1: unknown global field 'ctrl_interface=/var/run/wpa_supplicant'.
> Line 1: Invalid configuration line
> 'ctrl_interface=/var/run/wpa_supplicant'.
> Failed to read or parse configuration '/etc/wpa_supplicant.conf'.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Indeed, this option only makes sense when
BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE=y I suppose. However, in this
case, it makes sense a lot of sense to have this option in the config
file.

Should we have some kind of logic to add this line when
BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE=y ?

Maybe something like this:

# ctrl_interface=/var/run/wpa_supplicant # BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE

and a bit of $(SED) magic in the .mk file ?

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
