Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1943C6FD18
	for <buildroot@archiver.kernel.org>; Wed, 19 Apr 2023 00:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AC7241783;
	Wed, 19 Apr 2023 00:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AC7241783
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vPStEvDOHwUp; Wed, 19 Apr 2023 00:27:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9F5941771;
	Wed, 19 Apr 2023 00:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9F5941771
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED5211C4316
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 00:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFDC783D1C
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 00:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFDC783D1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gjoyby2lHqul for <buildroot@lists.busybox.net>;
 Wed, 19 Apr 2023 00:27:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2E1081EAD
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2E1081EAD
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 00:27:10 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id op30so19527242qvb.3
 for <buildroot@buildroot.org>; Tue, 18 Apr 2023 17:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681864029; x=1684456029;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gdmNOuC25RbBRl8H/Zyl2nRZuUmMfRvhbx60siajg90=;
 b=ecap6AwIY45dvRu5JMEe0xQxvkh7oDIXkimatWNmv9uGkTlzgGIidhNog20Sg8YRkW
 fJKebn8UYv9K+W1yHjd5hQHpmi6The1qHRHlu6jIBhEtyMkAzom2rOzsHAJbGdvgya2S
 i3DeROldOWEDazS6eL3Q/0oxO6m/fzxCuKVd4UjvPPJ0QVoNHnSUCqIO95WjEZ7SOy2q
 SgakU46kiO3+36bGu8WPy6EHOMXnAsfIhH7IVC++1Ql55L8TRAIA2/UPUGDARTY9zTR/
 Th3wpUk0IvNmQpgv55OVMbrYqsj/jdAbcGZOQW4QLnorz9NSnlL8VWIfkNjA0kcLcWec
 kWgA==
X-Gm-Message-State: AAQBX9ff3kASMr2l/4A25Sm31FWY4uTc8LxmiLUSnLyoaZKQQum3T3Hp
 os7/CDOl84lOYGAfi78UdY8=
X-Google-Smtp-Source: AKy350bl31SPcx8R/mtvWjav601qFrXDRQxeKiqXUtrty/C7QMy16dA0TOGUg4oYpbWtRHGVsvk6Xg==
X-Received: by 2002:a05:6214:5008:b0:5a6:24f6:724d with SMTP id
 jo8-20020a056214500800b005a624f6724dmr31630088qvb.13.1681864029323; 
 Tue, 18 Apr 2023 17:27:09 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a05621400c300b005dd8b9345d3sm4034208qvs.107.2023.04.18.17.27.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 17:27:07 -0700 (PDT)
Message-ID: <b6a35fbd-7ece-31e5-d7d8-9adbd4002972@gmail.com>
Date: Tue, 18 Apr 2023 17:27:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220927221133.594071-1-f.fainelli@gmail.com>
 <20230417195816.GN2819@scaer>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230417195816.GN2819@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681864029; x=1684456029;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gdmNOuC25RbBRl8H/Zyl2nRZuUmMfRvhbx60siajg90=;
 b=VTt956UogClia3ppF9/2fZ+k+vHSwu/cYSmW88aks6p7lSWEdna5OA8OTvFWf3C/PP
 AtSTN7vGuo72Fwx4BKEKGOyCjfHhflUejQfvccb3UQV2NvGHwJHoMYkZfm1VgzDbX/dz
 9NJ8SX+hMryBjlIHS6fqxWaaZhuplJXAcPQC1R0aWhEunJ1W+LpXGZZSMstLIoF+ab9E
 l83lhddcL0eaWibX6jhwZddCFSF2gWOhFVRfFuWXeJUGLTblZa6jlr/ZaiReltVfzCmp
 X1BuUi7jb2tsZJ0+Uj2nanWFuHs8CZAfVggPY1Qb8fle8KUda+wV1fODhg+1RLO98L5m
 KBRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=VTt956Uo
Subject: Re: [Buildroot] [PATCH] package/linux-tools: Exclude checking PE
 binaries from perf test
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 4/17/2023 12:58 PM, Yann E. MORIN wrote:
> Florian, All,
> 
> On 2022-09-27 15:11 -0700, Florian Fainelli spake thusly:
>> Since upstream Linux commit ed21d6d7c48e6e96c2d617e304a7ebfbd17b1807
>> ("perf tests: Add test for PE binary format support") present in >=
>> v5.10 there is an unconditional installation of PE binaries which will
>> be rejected by the check-bin-arch script.
>>
>> Make sure that these binaries are excluded from being checked to allow
>> the installation of the perf tests.
>>
>> Fixes: 6fcdaa4c5096 ("package/linux-tools: Allow installation of perf scripts")
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> I've finally applied to master, thanks.
> 
> However, I wonder if we could not be a bit more robust in check-bin-arch
> itself, something like:
> 
>      diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
>      index 27cc59bca0..2920a95ae3 100755
>      --- a/support/scripts/check-bin-arch
>      +++ b/support/scripts/check-bin-arch
>      @@ -58,6 +58,9 @@ exitcode=0
>       IFS="
>       "
>       
>      +# ELF magic
>      +ELF_MAGIC="$(printf "\x7f\x45\x4c\x46")"
>      +
>       while read f; do
>       	for ignore in "${IGNORES[@]}"; do
>       		if [[ "${f}" =~ ^"${ignore}" ]]; then
>      @@ -71,13 +74,19 @@ while read f; do
>       		continue
>       	fi
>       
>      +	# Check if it looks like it is an ELF file
>      +	read -N 4 magic <"${TARGET_DIR}/${f}"
>      +	if [ "${magic}" != "${ELF_MAGIC}" ]; then
>      +		continue
>      +	fi
>      +
>       	# Get architecture using readelf. We pipe through 'head -1' so
>       	# that when the file is a static library (.a), we only take
>       	# into account the architecture of the first object file.
>       	arch=$(LC_ALL=C ${readelf} -h "${TARGET_DIR}/${f}" 2>&1 | \
>       		       sed -r -e '/^  Machine: +(.+)/!d; s//\1/;' | head -1)
>       
>      -# If no architecture found, assume it was not an ELF file
>      +# If no architecture found, assume it was in fact not an ELF file
>       	if test "${arch}" = "" ; then
>       		continue
>       	fi
> 
> (with the read -N 4 trick as discussed in [0])
> 
> Thoughts?

That would work for me!
-- 
Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
