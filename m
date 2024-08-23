Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12623C531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9027641295;
	Fri, 23 Aug 2024 17:07:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ts5PC79EptWF; Fri, 23 Aug 2024 17:07:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B6FA4129C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B6FA4129C;
	Fri, 23 Aug 2024 17:07:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C05881BF306
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADE6D612F6
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lmLp5cl_h-iK for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:07:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A730960644
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A730960644
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A730960644
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:07:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89D5F60002;
 Fri, 23 Aug 2024 17:07:08 +0000 (UTC)
Date: Fri, 23 Aug 2024 19:07:07 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240823190707.71d0dc45@windsurf>
In-Reply-To: <20240822181830.65052-7-bernd@kuhls.net>
References: <20240822181830.65052-1-bernd@kuhls.net>
 <20240822181830.65052-7-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724432828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dfz0364ngUC21Dl0XmS9R6A9VI/hAdUeRL2keqarAVc=;
 b=da5v6+/SEQWFkk9ia0g1oUeOAfkAFB880j2WNaOgrAgtt49yPU1ZXIjuybCpDFjhL3/HL6
 0/AvXiIzLMAXLJwASivZaIl4Hhh0rC1VSjhp6Dr5nlCSjIOf/4LxXK+1CjEn+2zfgCg1hM
 J7WBMVP9Tj88KraJZJFCdR/8gLP2EjN+SFARwgzmltheBcF28/eJCmgoEfr90lzlxcs5Y2
 EKaNQT51bjN+aGeB32c9FDbYhRBbLOfSFL1ayT3zzRnzJYQHjMv/QhzrvQd1tQ95/uVrL7
 /UyrHDlkmibGiRKvgLA+E+2r3iMyy20WRu1RtAbYyt3oRnjD+HzExLChMiWQZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=da5v6+/S
Subject: Re: [Buildroot] [PATCH/next 7/7] package/kodi: needs
 python-packaging
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 22 Aug 2024 20:18:30 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Needed for external addons with python >= 3.12, for example:
> https://github.com/emilsvennesson/script.module.inputstreamhelper/issues/550
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

This looks like a fix, isn't it? Why isn't this targeted at the master
branch? The master branch already has Python 3.12, so this should be
applicable to master, not next, right?

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
