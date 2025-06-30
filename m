Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213E9C8302D
	for <buildroot@archiver.kernel.org>; Mon, 30 Jun 2025 13:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCFF040A5A;
	Mon, 30 Jun 2025 13:38:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a8dXiYgXbkL0; Mon, 30 Jun 2025 13:38:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08C634097A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08C634097A;
	Mon, 30 Jun 2025 13:38:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B1FA21C9
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 13:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2EB780F7E
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 13:38:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_dmyO2lj1Fb for <buildroot@buildroot.org>;
 Mon, 30 Jun 2025 13:38:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8BC7881EE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BC7881EE1
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BC7881EE1
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 13:38:37 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so3455688f8f.0
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 06:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751290715; x=1751895515;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+z26oHgu/EbR9hbU7UNf89bTuxmIKMoQWU6nL1xkj7g=;
 b=ZwJMICs+AFoMXfl7zmURjgk61EYEIP0FrrGSIgt848v0922A4M0hvhdH1BmR1jSj08
 I+Gy/bMa2xiFivBHaLLW0HAN43WrBmMzXhJcBGB1SryWvUpcbZvBpzsTJ5t8fNdSCVRZ
 1uiAijIYe2Q+xdkM1d1IqmhoiLzTiYplQh3HPMmugFriDFV0riej4ITW3jyBGMnoRfj0
 EpPbg2nsJDvMl+iusCg2j5cf3w19zqvFwwYnMJfQF8VWmiS2OHLxbuxqbw0/PGoPtLEx
 Bgv8jSH96+qB80HaYiCJtqHR+OVjkPns2oLZeOdti+0gERP1ETMIFcomc8QRz+1675vf
 K/Xw==
X-Gm-Message-State: AOJu0Yw7w2tjcW2HsQAbecz53E7ZVp7K/a7CWhsfysLOZ/WYaG47C0Sb
 lPzciEFEnHrfhoKoOZ4dzthRJU0as1lTbHFgJCUUiLCR2oIGfGuh3VAF9ggYhwUk2cuvIVInImq
 Dn2/M2zU=
X-Gm-Gg: ASbGncvrtSwtK1lo+Qh5v2LY5+XwkLI8wYoKXOrDp4m7w/WyFWr17O2dkiRW4tl5KGu
 hDXrEcoT4neRyMYD7TOhMk7/cqZngXJXedrUP7DMpKZRbIZgcwlkQ9DzH1H8MpTgNvjYwViFXDE
 xpAwn8MekbC9OSvhjD/+V6Hr7sLCMOBX6tLFGwE9JA8QHl3APoxFi54wEeOjG7uWZ+KB3v2sJaO
 ph9RvcGDJcSxYmp9BAGzkxD7hLfXVEhr4NDPc7hRQ/mzLw3VJZa//bO8l1q/umdUSqRCbr0/fKA
 DcSt/cZ476dTLDY+g71+Wahjum+qaGjzXUi6tNAwQFltctnAyJxpztSULQOIolqSobEWTyFtjgE
 =
X-Google-Smtp-Source: AGHT+IEO07zvHLqJpH4rYvWslHWtrA75Kt/TVsXB8EYSPTZ4P1DDza1zRPyZ1px88ZCpDIO0SRHn8Q==
X-Received: by 2002:a05:6000:4188:b0:3a5:8934:4959 with SMTP id
 ffacd0b85a97d-3a6f316239amr11075465f8f.27.1751290715360; 
 Mon, 30 Jun 2025 06:38:35 -0700 (PDT)
Received: from [192.168.178.20] ([213.211.140.212])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45396f24796sm74123105e9.1.2025.06.30.06.38.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 06:38:34 -0700 (PDT)
Message-ID: <52d86611-aec0-4fc5-a640-3d71483b9230@mind.be>
Date: Mon, 30 Jun 2025 15:38:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20250627121948.1933049-1-raphael.melotte@mind.be>
 <08585e4962ffe98f9faa307813c19ddc@free.fr>
Content-Language: en-US
Autocrypt: addr=raphael.melotte@mind.be; keydata=
 xsBNBF9jhjsBCACmkrLRBR22D1FiSlmQGKiSPPLY0lAYe6/DnBT7OsgiGIOWqmQL1ryGJmxI
 9PDMDGEBngJ6RyrsVlREt7ugoBEg75CrtYwXdTCB40fEPweceHtWwAQoOS3MDgFhdvd6uZvl
 YWenR6RcbCo/LZaV/novslE1eCnADNChMOkp8jTAA0K2jIlEYexrzO+G3CcrKmo6naVxn56r
 dn0kLnff4f/wvj+1l+J7m6GVL/8ckQ8fVQagLxQ5LHoxhIcOxKH1IEzf+gri/e+16gka7bWE
 4QUCEeGo/pBYysLinUP/6ArAmWoZXfGH3S0HiLBc/Yf4klnJ1nd6vZmxYKppOmy814+tABEB
 AAHNK1JhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT7CwJQEEwEI
 AD4CGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSjAZBvHnwkHJEj52rDTCsxdUfmrAUC
 Z4ZBYQUJCgPupgAKCRDDTCsxdUfmrC80B/0Y4VeyvIBoHgN2l5Jv9SvAAvPdtDNQBe66aG3X
 5J8wGOao7jGQQQwd52A/eRRHKf7DaVK8m1aMb82KSwaGp5YAM2TgUg72DvqPb2Nv/NKTjQ41
 mTBKOr0A1JJlhF0fOhOCvi4A4eQFnNt/Awn1id1ZKv7CVErH/AiXfdqF0nwXJ+SgTb7FtQ/R
 sCekSRrrnMiGqFA3W0zeYyZ6liehOCqqmYDwdqbnjjdaYfwEwPMRJCobdt9gpQsFxOWGNPTc
 EtPX6LyDEtF0gbQEdRDiYZ24YBeAydRwycmOiyKiVNnQFkKBw6jas5+7WeoKwnhZ7EEHhIEL
 6xRlP+ACT4YWIdkCzsBNBF9jhjsBCACcBqvoGcSgHH5io/UF+ouPP3tkr68kp6Ww2Gtnf7gu
 cL9vr9ixKbuobOCs2/1JhQD1fjmrs/Nb7wYUoA+QECkoZbdRLoqaldX0Uf+7no3EtwwSMROV
 EJKBOoRyuW7nH7PzoRmMYDGHqCYTuTfBH8byoh29tjPezyli5n4Zr3JIjmgjgG6jT31uqeDn
 eirLtWta2c2n4o5cPKoVNsZJmbVtuzAz5XHUPHDaLaFnQlaPlGQ1RDvuKVzkZ1maXloa9lND
 TL7dkWoQvq7LtYxRALEhSUU8My2Bxb3B+rRMGS8W+IGAdSvtxiGqDP6W7Ac2mrg13wXf8+fq
 XiYblnHp02PtABEBAAHCwHwEGAEIACYCGwwWIQSjAZBvHnwkHJEj52rDTCsxdUfmrAUCZ4ZB
 9QUJCgPvOgAKCRDDTCsxdUfmrDrzB/9w+0pSSeHdd+mgOgtjoab23OfHbwkQa86WgdSpx5hR
 U+QdtB9zJErJBA8q5Kq4vBSu+h9V9HaETg1nnpaREbiEo4mX5kiTHCwr51JArBLFMQXGMTqE
 pENpJdaHBZDJqktvcLFBfIzIo2avLMOjAznZBeFimEcKgwouAo9DK5qb61th9hjUBvNvzFjh
 h+mjryTGqe4l0eIRxwPi7uh1d3PCql/InUhXDii3oisu75ss+2aKyRtx1RMLxcj+pD1oheZs
 ib86j6501oe6jZ+FsoUBf6EXcSij4nZlVYtEWsr7vKpPEUdNYCeeAAOuabDWsYRU/Rfl8Myc
 7ZS5078ic8ic
In-Reply-To: <08585e4962ffe98f9faa307813c19ddc@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751290715; x=1751895515; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=+z26oHgu/EbR9hbU7UNf89bTuxmIKMoQWU6nL1xkj7g=;
 b=ZidanJUKitHDGH03D4TTgf1IlhYsAdeFQMiay3MxgtU0ILsXBJf/xMjw0u+tx/lJjl
 4jNWCaKcCiLxbVvK2mc1ToZtq/j/84NTaN9UyUv9QprAwTUkJ/Cqlw7kgIpT+bgOo9Af
 EBtDzJjtMe8FqUxCrNVCnXqAXFii1Q0rIrEvgkud1+RHcacs8y0m+nqYbaiM44mmxRID
 NsThSDM70FlAa9xbZQOE2QeFURWbmg44cbuTy03BBf36K18cXZ3nkB9AwB4uSZR26ZUJ
 njlsKVqy4CpIMG+qVWZq6iZq4Kr3Aar4acrB9zQCw6LglYgmaViJq5ZU2X9ykHanMuDB
 8oSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZidanJUK
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: add new test for
 nginx-modsecurity
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLAoKT24gNi8yOC8yNSAxNDoyMiwgSnVsaWVuIE9saXZhaW4gd3JvdGU6Cj4gRm9y
IGluZm8sIEkgZGlkIGZldyBtaW5vciBjaGFuZ2VzLCBzZWU6Cj4gaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzVjZGE4NWNiNTY2YmZjZDlkN2E2YzVi
ZDcwMWQzMjZhNDdjYjcyNWIKPiAKCkdvb2QgdG8ga25vdyBmb3IgbmV4dCB0aW1lIQoKVGhhbmtz
LAoKUmFwaGHDq2wKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
