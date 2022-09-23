Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D706C07E9D
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE7DB41A2A;
	Fri, 23 Sep 2022 21:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE7DB41A2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X8LJAbUoyYcx; Fri, 23 Sep 2022 21:40:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CBCF40438;
	Fri, 23 Sep 2022 21:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CBCF40438
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E9FD21BF82C
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4F2384261
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4F2384261
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D9kxqMwbnyfi for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:40:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAC57814B3
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BAC57814B3
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:39:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 80173C0002;
 Fri, 23 Sep 2022 21:39:57 +0000 (UTC)
Date: Fri, 23 Sep 2022 23:39:56 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220923233956.4d6ebabc@windsurf>
In-Reply-To: <20220920220904.98162-1-giulio.benetti@benettiengineering.com>
References: <20220920220904.98162-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663969197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yqCqBGDxzlNBgJxpJEbdavEW1cuPeeFRYnK76Uya0LY=;
 b=XZNpW0+o20EeSto9LQzPxx/w+tNAkc2v/E0/9GtxP4xXtdNArBp2OLDBkOg+OQ2iqgvuQ+
 juJ1zzR+282aJYSGKQX8IhOpG7v0Fju0Zj+oC0nRWjPcEkMRHTp048juXemkMgvDq66P39
 NofsB8ARe9kLBPHm3N3LY91VQfxd8YTrHVNVh/OYkWL9HpLZ8EihWIXPBZsg2aN+i049Lu
 z4qhN2Ldvsq85pWl+tFjibGTF6QKUEu5A2RFoUwUK0z65N+O40FOLU3FAlKIDXceqz89BQ
 RY5MnijosSrtwqC3J3TA2k2YFPwv8GH6kSgv4gQPo86eTEJb/tlgwGJZY59sRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XZNpW0+o
Subject: Re: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: fix build
 failure due to double defined endianness
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 21 Sep 2022 00:09:04 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> By default package rtl8812au-aircrack-ng uses CONFIG_PLATFORM_I386_PC that
> define -DCONFIG_LITTLE_ENDIAN and this can't be overridden since the
> USER_EXTRA_CFLAGS are assigned to EXTRA_CFLAGS in the beginning of Makefile
> while -DCONFIG_LITTLE_ENDIAN is assigned later.
> Instead of using the default CONFIG_PLATFORM_I386_PC let's set it to 'n'
> and let's use the same defines it uses:
> -DCONFIG_IOCTL_CFG80211
> -DRTW_USE_CFG80211_STA_EVENT
> This way -DCONFIG_BIG_ENDIAN can be define without the conflict of being
> defined with with the default -DCONFIG_LITTLE_ENDIAN.
> Let's also add Linux config FIXUPS to build the module correctly.
> 
> Fixes:
> http://autobuild.buildroot.net/results/2e4ee705d0e2b728f102aac4e6729f11ef22be36/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  .../rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk    | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Applied to master, thanks. The Makefile of this driver, with those
zillions of CONFIG_PLATFORM_xyz conditions, is really horrible...

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
