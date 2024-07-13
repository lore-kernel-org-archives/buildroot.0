Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE40FC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 21:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FE70815CC;
	Sat, 13 Jul 2024 21:10:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3EMUHL0AGfZG; Sat, 13 Jul 2024 21:10:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84331816A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84331816A2;
	Sat, 13 Jul 2024 21:10:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD0921BF355
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 21:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9743412F9
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 21:10:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xim-NtZ0ox18 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 21:10:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6636A410E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6636A410E1
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6636A410E1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 21:10:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3710FF802;
 Sat, 13 Jul 2024 21:10:29 +0000 (UTC)
Date: Sat, 13 Jul 2024 23:10:28 +0200
To: Steffen Persvold <spersvold@gmail.com>
Message-ID: <20240713231028.3ac24ecc@windsurf>
In-Reply-To: <20240627103457.28001-1-spersvold@gmail.com>
References: <20240627103457.28001-1-spersvold@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720905029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H86YiIb5RePkoNQ1kqCx8FjswgAjsrx2fHjQY8Krw88=;
 b=FtQLttFoyZ0NW8MvwBADO/dVRpYTaGlDk0uW/ktZALkGFg4XoEjFLrl6rTwzmljs7sgI6+
 HhagoXBlKQhkXdHz6I+ehR8lTtxwg6nMDKUIUNMC6AXNfRLeBAS24e9B/C+ABqh+Yw8tH4
 ynZFk0vZU1VnpmjcDccTfyARitKOkX3+CH6/X8+64kmETL5NydZAFUWF+gZ0QIKLBQNLNF
 LrsPHIzoytIZPCALovdds0EhzmGHBcuKassq/6iBFkh7+x7OUzuxEVPPJAFRFq2m4DS75k
 pWkQtTiRV0cbkT5oXewD07hV5ggvPouq1dRKr6BPkaf6BV6ZF6YdHKwkLBZ0Fg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FtQLttFo
Subject: Re: [Buildroot] [PATCH] package/directfb: enable on riscv32 again
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

Hello Steffen,

On Thu, 27 Jun 2024 12:34:57 +0200
Steffen Persvold <spersvold@gmail.com> wrote:

> Newer 32bit architectures like RISCV32 and ARC are using 64bit time_t
> from the get go unlike other 32bit architectures, therefore aliasing
> __NR_futex to __NR_futex_time64 avoids the build error mentioned
> in cb6fd050.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c0f4168575fa85af933539441eea95a3b10dac91
> 
> Signed-off-by: Steffen Persvold <spersvold@gmail.com>
> ---
>  ...-__NR_futex-on-32bit-architectures-u.patch | 40 +++++++++++++++++++
>  package/directfb/Config.in                    |  2 -
>  2 files changed, 40 insertions(+), 2 deletions(-)
>  create mode 100644 package/directfb/0007-libdirect-define-__NR_futex-on-32bit-architectures-u.patch

Thanks for your contribution, applied to our master branch!

How of curiosity, are you actually using DirectFB on RISC-V 32-bit
platforms?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
