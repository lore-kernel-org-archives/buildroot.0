Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3420EC19F32
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 13:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33D1160F69;
	Fri,  7 Mar 2025 13:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HuQ-B3mJ2z_5; Fri,  7 Mar 2025 13:20:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C8E960765
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C8E960765;
	Fri,  7 Mar 2025 13:20:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B48671F
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 13:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DED460757
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 13:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id epbD_cVgw6Ez for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 13:20:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7D751605EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D751605EA
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D751605EA
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 13:20:48 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5e5e34f4e89so1579618a12.1
 for <buildroot@buildroot.org>; Fri, 07 Mar 2025 05:20:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741353646; x=1741958446;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pzmBLR1m5LriYY7KhOiLbiMILBnHYdSqwWXZKSMqx1Q=;
 b=WpOBB8lyXqtz6dkRqvFQjzZfeDZsM6NZTZDfINgwCt+CO/5dKKxULJ1StpdFN81Vf+
 7Q5+uGdQvutluPd+kM9Ik8ZenYUC82cbEwIZPGSZVmbztNr9W3i4X5cOWjyfexVfuYoU
 uEKKI4eTqPj1BImSVT4QxeuB8kSnEnc8OAsdxOkr+DDliB9ARTQosxIbJZODsOaWSTa0
 gnlt0GvzEag2Y4bE+s05VJIYA3+3BYFzJQT7px56nxHY7r0LzLlew9DdhEYKU6UJXhcQ
 r9nC0z25Y7cIuMedPAHlsghCkxXFbmij+WANk/u+nvfALIeaq5RcmzaXHmf/1NwyM/wk
 Kzyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV16M6ON8cHEhArawiiW8nHbXUuE2QPYW/W1Vwz4bQ2IE7xreETKD+WSKZGwzVd0BbkgSbw/TjiSP0=@buildroot.org
X-Gm-Message-State: AOJu0YzAIRN0XCn1VQCnJvdiDujL3no499dODimQatR9WH1BwDu7OAPU
 SxartBaag+QiT6iUFU/NBjMertT26wNzUM99UNie0fB3EhDFVI0O0Az2OQ==
X-Gm-Gg: ASbGncurwWLe4ek4spBzyqf1l8cj7cZDG9EHzC1ZwvHl2EKnun3tl46FaeqawJrccTB
 lmRJLGChjZn4FrzEyjwT4AXa+OorD0FLBtqSGzSBFXpaY+KwATDM/CRWg5LKn6cDP9q/1rJTbnH
 KAQsSeME7ee/Yze6DGTPO53FKsbmItc9yZFX67XOjovmgVHAbYC1y/ffR2DPBxBiRE5vBPWaR5F
 4snnnnWdyjGsjKt/cFvXkkNXfmunDxnY1k9LwAQEJCRrc7mQsYK00p90tIwlwpebO0RqFOl2ZJw
 L4t3vJN1CkTsIXMgcUY4gWZ6GUZ2RClhUdXaQ/9AQGkK3IYTdWKmz6pmI+WMZuQAEPs=
X-Google-Smtp-Source: AGHT+IEVZp60EH9bjM5K6wS9rUj1OYsXL+gUq+RA4rN4DP/+3Ghr71INdqiT0yvkUJhnbbiFSyniWw==
X-Received: by 2002:a17:906:f589:b0:abf:d4a9:a0a5 with SMTP id
 a640c23a62f3a-ac252f8e28fmr396953366b.45.1741353646272; 
 Fri, 07 Mar 2025 05:20:46 -0800 (PST)
Received: from ?IPV6:2a02:8070:2483:7e00::f0b8? ([2a02:8070:2483:7e00::f0b8])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac239485bf3sm279605366b.63.2025.03.07.05.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 05:20:45 -0800 (PST)
Message-ID: <be26f445-7e91-45c6-b249-ef8cf0653606@gmail.com>
Date: Fri, 7 Mar 2025 14:20:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1740841539.git.yann.morin.1998@free.fr>
 <b583ec300376e548aa474691e08d8486dff91a16.1740841539.git.yann.morin.1998@free.fr>
Content-Language: en-US
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <b583ec300376e548aa474691e08d8486dff91a16.1740841539.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741353646; x=1741958446; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pzmBLR1m5LriYY7KhOiLbiMILBnHYdSqwWXZKSMqx1Q=;
 b=kHTNTBHaNlFgp3uW1QUosImoS5aLNMy5h5oNaNE+iCt/3WKmxLhtjG3RxXLgFUcV1O
 zQfV0q58TnHvf96GDwAEGETOJHvs3AWJrimR1zyh4GIPxURRjyXlPSV+6yIpA9sflA4f
 qgjVPVQ4NBJh6dkGDopSwuICH4IEBJ9fUrF5rmAfaaCHbXhkULwNJzxJ58XLytf+COKE
 8H3lCSTo8jrJ+HpGKsKtRcVRGDoDcjiaTVcGeznCz6uMJiudR41UqHwSOEyEyhyv0MZC
 XXGJl7GcZxiIiXGMCmFFnbbxryAkrfr0H4PnjHK/pIiuvjQCN7t6qMGqG+HBYfplF0BG
 cZqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kHTNTBHa
Subject: Re: [Buildroot] [PATCH 4/9 v3] package/slirp4netns: needs TUN
 support in the kernel
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,
the changes looks good.

On 3/1/25 16:05, Yann E. MORIN wrote:
[snip]
>   
> +define SLIRP4NETNS_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NETDEVICES)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
> +endef

Yes, you are right; those kernel configurations have to be applied.

Thank you for the trial and error. ;)

[snip]

Regards,
Raphael

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
