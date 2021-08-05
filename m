Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF92C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 18:57:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F159D60EE9
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 18:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F159D60EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C589F60A3B;
	Thu,  5 Aug 2021 18:57:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wmc-NFo3sxEK; Thu,  5 Aug 2021 18:57:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16FFA60A68;
	Thu,  5 Aug 2021 18:57:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB8111BF2FE
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 18:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB49260A68
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 18:57:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ga_fjKcJ9S71 for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 18:57:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 54F0760A3B
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 18:57:00 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id x14so9772074edr.12
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 11:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DqVHJh84ucxS5bdGxchgwVa42DD3TxoNk5VMZlBrCsc=;
 b=IGVlaTKB1kYoQ9J1WC6sSv1rByv1ALISd+hp5LuKY2Zxu0lKlZbqs5GQPGyV11V26+
 5ygGcs4HfE1AMsy9KmymvOEbQ8oJxzJNR7GSGaV+J7qsjOuZJlUkInvVwmQLFnQiL0Hg
 EjiJSGLlq9nld6YDWM8htq3xMK8GKRSlMZbvAYJTu8H6KBJKTY1kR5vEOZCKu5HXMDzn
 +JWvNjmKF0XtJN4hO6BeAX+pbtpCL53P3m1z1gkDezqvARetWHtuOkTbSkwcyRBQrrtD
 bNv/yxLo0HyMPNG1Uf5N08fSCxCwIiY9n03Ljs6/jlbb4GzKrSbcvl4HKyLYpH26csee
 WfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=DqVHJh84ucxS5bdGxchgwVa42DD3TxoNk5VMZlBrCsc=;
 b=NKIRBiy5Vh0pB1nmSk8iCiILKccix6pHaqtpNFTKajybBwb9LD0Nkkx2gbTsQ6agK/
 s/pA6tb4A+C5ncKrjHmwzx9KHuxYiPmg8gMgLtJtAlDukZukHwkcM8SknAp2xTUz0yEd
 YcN4zEk8Vy91a+31KMk4dPGF6j3/aZ815EJMxK+vvuupukm9e2+MO4rguJDv7EsmGT5R
 gt3+Z+nY1QM394AZfF8FTAPWovY6Dihgb8CGnQAC37ADjdX7FxQycOAlsNp64WhPm+GY
 /g8YVI9nwDXvd9wBg3NlGHl9/RHAHFvgw+2qGjGcnqMG5DPP3u1TCeHAsxLZf6HCxjcm
 VuLw==
X-Gm-Message-State: AOAM530xiOaV/oPPAn1MqoC31vNbEhaD1nkW1ZC3CNPl72dwLcBZLPf2
 jgI7SoiwtCq+/MWRyxOxH9G15VylSa31bbbNM/Y=
X-Google-Smtp-Source: ABdhPJwjl50nUMagtlRdRMDnUIrGlNrJ+ellm1cYWEC9KRFFn2nLLRFyPAAeQ3k+p/DoCyHV7i/ixg==
X-Received: by 2002:a05:6402:b82:: with SMTP id
 cf2mr8326586edb.71.1628189818468; 
 Thu, 05 Aug 2021 11:56:58 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id mh10sm2008052ejb.32.2021.08.05.11.56.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 11:56:58 -0700 (PDT)
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 buildroot@buildroot.org
References: <20210804103353.468494-1-clement.leger@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <8f362aae-7680-96d3-8563-cefee02db4ab@mind.be>
Date: Thu, 5 Aug 2021 20:56:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804103353.468494-1-clement.leger@bootlin.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] boot/optee-os: use dedicated 3.13.0 patch
 directory
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

CgpPbiAwNC8wOC8yMDIxIDEyOjMzLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gRXhpc3Rpbmcg
cGF0Y2ggaXMgZm9yIDMuMTMuMCBvcHRlZSB2ZXJzaW9uIGJ1dCBpcyBsb2NhdGVkIGF0IHRoZSBy
b290Cj4gb2Ygb3B0ZWUtb3MgZm9sZGVyLCBsZWFkaW5nIHRvIGVycm9yIHdoZW4gYXBwbHlpbmcg
aXQgb24gbW9yZSByZWNlbnQKPiB2ZXJzaW9uLiBNb3ZlIGl0IHRvIGEgZGVkaWNhdGVkIDMuMTMu
MCBmb2xkZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVtZW50Lmxl
Z2VyQGJvb3RsaW4uY29tPgoKIEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogUmVnYXJkcywK
IEFybm91dAoKPiAtLS0KPiAgLi4uMDAxLWNvcmUtemxpYi1maXgtYnVpbGQtd2FybmluZy13aGVu
LV9MRlM2NF9MQVJHRUZJTEUtaXMucGF0Y2ggfCAwCj4gIDEgZmlsZSBjaGFuZ2VkLCAwIGluc2Vy
dGlvbnMoKyksIDAgZGVsZXRpb25zKC0pCj4gIHJlbmFtZSBib290L29wdGVlLW9zL3sgPT4gMy4x
My4wfS8wMDAxLWNvcmUtemxpYi1maXgtYnVpbGQtd2FybmluZy13aGVuLV9MRlM2NF9MQVJHRUZJ
TEUtaXMucGF0Y2ggKDEwMCUpCj4gCj4gZGlmZiAtLWdpdCBhL2Jvb3Qvb3B0ZWUtb3MvMDAwMS1j
b3JlLXpsaWItZml4LWJ1aWxkLXdhcm5pbmctd2hlbi1fTEZTNjRfTEFSR0VGSUxFLWlzLnBhdGNo
IGIvYm9vdC9vcHRlZS1vcy8zLjEzLjAvMDAwMS1jb3JlLXpsaWItZml4LWJ1aWxkLXdhcm5pbmct
d2hlbi1fTEZTNjRfTEFSR0VGSUxFLWlzLnBhdGNoCj4gc2ltaWxhcml0eSBpbmRleCAxMDAlCj4g
cmVuYW1lIGZyb20gYm9vdC9vcHRlZS1vcy8wMDAxLWNvcmUtemxpYi1maXgtYnVpbGQtd2Fybmlu
Zy13aGVuLV9MRlM2NF9MQVJHRUZJTEUtaXMucGF0Y2gKPiByZW5hbWUgdG8gYm9vdC9vcHRlZS1v
cy8zLjEzLjAvMDAwMS1jb3JlLXpsaWItZml4LWJ1aWxkLXdhcm5pbmctd2hlbi1fTEZTNjRfTEFS
R0VGSUxFLWlzLnBhdGNoCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0
dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
