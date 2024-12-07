Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F69CE7717B
	for <buildroot@archiver.kernel.org>; Sat,  7 Dec 2024 20:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C746606C9;
	Sat,  7 Dec 2024 20:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TAOzg2MFfxpC; Sat,  7 Dec 2024 20:47:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97B8960659
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97B8960659;
	Sat,  7 Dec 2024 20:47:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8794ED7
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 20:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 775576062F
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 20:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJF6mwIRp5gd for <buildroot@buildroot.org>;
 Sat,  7 Dec 2024 20:47:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7575160640
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7575160640
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7575160640
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 20:47:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 559F4240002;
 Sat,  7 Dec 2024 20:47:33 +0000 (UTC)
Date: Sat, 7 Dec 2024 21:47:32 +0100
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
Message-ID: <20241207214732.69709f7f@windsurf>
In-Reply-To: <20241207203633.598905-1-geomatsi@gmail.com>
References: <20241207203633.598905-1-geomatsi@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1733604453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7X8NaykECHIWcUh/DviyyLXI1kegPHaW1NIvoOIFwnE=;
 b=L91zFtiEnX3mI3IuDJs0CSJUgjPRVsT2hjHP8RyaJpaQiqakZTzyB+0hlvVTe+wa0pFKFV
 V79G/rGuqPjmrp92s3DjpxFwlEcCQmf8PFTKa3M/YmB1CKBCCFwPFPym9X7lZVbG6TuXmh
 vy0cbB3eBXscURtdzFWdf9n2XqetZwuoEiDExovpDtJGVh3LdFLeBIKMx7gk8230LwAsmK
 9qPtwKz1gVYtQc/GdsRC3JY5LTs5gX4grXD8BZMbdpPwPUIM2P/Wbq8EVzodC9rRaO+Hsi
 mc4rf+iXFAMCaUU2j9taA+2yVX7NuTz6OaeLI73d8NHInzARLGS44K7rZOWgHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=L91zFtiE
Subject: Re: [Buildroot] [PATCH] toolchain: follow symlinks in ld.*so.*
 install helper
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

Hello Sergey,

On Sat,  7 Dec 2024 23:36:26 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> Current toolchain install helper fails to setup external toolchains with
> merged-usr sysroot. It does not follow lib symlinks when looking for
> ld.*.so.* files. As a result builds fail with various linker errors.
> Follow symlinks in find tool when installing ld*.so.* linker scripts
> from external toolchain directory to staging and target directories.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Thanks for the patch!

I need to get back to my backlog, but I believe I had investigated some
toolchain issue, and came back to the same patch/change as you.

This regression was introduced by commit
92207bc03f2358b28e0fd2cc3a41e40504b5d3d4 ("toolchain: handle toolchains
with multiple ld*.so.* files").

I am wondering how I got to debug this? Are there some autobuilder
issues?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
