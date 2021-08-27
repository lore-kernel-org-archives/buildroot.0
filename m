Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 009FFC432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 19:59:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 959FD60F92
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 19:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 959FD60F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D98A817AF;
	Fri, 27 Aug 2021 19:59:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wPqgRfZ-i_CU; Fri, 27 Aug 2021 19:59:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 415938186A;
	Fri, 27 Aug 2021 19:59:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B86D21BF28C
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 19:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EF9761560
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 19:59:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id znGA4Wqb_oON for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 19:59:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B83906155B
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 19:59:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a574:2179:f8:908b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 22E79B004D5;
 Fri, 27 Aug 2021 21:59:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630094368;
 bh=34cf3laqLlQ0ThPuSUAGFsn4VxdsTYM65WD/ZoWkV+Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BcjKuY4fTbQPSLMicAf+wJ1i0RLtpjWYg0FdTAVtzhNa68MUrHAZth/IP92/CKls0
 8sNnV8tPTAos4DBj8PmOJuePN2ExSMr0T2QN37NDqgrl7VW+GExpywvbBEGe9fJ/UW
 XQrZBT4LlriDrPIFwedTzRrDujX3blBibJ48bPL+8H2H0veHDPqZ1bdkR7dXbRTlrH
 BLjiZmbjIe3di38TIcFQD9PPK3rJN57X4q3qTW9YWLM+X4+rrheA9JKfEfYjtakKwi
 96A1rGhhdVfoIhiPM+2ybBDQp3Q6WpnLwxLrgSWfvZdiGji02Isz88uTdIQUTRhkuk
 iUK/uUpU/sHWA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 27 Aug 2021 21:59:21 +0200
Date: Fri, 27 Aug 2021 21:59:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210827195921.GC2661@scaer>
References: <20210827162311.2006524-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210827162311.2006524-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2,1/1] package/ipmiutil: touch config.h.in
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
Cc: David Bachelart <david.bachelart@bbright.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-27 18:23 +0200, Fabrice Fontaine spake thusly:
> Build fails since bump to version 3.1.7 in commit
> 011f31ee244b7fe4621b3f69ca3d7e7b1cfdb5bb because config.h.in is older
> than aclocal.m4:
> 
> make[1]: Entering directory '/tmp/instance-4/output-1/build/ipmiutil-3.1.7'
> (CDPATH="${ZSH_VERSION+.}:" && cd . && autoheader)
> /bin/bash: autoheader: command not found
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2005af881726473f2cda176e90c1e41e4baea67c
> 


  - the title should explain what is fixed, not how it is fixed, so I've
    changed that to:  package/ipmiutil: avoid the need for autoreconf

  - the comment in the code was a bit misleading: "it" as a subject
    refers to the subject of the previous sentence, so it was a bit
    confusing that config.h.in was touched, not aclocal.m4; to remove
    the confusion, I've changed that to: "Touch the latter to avoid
    autoreconf".

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Arnout Vandecappelle):
>  - touch config.h.in instead of autoreconf
> 
>  package/ipmiutil/ipmiutil.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
> index d85b9643f0..a8d9bb8763 100644
> --- a/package/ipmiutil/ipmiutil.mk
> +++ b/package/ipmiutil/ipmiutil.mk
> @@ -11,6 +11,12 @@ IPMIUTIL_LICENSE_FILES = COPYING
>  
>  IPMIUTIL_MAKE = $(MAKE1)
>  
> +# aclocal.m4 is newer than config.h.in. touch it to avoid autoreconf
> +define IPMIUTIL_TOUCH_CONFIG_H_IN
> +	touch $(@D)/config.h.in
> +endef
> +IPMIUTIL_PRE_CONFIGURE_HOOKS += IPMIUTIL_TOUCH_CONFIG_H_IN
> +
>  # forgets to link against libcrypto dependencies breaking static link
>  ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
>  # tests against distro libcrypto so it might get a false positive when
> -- 
> 2.32.0
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
