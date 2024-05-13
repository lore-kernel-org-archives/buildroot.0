Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7BEC25B78
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 06:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BC96400BB;
	Mon, 13 May 2024 06:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UXpavw8DEc1d; Mon, 13 May 2024 06:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2185140165
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2185140165;
	Mon, 13 May 2024 06:40:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B774E1BF4E3
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 06:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A433440165
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 06:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LkJkP00GYjHI for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 06:40:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 54828400BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54828400BB
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 54828400BB
 for <buildroot@buildroot.org>; Mon, 13 May 2024 06:40:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A7FB240005;
 Mon, 13 May 2024 06:40:27 +0000 (UTC)
Date: Mon, 13 May 2024 08:40:26 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240513084026.4513d1f6@windsurf>
In-Reply-To: <20240512114617.2564569-2-roykollensvendsen@gmail.com>
References: <1924535> <20240512114617.2564569-1-roykollensvendsen@gmail.com>
 <20240512114617.2564569-2-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715582427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h6P8jLl5dj7+vmHK/aej3SR7LQl13i3wP4ohreWMoB8=;
 b=WuBZS+IwyE9PhF7I2CsaDKpzqfqK98Xy5g56ZsYwYyyUmWg4Q2WuidrPbFGC2MRF9Vvaok
 MRU0F1N1oBZMaN5+kILI+FR3ewQVswXIhQrZuTVeLNunzhfh+A/H176N6GTRa0E/KUZxKg
 +C/p6h9vjXSb+sPjge7ESf9lWDCwPm1Md0jkZMY1fSlB5dZOhgiuNXluFplWV5535aMDXL
 BxwNHv3yVI3UDltEuzH80Nv9YT5ILp1MCre5V3bqedezvmJ0FJJ/jj29MvNAV7bdoIEl/x
 wvpjgUPZuljMAes8v40UmbRw76MQCYW54lf4sdj0k6UMJVpS881QqiIFiGbsyQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WuBZS+Iw
Subject: Re: [Buildroot] [PATCH v3 02/14] package/qt6/qt6base: patch
 CVE-2024-33861
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Roy,

On Sun, 12 May 2024 13:45:49 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> From: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
> 
> Got patch from:
> 
> https://download.qt.io/archive/qt/6.7/
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>

Thanks for this v3. However, you're again putting a fix as PATCH 02/14
of the series, after a bump. Is it because this CVE is only applicable
to Qt 6.7 (and not the 6.4.3 we already have in Buildroot) ? Could you
clarify this point, which is very important?

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
