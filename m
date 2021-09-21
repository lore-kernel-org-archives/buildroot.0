Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C79FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 18:59:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B935E61186
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 18:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B935E61186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59F7C606D5;
	Tue, 21 Sep 2021 18:59:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D-gWSo5axozn; Tue, 21 Sep 2021 18:59:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FBA860839;
	Tue, 21 Sep 2021 18:59:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BFCF1BF2B6
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 18:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68C2481CD0
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 18:59:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UW3Nb--rF_YY for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 18:59:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C93D881B23
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 18:59:39 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id r5so176782edi.10
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 11:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=M8djjsKAD9gOB565wmxIXp38GkqRhBHWKchE4ad6b6U=;
 b=PEAYwTOvARIaHGK1HP88kmKJFFqbcxtCKa7lhlRZNMNLPRvsfuvuFDSM1x2P/LGNRn
 HBLXnfT3qXW7DcRXMTZkgez2ucVAECUB7MWRjeet+z2KSPuf0IXfPgEuH0Yc+7WnNpmd
 bXCS71+swKX7GX15p8JbbZ6E4JOUUqUxxHj9uB7h7S+hOyODXduBsgTG+foGRxi+jatH
 yABEhbu+YqMhdYca9W8VOjugVjKSdlHcxBRmTd1SPUVYk7RJv1gsC8Lbid+ydeEm7GSS
 3eWjI1MdV5c2cHnwR1p8wsn1efvzV/+dju9gwkTEQWzzALv8r6DrRiCzC5/0knMBE8hL
 cf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=M8djjsKAD9gOB565wmxIXp38GkqRhBHWKchE4ad6b6U=;
 b=T4vl/WedBib5zWudFn61IXFxlUeaC7xRlYGc8JMoxqb8yPd2A6kIYBWuHESSke2bWb
 5legrhx+hlk87ZSpCblYcKS7b7+IMKhJ+ZMnCoASmL8oennm7waJ2nmpzIK2XKcAhmxA
 4uSPDRn142KZYG0Hu0UKbAa1JWFJ2q0eJEst3iI86m09BJxXwha2/HQX10qfMxJmHfpi
 Yk6t/n2vv5XI1yx97syD2xy80LHGWdVZ4oNnKEHbqwfFEIa7kfpPVYnVI2lA4ac6tgUH
 NirGrFdBwS5AKgaWRkEJl1hu57xgKsCpQqpVKrbOBTtoAJ6JGO4wjcdbLgJEu1Vy4l7h
 Mv0w==
X-Gm-Message-State: AOAM531ddGAWrarvDpCgkz/tBP+XlJ9PP5bKjCgIlzkFLeqbJ2Tnqv0p
 PDPxWcWA+h9g88Jot0PQOx6IIQ==
X-Google-Smtp-Source: ABdhPJzqkg/3IBUEyBDh2Od6mkXVJ3TfYGbejh7NfjZRf/qKLZFQICb2CuZc/WAWdgu/4YzUHH9OMg==
X-Received: by 2002:a17:906:7811:: with SMTP id
 u17mr35723026ejm.562.1632250776334; 
 Tue, 21 Sep 2021 11:59:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id c19sm4525570edt.50.2021.09.21.11.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 11:59:35 -0700 (PDT)
Message-ID: <609f4180-a954-7f68-8017-4f33dcdfeb42@mind.be>
Date: Tue, 21 Sep 2021 20:59:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Illia Bitkov <illia.bitkov@mind.be>, buildroot@buildroot.org
References: <20210908180825.690731-1-illia.bitkov@mind.be>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210908180825.690731-1-illia.bitkov@mind.be>
Subject: Re: [Buildroot] [PATCH v3 1/1] package/mono: fix external
 libatomic_ops linkage
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 08/09/2021 20:08, Illia Bitkov wrote:
> Added patch fixes linkage of libgc with external libtomic-ops.
> Mono uses bundeled bdwgc which doesn't link external libatomic-ops.
> Patch is a fix cherry-picked from bdwgc upstream.
> 
> Problem found on ARMv5 processors, on newer ARM processors
> it uses header based functions and doesn't need built library.
> 
> Error:
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../../external/bdwgc/.libs/libgc.a(gc.o): in function `GC_steal_mark_stack':
> gc.c:(.text+0x2020): undefined reference to `AO_store_full_emulation'
> 
> Fixes:
> http://autobuild.buildroot.net/results/ebc54e5dea63aca21a4072d294fdede41de559c7
> http://autobuild.buildroot.net/results/6d10a4bd43fbc9c1d3fa26d5eef394c8023cb85f
> Signed-off-by: Illia Bitkov <illia.bitkov@mind.be>

  Leave an empty line before the Signed-off-by.

  Applied to master with that fixed, thanks.

  Regards,
  Arnout

> ---
>   ...-system-libatomic_ops-shared-library.patch | 52 +++++++++++++++++++
>   1 file changed, 52 insertions(+)
>   create mode 100644 package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch
> 
> diff --git a/package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch b/package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch
> new file mode 100644
> index 0000000000..66d4d8e100
> --- /dev/null
> +++ b/package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch
> @@ -0,0 +1,52 @@
> +From 02a44ee1df8176c72e75fd706d1a8f063d3196d5 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Mon, 5 Nov 2018 22:50:40 +0100
> +Subject: Fix linkage with a system libatomic_ops shared library
> +
> +Issue #247 (bdwgc).
> +
> +When bdwgc is linked with the external libatomic_ops, bdw-gc.pc must
> +contain the needed dynamic libraries (such as -latomic_ops) otherwise
> +build of applications could fail on the link stage on some hosts:
> +* libgc.so: undefined reference to 'AO_fetch_compare_and_swap_emulation'
> +* libgc.so: undefined reference to 'AO_store_full_emulation'
> +
> +So, this commit sets ATOMIC_OPS_LIBS to "-latomic_ops" when a system
> +atomic_ops library is used and uses ATOMIC_OPS_LIBS in bdw-gc.pc.in.
> +
> +* bdw-gc.pc.in (Libs): Add @ATOMIC_OPS_LIBS@.
> +* configure.ac [$with_libatomic_ops!=no && $with_libatomic_ops!=none
> +&& $THREADS!=none] (ATOMIC_OPS_LIBS): Set to -latomic_ops; do AC_SUBST.
> +
> +Fix is cherry-picked from bdwgc upstream
> +
> +Link to original commit https://github.com/ivmai/bdwgc/commit/02a44ee1df8176c72e75fd706d1a8f063d3196d5?branch=02a44ee1df8176c72e75fd706d1a8f063d3196d5&diff=unified
> +
> +Signed-off-by: Illia Bitkov <illia.bitkov@mind.be>
> +
> +diff --git a/external/bdwgc/bdw-gc.pc.in b/external/bdwgc/bdw-gc.pc.in
> +index ef4c2341..a32e7598 100644
> +--- a/external/bdwgc/bdw-gc.pc.in
> ++++ b/external/bdwgc/bdw-gc.pc.in
> +@@ -6,5 +6,5 @@ includedir=@includedir@
> + Name: Boehm-Demers-Weiser Conservative Garbage Collector
> + Description: A garbage collector for C and C++
> + Version: @PACKAGE_VERSION@
> +-Libs: -L${libdir} -lgc
> ++Libs: -L${libdir} @ATOMIC_OPS_LIBS@ -lgc
> + Cflags: -I${includedir}
> +diff --git a/external/bdwgc/configure.ac b/external/bdwgc/configure.ac
> +index 21abe8fa..9ffe81de 100644
> +--- a/external/bdwgc/configure.ac
> ++++ b/external/bdwgc/configure.ac
> +@@ -1081,7 +1081,9 @@ AS_IF([test x"$with_libatomic_ops" = xno \
> + AC_MSG_CHECKING([which libatomic_ops to use])
> + AS_IF([test x"$with_libatomic_ops" != xno],
> +   [ AS_IF([test x"$with_libatomic_ops" != xnone -a x"$THREADS" != xnone],
> +-          [ AC_MSG_RESULT([external]) ],
> ++          [ AC_MSG_RESULT([external])
> ++            ATOMIC_OPS_LIBS="-latomic_ops"
> ++            AC_SUBST([ATOMIC_OPS_LIBS]) ],
> +           [ AC_MSG_RESULT([none])
> +             AS_IF([test x"$THREADS" != xnone],
> +                   [ AC_DEFINE([GC_BUILTIN_ATOMIC], [1],
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
