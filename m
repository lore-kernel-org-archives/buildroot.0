Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E79C35FE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 08:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81B4581C40;
	Sun, 15 Sep 2024 08:10:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RIdxQIA-57cJ; Sun, 15 Sep 2024 08:10:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96B6F81DED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96B6F81DED;
	Sun, 15 Sep 2024 08:10:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 014C81BF47D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E44E24028E
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYVoUvgOgJes for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 08:10:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AF31040136
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF31040136
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF31040136
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 08:10:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B61320002;
 Sun, 15 Sep 2024 08:10:26 +0000 (UTC)
Date: Sun, 15 Sep 2024 10:10:25 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240915101025.24a760b1@windsurf>
In-Reply-To: <20240915043131.1394319-1-james.hilliard1@gmail.com>
References: <20240915043131.1394319-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726387827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P3BvV55Yf3Yrds6Y9/aY002WZH2txlHxDYpJyvveoLU=;
 b=m9VmOrAynLpPyZ7JsQoE62S/I6zI9LvaxY6WIVVNY/x9OooqaI1J0rIfpH92GvvarIESrY
 wWCrJOJQY5yYReAwod5eJ+nhkPBiql4emTfJMrvAiHYvylvUmkp4iwLrTIul+Tn5F0ooPH
 NpF/oGBbiex/HrSSznnmECcmwmxME59kB6pet0rp53XtJ9CyEoP0JqTcwU7oTed2auupfK
 GkZ1CaGC3gGg4SP0Cy7YfJXxA/GrZw5RCUkIhbRTrrdqiyswjRRSDBEoZ5UrhKS5CLYjyC
 8J1pX2QBaPppLlMJizmOLREJW35mfdbF1e1vAlYhyKhMN9NRW7mfYhlmOiMvaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m9VmOrAy
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cssutils: bump to
 version 2.11.1
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 Sep 2024 22:31:31 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Also on this one, edited the commit message to mention that the license
file was renamed, but not changed. Here as well, pretty obvious, but
better said than silenced.

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
