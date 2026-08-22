Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBFAC5B572
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3230F80ED7;
	Sat, 22 Aug 2026 12:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cIE-Y-mb4X7i; Sat, 22 Aug 2026 12:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787402434;
	bh=kMA6mkED2Terq6SEGWXRwwDVEFiztix6Xf2EMbefI7U=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=LyxgsAGnGXTSIOsxhdifEMjUOaitZ6sus326RIaMAv3C6nuu5FJ0HAKt50igqrQ23
	 bXuYZUckOcyg/F43q4sLeoZIHhAdGUdbreGoWL1UW+HKkOKNEGli+mZN9r6EUip6Wp
	 MMDcghrVh4Tf4CyL7J1SJbgXTtnrpsOt+KPbvL6zX9B+VnybsCckbNRmET4wdFegRf
	 FDO1mQYRZhcIfJEccHHhrlAOTwWHz9arEvWVvTykYGSFu3eqqBTnnYCMkYVaIvUyPD
	 8csRaQ1FgHexhRs74Y1cho4I3CBCbioGLqL8bmfT1DpheXX+tHKuS2cwkfU4rA/8te
	 +wmD77iX5WdYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56B0280EF9;
	Sat, 22 Aug 2026 12:40:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0394E2B2
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDDDD40073
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TYEQLRiWOmP6 for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:40:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B544E4005F
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:40:31 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-c160420289bso291043666b.0
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 05:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787402429; x=1788007229;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yhhIYDK58Hta6A4v9FIAYH7dowgnlvz03adVINnsLQI=;
 b=Rse4cmRYw5GxavmkeowNhfHTeuz+uUg3pP0pzljp8oaGgZg/0GkHqiW2zws876PkRL
 B3JDgaLCV73VKoRVecsfS+b6rlkBt8pYGiMi//fMSTCZDLeWUDuey/WRwts9r5WV6lxf
 OiWRZGcjMkVy0/BB9bx8D8zm6Wu0rim+6oDMRB0CWEgOjJKeGxt/aEG+i8g54CXz7sJT
 asWAsIWu8WyfpNI/fjzWkbOOFs2QkZPDn5Q5iDBsNs0+SyUDSn7NsUMenK+Tyt1V7id+
 FpVJOWljHXrgxyZJf6aOh8BdU2oGeWFPVhnnbEEkSZzESgxiicX2FO11yvqqo9jSu9QA
 MtFw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqFZhjhpBKPTKFBBCpyzoByNH8WHgFVCjMer/Y7QLDR3R0asTEwu6GTQfwOliJAsDpfaoIZFGg7D7E=@buildroot.org
X-Gm-Message-State: AFuF++kSq3IWbL1Z7xNeAjuh/daDbUDvaRUQoq+tr0RJUkqFbLbnRHyO
 /+5PfHBUgBks3MzZ4iL8+kLOitnsL9SDwUwoX/NSyJo9m/HOBrP6HKXiVLED/jWLmyyRM4q2l2q
 PjLNi
X-Gm-Gg: AR+sD11NleLh/Vyu6R3fUyeP5O82OvLKkBPMrPS1gteeJp01I33Op4bmk1KZQtcOHD4
 /IvStqO0MsrbynVnFSqjEQQ0cKppEcFD7yIXv30j2bDZD/C/NUBrl8FEekixHiZUHLOA7FKSnvE
 RxwryQ3BgpzUAQ7mA126F08FgR8h5I58I7yAL0J/SHjKq6exTAHePceAk0ZGUziJNkU5rTSGcaP
 FoS+ZFpeQZrLBIrAibhCRsujkpoi4vx6wYAUEW4Bj1DShI1Ujzl04P012qvfIHYGGJlZYXLgTmJ
 cpqoUcO6h7dQfRnpDgsccf2b5dclTwgIHD+W/Yv1gKWmLhOs4/90D9ZrXfWX8kl4JDiGZ7B8Gw9
 KWD821RYvvzBqAkeiXxnlkX1S+2yyuDuxi8vnYtiox2KGlVlLHaFCRhADjWNqvtj2rlPDre3osF
 XOUP7tXtDEtSalhnDd2hlaKeT28LcM4/SaMledW4pp6DDTg72aYSDsTZoq3GF7qdQ0YVqwdgmUl
 565loAn/N5F1M2k5MtlYF4RVigsHMq4ntbYx/JmT8j40vSt
X-Received: by 2002:a17:907:1c9e:b0:c16:3187:997e with SMTP id
 a640c23a62f3a-c246a4ede76mr1361804066b.7.1787402429270; 
 Sat, 22 Aug 2026 05:40:29 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2496734bfcsm309368966b.43.2026.08.22.05.40.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2026 05:40:29 -0700 (PDT)
Message-ID: <ca389caa-da7c-4c36-ada5-f1a70632d1bf@mind.be>
Date: Sat, 22 Aug 2026 14:40:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <aoGO11vvqxF6VTOy@waldemar-brodkorb.de>
Content-Language: en-US
In-Reply-To: <aoGO11vvqxF6VTOy@waldemar-brodkorb.de>
Subject: Re: [Buildroot] [PATCH] package/wpa_supplicant: security bump to
 2.12
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 16/08/26 12:20, Waldemar Brodkorb wrote:
> See here for a Changelog:
> https://git.w1.fi/cgit/hostap/tree/wpa_supplicant/ChangeLog?id=e6386389448a4e0ec568fa7a27026e03f95bb768
>
> Security issues fixed in this release:
> https://w1.fi/security/2026-4/incomplete-bounds-checking-of-mesh-ampe-messages-in-wpa_supplicant.txt
> https://w1.fi/security/2026-3/unexpected-sae-commit-message-contents-terminating-wpa_suppliant.txt
> https://w1.fi/security/2026-2/missing-network-context-validation-for-pmksa-caching.txt
> https://w1.fi/security/2026-1/missing-ml-parsing-validation.txt
>
> Patches 0001 and 0002 are upstream.
>
> Tested on Raspberry PI4 (64 Bit).
>
> License changed:
> -Copyright (c) 2002-2024, Jouni Malinen <j@w1.fi> and contributors
> +Copyright (c) 2002-2026, Jouni Malinen <j@w1.fi> and contributors
>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
