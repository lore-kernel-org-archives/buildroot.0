Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD76FC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:17:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75E3860F8F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75E3860F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5020D60B4F;
	Wed,  4 Aug 2021 01:17:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YGZKPZTdKaah; Wed,  4 Aug 2021 01:17:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9708960B33;
	Wed,  4 Aug 2021 01:17:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B21751BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91447404F5
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M7jnuCHLvIm5 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:23:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AF96404CD
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:22:59 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id c25so628905ejb.3
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 14:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jCcPsIhdRdAgkRB57fMlhaaB/QPPAw+8HWfAVdtU/HI=;
 b=DHk6fZy4R0DbSEljBOSKdYh8gam/eLNg9MFYSjvpXDo1KF3iFq3rJLbES0Ut18pUf9
 /c0cJjp30WaXjo1NoMIAAmBperf8k0M8YesCpOW7KDTI0nM2cXeUrd8pKmrr3gFlMf7g
 RgWcq5f9hGqv3zopcNOZbHr9PRB6FYBzfZZSQkWgNvsDTL32SJCuEM2C1l4/wfnULw61
 nfKvmfz+KYmjQ96ls7/hOKeefKR1CqBslK9UPLy8jUwvPqzyyAp/vk7iugqNIPivnD3v
 4gHGZxIapdkPKRZ9qySvTgDTcZR/J/EmGf7EOfVB2/arRyV2mKKFY75egrRuBRSC7amj
 zXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=jCcPsIhdRdAgkRB57fMlhaaB/QPPAw+8HWfAVdtU/HI=;
 b=mvwdiE6InMmQywwhKEMlk8jRuHhjgRKSyqrcI0s7vu404I39+ZOH2CIBSpPkpkGrMG
 oz5NLc1+K526vDS92lsL1ZkxernWBo/M5fjUI1bbNs/ZTDC3/NWVITYQLiqVTfFqkaLz
 FRGKXoSu0Jgg+QrBWSyqFLLmanMm98kxMolM4WUAX+e/fsceiJj5YUi8EX2FR1FNUnyI
 tfuSu2NIRqyn+3NwWrxNL5rfC/+kpH5GnuiDplDR7xgOsFUY0gpTnP72tji+91XyIzFi
 L8saKEPZM2SC+n9k5zPf4tOXj5Z7XTK39ChmDWCQ9Vh7NOKzwia24wz8NBUwUUAgQnrk
 oJnw==
X-Gm-Message-State: AOAM533KO6+kawOujllkO6YXCVm6iCsYtUpUKEsZ/ND91IIjXlXhWGv7
 QTkTkM4j+HK+kGsR4PIrb9z9j41CWgykBCq6PlI=
X-Google-Smtp-Source: ABdhPJyLFwuF/1E9G4BZcjMV9ljH8VToXWNfzAJpqhB+t/VnHFYx625JhfU7N1CkQ/xl20P6Bubl6A==
X-Received: by 2002:a17:906:31cb:: with SMTP id
 f11mr23061835ejf.379.1628025778026; 
 Tue, 03 Aug 2021 14:22:58 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id j22sm30202ejt.11.2021.08.03.14.22.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 14:22:57 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210803082601.2457321-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <a550d404-58e9-3545-5773-78aafbc8adfe@mind.be>
Date: Tue, 3 Aug 2021 23:22:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803082601.2457321-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/wireshark: link with -latomic
 if needed
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 03/08/2021 10:26, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump to version 3.4.7 in
> commit bb75c4b541fac144b53b63248e235f22ba1d25ad:
> 
> /tmp/instance-5/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: ui/qt/CMakeFiles/qtui.dir/sequence_diagram.cpp.o: undefined reference to symbol '__atomic_compare_exchange_4@@LIBATOMIC_1.0'
> /tmp/instance-5/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /tmp/instance-5/output-1/host/sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6617ee0e0046a0452a1515b89e9c704b1c125ec4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 I double-checked that wireshark's CMakeLists.txt doesn't do anything evil with
CMAKE_EXE_LINKER_FLAGS - it actually does, but only for MSVC.

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/wireshark/wireshark.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> index e852083de6..6ee4b20391 100644
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -43,6 +43,10 @@ endef
>  
>  WIRESHARK_PRE_BUILD_HOOKS += WIRESHARK_BUILD_LEMON_TOOL
>  
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +WIRESHARK_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
> +endif
> +
>  ifeq ($(BR2_GCC_ENABLE_LTO),y)
>  WIRESHARK_CONF_OPTS += -DENABLE_LTO=ON
>  else
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
