Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB22E728C7
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 16:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59055408E1;
	Fri, 29 Sep 2023 16:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59055408E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hekhr0bTa-pD; Fri, 29 Sep 2023 16:19:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85E2A4051F;
	Fri, 29 Sep 2023 16:19:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85E2A4051F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B51971BF27E
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 16:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D9C283CEF
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 16:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D9C283CEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KB4F9Z87XEpn for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 16:19:22 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62DD283CEE
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 16:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62DD283CEE
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1bf55a81eeaso109159125ad.0
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 09:19:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696004361; x=1696609161;
 h=content-transfer-encoding:subject:from:content-language:to
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dr5AWcgIl66KagzgFpuy+ipzvCBa3ufx9/nbPeMDgnU=;
 b=Rj+rafaVhvuocVGf5GDdKt0rS8ireO/x/z2wng3ZpmggS1RZFV+aBxWCcVovBhMiFR
 TJyTxOc4c2hAoSrVYtQuFMkkB6lYYtnfGkLlvJAoHLactGbUpKB/KeFpgglrdDc1ZJFY
 K/GxfWVRC8OQqb1UUvOPsN242x2f8kAL3OhhzK4m2Kg4BaBS1414nxRuSGrKi0C4o+mN
 R6Fm0ninKf1w1bPGWSlmLU9JRN+fq0TMQy+m3SffiLpF3nVeehB2YDyW2M7NdS0W0/un
 jUuWaHlWGkg6QpC1Li09Cy/lOpQypTzDRnMhP4JlD3wkUH7JdxY+RrMHkQFg6C2gGZTH
 e1Dg==
X-Gm-Message-State: AOJu0YxFwEJcRbdaMiqXvrp4RjqqJWaXHcaLXEoZ5o2YcutqFo6USTwy
 VsvGyE5CoZck1c/hxXcr+SP/x7zFI/DUBw==
X-Google-Smtp-Source: AGHT+IFDwxmi3OyEVojpjRQangdAyZHbYifzksUSfvjITn3mma/S0YiWDGXKIv4ytrhQn7uVZTFyww==
X-Received: by 2002:a17:903:22c4:b0:1c1:f3f8:3949 with SMTP id
 y4-20020a17090322c400b001c1f3f83949mr4999821plg.1.1696004361417; 
 Fri, 29 Sep 2023 09:19:21 -0700 (PDT)
Received: from [10.0.0.73] ([76.8.199.226]) by smtp.gmail.com with ESMTPSA id
 21-20020a170902c25500b001c61073b076sm11291664plg.144.2023.09.29.09.19.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Sep 2023 09:19:21 -0700 (PDT)
Message-ID: <63a9eeea-7362-4de3-3d53-e00548a3a458@gmail.com>
Date: Fri, 29 Sep 2023 10:19:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: buildroot@buildroot.org
Content-Language: en-US
From: Lance Fredrickson <lancethepants@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696004361; x=1696609161; darn=buildroot.org;
 h=content-transfer-encoding:subject:from:content-language:to
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dr5AWcgIl66KagzgFpuy+ipzvCBa3ufx9/nbPeMDgnU=;
 b=KPDZ95Up6UqCSQkCeXJSSlFJviZyg1KikwULVoCzZ4bEnhK86HGyeBSpSlBOQEitjl
 SLlQpqCNmDyAjGNSuoh8QBayAxAVC2Bi9W/NeNKvXT98biOCvUPajZyI68dP1rocg4Zh
 qz5f2BR/LMgpraw7/tKCCi9sVEFnEBmcE9jgqtzjKi3lN8UgZlPsDlu5WA1hm20CCtjn
 sTZArvIfKFSnp4Knx8mVxLvPuMO4C5/sROmsFReEZ7mpsZFijbCcXbfF6zHOVltMpz7I
 nvVsp51Ngi4im9bSZVsSqtV7WXcHK/5yD4cZty4K/5T/Dzo4EQAKtoGJh6GvMWBp5tTB
 MK1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KPDZ95Up
Subject: [Buildroot] openvmtools - musl
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hlbiBidWlsZGluZyBvcGVudnBudG9vbHMgd2l0aCBtdXNsIEkgZ2V0IGEgInVuZGVmaW5lZCBy
ZWZlcmVuY2UgdG8gCnJlc19pbml0IiBhbmQgb3RoZXIgcmVzXyBmdW5jdGlvbi4gSSBmb3VuZCB0
aGlzIHBhdGNoIGZyb20gb3BlbndydCB3aGVuIAphcHBsaWVkIGZpeGVzIHRoZSBpc3N1ZSBmb3Ig
bWUuCgpodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vb3BlbndydC9wYWNrYWdlcy9t
YXN0ZXIvdXRpbHMvb3Blbi12bS10b29scy9wYXRjaGVzLzAwMTQtcmVzb2x2ZS1tdXNsLWRvZXMt
bm90LWltcGxlbWVudC1yZXNfbmluaXQucGF0Y2gKCmJ1aWxkcm9vdC0yMDIzLjA4Cng4Nl82NApn
Y2MtMTMKbXVzbCBsaWJjCgpMYW5jZcKgIEZyZWRyaWNrc29uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
