Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896CEC001DF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 04:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 035664202C;
	Fri, 28 Jul 2023 04:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 035664202C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZOqVBy_-BK_C; Fri, 28 Jul 2023 04:56:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1906D42017;
	Fri, 28 Jul 2023 04:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1906D42017
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B4C21BF3ED
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 04:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75A4783C12
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 04:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75A4783C12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OKBkTrGNF6Aa for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 04:55:58 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3D3683BFF
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 04:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3D3683BFF
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fb7dc16ff0so2964206e87.2
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 21:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690520155; x=1691124955;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bhpECbZIivWaXuxhfR/5nssdty6RkqzJ7BkuR6rz3XA=;
 b=JyXYm0DYzWn2fuV3lNy9gJzbj0SSNNvSuRXGYvC9vsyf71vUknawYVf31J1OS4aUvN
 Ql+X2aXlFBnabNBEm8L2acjwyprRdISaglVRgWsso2j0kBKcHs/FoEz+iNQmh3FQO1he
 0sbMQjVM4Vopb+2vyjnZTbS/JS8oFc2Mm9trsoVR+l0nsuvFD9agu/RJogqrOWuAXLi8
 0WoC1OREXbJo7mySZjM4X5+O/UlGi1QhsPssE7ck4uBmJSi2ENhuPsRhIkmQStvB2AjE
 GX30nCfN8bvVtWjjZzzxXujGGYBwoAYaFkPTEaKRNx708pz8KgoZeoVv2zR+g8QU8/48
 LtPw==
X-Gm-Message-State: ABy/qLavTPQJJxq+K0n8uGO0gM3gOHa+se6PES2rV8y5cmUDG3VKCpBW
 dTJJvWIuzy4axsstZBTJIORX17LmjWNdrYQuHd+kaZlmNLk=
X-Google-Smtp-Source: APBJJlHwhXKO3g48FtjnLE3vMhd1i0SkKOWtktQrpnB+KIa5sWQpshG28M7OrAqiS4Z23Q1rHzbKkA==
X-Received: by 2002:a05:6512:1286:b0:4fb:8bfd:32e4 with SMTP id
 u6-20020a056512128600b004fb8bfd32e4mr939781lfs.13.1690520155475; 
 Thu, 27 Jul 2023 21:55:55 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182]) by smtp.gmail.com with ESMTPSA id
 u21-20020ac243d5000000b004fe18e4a4f2sm543718lfl.183.2023.07.27.21.55.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 21:55:53 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2b9b50be31aso26285091fa.3
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 21:55:53 -0700 (PDT)
X-Received: by 2002:a05:651c:156:b0:2b9:c644:415d with SMTP id
 c22-20020a05651c015600b002b9c644415dmr729281ljd.46.1690520153415; Thu, 27 Jul
 2023 21:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230728045411.1023408-1-christian@aperture.us>
In-Reply-To: <20230728045411.1023408-1-christian@aperture.us>
Date: Thu, 27 Jul 2023 21:55:42 -0700
X-Gmail-Original-Message-ID: <CA+h8R2p4z8_bDF2d8dnzqivFN=iMNr_7Ns0tZ2tbP-eckm=Tcw@mail.gmail.com>
Message-ID: <CA+h8R2p4z8_bDF2d8dnzqivFN=iMNr_7Ns0tZ2tbP-eckm=Tcw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690520155; x=1691124955;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bhpECbZIivWaXuxhfR/5nssdty6RkqzJ7BkuR6rz3XA=;
 b=z4YPGAR0t/8HyZ77r7xhhEgXrhXDhgQP8CrFTWQ9Mp36UbMyvjetjDy5q8LFky5EZJ
 u8ofVpW+c2qBWip4g9oFbrcznnpOWa1Ptbd8EL+OPbPp1R5LG/2Jp4qIJ5WazcE9wUUM
 izClVYE18XC8eUABjQczmC1NJuTmO6OcdjSOPl2SjVpfWfo/ceRwHjQU/rBYSkoR9rSV
 bc1bhGe0nF8OIxu/V3WyBoN10uhkXGX2O3v88B5+ABMkSi4DXNALFbm8gQnPqxlyWbFd
 xPzV+XWdWRej+tGLCxFS60H38kkk/uZjAN+mfkkjA6FcEGWq1V9RkEC9k/sqZX3kk3hP
 Co0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=z4YPGAR0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/go: fix go-bootstrap when
 parent dir contains invalid .git
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Romain Naour <romain.naour@gmail.com>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKT24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgOTo1NOKAr1BNIENocmlzdGlhbiBTdGV3
YXJ0IDxjaHJpc3RpYW5AYXBlcnR1cmUudXM+IHdyb3RlOgo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L2dvL2dvLm1rIGIvcGFja2FnZS9nby9nby5tawo+IGluZGV4IGVmYTQ3ZTU3ODEuLmFlZjhhYjIy
NDAgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9nby9nby5tawo+ICsrKyBiL3BhY2thZ2UvZ28vZ28u
bWsKPiBAQCAtMTI1LDYgKzEyNSw3IEBAIEhPU1RfR09fSE9TVF9FTlYgPSBcCj4gICMgSE9TVEND
X05PQ0NBQ0hFLiAgU2VlIGh0dHBzOi8vZ2l0aHViLmNvbS9nb2xhbmcvZ28vaXNzdWVzLzExNjg1
Lgo+ICBIT1NUX0dPX01BS0VfRU5WID0gXAo+ICAgICAgICAgR08xMTFNT0RVTEU9b2ZmIFwKPiAr
ICAgICAgIEdPQk9PVFNUUkFQX0JVSUxEVkNTPTAgXAo+ICAgICAgICAgR09DQUNIRT0kKEhPU1Rf
R09fSE9TVF9DQUNIRSkgXAo+ICAgICAgICAgR09ST09UX0JPT1RTVFJBUD0kKEhPU1RfR09fQk9P
VFNUUkFQX1NUQUdFMl9ST09UKSBcCj4gICAgICAgICBHT1JPT1RfRklOQUw9JChIT1NUX0dPX1JP
T1QpIFwKClRoaXMgaHVuayBjYW4gYmUgZHJvcHBlZC4gQWxsIHRoYXQncyBuZWVkZWQgaXMgdGhl
IC5wYXRjaC4KCkJlc3QgcmVnYXJkcywKQ2hyaXN0aWFuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
