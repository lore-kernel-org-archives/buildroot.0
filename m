Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311C4C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 19:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E60336076C;
	Mon, 24 Jun 2024 19:26:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_vvomB8AGvg; Mon, 24 Jun 2024 19:26:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8F5A6082B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8F5A6082B;
	Mon, 24 Jun 2024 19:26:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D2BC1BF473
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 19:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 299154011F
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 19:26:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bOswsndfohl6 for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 19:26:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 06ADA400F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06ADA400F8
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06ADA400F8
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 19:26:30 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5295eb47b48so5526320e87.1
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 12:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719257188; x=1719861988;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tT/D0dg/jd9XbrRvqiI8+CWCna2S6fAF19u0hP+Zmko=;
 b=RFF0D4B2AaPBzPl9g1oZNFRz0SWpAgIa3PlyRyqXPOczIIR1qX91+c01/RTx3wwgJn
 RrExo+Z5hTfEIs730glElyipOoKBRfP+H8iyDAmPtweSfA9ETy/mGLjfq89TrZ3O6JhD
 PqZ2AJQIqpvEpz8d737rWrZGdfD+RDwF247X51fjMRWUNZDpLqZT7gp14LmxhzLY7ZCu
 OXMPX8+BF64TTgyIWO9nk2fg7AHHmSJZZEXRtJWifPKR0U3/4ufuCIx4KwzO59vDhj4n
 47ueTDkauSpvvKxWPf3Rekfq5XoJnsrthRkHo7CyJxgoPoaf/kvCzwtwNOA1n0pLFOZz
 zyow==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhL9kKtYrl1RUq+70HZMxK4yWpoMOtLl5tvGqitEx5dPolZjbc0P4RFaXnoL6soZbzgrUoSNMPfJ0jjWx6s7aDOXEY4mnKHg==
X-Gm-Message-State: AOJu0YzrmyttyvZeC54EtFQXTnwu2tXLPnq94pCy+u1h1OiCRghtnOu1
 yX45shMk/w1eNIJOhJZtusrN1hfJq7GdxcmEUYT2/cNPzUPfPNYc9mQkyh4SqHE=
X-Google-Smtp-Source: AGHT+IFhlT55C3JCvGZnCxkPY08IEgl3eQ6qeI9j9+6AQmls457E0criqb8uLFkQj6quFh57f0iTUg==
X-Received: by 2002:a05:6512:224b:b0:52c:e670:7a12 with SMTP id
 2adb3069b0e04-52ce6707b1bmr3446845e87.60.1719257187965; 
 Mon, 24 Jun 2024 12:26:27 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d0be841sm183549285e9.20.2024.06.24.12.26.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 12:26:27 -0700 (PDT)
Message-ID: <824590b3-d21c-47da-955f-83803545198a@mind.be>
Date: Mon, 24 Jun 2024 21:26:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20240520194136.2470200-1-giulio.benetti@benettiengineering.com>
Content-Language: en-GB
In-Reply-To: <20240520194136.2470200-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719257188; x=1719861988; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tT/D0dg/jd9XbrRvqiI8+CWCna2S6fAF19u0hP+Zmko=;
 b=CnYTK39slLUrwB0jsbLnwK+S26nIDgKO87yt6UeuuAI6G82Gf4bdt5WJnF9hNyQBts
 ITEQNNtRy+5fQZFALRnAxj6hwHkeD3fD3U2c66djoxWo2CFd4YZ1IoY4c/40iJXRxrFW
 uaNoWASjZQ7UQo9BhxNmxw/pvvPkW+oTA3mO2Gdj2omJWdJM1pqxiMz9SL3e5BrDVXfI
 fQnGEZLZ52eJisWuNTAiDc8k0jXzpvtC/g9ppDDc+MQtfuQAQkoEq6r9n5r+ZfDLVUym
 tUR5BRT8aCPpS2LQyPRktRrAe6xy5CI/CiLE86JqzrHQNV+rQz6ks9IIpcOsEaqbHnUd
 Ugrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=CnYTK39s
Subject: Re: [Buildroot] [PATCH] package/rtl8189es: bump to version
 2024-05-19
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/05/2024 21:41, Giulio Benetti wrote:
> With this version we can build with Linux 6.9.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/rtl8189es/rtl8189es.hash | 2 +-
>   package/rtl8189es/rtl8189es.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8189es/rtl8189es.hash b/package/rtl8189es/rtl8189es.hash
> index 1ef46436fb..1b1aefdd5c 100644
> --- a/package/rtl8189es/rtl8189es.hash
> +++ b/package/rtl8189es/rtl8189es.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  b28c15f4631f4151ea6fca96d59aec931766af49ccb7a0d5e1080fc41a323713  rtl8189es-eb51e021b0e1b6f94a4b49da3f4ee5c5fb20b715.tar.gz
> +sha256  5ab565057ac81527ac579edfdd2a1e42b9ceb2f2924b2ade88a11849443789e4  rtl8189es-30a52f789a0b933c4a7eb06cbf4a4d21c8e581aa.tar.gz
> diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
> index 8bac0a125f..11735ba112 100644
> --- a/package/rtl8189es/rtl8189es.mk
> +++ b/package/rtl8189es/rtl8189es.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RTL8189ES_VERSION = eb51e021b0e1b6f94a4b49da3f4ee5c5fb20b715
> +RTL8189ES_VERSION = 30a52f789a0b933c4a7eb06cbf4a4d21c8e581aa
>   RTL8189ES_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189ES_VERSION))
>   RTL8189ES_LICENSE = GPL-2.0
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
