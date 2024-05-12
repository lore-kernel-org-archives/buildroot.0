Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DFCC10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 07:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73A144010C;
	Sun, 12 May 2024 07:07:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dulCrIk5h1mA; Sun, 12 May 2024 07:07:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8053A401CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8053A401CC;
	Sun, 12 May 2024 07:07:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09B481BF473
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB23E8409D
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:07:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKvIAwiZ0yES for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 07:07:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8837584091
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8837584091
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8837584091
 for <buildroot@buildroot.org>; Sun, 12 May 2024 07:07:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5535E60003;
 Sun, 12 May 2024 07:07:26 +0000 (UTC)
Date: Sun, 12 May 2024 09:07:25 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240512090725.2ea1dd6b@windsurf>
In-Reply-To: <Zj91Z07zMX8i02Ut@waldemar-brodkorb.de>
References: <Zj91Z07zMX8i02Ut@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715497646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jd/QYqZfatYtclcdmxWgVfELDG4FZR8KQ607wX1/yJ4=;
 b=KWm4sTpBEiLImcU1TNqdJ+s3USnwW5erjKpadNisG0ls4PpAv7lMR5LtaqOMEWC4hAYB+n
 DycDtLZxesABaPrMk6iWXjMm8KYry9e+X9YM1Mc811Ps/JIrWC56dfUCLjRFy28tJYEE8F
 ysSTUgcf0By78uSco1a9yFWcLWu8X2XPHsFZVLOETFVQWHqAWONAwKTPAtEFNZm/cBNP4k
 dykkdz6DjgeTdkGHlACQDHV8XjKymazuLXxajibyfzA1eb+WWhAxFjPs3ELZZHKQccgkTh
 1InTBxBC9rG/BH1wV3WZTqaCW1XYy+EHXoOa6e+SiVl6SHyJc0Oi6TxSTlFhQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KWm4sTpB
Subject: Re: [Buildroot] [PATCH] package/uclibc: enable Linuxthreads for
 riscv64
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

On Sat, 11 May 2024 15:40:55 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Since commit:
> https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=1640c262dc63e2f8f43c0728dbe867c8fffe3e9d
> 
> Linuxthreads support for riscv64 was added to uClibc-ng.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/uclibc/Config.in | 1 -
>  1 file changed, 1 deletion(-)

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
