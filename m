Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382DDC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 15:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED64841494;
	Fri, 12 Jul 2024 15:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lW8ls3INL_1A; Fri, 12 Jul 2024 15:16:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B302D414D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B302D414D0;
	Fri, 12 Jul 2024 15:16:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 45E1F1BF5D7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F34982003
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x4nrltNKf8sz for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 15:16:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D145181FF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D145181FF5
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D145181FF5
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:16:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46ADB1C0002;
 Fri, 12 Jul 2024 15:16:11 +0000 (UTC)
Date: Fri, 12 Jul 2024 17:16:10 +0200
To: Thomas Huth <huth@tuxfamily.org>
Message-ID: <20240712171610.1a5a85cf@windsurf>
In-Reply-To: <20240517082007.312904-1-huth@tuxfamily.org>
References: <20240517082007.312904-1-huth@tuxfamily.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720797371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cae9Kxyl+z9fuRCY0vmZDpO/+RCt6H1FC/90P+pnW8U=;
 b=Mu+tdumn7ppG/m2jcZH6FUE/KvfSccT80tp7RkFkO7js0lrkqs4EV6OFO1/dk5bgab8w2b
 NR7WrCSUwmJz1uUlcqk3u/mEB9E3qo3V5h1vACvSp/tTjiMVHO3vgFOc4yHzzBDQ9KROPT
 /vCC9NCKnkL2VPkkXAaWj9vyYRbRVr+RBlPYWRG6lpSyHkwaQZX3lOd2LnL1NbVAa2HJdk
 0kW7DIVSxtBZuH0VKAxhmpk9sPPtpWl8BRhmPRMBFhyCdxZv2Tc4P1yo3FMfinrUDw7jr+
 gg5OaJSVTdRNH//lD7AkuwrXh8qtTc30x6yIEfX+Fr/uvcV6Dkd5FcLg+q0puw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Mu+tdumn
Subject: Re: [Buildroot] [PATCH v2] package/frotz: fix build with gcc 14
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 17 May 2024 10:20:07 +0200
Thomas Huth <huth@tuxfamily.org> wrote:

> Change -std=c99 into -std=gnu99 in the CFLAGS to avoid the following
> build failure with gcc 14:
> 
> fastmem.c: In function 'z_restore':
> fastmem.c:842:36: error: implicit declaration of function 'strdup'; did you mean 'strcmp'? [-Wimplicit-function-declaration]
>   842 |                 f_setup.aux_name = strdup(default_name);
>       |                                    ^~~~~~
>       |                                    strcmp
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/df3b3b98265ec3a75578614746b2d1426c90e125
> 
> Reported-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>
> ---
>  v2: Use gnu99 instead of removing c99

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
