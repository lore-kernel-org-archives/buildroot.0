Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBADC19F4F
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 16:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95B3060D5C;
	Wed,  8 May 2024 16:30:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eLy79SSxEUbT; Wed,  8 May 2024 16:30:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8505E60D53
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8505E60D53;
	Wed,  8 May 2024 16:30:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A5C1A1BF2B0
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F40940898
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6nLfS9Vjw6PQ for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 16:30:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5D44D4088A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D44D4088A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D44D4088A
 for <buildroot@buildroot.org>; Wed,  8 May 2024 16:30:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5560D240003;
 Wed,  8 May 2024 16:30:23 +0000 (UTC)
Date: Wed, 8 May 2024 18:30:22 +0200
To: Christian Stewart <christian@aperture.us>
Message-ID: <20240508183022.047dea30@windsurf>
In-Reply-To: <20240508040220.28371-1-christian@aperture.us>
References: <20240508040220.28371-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715185823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i3JyAwdGEHPvVo4wgy1JK2DRffi6MLGAYOg+G+XsDTs=;
 b=P8HZDNiprpoXN3S0Xve99tmyK+ShvOYGL/pfNVMHbhYUIANlxSo78jdc7libXAKoWvwINr
 BPiyX7Y64ML18DqP/5D4XK/ysAcOi7tYgyIAzzHSi6ZP9rmNb/ZSrieKbH9WCU3VMl/4cJ
 RMdrs74QbEdywxkH5eSbwjg3TNmibpdGvtn7bqOH9G9jnTsacFskMOMSQOSBRIBghBlkSD
 q0/5gZ+SN8nPoTetHtdtiTk1DjvjlRm9uJUV0TqqG5pAORRw9G0eEnFi7YEh9QVMqSvkbA
 28JI9I+i5ZNYld5M3jYfzB8CJQl2kGKCBVLY+iVZLKkxnwlVxC5yPmWAReBHLw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P8HZDNip
Subject: Re: [Buildroot] [PATCH v1 1/1] package/mdadm: add udev to ldlibs if
 enabled
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
Cc: "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue,  7 May 2024 21:02:20 -0700
Christian Stewart <christian@aperture.us> wrote:

> Fixes a build failure where the udev_ functions are undefined.
> 
> -ludev needs to be added to LDLIBS.
> 
> The build failure was against the systemd version of udev.
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Thanks, but I've instead applied
https://patchwork.ozlabs.org/project/buildroot/patch/20240508120057.791378-1-fontaine.fabrice@gmail.com/,
which fixes the same issue.

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
