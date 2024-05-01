Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A547AC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 752BA60BE9;
	Wed,  1 May 2024 19:02:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XScoZ1rpgKqZ; Wed,  1 May 2024 19:02:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BCC560BF1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BCC560BF1;
	Wed,  1 May 2024 19:02:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 92B1C1BF418
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E45D820A4
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UxS4OnSU_QZ1 for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:02:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6A01482078
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A01482078
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A01482078
 for <buildroot@busybox.net>; Wed,  1 May 2024 19:02:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD704C0005;
 Wed,  1 May 2024 19:02:03 +0000 (UTC)
Date: Wed, 1 May 2024 21:02:02 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240501210202.03f37cf8@windsurf>
In-Reply-To: <20240403085524.1650692-1-francois.perrad@gadz.org>
References: <20240403085524.1650692-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714590124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M9SVw2CWNNhBw9RCMwibq1SU4BguOT2MNyvU+vTBois=;
 b=ldq6tj71WcGO1CfLxa8unslDthtt6OM3iMNa/veLfYFSkez2ea9imKeiWD4RkWq6bL0WRU
 lKOCrZwgE4tHqQC9leSXNn7NsTcKrsnr/yVc1t+H69K1cq2I20G01REwU2rR11673/Wrk4
 glX8rRJcVWCVYZgGFXLugGLTs7PWIh57WRrduswgIZ16+h+t/qo1HZXS7u8fC+NaGohroS
 f5kEAXEPam4GZQjFlR+Dk9/u32NtB5+twERC9yORPFcykpMuur1xnMtWudPudENRv983uA
 NImWLceiHUJA9nmCEpnyB/7ALgBdyxLYR/Ru6oQYzF2RT8mgc9jDcaZk448dEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ldq6tj71
Subject: Re: [Buildroot] [PATCH] package/lua-lsdbus: new package
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  3 Apr 2024 10:55:24 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                  |  1 +
>  package/lua-lsdbus/Config.in       | 12 ++++++++++++
>  package/lua-lsdbus/lua-lsdbus.hash |  3 +++
>  package/lua-lsdbus/lua-lsdbus.mk   | 17 +++++++++++++++++
>  4 files changed, 33 insertions(+)
>  create mode 100644 package/lua-lsdbus/Config.in
>  create mode 100644 package/lua-lsdbus/lua-lsdbus.hash
>  create mode 100644 package/lua-lsdbus/lua-lsdbus.mk

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
