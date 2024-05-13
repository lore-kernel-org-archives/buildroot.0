Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2702BC25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 20:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4AA1406D4;
	Mon, 13 May 2024 20:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cRvuHPSZEfR4; Mon, 13 May 2024 20:40:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AA3C407FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AA3C407FF;
	Mon, 13 May 2024 20:40:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B0A981BF2C0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D4D182849
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UaIZiutN8OAa for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 20:40:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9026882846
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9026882846
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9026882846
 for <buildroot@buildroot.org>; Mon, 13 May 2024 20:40:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F399A20002;
 Mon, 13 May 2024 20:40:39 +0000 (UTC)
Date: Mon, 13 May 2024 22:40:39 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240513224039.6aa3b261@windsurf>
In-Reply-To: <ZkDsA9NqjGG5GwdB@waldemar-brodkorb.de>
References: <ZkDsA9NqjGG5GwdB@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715632840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CzZZDxbIAQcK0YL69MwkS7JwK0HKdctgLesVisqX6I8=;
 b=MTRyKcKhumMU89oSULG/VeSosPWMFuu0ltTzZAl+Vo4+nuBsEJPbQo4tbLqCDyUPsqSeTC
 qgRfhaR3S+3zk6RPdZ1k8J1dAyhLGv6yT830HBdqpSvP4Tw+/5L2L06iwj9Eu5nGHmDEmy
 OY1CKv8tpmnbIFopAx+i7a8fAKaD2J7gvpY0XqPx70gVOtFoYIPmqdPV+YJUMLQjxhjaa7
 syuvrbM6BgZPbi9OoyvjFiWBXhUFEQDUSNDQ+bIqUWvT5dxxCW4YVHdiyYl+cajq6LH34y
 7ejwv68wFRHyP9T+m9BSD1FtRKlJ16mNylkQFpTg4II0VuAL/IdcOJeqfuGCvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MTRyKcKh
Subject: Re: [Buildroot] [PATCH] package/gcc: enable obsolete nios2 target
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

On Sun, 12 May 2024 18:19:15 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> +# allow to build gcc 14.x
> +ifeq ($(BR2_nios2),y)
> +HOST_GCC_FINAL_CONF_OPTS += --enable-obsolete
> +endif

Dammit, I applied, but in fact, this change should have gone in one
single place: package/gcc/gcc.mk, adding to HOST_GCC_COMMON_CONF_OPTS,
which is used for both the gcc-initial and gcc-final stage. So I did
this as a follow-up commit in
https://gitlab.com/buildroot.org/buildroot/-/commit/1c8bdef54213640e88b199466d1e504515c1a073.

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
