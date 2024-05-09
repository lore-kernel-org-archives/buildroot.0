Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2392C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C233418AB;
	Thu,  9 May 2024 16:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OlP7_toal0B2; Thu,  9 May 2024 16:07:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AA0841B4B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AA0841B4B;
	Thu,  9 May 2024 16:07:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B37EE1BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F82B41B4B
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HeV4wf07Mz7H for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:07:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 57A0A418AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57A0A418AB
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57A0A418AB
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:07:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D71D21BF206;
 Thu,  9 May 2024 16:07:32 +0000 (UTC)
Date: Thu, 9 May 2024 18:07:32 +0200
To: Zenichi Amano <zenichi.amano@gahojin.co.jp>
Message-ID: <20240509180732.23542b3f@windsurf>
In-Reply-To: <20240423062020.2543618-1-zenichi.amano@gahojin.co.jp>
References: <20240423062020.2543618-1-zenichi.amano@gahojin.co.jp>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715270854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RREuG0nVUgPhl5JZbRQEV3B+PvkNfHxtin1NXQoXl6Y=;
 b=Eui19Yt/WkokKdfPXIJpOCwKBoZHAcOT9Zojj4/gGaIx2bzzW48rFc0dWYBr7aR8LwyfxF
 GxxHPcMHzJmMX1IUQ/Lz/BsS8taVUBxhM2OObMECjJbzzcY0pGc4boaXRJSSfkrUM75ukB
 n0Te8XQQ/MRQUQxmIUjCDGb5Z0f6jp2UqmGIxb4iT8nKSG9qANbhPA8h6Fx1onfp24JBqu
 ti+q/RSZMuykVdyY14vbkywO+IK9vPmqVsl4CuY49bC8O3jDWQgbxZFQTUsy+ViXseX4b7
 HgUQiQ4uNEbhGuAzsl7m+GHEpGFrhkiBIt+3tsRK3xkEFJ6AV/X6SysummaIbg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Eui19Yt/
Subject: Re: [Buildroot] [PATCH 1/1] package/pcsc-lite: bump version to 2.1.0
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

Hello Zenichi,

Thanks a lot for your patch! I have a request below.

On Tue, 23 Apr 2024 15:20:20 +0900
Zenichi Amano <zenichi.amano@gahojin.co.jp> wrote:

> +ifneq ($(BR2_PACKAGE_POLKIT),y)
> +PCSC_LITE_CONF_OPTS += --disable-polkit
> +endif

We really like to have both sides of the conditions explicitly, i.e
something like:

ifeq ($(BR2_PACKAGE_POLKIT),y)
PCSC_LITE_CONF_OPTS += --enable-polkit
PCSC_LITE_DEPENDENCIES += polkit
else
PCSC_LITE_CONF_OPTS += --disable-polkit
endif

or, if you're not interested in testing the polkit support, you can
also just unconditionally pass --disable-polkit, and let someone else
interested by polkit support look into this topic.

Indeed, your change is incorrect, as BR2_PACKAGE_POLKIT=y implies that
polkit is enabled, but not that it has been built before. So with your
change, it is possible that pcsc-lite gets built before polkit... and
you don't pass --disable-polkit in this case.

Could you have a look at providing an updated patch?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
