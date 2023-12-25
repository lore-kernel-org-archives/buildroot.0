Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C4EC3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 10:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94BC4415CF;
	Mon, 25 Dec 2023 10:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94BC4415CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GoNhxlmyRF50; Mon, 25 Dec 2023 10:15:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4359401BD;
	Mon, 25 Dec 2023 10:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4359401BD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF6C81BF94D
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 10:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97A83401BD
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 10:15:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97A83401BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YnK79JGNFZ5P for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 10:15:42 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F23C4013F
 for <buildroot@buildroot.org>; Mon, 25 Dec 2023 10:15:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F23C4013F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0FE41E0002;
 Mon, 25 Dec 2023 10:15:38 +0000 (UTC)
Date: Mon, 25 Dec 2023 11:15:37 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231225111537.7d46ac11@windsurf>
In-Reply-To: <20231130191305.5345-1-fontaine.fabrice@gmail.com>
References: <20231130191305.5345-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703499339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2EZMEpOq3DVGqRUZXA0VG2uTQPJFRXNyFWyPgk9+4Is=;
 b=dAzuVU3xM5YyjJ9tmVMIP3s3ZyDB+TC1e6DXjjB++R29Rdwj9iZ0XmuB208Jw9G8mdAYGh
 v+9uPc+6hbl7wZlJGS/Aox567mMptdB2opXdXgOy0PpCUAeQBLvXICisfXkRqsldKKa0hs
 6M3iLwejiiTP0VEZ+IerwOVXeetaGeGJL3LXf29CaLfXbCCJLZbU2tA9k5KxDAdfnQtB6i
 sEhp2GLtkdmTSquxggl/wVZjrBMClfmiOTb2V/J1KhG5WJ+uhnWY7vsrvj1TD5uuMAo/3E
 GiEfL1poaW7YjGXBilVOL+7C0X2SCAyq7quPr4oAps0V9aYF1XZbEoZ9mVSEew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dAzuVU3x
Subject: Re: [Buildroot] [PATCH 1/1] package/libselinux: fix build with
 BR2_TIME_BITS_64
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 30 Nov 2023 20:13:05 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This LFS workaround for glibc < 2.23 was added in 2016 by commit
> ebcca24c953d8df4b16bc52c5ba31feae4ed8ad0 and is probably not needed
> anymore as glibc 2.23 was released in February 2016:
> https://sourceware.org/glibc/wiki/Release/2.23

We still have in our external toolchains
toolchain/toolchain-external/toolchain-external-codesourcery-arm/,
which is a toolchain from 2014, and it uses glibc 2.18. So I suspect
this change would break with this glibc toolchain. However, this older
glibc toolchain will clearly not support 64-bit time_t.

So either we decide that we stop supporting anything older than glibc
2.23, or we have to add some condition on the version of glibc being
used.

Let's see the opinion of the other maintainers.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
