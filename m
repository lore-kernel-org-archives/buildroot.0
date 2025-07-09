Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4458AC83F0A
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 20:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75D12406F4;
	Wed,  9 Jul 2025 20:55:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UxWW6Ay7S27b; Wed,  9 Jul 2025 20:55:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3AA5406A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3AA5406A5;
	Wed,  9 Jul 2025 20:55:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ED03615F
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 20:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3813405AC
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 20:55:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYy6F5T9qzFy for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 20:55:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC42C40594
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC42C40594
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC42C40594
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 20:55:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3DDA844383;
 Wed,  9 Jul 2025 20:55:23 +0000 (UTC)
Date: Wed, 9 Jul 2025 22:55:22 +0200
To: Julien Olivain <ju.o@free.fr>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20250709225522.0a12e583@windsurf>
In-Reply-To: <20250705174708.A26BE85FEA@busybox.osuosl.org>
References: <20250705174708.A26BE85FEA@busybox.osuosl.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefkeehjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduueevhefhheelkefggeevvdffjeetvdetgefhgedtiedukedvfeeltdfgleeuvdenucffohhmrghinhepsghuihhlughrohhothdrohhrghdpsghuihhlughrohhothdrnhgvthdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehjuhdrohesf
 hhrvggvrdhfrhdprhgtphhtthhopehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1752094523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ELN+0Wpehuew5gtVxzKpEBkxLI9Ez/H208sY+vhXeB4=;
 b=m5l9tZAJ2FXKeEZg0H+pTORK9RroY2UEQTtU2Aun2u0aVk50gtlCjC9cd+rG9vUmayMm0m
 a3CwGLI7pvLt9ulSr/K/T5ahp0YVIVbiFCFAWGrfWKSuemRORdZxmL3wut6G4akWrkJnI9
 uqm/F1J8x8wekzMlZefFSKtXPFgE7ZmmC5USY2tCVkYr92HVSy5gwGhZR2tBAjih7eXAi/
 u6V+N7ILyYTlw5gBdCRsRCZU8JKD83ssRewz7LR6bz4aGSoqcY1UcLWybc82Z9NKkUKSIy
 KUuVbhtfok3lsDoI7VL3ZNfc+2FRUWxQqYVDpCzgexLQiM2HOuZD5pZ1ms7pbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m5l9tZAJ
Subject: Re: [Buildroot] [git commit] arch: Introduce LoongArch64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

This commit seems to be causing build issues in
host-gcc-initial-14.3.0. See below.

On Sat, 5 Jul 2025 19:45:38 +0200
Julien Olivain via buildroot <buildroot@buildroot.org> wrote:


> +config BR2_GCC_TARGET_ARCH
> +	default "loongarch64" if BR2_loongarch64_generic
> +	default "la64v1.0" if BR2_loongarch64_v1_0

This particular arch value is not known to gcc 14.3.0, causing this
build failure:

Unknown arch in --with-arch=la64v1.0
make[1]: *** [Makefile:4546: configure-gcc] Error 1
make[1]: Leaving directory '/home/buildroot/instance-0/output-1/build/host-gcc-initial-13.4.0/build'

See:

https://autobuild.buildroot.org/results/04a904f08d6e0aacbd308692c99e77a334d72b95/build-end.log

See:

https://autobuild.buildroot.net/?arch=loongarch64

for all loongarch64 build failures.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
