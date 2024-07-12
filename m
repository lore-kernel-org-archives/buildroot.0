Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1045DC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 10:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDB60408C5;
	Fri, 12 Jul 2024 10:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMVZjSfCZDgt; Fri, 12 Jul 2024 10:43:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A74D240735
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A74D240735;
	Fri, 12 Jul 2024 10:43:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A42F91BF47F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 10:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9ECB260614
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 10:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K5275Udw4dRP for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 10:43:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 75A0E6072E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75A0E6072E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75A0E6072E
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 10:43:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72FBE20005;
 Fri, 12 Jul 2024 10:43:39 +0000 (UTC)
Date: Fri, 12 Jul 2024 12:43:38 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240712124338.235251be@windsurf>
In-Reply-To: <20240625211847.1419944-13-roykollensvendsen@gmail.com>
References: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-13-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720781019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GukMqqZqqAMgnXBZwPm0w4oXO8c5PumcdfGwYHEzpig=;
 b=f8sQNATOivlFcoF9YZojHBDnZae9aTq1aVqEPVaD/ig9XEuQAIU3EqnfL7oBqfJsAGUTrZ
 QVRV9i8OnP1AdKBm8BKDbZIKALROKg0CItfFvbwUhAOaIRvb5mSJs9G5hZVbPnnynu1W5N
 O0XD4X8tsc8s03YIwfAz0xbapOB+/YVUOTIkt/JnXN05pFSdZUIyWhqO1NpHEvcOBolp9L
 AVrl+pOCsDFKSpnBaP3iJX8aePBDnG2lT3D4kxeZ4cfSYe/1b/Ghlrodh6aK6Fl6F5+Dkd
 tF2Uf3OrBU/anjW45MEbrkj3Tkre56Lo8KXHa7sBGCroHzcOw+UPnWgLqHSIxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f8sQNATO
Subject: Re: [Buildroot] [PATCH v9 13/14] package/qt6/qt6virtualkeyboard:
 new package
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Roy,

On Tue, 25 Jun 2024 23:18:37 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> +QT6VIRTUALKEYBOARD_LICENSE = \
> +	GPL-3.0-only, GFDL-1.3 no invariants (docs), \
> +	BSD-3-Clause

Changed to:

+QT6VIRTUALKEYBOARD_LICENSE = \
+       BSD-3-Clause (examples), \
+       GPL-3.0, \
+       Apache-2.0 (openwnn, pinyin, tcime plugins)

And applied. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
