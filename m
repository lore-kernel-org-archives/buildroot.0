Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C75C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:00:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DB73611C0
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DB73611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CF87605E1;
	Sat, 11 Sep 2021 19:00:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gz80FWw95WCu; Sat, 11 Sep 2021 19:00:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 705C3605D8;
	Sat, 11 Sep 2021 19:00:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 92C061BF2C2
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8282B605D8
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:00:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sowJFN6uzGFp for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 19:00:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9A67600CC
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 19:00:47 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id j13so7579923edv.13
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 12:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tq9dXUXFyEdVL+JC5ppgs8GWUWJolwvzDXuLQ+W3pBw=;
 b=O1fWYKHY8b43qyRBjrBZjkzfYBkpAIJ/DiU2c4i4O4oDXjIYSyPCtVJBz3rNUqJTY/
 /B4Qn/tr2cTsLdFF5n2J2F6BrQC+yZsqY4uzfz3+MbWzqtrlQmrt8eVw/RsmXWjH+4gM
 aUA/5Yzu3WHDLcuCXmOKct746MsXqxSyDvrhFInXF1qXZjrBjqgsUkAkWqepXe14/ypl
 ItKfBlYvH0fMS01KQZfXCw1pwd+YbMjaEdGKaYR3sE41CCOHd57a+LiRogre0N6smcf5
 GVUtd1w/wrfuYol4ut2O+axPzNfWTmCzzGrHP9D5k6RHqXkVc46doOZHNEzrAzIrVrNF
 Ldmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Tq9dXUXFyEdVL+JC5ppgs8GWUWJolwvzDXuLQ+W3pBw=;
 b=kZ75hawqDSsF7HqrgQvnncn/HK5VMuBInn3DIw6srbTNkaom1OJpm696fhDMt1fiu2
 jlTC0Flk6+Gb+c/6T7zi9IxOlnPsRO9RDE7goTEdjWbnGgTKrNfWLYjaX8u7JhJwzPL2
 p+6ELJCpsshfv6+5Wf8pJiXhhzc2qrHdgrVI75C1hvjnXEx0/vmAAqwFKaTczgNKGcEW
 x7C+VboGZAsUymAis1QihvmVxTBmgjau9qeLI6sXEz58xGBuBjadaPjT3m23/95VLBVP
 Yxlbb0WVIoIq3aqF/XbF0P91x41W1zT12BIvM7ZSS+vFpdig3GEp5NWX5UEro4lTbbvy
 FjYA==
X-Gm-Message-State: AOAM530jEUPrZZnd4wU5pDWl36qRk8dDM3t+3/Fvu35r5u2EINeMD2r8
 DfutyRazHjvPP9fS6cnj410CWw==
X-Google-Smtp-Source: ABdhPJzLnLocIDE+KO7hc3dGgevAq33VpJWryVUxjelvLu+MCFd/OcWWoV6IBsxlw8rTmEQrU8pQ5g==
X-Received: by 2002:a05:6402:389:: with SMTP id
 o9mr4400701edv.213.1631386845704; 
 Sat, 11 Sep 2021 12:00:45 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d16sm1097962ejk.39.2021.09.11.12.00.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 12:00:45 -0700 (PDT)
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20210903162027.1935040-1-aduskett@gmail.com>
 <20210903162027.1935040-4-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <b7a17609-76d6-5a8d-ca9a-1001e0c0eb1e@mind.be>
Date: Sat, 11 Sep 2021 21:00:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210903162027.1935040-4-aduskett@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH/master 3/7] g-ir-scanner.in: Fix shellcheck
 warnings, switch to sh
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
Cc: Romain Naour <romain.naour@gmail.com>, Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 03/09/2021 18:20, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

 Applied to master, thanks.

 ... And now I notice that I forgot to add the package/gobject-introspection/
prefix to the previous patch. I added it here and will hopefully remember to do
it for the following ones.

 Regards,
 Arnout

> ---
>  package/gobject-introspection/g-ir-scanner.in | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/gobject-introspection/g-ir-scanner.in b/package/gobject-introspection/g-ir-scanner.in
> index 22df7be309..013eb15700 100644
> --- a/package/gobject-introspection/g-ir-scanner.in
> +++ b/package/gobject-introspection/g-ir-scanner.in
> @@ -1,4 +1,4 @@
> -#!/usr/bin/env bash
> +#!/usr/bin/env sh
>  
>  # These environment variables are empty by default, and as such ccompiler.py
>  # defaults to either using the system tools (CC, CXX, and CPP) or leaving
> @@ -15,8 +15,8 @@ export LDFLAGS="${LDFLAGS:-@TARGET_LDFLAGS@}"
>  
>  export GI_SCANNER_DISABLE_CACHE=1
>  
> -${HOST_DIR}/bin/g-ir-scanner \
> ---lib-dirs-envvar=GIR_EXTRA_LIBS_PATH \
> ---use-binary-wrapper=$(dirname $0)/g-ir-scanner-qemuwrapper \
> ---use-ldd-wrapper=$(dirname $0)/g-ir-scanner-lddwrapper \
> ---add-include-path=$(dirname $0)/../share/gir-1.0 "$@"
> +"${HOST_DIR}"/bin/g-ir-scanner \
> +    --lib-dirs-envvar=GIR_EXTRA_LIBS_PATH \
> +    --use-binary-wrapper="$(dirname "$0")"/g-ir-scanner-qemuwrapper \
> +    --use-ldd-wrapper="$(dirname "$0")"/g-ir-scanner-lddwrapper \
> +    --add-include-path="$(dirname "$0")"/../share/gir-1.0 "$@"
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
