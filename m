Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A80DC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 12:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DB518146F;
	Sat, 13 Jul 2024 12:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9cDRtuL_u_cB; Sat, 13 Jul 2024 12:52:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55E95815CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55E95815CC;
	Sat, 13 Jul 2024 12:52:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B8391BF5AE
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8851E815CC
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:52:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_ee2Dym1lya for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 12:52:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E4D88146F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E4D88146F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E4D88146F
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 12:52:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6C4EFF808;
 Sat, 13 Jul 2024 12:52:28 +0000 (UTC)
Date: Sat, 13 Jul 2024 14:52:27 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240713145227.3a69102a@windsurf>
In-Reply-To: <20231203182911.290968-1-fontaine.fabrice@gmail.com>
References: <20231203182911.290968-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720875148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W0VM75s/4iJJvB2xQ56c5MTfYsMZEGA6KKR5ppBpOrk=;
 b=VmcF3/DfehYOw+jIPaRGyBvzn3H17/7GlZB0NbyeGXlG6APjDSCNEwAs8+HOm3Xb9xpuTC
 HrZZ5dh+UVo2h1mTV7EaiJrKMbhxpPmL8EqFPBfVK2LTWpiWFxacTf3OUh2L7JHtG4PYpA
 AMT5RRHgbGJZq9ABo+e0pjgu8XOg78T/Tjiha9rKwPRv/xpeaIsLcziaAcaWQWFDTZ5WBg
 hoUrTcnh2fbruclxX++e9St0xS0FBj66BUMxvbr8crNPogZMuEoVq+LbQx3dL7wmWSoX9W
 AAqldEHPfruIyIZvQKP+Yk9GKHCS6r1y3LZUdU9hrA9ZSwJngENRukYJzFBYBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VmcF3/Df
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/openssl: add BR2_PACKAGE_LIBRESSL_ARCH_SUPPORTS
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

Hello,

On Sun,  3 Dec 2023 19:29:11 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libressl doesn't support all architectures since bump to version 3.8.2
> in commit 21eca49ed5110872407b76ab9337d2877c4cda24 and
> https://github.com/libressl/portable/commit/b98c56fd5e86fa76eb55a98a2266a923f64f705c
> https://github.com/libressl/portable/commit/71ce0b8c3e07079a40011d2f3515969e3bdf302e:
> 
> In file included from /home/autobuild/autobuild/instance-4/output-1/build/libressl-3.8.2/crypto/rc4/rc4_enc.c:61:
> /home/autobuild/autobuild/instance-4/output-1/build/libressl-3.8.2/crypto/../include/openssl/rc4.h:75:9: error: unknown type name 'RC4_INT'
>    75 |         RC4_INT x, y;
>       |         ^~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1f6ac121b3771ccc4b0e846c061b7002ccb63963
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks, patch applied, sorry for the huge delay!

I even submitted a small
contribution https://github.com/libressl/portable/pull/1070 to error out with
a nice error message rather than horribly failing at build time.

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
