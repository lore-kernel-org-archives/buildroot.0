Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DD2C67861
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 19:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBFD860E25;
	Tue,  9 Apr 2024 19:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AnQ-FbtDNxdN; Tue,  9 Apr 2024 19:51:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF4BA60E4B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF4BA60E4B;
	Tue,  9 Apr 2024 19:51:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE4641BF59E
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 19:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C09524168B
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 19:51:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AsP3I7-9uHre for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 19:51:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 280FE415B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 280FE415B9
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 280FE415B9
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 19:51:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FCF4C0007;
 Tue,  9 Apr 2024 19:51:01 +0000 (UTC)
Date: Tue, 9 Apr 2024 21:51:00 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240409215100.7440fd16@windsurf>
In-Reply-To: <20240408205742.1422545-1-yann.morin.1998@free.fr>
References: <20240408205742.1422545-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712692261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=05/9FbTb6dTPoBHbaGXNHCmMxzBOiXe9klo3A0yUhyg=;
 b=drfz4DKvh2sMKQPh27EdM+6Kb6NziO/i3Xq7/Y4cyVJzs/PhmhOHXQEw/6buR5hpTh1Zhr
 SLMw5QMujFDpwmTPwVF7zgsINmIpFjiZPkbZpzbEBEITeNfAQLalNx4fVDX4xPVntdMxfD
 13/eloHXP6KpthYUQADb1o/PgTIj83HafrSUsOWlPn9yBSp0Z6QIBaF6zMCEp9nunRhFTr
 fGTQGgujPblhMlSvKPLYLn2DvwAoepI9Zr1jT73FdM7tFWaixIY3C4htbuHD8kaUTbT5SJ
 XpGkYHMNAp1s2q7BEhav8wS6GACMxW8KUq1MpFIoGMtCq5+qKdar8MH+O9qV2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=drfz4DKv
Subject: Re: [Buildroot] [PATCH] toolchain/external: remove libcrypt from
 glibc
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann

On Mon,  8 Apr 2024 22:57:42 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Note: this commit only deals with glibc and its internal libcrypt (or
> lack thereof); other C libraries, musl and uClibc-NG, are not considered.

[snip]

This all looks reasonable to me. One comment below, though.

>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
>  TOOLCHAIN_EXTERNAL_LIBS += libnss_files.so.* libnss_dns.so.* libmvec.so.* libanl.so.*
> +# Note: explicitly do copy libcrypt*.so.* even for glibc: it is not the same

Are you sure you wanted to say libcrypt*.so.* here? Didn't you want to
say libcrypt.so.1 ?

If you wanted to say libcrypt.so.1, then the patch is fine for me and
you can add my

  Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

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
