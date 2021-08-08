Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFB6C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 08:50:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81DA361019
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 08:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81DA361019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31D7F402D7;
	Sun,  8 Aug 2021 08:50:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tclqYIdnDCOk; Sun,  8 Aug 2021 08:50:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D5C1402E7;
	Sun,  8 Aug 2021 08:50:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 608511BF580
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 08:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D00782D45
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 08:50:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lUeNB4lxrVjQ for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 08:50:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2FA482B61
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 08:50:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6435:5a60:3dd3:9849])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B4BF0780310;
 Sun,  8 Aug 2021 10:50:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628412637;
 bh=vzU+1sZliifieLq9U+lMywbvqtfDs5//+gRldFUIdJI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hczmySGOd31MuV/vH8kIl2kzmxQ2R1Sp5zwGLGephNnPzyEPRVbCA2ujRj3+5jZoG
 K4p3TNjGTa/TixT7AtjFNqc1HW9YCBmm/o1+OKBR3+jv3ydFSqjO5sgKbarixP/9b9
 l9wfCFSST8igVAPU/JxYC6hLzN+8u95cEWJqPLZAxSd64sWt3QSvzm+DdWTVXAUJoJ
 Q5TUYvg2jPSR5YxcMZkJE2nG6p4IC8Lcw2BUMs0idFsN1b6KYOqxKvsTTCzq7T51rz
 MrMw6/gSAVdZ2wP1ZtEx/sJqhJWNgIOXjCY9T0R9ZsOs+jhIQiQdAGsxBS3d5/4L+v
 jA8hxMQimTieA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 08 Aug 2021 10:50:31 +0200
Date: Sun, 8 Aug 2021 10:50:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <20210808085031.GJ27036@scaer>
References: <20210806125047.1832422-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806125047.1832422-1-tomi.valkeinen@ideasonboard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/kmsxx: remove erroneous use of
 static-libc option
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Tomi, All,

On 2021-08-06 15:50 +0300, Tomi Valkeinen spake thusly:
> For some reason the build file sets -Dstatic-libc=true option when
> BR2_STATIC_LIBS is set. This is not correct, or at least I cannot figure
> out the reason for this, so remove it.

Well, the reasonning was probably that: "if BR2_STATIC_LIBS is set, then
we want to do a fully-static build, so let's use that option that looks
like its name means exactly that."

But static-libc is not about the C library; it is about statically
linking against libgcc and libstdc++. Which should not happen, because
we are doing a full static build.

The issue that I can see, however, is that for pre-built toolchins, we
bulk-install their sysroot, and so we end up with our staging that may
contain shared libraries, and thus this be have been an attempt at
forcing the use of the static libgcc and libstdc++.

But in Buildroot, we force the use of -static in CFLAGS, CXXFLAGS, and
LDFLAGS (and any similar mechanism in all packages infras), and this
should be enough to link everything statically.

In the end, that does not seem to be necessary at all, indeed. I just
did a static-only build, and the sizes of the utils or the libs are
strictly identical with or without that option.

So, I've applied this patch to next, after expanding the commit log with
a summary of the above.

Regards,
Yann E. MORIN.

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> 
> Re-sending, as first attempt was rejected as I was not subscribed to the
> list.
> 
>  package/kmsxx/kmsxx.mk | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
> index fd40ff8e73..871ecaf85c 100644
> --- a/package/kmsxx/kmsxx.mk
> +++ b/package/kmsxx/kmsxx.mk
> @@ -17,12 +17,6 @@ KMSXX_CONF_OPTS = \
>  	-Duse-system-fmt=true \
>  	-Duse-system-pybind11=true
>  
> -ifeq ($(BR2_STATIC_LIBS),y)
> -KMSXX_CONF_OPTS += -Dstatic-libc=true
> -else
> -KMSXX_CONF_OPTS += -Dstatic-libc=false
> -endif
> -
>  ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
>  KMSXX_CXXFLAGS += $(TARGET_CXXFLAGS) -O0
>  endif
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
