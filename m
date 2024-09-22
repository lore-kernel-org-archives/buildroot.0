Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0BFCF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46D2B80CCA;
	Sun, 22 Sep 2024 10:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UFXPXgnnat4e; Sun, 22 Sep 2024 10:06:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5022D80CE2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5022D80CE2;
	Sun, 22 Sep 2024 10:06:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 398BB1BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27CAA400FC
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9AbSeDVzVy6c for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:06:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ADE9C40022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADE9C40022
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADE9C40022
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:06:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9FC320003;
 Sun, 22 Sep 2024 10:06:38 +0000 (UTC)
Date: Sun, 22 Sep 2024 12:06:36 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240922120636.30649fc3@windsurf>
In-Reply-To: <20240922092312.2061358-4-dario.binacchi@amarulasolutions.com>
References: <20240922092312.2061358-1-dario.binacchi@amarulasolutions.com>
 <20240922092312.2061358-4-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726999600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=niSv4KTWPONRLWaGdXQdboYYA/4MG593fSwQ1PZqpAQ=;
 b=p5j3qIIUaZqXCcED3ZWCOa+2RVHzIrnsWol2eOeZSV6Z2/zLwkjLI9cnwgABWF0xjmM9kH
 RiohTX0ixyPlFVRvnPCxXvl4RU/8t4sfiCjd1+mhRmY10cJvAwYoeDkoB+kTztByKmQfl3
 M7MA8dHuItwno1t+xuJIl/YoWk8cFdOYv24Of7bKThym0f0vDvjwXtnP8nseWGBVXvfXjv
 96t50AwNCV3Dxa3ITUyF1PFo47RSR0XSMeF+aEbkfAbEiz15MCXEfEDz0rql5d8rhXsFt0
 ES5IUHTUMjty3stf5xOthPFtfhTA34HxO7w1tfo2bMwwqrI5LdubZ6Tu3RINKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=p5j3qIIU
Subject: Re: [Buildroot] [PATCH v2 3/9] arch: make FDPIC dependent on
 toolchain support
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
Cc: Romain Naour <romain.naour@gmail.com>, yann.morin.1998@free.fr,
 buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 linux-amarula@amarulasolutions.com,
 Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dario,

Thanks for reposting this patch series after our discussion last
week-end!

On Sun, 22 Sep 2024 11:23:06 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
> 
> FDPIC support on ARM requires a certain target name, and therefore is
> only currently available with the Buildroot toolchain. In addition,
> only uClibc-ng supports FDPIC on ARM at the moment.
> 
> This may need to become more complicated if we end up in a situation
> where each libc supports FDPIC on a different set of architectures.

However, I think this patch is incorrect, or more precisely it's not
how we want to handle things. Instead, what we want is:

- For internal toolchains, that C libraries that don't support FDPIC
  are made unavailable when FDPIC is selected. So basically I would add
  a depends on BR2_BINFMT_ELF to BR2_PACKAGE_GLIBC_ARCH_SUPPORTS and
  BR2_PACKAGE_MUSL_ARCH_SUPPORTS. In practice this will be a no-op as
  glibc and musl already have a "depends on BR2_USE_MMU", and FDPIC can
  only be selected on noMMU systems.

- For external toolchains, I would make sure that the ARM toolchains
  properly depend on the relevant BR2_BINFMT_* option.

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
