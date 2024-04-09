Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF06CD128A
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 20:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45EC060E33;
	Tue,  9 Apr 2024 20:35:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PUG5ZOhUjKV6; Tue,  9 Apr 2024 20:35:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C6106076D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C6106076D;
	Tue,  9 Apr 2024 20:35:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B0B9C1BF3A4
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 20:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BE8F8134D
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 20:35:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fplcbO8itntc for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 20:35:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 371018133C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 371018133C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 371018133C
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 20:35:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 73E5B13F89A;
 Tue,  9 Apr 2024 22:35:37 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 09 Apr 2024 22:35:37 +0200
Date: Tue, 9 Apr 2024 22:35:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZhWmmaKyYDHbqNQA@landeda>
References: <20240408205742.1422545-1-yann.morin.1998@free.fr>
 <20240409215100.7440fd16@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240409215100.7440fd16@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712694941;
 bh=y+xAiSbLcy+A8MYKCkqF0gkjBjHWEO7BdcnxPEorFdM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dH3hW1T9O1uru3LFGW4MlPtSlRtK+6D4AWmalOgQbPVY5smVg8pQKXaE+jL2Gq8az
 6faFtxgzKgU4vtD0OJyCRf3lvKSCI7HY7g+ViL8k767qhMW+LbRfVrYMKxpVFB7Hq7
 Y5kB3OkXjy+yuHaK1db6YsaPfzbpkYKChj1sNI2B7oPD2y2XnA3HdnfqLmwbTSmsN9
 5TgRfqsB1UEaUsoKKPzasXAwsJ1Fgs4JFsNbdTB7dmzlo2XjkA57AwXHtAVppuHk4Z
 eRPx49V1Qr7o13yQSQ6f2v4GjF4EQ5h1Ry/CF09CviqxeghwIf9ynGVnMFJXH5xWWV
 HVzMvWWk6NR9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dH3hW1T9
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-04-09 21:51 +0200, Thomas Petazzoni spake thusly:
> On Mon,  8 Apr 2024 22:57:42 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > Note: this commit only deals with glibc and its internal libcrypt (or
> > lack thereof); other C libraries, musl and uClibc-NG, are not considered.
[--SNIP--]
> >  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
> >  TOOLCHAIN_EXTERNAL_LIBS += libnss_files.so.* libnss_dns.so.* libmvec.so.* libanl.so.*
> > +# Note: explicitly do copy libcrypt*.so.* even for glibc: it is not the same
> Are you sure you wanted to say libcrypt*.so.* here? Didn't you want to
> say libcrypt.so.1 ?

Damned, I missed that. Yes, this is about "libcrypt.so.1" explicitly.

> If you wanted to say libcrypt.so.1, then the patch is fine for me and
> you can add my
> 
>   Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Good, I'll respin.

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
