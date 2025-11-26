Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB54D1037B
	for <buildroot@archiver.kernel.org>; Wed, 26 Nov 2025 11:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 770F283BE0;
	Wed, 26 Nov 2025 11:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05chUPXBIipj; Wed, 26 Nov 2025 11:18:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F08683BE3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F08683BE3;
	Wed, 26 Nov 2025 11:18:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B355F2A9
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 11:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FE9083BE3
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 11:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4YzygcLHqWDB for <buildroot@buildroot.org>;
 Wed, 26 Nov 2025 11:18:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8BD1B83BE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BD1B83BE0
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BD1B83BE0
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 11:18:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id CF53FC15D77
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 11:17:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 93D0E60721;
 Wed, 26 Nov 2025 11:18:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D35AA102F08C9; Wed, 26 Nov 2025 12:18:13 +0100 (CET)
Date: Wed, 26 Nov 2025 12:18:12 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20251126121812.07aa86a2@windsurf>
In-Reply-To: <20251124213735.1553096-1-bernd@kuhls.net>
References: <20251124213735.1553096-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1764155894; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=OQzIgxUo6mlChI8w+zXsNeovASGG9485rO0WY0K9/0U=;
 b=iDCM9GXfddr07nr/OSV6+0egTCa+A/rQzyik6KiVHkQjndYJAlbsSLmjiyAF5vpmbvsHPG
 1amQIZkI9x40Kwrr28b1O2GlZlOcFQlAQq7Oaol2rhPjrFtg/UM9wXPteJ9MuOxkLAuITm
 3NcTxP7CJeDdLjbPHme4dBu3W9bdJmr+WcwEDI2t2FDlJFtlprjca14j1CcXUblRbP+K5d
 wuJIDMGYHGl5DiLH7GkTWKcF/ewgbmQmrHDJQZH6N0gCBDZuSL/888EOJJSbkl5i1z+3Cu
 6Y+XYjctkcxcz95e8IKv3EqNQu/gvIsl6/0jfoubM3Ws/Vz128yVMStOk+361Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=iDCM9GXf
Subject: Re: [Buildroot] [PATCH 1/1] autobuild-run: also save Meson config
 log files on package failure
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

Hello Bernd,

On Mon, 24 Nov 2025 22:37:35 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  scripts/autobuild-run | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 4987c61..0e4e4bf 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -627,7 +627,7 @@ class Builder:
>              srcroot = os.path.join(self.outputdir, "build", '-'.join(reason))
>              destroot = os.path.join(self.resultdir, '-'.join(reason))
>              config_files = ('config.log', 'CMakeCache.txt', 'CMakeError.log',
> -                'CMakeOutput.log')
> +                'CMakeOutput.log', 'meson-log.txt')

Thanks for the patch, but are you sure you are using the latest master
of the buildroot-test repo? Indeed the exact same change was made by
Peter in September:

	https://gitlab.com/buildroot.org/buildroot-test/-/commit/a70791686ab3c4636bb2b6b3ae7736c78f1652e3

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
