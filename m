Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0061CC25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C47C682D75;
	Mon,  6 May 2024 20:16:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nb-Cis1hQH9Q; Mon,  6 May 2024 20:16:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67C1382BC8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67C1382BC8;
	Mon,  6 May 2024 20:16:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A0F3B1BF3E8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DDD3403F9
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LoKts18borsJ for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:16:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 07A5A40108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07A5A40108
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07A5A40108
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:16:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1531A20002;
 Mon,  6 May 2024 20:16:40 +0000 (UTC)
Date: Mon, 6 May 2024 22:16:40 +0200
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20240506221640.50f0181c@windsurf>
In-Reply-To: <20240430204744.1014238-1-romain.naour@smile.fr>
References: <20240430204744.1014238-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715026601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yp+2A491lU3VYGnL8oR94J0gwKok6zeU5NBUgrQIjtk=;
 b=mEnGm60eEpoX4Dr3ywF6qI9fVz8R3Z4XI9j2eJa2X182vMXpYREFLUfIH6S+ujsHtbmTdZ
 wHaurjC210X+2eHfHjbzC55kf5J9Ne+rauhV/HSJc33SutlwYmCTSvET5kz3ORA5fUipCQ
 yYlUAazFv173IjAXgEfxdQSlMSplP7yJUKXKupD6HF+9qLwikTFjb9O80vOry1NGxDYiUh
 whJMlUu/ZI2lzSDDiFakzPAn3MSOfqB5iqyMMZh9ndOdIQT7BLDh8FI9LJG0opTLsVljlh
 8XaIBzwrx8Ykn58NJh3hoN84QGxi9kAl7ge4VRPw/PrdL6swACCCCuHkz/TOhw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mEnGm60e
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: TestPerlDBDmysql: use
 ext2 instead of cpio
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

On Tue, 30 Apr 2024 22:47:43 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> The CPIO filesystem generated by TestPerlDBDmysql is too large, and
> doesn't fit as an initramfs in the 256MB of RAM available in the
> versatilepb machine. This causes a failure while running a basic
> test "perl -MDBI -e '1'" since "/usr/lib/perl5", and many files
> being missing from the root filesystem, ultimately causing the test
> to fail.
> 
> Can't locate DBI.pm in @INC (you may need to install the DBI module)
> (@INC entries checked: /usr/lib/perl5/site_perl/5.38.2/arm-linux
> /usr/lib/perl5/site_perl/5.38.2 /usr/lib/perl5/5.38.2/arm-linux
> /usr/lib/perl5/5.38.2).
> 
> It would make sense to switch all test cases to use ext2 + a
> hard-drive, but for now, let's fix the few test cases that are causing
> problems.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/6735654506
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  support/testing/tests/package/test_perl_dbd_mysql.py | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Both applied, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
