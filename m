Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF61C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 18:58:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BF086056B
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 18:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4BF086056B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CB736072F;
	Fri,  3 Sep 2021 18:58:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RLdBMsakdVX8; Fri,  3 Sep 2021 18:58:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EA266060C;
	Fri,  3 Sep 2021 18:58:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B2C0B1BF321
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 18:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A29CA80C40
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 18:58:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WwAvsxoD7lQx for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 18:58:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A39980C34
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 18:58:54 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id bt14so48040ejb.3
 for <buildroot@buildroot.org>; Fri, 03 Sep 2021 11:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xN47yCxMpM/xXB8Q18FbHrYo9roLQc5IHVKgTpPxcwE=;
 b=ZcFEx4GK/c0MDgBXDOlAGs9oYcnLEWq6jkVcrt3fao1g5/PEk7ouNCuYejXXzEczeU
 nseHFbF4Ng1SRw5QI2O5gvpLfEa0C77qLzxncrYAil1kVT5RHUXBIQhYULgbY+DGJsxP
 324by8h/rjxaq9hkAVGevr5IBUUjVH28iVQkWneJ1h1O9W/Go53YgKbzj88a1y/Aw6ky
 b8k+dRbSfV80D+015Se2mYdW4fV1pMK5LWLBTpD9lQSn99slryqyFPjER/+VmglbNF4f
 o8t19nFShjYp5hs9LkmBbs0mGncgLTG6zCsuRqHbPKUZG0Sz5v0z3xDai4lKpSVkPbYu
 2XVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=xN47yCxMpM/xXB8Q18FbHrYo9roLQc5IHVKgTpPxcwE=;
 b=t8jqfD2wcPjQXjvCkIX9zd7WuR3sX5S9jPG1N+fte8O7kdHwEk7cTJ4MRuVchy8iOl
 P67II8hESkeTHma/SMY5TEj/2m9akSBmnvkNZBLJyYLVUl1TI6CV8l3vOUnEvHiIzmrW
 TM7PcskvOrrugwS/uFm+33POw2OZffBvCX/VxBxTHkK5fR5xnf5YlaJSIHANFLe/BbC+
 QpOhMIJXA1UJbl5FvboR85t/ycAigwTGGVVs+3C4qUu0+KNrDx227pPlQAog933Pwf5D
 8ql/ZS88LtmsVLi4TB7Yu5+SIQOoOcpcdESPYga8QbmVgfy785DWIeb/gcdKw+hn1XUb
 XLHQ==
X-Gm-Message-State: AOAM531TOq6xiCfeFlR64iAVqvznCOB6BsNZ+sGAMvTJ7v1azCuNQ97b
 9hcP4Gs+/P+HWCOWOXDTWw2xqQ==
X-Google-Smtp-Source: ABdhPJzf1ucXO27Ktd0elLrzLkPVcWzzyMHxm+/lpAfbXFMeMBfHT8P7BuHRTNJBiM3kc8XFQTL9Nw==
X-Received: by 2002:a17:906:b00c:: with SMTP id
 v12mr376241ejy.222.1630695532607; 
 Fri, 03 Sep 2021 11:58:52 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id qt23sm16330ejb.26.2021.09.03.11.58.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 11:58:52 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210902162222.2232480-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <378572aa-760f-1b13-d7ff-aa898521d4fd@mind.be>
Date: Fri, 3 Sep 2021 20:58:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210902162222.2232480-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5base: fix build on
 riscv32
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 02/09/2021 18:22, Fabrice Fontaine wrote:
> Fix the following build failure on riscv32:
> 
> In file included from thread/qmutex_linux.cpp:45,
>                  from thread/qmutex.cpp:804:
> thread/qfutex_p.h: In function 'int QtLinuxFutex::_q_futex(int*, int, int, quintptr, int*, int)':
> thread/qfutex_p.h:116:30: error: '__NR_futex' was not declared in this scope; did you mean '_q_futex'?
>   116 |         int result = syscall(__NR_futex, addr, op | FUTEX_PRIVATE_FLAG, val, val2, addr2, val3);
>       |                              ^~~~~~~~~~
>       |                              _q_futex
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ffedfc000029072d5d724e98ab4551fe973658ce
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  .../qt5base/0009-Fix-build-on-riscv32.patch   | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/qt5/qt5base/0009-Fix-build-on-riscv32.patch
> 
> diff --git a/package/qt5/qt5base/0009-Fix-build-on-riscv32.patch b/package/qt5/qt5base/0009-Fix-build-on-riscv32.patch
> new file mode 100644
> index 0000000000..98c7210551
> --- /dev/null
> +++ b/package/qt5/qt5base/0009-Fix-build-on-riscv32.patch
> @@ -0,0 +1,45 @@
> +From 035dc537bee26e3b63a211b2835d8560439e161f Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 27 Aug 2021 16:28:32 +0200
> +Subject: Fix build on riscv32
> +
> +riscv32 fails to build because __NR_futex is not defined on this
> +architecture:
> +
> +In file included from thread/qmutex_linux.cpp:45,
> +                 from thread/qmutex.cpp:804:
> +thread/qfutex_p.h: In function 'int QtLinuxFutex::_q_futex(int*, int, int, quintptr, int*, int)':
> +thread/qfutex_p.h:116:30: error: '__NR_futex' was not declared in this scope; did you mean '_q_futex'?
> +  116 |         int result = syscall(__NR_futex, addr, op | FUTEX_PRIVATE_FLAG, val, val2, addr2, val3);
> +      |                              ^~~~~~~~~~
> +      |                              _q_futex
> +
> +Pick-to: 6.1 6.2
> +Fixes: QTBUG-96067
> +Change-Id: Ib6a9bcc496f37e69ac39362cb0a021fccaf311f5
> +Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
> +[Retrieved from:
> +https://code.qt.io/cgit/qt/qtbase.git/commit/?id=035dc537bee26e3b63a211b2835d8560439e161f]
> +---
> + src/corelib/thread/qfutex_p.h | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/src/corelib/thread/qfutex_p.h b/src/corelib/thread/qfutex_p.h
> +index 40482b6fc1..037207a5c0 100644
> +--- a/src/corelib/thread/qfutex_p.h
> ++++ b/src/corelib/thread/qfutex_p.h
> +@@ -103,6 +103,11 @@ QT_END_NAMESPACE
> + // if not defined in linux/futex.h
> + #  define FUTEX_PRIVATE_FLAG        128         // added in v2.6.22
> + 
> ++// RISC-V does not supply __NR_futex
> ++#  ifndef __NR_futex
> ++#    define __NR_futex __NR_futex_time64
> ++#  endif
> ++
> + QT_BEGIN_NAMESPACE
> + namespace QtLinuxFutex {
> +     constexpr inline bool futexAvailable() { return true; }
> +-- 
> +cgit v1.2.1
> +
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
