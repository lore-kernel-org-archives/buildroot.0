Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D06C4332F
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 21:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ADB760F69;
	Mon, 21 Nov 2022 21:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ADB760F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eBA1eVNiKDvt; Mon, 21 Nov 2022 21:34:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E40C60F68;
	Mon, 21 Nov 2022 21:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E40C60F68
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B20DF1BF34D
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D81960F67
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D81960F67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2yO162GuA_HY for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 21:34:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FA1B60F58
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1FA1B60F58
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 21:34:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C9F4C1BF207;
 Mon, 21 Nov 2022 21:34:14 +0000 (UTC)
Date: Mon, 21 Nov 2022 22:34:14 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221121223414.77d0b8fe@windsurf>
In-Reply-To: <20221116152236.805035-1-giulio.benetti@benettiengineering.com>
References: <20221116152236.805035-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669066455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f9dcW34peA9j55GOBzAqUWfUzmNDW67dry97lAJULO4=;
 b=kQ6DPNvgIUWrbaRfp98dPsZhZfzG1P4ZZqwDKXNhQwd+Tj9VwSIkvqbVq/Zk5cx397r+rf
 2T5wigHevWj+vxDo47ul1pcIv4wjX/pbrfFyGvmczbeQciimaCWtZ198M5R7tGoOVPk6Tz
 gSo5C0nPmCl0ywXbT+7kXSjUy3KHHRgUU/fl53kAKKmuEFlsYBIXINdpl3T3u6XZx8/e31
 M9LAKsmN/ZCZN4yaN8V8tA5/6jnTSCXkhvtZTIV7fRX6/Z67QivfC0YbnOnhrhAx+OBr39
 /6LkD6zGLjV6UhhTJ3/ILXM/ZpYLUCJhIEs5lruqJC/FkkglCR3a19gUV5/F8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kQ6DPNvg
Subject: Re: [Buildroot] [PATCH] package/rtl8723ds: fix build failure due to
 endianness and Linux version 6.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 16 Nov 2022 16:22:36 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add local patch pending upstream[0] to override CFLAGS to set endianness
> according to BR2_ENDIAN. Let's also bump version to latest to support up to
> Linux 6.1.
> 
> [0]: https://github.com/lwfinger/rtl8723ds/pull/29
> 
> Fixes:
> http://autobuild.buildroot.net/results/2646ec0512f867e20c25c1d0a6417826218942d6/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...TRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch | 39 +++++++++++++++++++
>  package/rtl8723ds/rtl8723ds.hash              |  2 +-
>  package/rtl8723ds/rtl8723ds.mk                | 10 ++++-
>  3 files changed, 48 insertions(+), 3 deletions(-)
>  create mode 100644 package/rtl8723ds/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
