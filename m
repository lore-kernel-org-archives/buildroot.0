Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE677C021AA
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 19:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 952976058C;
	Sat, 14 Sep 2024 19:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2bFaYoxIday2; Sat, 14 Sep 2024 19:00:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B0DC6062C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B0DC6062C;
	Sat, 14 Sep 2024 19:00:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D046D1BF31D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 19:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B995F406E4
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 19:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qczJUiuR1GtT for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 19:00:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5D9CC406CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D9CC406CF
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D9CC406CF
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 19:00:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B44340003;
 Sat, 14 Sep 2024 19:00:32 +0000 (UTC)
Date: Sat, 14 Sep 2024 21:00:30 +0200
To: Yu Chien Peter Lin via buildroot <buildroot@buildroot.org>
Message-ID: <20240914210030.20a1d5fe@windsurf>
In-Reply-To: <20240910062635.4193650-2-peterlin@andestech.com>
References: <20240910062635.4193650-1-peterlin@andestech.com>
 <20240910062635.4193650-2-peterlin@andestech.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726340432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P6F4OwBdTGqRXX6pmZl+eYhaAuphRUMLW1+gKgH6pCk=;
 b=csWrBjV3XjRbqVm2M6zUrmeTuIlYCb54Rc0bQWQKMXbn4pHn2OJOv0vAcui9O/7Z2sLlBM
 koRWy6j8zjLKJ80ES7e5WiVM4ufJKPxJMeKiyowA4p5Ib1BrAM2+EAsJ6v8Uh79OnYErxx
 8pOrZ9zbZRTnPvVbHdAsib1mrs50vR0dJigJVhFEqaSthEEoEQb8UapGE1ya3KFrND13D5
 IASMYJyp+bi8aTy+UU6fOO+5LqSaepmqEPShW6JXfz5eJE3udQZ8NT9pBWIBF0svkkdRLw
 UaOc9m3pATuiNF1GTWSYpKxiRTfMsKs0bViTZSfRAcaUTbldAKKkSaTemmqjfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=csWrBjV3
Subject: Re: [Buildroot] [PATCH v3 1/4] package/andes-spi-burn: new package
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
Cc: tim609@andestech.com, Yu Chien Peter Lin <peterlin@andestech.com>,
 ycliang@andestech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 10 Sep 2024 14:26:32 +0800
Yu Chien Peter Lin via buildroot <buildroot@buildroot.org> wrote:

> Add a new package for Andes AE350 SPI_burn tool to program
> flash memory.
> 
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>

Thanks for this new iteration. Unfortunately, there's still something
that doesn't work. It fails to build for me with:

/usr/bin/ld: cannot find -lm: No such file or directory
/usr/bin/ld: cannot find -lc: No such file or directory
collect2: error: ld returned 1 exit status
make[1]: *** [Makefile_SPIburn_linux:25: SPI_burn] Error 1

that's because you link with -static, and I don't have the static
version of libc/libm installed on my machine.

So I wanted to patch that out, but the code is not even in the Github
repo at https://github.com/andestech/meta-andes/, so I can't create
a pull request. All you have published is a ZIP file with the source
code, buried deep inside the meta-andes Yocto layer repository. This
really isn't nice, and prevents people (like me) from actually
contributing fixes (like removing this bogus -static flag).

Could you instead create a proper Github repository for this project,
so that people can submit fixes, so that you can do tags, releases, etc.

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 069965680b..aab5a6c05f 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2487,6 +2487,7 @@ N:	Yu Chien Peter Lin <peterlin@andestech.com>
>  F:	board/andes
>  F:	configs/andes_ae350_45_defconfig
>  F:	package/kmon/
> +F:	package/andes-spi-burn/

Alphabetic ordering is not correct here.

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
