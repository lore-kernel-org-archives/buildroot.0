Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7D8C5B543
	for <buildroot@archiver.kernel.org>; Thu,  5 Jun 2025 15:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56B5A83FC0;
	Thu,  5 Jun 2025 15:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ulvr7b3Ma54q; Thu,  5 Jun 2025 15:34:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B906583FA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B906583FA1;
	Thu,  5 Jun 2025 15:34:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AF9851A4
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 15:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A14BA419C7
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 15:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oj6mKnXNM_F6 for <buildroot@buildroot.org>;
 Thu,  5 Jun 2025 15:34:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 81771419AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81771419AA
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81771419AA
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 15:34:16 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so8749105e9.0
 for <buildroot@buildroot.org>; Thu, 05 Jun 2025 08:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749137655; x=1749742455;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/32QFvY45WP3siQzF1CKbM6QbEl85CFR34bxn5SGNpo=;
 b=suvUqPRcxqNkkOT6DpTPJrb1OvYNeP0grERRiF3RJm/8U1RoNx99A1hSLmjR5qZrtZ
 x7Lb8IAMvGIKnmk2QXDuH2dboywD0AG3p3kt65tDfcOpKl2I7Wn9EoE3W+gvXHhKo/IU
 VWXNE6JInlpcrj4DDpxDPoNudcG3AyJpnpbnr51MyECOosQs5SYWCb2T+TABaKmiYr5m
 5ETZtkXO999Envqi+WjKfLukBPCKtFqnzh2AMxXLWaLg9aKkLQQP1NcAXPHeaXacORMW
 wiq1sG/ImLLUXzDvYD6cL+8xBEpfgVXiD19hs0Rr1jX5Rgby8QD/6MnHYtrYErQAinY4
 9CQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKYyY5W6Fwswdoss0j0Ik0Jd3Yv6BIfJD6xchdxCuBCkD6YBmEfnjQBechYezqpLflhoKZjcKbqrc=@buildroot.org
X-Gm-Message-State: AOJu0Yw+mFvEmD66kpCmcBG5k16KCJMa7OcGD7J6y2E8z7l3159IcJMh
 1UaeiKQ+wMBgtYgWfvT7Zed+cqDtJceEJmflwhwE8T2hrJQE16hJ5nKFRH/tInXuiDMCuxSiymg
 YLHhV6tc=
X-Gm-Gg: ASbGnctPGq/DiX9nMogHYZxWh9timMEnNHEi1g4dFHKKTkm1VAk8lWUITj60xK/iU8s
 +j/hGP/ACERlLwHgk78EazrzO5tfmhzl5quuIeO/6Vbx+9KvtxzmNTIrvCsQdDGgTHPFYhkRoPU
 EFM7ga1IFeWx9jIKnvKJBuBBKun64Uea2l43EssNVT6AAxcBtMGgGcajad4TTPNAil+hKTW2QZS
 mnOE9LgXHfp6YrvyemZMfcpK2jnOYWuIXrrhrBQtjOz/Wvhyw8DOoEUkRCpgMzkJsJmErzhCKTf
 H9mI263EtLkMGPiFmDJcelTdeS7UGCPBJaSS6a71iiwhVEy9luvl3a1OK7lbPLaPYviAPWkIBNb
 MPAijuMkPWZ8WttSZpShJYW79aQneDdYz
X-Google-Smtp-Source: AGHT+IHhbEuargUf14pK2etvVWDQxnR5uZVq9AAksH9+DC5yOfm2nm1hKJ9VgsT64lHMQQkCeQ3lOg==
X-Received: by 2002:a05:600c:3b91:b0:450:cfcb:5c83 with SMTP id
 5b1f17b1804b1-451f51249ffmr72678205e9.30.1749137654984; 
 Thu, 05 Jun 2025 08:34:14 -0700 (PDT)
Received: from [10.5.0.221] (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a52f8c1bd8sm391606f8f.85.2025.06.05.08.34.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 08:34:14 -0700 (PDT)
Message-ID: <9a12494f-2a50-4fe3-98ea-95060a5ba672@mind.be>
Date: Thu, 5 Jun 2025 17:34:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@rnout.be>, buildroot@buildroot.org
References: <20250603063844.194753-1-raphael.melotte@mind.be>
 <2345bdd4-08d4-485e-b2db-8e497717ca05@rnout.be>
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
In-Reply-To: <2345bdd4-08d4-485e-b2db-8e497717ca05@rnout.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1749137655; x=1749742455; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=/32QFvY45WP3siQzF1CKbM6QbEl85CFR34bxn5SGNpo=;
 b=ZzvvObjNAf2NWJT9LLfcU8Ao7YsAxf4urRZmtYstH7jcZI0tD0yOXpCwTFkaE2h4lZ
 payNB0etZlyhdHp106L7W/LfoRzBIwQ+Fq9vvcbyTRhlTv5yySzxTaUwPTPsMOijzd6H
 hM3S8OKPkzilRS65tNHiEroeKY5QUjJZKLkCI48IEO2+RXBuT9y+gsHr0hl/7Pgclrvi
 NMELbML9pazCz0agPg1P/ZJY0zkN5/WCFPpKJrWc8y4NR4yEbbig4nbrnjYA+7PUo2/i
 k4dtx1lnOe6hVaHbAkFvQz5Lta/BcDsYEjRDjiK3VwSDqDUykOkjYom3QAWvqTk2fNrN
 Z3IQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZzvvObjN
Subject: Re: [Buildroot] [PATCH 1/1] utils/get-developers: add option to
 list packages matching developers
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

SGkgQXJub3V0LAoKT24gNi80LzI1IDIxOjI5LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToK
PiAKPiAKPiBPbiAwMy8wNi8yMDI1IDA4OjM4LCBSYXBoYcOrbCBNw6lsb3R0ZSB2aWEgYnVpbGRy
b290IHdyb3RlOgo+PiBJbiBzb21lIGNhc2VzIGl0IGNhbiBiZSB1c2VmdWwgdG8gYmUgYWJsZSB0
byByZXRyaWV2ZSB0aGUgbGlzdCBvZgo+PiBwYWNrYWdlcyByZWdpc3RlcmVkIGluIHRoZSBkZXZl
bG9wZXJzIGZpbGUgZm9yIGNlcnRhaW4gdXNlcnMuCj4+IEZvciBleGFtcGxlLCBvbmUgbWlnaHQg
d2FudCB0byByZXRyaWV2ZSBhbGwgdGhlIHBhY2thZ2VzIHJlbGF0ZWQgdG8gYQo+PiBzcGVjaWZp
YyBkb21haW4gbmFtZSAoZS5nLiBhIGNvbXBhbnkpIHRvIHVzZSBpdCBlbHNld2hlcmUgKGUuZy4g
ZmVlZAo+PiBpdCBpbnRvIHBrZy1zdGF0cykuCj4gCj4gIMKgVGhhdCB1c2UgY2FzZSBvZiAiYSBj
b21wYW55IiBtYWtlcyBzZW5zZSBmb3IgYnIyLWV4dGVybmFsIHBhY2thZ2VzLCBidXQgdGhvc2Ug
ZG9uJ3QgZW5kIHVwIGluIERFVkVMT1BFUlMuIEdpdmVuIHdoZXJlIHRoaXMgcGF0Y2ggaXMgY29t
aW5nIGZyb20sIEkgdGhpbmsgdGhlIGlkZWEgaXMgdG8gdXNlIERFVkVMT1BFUlMgdG8gdHJhY2sg
TFRTIHBhY2thZ2VzPyBUaGVuIEkgdGhpbmsgaXQncyBiZXR0ZXIgdG8gaGF2ZSBzb21ldGhpbmcg
c3BlY2lmaWMgZm9yIHRoYXQgKGkuZS4gbm90IERFVkVMT1BFUlMpLgoKTm8sIHRoZSBpZGVhIGlz
IHRvIHVzZSBpdCB0byB0cmFjayBwYWNrYWdlcyBvbiB0aGUgbWFzdGVyIGJyYW5jaC4KTGV0IG1l
IGdpdmUgYSBiaXQgbW9yZSBjb250ZXh0LgpJIHdvdWxkIGxpa2UgdG8ga2VlcCBhbiBleWUgKHBy
b2dyYW1tYXRpY2FsbHkpIG9uIHBhY2thZ2VzIHRvIHdoaWNoIE1pbmQgY29udHJpYnV0ZWQuCkZv
ciB0aGF0LCBJIG5lZWQgYSBsaXN0IG9mIHN1Y2ggcGFja2FnZXMuCkkgY291bGQgYnVpbGQgYW5k
IGtlZXAgc3VjaCBhIGxpc3Qgc2VwYXJhdGVseSBvbiBteSBzaWRlIGJ1dCB0aGUgREVWRUxPUEVS
UyBmaWxlIGFjdHVhbGx5IGFscmVhZHkgY29udGFpbnMgdGhpcyBpbmZvcm1hdGlvbiwgc28gSSBk
b24ndCB3YW50IHRvIGR1cGxpY2F0ZSBpdC4KSSBjb3VsZCBwYXJzZSB0aGUgREVWRUxPUEVSUyBm
aWxlIGV4dGVybmFsbHkgYnV0IHNpbmNlIGdldC1kZXZlbG9wZXJzIGFscmVhZHkgZG9lcyBzbywg
aXQgbG9va2VkIGxpa2UgYSBnb29kIHBsYWNlIHRvIGFkZCBzdWNoIGEgZmVhdHVyZS4KCgpLaW5k
IHJlZ2FyZHMsCgpSYXBoYcOrbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
