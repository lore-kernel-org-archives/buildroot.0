Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71714D767F2
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 18:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FEA640288;
	Thu, 31 Oct 2024 18:07:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A8iIsEe3tX5C; Thu, 31 Oct 2024 18:07:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5FD8402A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5FD8402A0;
	Thu, 31 Oct 2024 18:07:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 582165E4F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4847260B10
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G3uPMRb4YGtV for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 18:07:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E1DD860AE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1DD860AE6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1DD860AE6
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:07:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 88980240004;
 Thu, 31 Oct 2024 18:07:16 +0000 (UTC)
Date: Thu, 31 Oct 2024 19:07:15 +0100
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Buildroot Development <buildroot@buildroot.org>, Edgar Bonet
 <bonet@grenoble.cnrs.fr>, Brandon Maier <brandon.maier@collins.com>, Dario
 Binacchi <dario.binacchi@amarulasolutions.com>, Ben Wolsieffer
 <Ben.Wolsieffer@hefring.com>
Message-ID: <20241031190715.795e9189@windsurf>
In-Reply-To: <20241030100404.43847-3-bagasdotme@gmail.com>
References: <20241030100404.43847-3-bagasdotme@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730398037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N6m9qqqRvCSKzTNfqXX2NmgJuLixIqOsLlItYziMx30=;
 b=EZVKi0aotuDJa5W6HVaiDCi2qkdu6GxThc4Pa/51JvgnyzEKgyegbAINLmDfLvczprbmMm
 cgCPbBLPKfqxMjQ/vfFopwQG/H+589xkFpLME2YcgaS1ElzruvRXi/pg1gopnFTlej1TQe
 JZ1p/qezL5b84lQuhgk/G3qTRziUkjVLcbBWqLJuB22B+CqyE6pggR57yHrW9sigBacZsF
 RtI/5RrnfikqsMkcyU73Sq6gHR/meO2rn1LGSw1UJBz4EK5prfr/v/sFHk1FnwMrJTPWa2
 +Fiw5j5ozZzvLXH2WquD1q1kmZz8GRBU6apo0LoWEY++Nv10Ksqbb90qxvKUkg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EZVKi0ao
Subject: Re: [Buildroot] [PATCH v2] package/git: fix wchar-less uclibc build
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

On Wed, 30 Oct 2024 17:04:03 +0700
Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> The package fails to build on wchar-less uClibc-ng configuration
> (i.e. without BR2_TOOLCHAIN_BUILDROOT_WCHAR selected):
> 
> ```
>     CC t/unit-tests/unit-test.o
> t/unit-tests/clar/clar.c: In function 'clar__assert_equal':
> t/unit-tests/clar/clar.c:767:23: error: unknown type name 'wchar_t'
>   767 |                 const wchar_t *wcs1 = va_arg(args, const wchar_t *);
>       |                       ^~~~~~~
> In file included from t/unit-tests/clar/clar.c:13:
> t/unit-tests/clar/clar.c:767:58: error: unknown type name 'wchar_t'
>   767 |                 const wchar_t *wcs1 = va_arg(args, const wchar_t *);
>       |                                                          ^~~~~~~
> t/unit-tests/clar/clar.c:768:23: error: unknown type name 'wchar_t'
>   768 |                 const wchar_t *wcs2 = va_arg(args, const wchar_t *);
>       |                       ^~~~~~~
> t/unit-tests/clar/clar.c:768:58: error: unknown type name 'wchar_t'
>   768 |                 const wchar_t *wcs2 = va_arg(args, const wchar_t *);
>       |                                                          ^~~~~~~
> t/unit-tests/clar/clar.c:769:65: warning: implicit declaration of function 'wcscmp' [-Wimplicit-function-declaration]
>   769 |                 is_equal = (!wcs1 || !wcs2) ? (wcs1 == wcs2) : !wcscmp(wcs1, wcs2);
>       |                                                                 ^~~~~~
> t/unit-tests/clar/clar.c:784:23: error: unknown type name 'wchar_t'
>   784 |                 const wchar_t *wcs1 = va_arg(args, const wchar_t *);
>       |                       ^~~~~~~
> t/unit-tests/clar/clar.c:784:58: error: unknown type name 'wchar_t'
>   784 |                 const wchar_t *wcs1 = va_arg(args, const wchar_t *);
>       |                                                          ^~~~~~~
> t/unit-tests/clar/clar.c:785:23: error: unknown type name 'wchar_t'
>   785 |                 const wchar_t *wcs2 = va_arg(args, const wchar_t *);
>       |                       ^~~~~~~
> t/unit-tests/clar/clar.c:785:58: error: unknown type name 'wchar_t'
>   785 |                 const wchar_t *wcs2 = va_arg(args, const wchar_t *);
>       |                                                          ^~~~~~~
> t/unit-tests/clar/clar.c:787:65: warning: implicit declaration of function 'wcsncmp' [-Wimplicit-function-declaration]
>   787 |                 is_equal = (!wcs1 || !wcs2) ? (wcs1 == wcs2) : !wcsncmp(wcs1, wcs2, len);
>       |                                                                 ^~~~~~~
> make[1]: *** [Makefile:2795: t/unit-tests/clar/clar.o] Error 1
> ```
> 
> This is because since version 2.47.0, Git imports clar unit testing
> framework, which uses wchar_t. On wchar-less uClibc-ng configuration,
> however, the installed <wchar.h> header is a stub (that is, wchar_t
> is undefined).
> 
> Apply upstream patchset from Patrick Steinhardt [1], which includes
> upstreamed clar build fix.
> 
> Fixes: https://autobuild.buildroot.org/results/85dbf87451156fce7c2a12d8882622ea75e0d0db
> Link: https://lore.kernel.org/git/cover.1729506329.git.ps@pks.im/ [1]
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---

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
