Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C88C54E49
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 16:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 797A681FAC;
	Sun,  3 Mar 2024 16:47:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PWq6TQnAP1yN; Sun,  3 Mar 2024 16:47:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 903A881FBB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 903A881FBB;
	Sun,  3 Mar 2024 16:47:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F5A01BF575
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CD7960A70
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:47:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rTXgnj6GJ0un for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 16:47:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 667D96086A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 667D96086A
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 667D96086A
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 16:47:34 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-412d501fb96so8470495e9.0
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 08:47:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709484452; x=1710089252;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gmCBWtjNXoS2Kwc8OUiDz5/0Vzf6nLEb5aIFkwB1cuk=;
 b=Yrm133y7N8viyyOMNXfZlb/k1rZeZ5hD544+PsNemXnIkJd0qYGqEJUGB/hdk0PEbV
 CUZWWHCNRnK4xa6+KE0m/kNDqZu+58gny0hsdxC2l6lT3hY/HowTydlhDCbjhRKQhKyk
 GezYGDc0TZNKtNqH0V9JbtXlbYHQ3Unf7HkXLN8wiJtwjEQxJu3gKdyKm1gbMLSmT4g6
 eeFVnkU30Qpq61i2KQMQ/mNJJPizlAUJIGAdiVpUqg+RrxqNbnnPVHaUq9PuHwyn/sVD
 CCaj7OZ3YLHySkSRvFARyuEDCDEeXKc1CmhdFyDJWitkal0fIzMKHPBABHJko3S50M8o
 KKsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrbAIIXTvhsPTiqP03bzuSN0iQgpKr/ebZBqIeCPREQSJuDL916URGrzBw+gcCokvVtMic53nbDYlPO/phqJOFQACZM4NANg==
X-Gm-Message-State: AOJu0Yy5na5GKI7uJgXc+u64bH62khEd0Hnd5w6jCfEpW+dTgEyzWuwA
 i8Q+fbDMn3jgbKgXJhSPconcd6Z8uk0rQd28m6IL3aKQNofwykI3DxtNN06BINE=
X-Google-Smtp-Source: AGHT+IFcho+O7kqNPQfpxvfT2NgcunlALfplFcGPNFrKhZwviD3SyXaIjr2+ywEVjbUjRxPqjuPMCg==
X-Received: by 2002:a05:600c:1384:b0:412:c213:d0fc with SMTP id
 u4-20020a05600c138400b00412c213d0fcmr5887364wmf.15.1709484452414; 
 Sun, 03 Mar 2024 08:47:32 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 fc10-20020a05600c524a00b00412e38ad377sm425458wmb.15.2024.03.03.08.47.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Mar 2024 08:47:32 -0800 (PST)
Message-ID: <e8d591e8-1c00-42a4-98e2-88f80d4fa06c@mind.be>
Date: Sun, 3 Mar 2024 17:47:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240213210051.162913-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240213210051.162913-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1709484452; x=1710089252; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gmCBWtjNXoS2Kwc8OUiDz5/0Vzf6nLEb5aIFkwB1cuk=;
 b=b8ZZX2qrIWtZLl65/C+/yaEidEjkwj/98q4CScZ5gFPhtr9J6j7ZYkuurMHZrhKuD+
 jOrudq2nMtZvmhu6tt5GhPEoccCGWeCr13CljkEdxAGd/N0KAiN/VTDXhdiEIrBpjxqO
 Uf5ODAtzbT+FW3l37qLXjXwS3vaPBLwU1OXtUHfHy7Sf9uNQIWrPVp1wShow0VV5Cpg+
 AGk7ekrCCjTerGDXnmJmd2LZlZ8LWJLuO9xcqi+wzH586ME5wLjQe9ecwhDFqQf0AlS7
 t+lPCw16ExjxRBk/hbRtoDp7Ny59RX0CbtuuOHnBwdTK+En3g8q4PHtsA83CHXLBzGxL
 UXNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=b8ZZX2qr
Subject: Re: [Buildroot] [PATCH 1/1] package/botan: fix uclibc build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/02/2024 22:00, Fabrice Fontaine wrote:
> getentropy is enabled by default since version 3.0 and
> https://github.com/randombit/botan/commit/8642f2a99deefc85cdb512ee50d9f62c5e0ae4b8
> and explicit_bzero is also enabled since version 3.0 and
> https://github.com/randombit/botan/commit/e6819a380fb67c1be546dc618248b62d93266423
> resulting in the following build failure since bump to version 3.2.0 in
> commit 2f8feb66204ff661e9fd5f508e2dfd1ebc0f2813:
> 
> src/lib/entropy/getentropy/getentropy.cpp:26:9: error: '::getentropy' has not been declared; did you mean 'Getentropy'?
>     26 |    if(::getentropy(buf.data(), buf.size()) == 0) {
>        |         ^~~~~~~~~~
>        |         Getentropy
> 
> Fixes: 2f8feb66204ff661e9fd5f508e2dfd1ebc0f2813
>   - http://autobuild.buildroot.org/results/d58c4730c770467b42af426545dd917ecc5fed17
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/botan/botan.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/botan/botan.mk b/package/botan/botan.mk
> index 7c290f04ad..88dbfa5807 100644
> --- a/package/botan/botan.mk
> +++ b/package/botan/botan.mk
> @@ -49,7 +49,7 @@ BOTAN_CONF_OPTS += --without-stack-protector
>   endif
>   
>   ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> -BOTAN_CONF_OPTS += --without-os-feature=getauxval
> +BOTAN_CONF_OPTS += --without-os-feature=explicit_bzero,getauxval,getentropy
>   endif
>   
>   ifeq ($(BR2_PACKAGE_BOOST_FILESYSTEM)$(BR2_PACKAGE_BOOST_SYSTEM),yy)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
