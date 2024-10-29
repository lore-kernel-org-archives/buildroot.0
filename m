Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A07D3A670
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 17:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CEB74010E;
	Tue, 29 Oct 2024 17:11:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uOrV4qM9WU_2; Tue, 29 Oct 2024 17:11:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E9E440119
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E9E440119;
	Tue, 29 Oct 2024 17:11:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C83959BA
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 17:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A0FC4010E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 17:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pjKIdFgVs2yH for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 17:11:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D90E2400ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D90E2400ED
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D90E2400ED
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 17:11:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA75920007;
 Tue, 29 Oct 2024 17:11:19 +0000 (UTC)
Date: Tue, 29 Oct 2024 18:11:18 +0100
To: Cherniaev Andrei <dungeonlords789@naver.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20241029181118.6db497b0@windsurf>
In-Reply-To: <20241029113052.1243078-1-dungeonlords789@naver.com>
References: <20241029113052.1243078-1-dungeonlords789@naver.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730221880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HXhlDJLD48KlbCGDIALuOSDO2xSuIKu1vzMEDV6Yy48=;
 b=BludXKzixKb2LcploKBj1wz0/Vw3sKrv85SkVYs9RBa8AnR843qLR1vtnXM0/St5UFoPAr
 zuIhEBOl7hTW8PWPZ3HgO8bFN/ncmZp7l1kWmg3I3qg0aO64fvA4stzcPtesyu0MRx0eko
 xaKs1t8sPCYEfFSnpBs3Kdo2zbbekrH0tbsZo8un0m8Zb49OyJWcVsPH1XsO9vEM9gyEfS
 cZChbvA2ifavLxGG4Hm4621D9G11kQoZoHVZBZzSLdH7b4dZasgQk+SetBPE/06f4gHtD6
 7syHDdEMiB5LrN0i499/IIMPHcOrqrmBbuXSL82NuV0KktKMypnrKeEjVle9vA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BludXKzi
Subject: Re: [Buildroot] [PATCH] support/kconfig: fix linux header path
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

On Tue, 29 Oct 2024 20:30:51 +0900
Cherniaev Andrei <dungeonlords789@naver.com> wrote:

> Usually you will never have "/usr/src/linux"... For example on my Ubuntu 24 I have "/usr/src/linux-headers-6.8.0-47-generic". My change makes path universal.

Thanks for your patch. However, it cannot be applied as you did not
Signed-off-by on your patch.

Also, please wrap your commit message to 80 columns.

> diff --git a/support/kconfig/README.buildroot b/support/kconfig/README.buildroot
> index 76808f85b4..c08970c87e 100644
> --- a/support/kconfig/README.buildroot
> +++ b/support/kconfig/README.buildroot
> @@ -2,7 +2,7 @@ This is a copy of the kconfig code in the kernel (currently 4.17-rc2) tweaked
>  to suit Buildroot.
>  
>  To update:
> -	cp -r /usr/src/linux/scripts/kconfig support/kconfig.new
> +	cp -r /usr/src/linux-headers-$(uname -r)/scripts/kconfig support/kconfig.new

I actually don't think /usr/src/linux-headers-$(uname -r) is any
better. Most people who are interested in this will have their Linux
kernel source code cloned from Git, in some totally different location.
So perhaps:

"""
To update, assuming $KSRC points to a Linux kernel source tree:
	cp -a $KSRC/scripts/kconfig support/kconfig.new
	...
"""

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
