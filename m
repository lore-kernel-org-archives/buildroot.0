Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCA4C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 11:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FFB7410B9;
	Tue,  7 Jun 2022 11:48:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P3A1p1nsX-rj; Tue,  7 Jun 2022 11:48:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4CAA40AD1;
	Tue,  7 Jun 2022 11:48:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 30B7D1BF40F
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 11:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FBAB84332
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 11:48:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TJuscoLo4yyt for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 11:48:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3F7184244
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 11:48:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 60E5F10000B;
 Tue,  7 Jun 2022 11:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654602484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ADObx8cl4f1ufbjmhilG9jNSb51vxFWHK4hLKx/YhbE=;
 b=ohtKCFM9XhaN2Zd/gWGzhG5dndRGkrqfGguzcoGWRjPzbTy9RhaQuZzyP2jda5XMEBZxMQ
 JboJZmAWxIHS1S1Gmg87gkzpQspe1/XEG8VG9ZHGsuElyLMcS1fam16b8y85ORENhOROdC
 ceG/7PYShN54dkViHlLHKTkwbNJlRNeq2KSPQfnT0tKQk7QsBVFXflebso1ElIgvJVl+ab
 zevWXciU/oG6Qth6kw4YTRlbtpc1gnDbad6LA70Iyo+L6IoS3iNu9kjfBQNm1ZTjZ9AxVb
 JlOu4MoX6ep3lurvnOHezD1TeFEu1xdDieOndlRG6PwM/FRD0A5LRGuUFbqswg==
Date: Tue, 7 Jun 2022 13:48:03 +0200
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20220607134803.630edcd7@windsurf>
In-Reply-To: <CA+_SqVZiyKDxz=+0391_0jbdnE+Qt06NnT=i=n1e0zZiPN0G6g@mail.gmail.com>
References: <20220527103335.1968203-1-angelo@amarulasolutions.com>
 <20220527103335.1968203-2-angelo@amarulasolutions.com>
 <20220601212111.716a33cd@windsurf>
 <CA+_SqVacVxJkhC13fussgw9Pctmr8zrbc2DBs0m0+sqxNFfQZw@mail.gmail.com>
 <e3ffcc1c-518a-65f4-d713-2b31254238d8@mind.be>
 <CA+_SqVZiyKDxz=+0391_0jbdnE+Qt06NnT=i=n1e0zZiPN0G6g@mail.gmail.com>
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

On Tue, 7 Jun 2022 12:21:22 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> The problem here is that wpa_supplicant.conf file will always be provided
> in a user overlay, because to connect to a wifi a proper `network=`
> configuration settings must be provided.

Then why do we provide an example configuration file? :-)

> Would we really like to mess with a user overlay provided configuration
> file? I think that a user must ensure the configuration file is in good
> shape for the service to work.

If the wpa_supplicant.conf provided by Buildroot is overridden by a
file in the rootfs overlay, then whatever we do in
WPA_SUPPLICANT_INSTALL_TARGET_HOOKS will have no effect, the file in
the rootfs overlay will win. So we are not "messing up" with the file
provided by the user.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
