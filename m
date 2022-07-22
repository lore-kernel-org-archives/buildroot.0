Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E26C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 21:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC5B1423FA;
	Fri, 22 Jul 2022 21:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC5B1423FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6y3tKOxkKwwr; Fri, 22 Jul 2022 21:05:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A41A4237E;
	Fri, 22 Jul 2022 21:05:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A41A4237E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A4111BF215
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D916D60A72
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D916D60A72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gu7ru8W6uz-H for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 21:05:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3AA860ADD
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3AA860ADD
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 21:05:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C4E6B20002;
 Fri, 22 Jul 2022 21:05:04 +0000 (UTC)
Date: Fri, 22 Jul 2022 23:05:04 +0200
To: Ben Hutchings <ben.hutchings@mind.be>
Message-ID: <20220722230504.407c743d@windsurf>
In-Reply-To: <20220614161508.419275-1-ben.hutchings@mind.be>
References: <20220614161508.419275-1-ben.hutchings@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658523905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R+tJBI8Elt3tnavJ/1E+O6y/S4jZ3bs9u3tUVzdKaJo=;
 b=K7P6JRLcqF4XRl3SmQmNApKt1iTzgOmlvV7IF43xKSApxbbmFtuZjc+TUKWfFaorujQPYh
 2URDW+xH4yXRbpqlBAnlXr1vOAR1aN3rQDbEM3E/s3VdipA3kcCDbhb6xfCGJmBTX+TIuO
 eeqNXsYaePkGyjvmLs59jcRmmsppzCGJ7MJMAZnsz/3L2IbM8X+ow6SKiNV5YiCTll2Tsh
 rptWH6/g6oEzRiJW0ROP3gIMjUsssJ6tlHJ72BF3uXaz+raJoPewSUnHmBqqs/6Evpl8QO
 bIPJEKshwcYf3hQUC0TVeVCl2wOzwMmMqoJOBosUfap3XWgMTLBE1MJTKuUXIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K7P6JRLc
Subject: Re: [Buildroot] [PATCH] package/swupdate: Add upstream patch to fix
 build with uclibc
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

On Tue, 14 Jun 2022 18:15:09 +0200
Ben Hutchings <ben.hutchings@mind.be> wrote:

> Fix the following build failure with uclibc:
> 
> core/bootloader.c: In function 'register_bootloader':
> core/bootloader.c:28:15: warning: implicit declaration of function 'reallocarray' [-Wimplicit-function-declaration]
>    28 |  entry *tmp = reallocarray(available, num_available + 1, sizeof(entry));
>       |               ^~~~~~~~~~~~
> core/bootloader.c:28:15: warning: initialization of 'entry *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
> [...]
> .../arm-buildroot-linux-uclibcgnueabi/bin/ld: core/built-in.o: in function `register_bootloader':
> (.text.register_bootloader+0x2c): undefined reference to `reallocarray'
> 
> Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
> ---
>  ...der.c-fix-build-without-reallocarray.patch | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/swupdate/0001-swupdate-core-bootloader.c-fix-build-without-reallocarray.patch

Thanks a lot, applied to master after adding a reference to an
autobuilder failure that this patch is fixing. Many thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
