Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AD1C77B7C
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 14:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 140D480F58;
	Wed, 25 Jun 2025 14:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tzSPQ4Hxbn5V; Wed, 25 Jun 2025 14:53:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F07980ED6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F07980ED6;
	Wed, 25 Jun 2025 14:53:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F213154
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 14:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9C3F80E9E
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 14:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YoeUkiRpD8cX for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 14:53:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D662180DF7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D662180DF7
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D662180DF7
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 14:53:11 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-450ce671a08so42903925e9.3
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 07:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750863190; x=1751467990;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZftC9sgYI0Y2faSttdEPZvD4ba9viD+WvEfV4bPPtz0=;
 b=LV1FeGZ9GmOPaKDcTmzN1B+XDrAc1F9DGQbLQZakgSHrvA+VxW2HOTlVHRNu2A4yBw
 NSK2BSDdFGBRh0y3wSJ6+RyvFiPJ18TeYaerDf4dgsP/IPrvoBD3RiKUt0DKx99gwwj+
 p3g+jwA4E4tS1eEyXeWkmebWzB8b+kPHnVGFomT4i+bvU/uQPeFUmR3M1Zh5px+j4OOS
 h/261hkeM3AvDA9I7ziQ/oTcpIhhaVVLhPrebkbkI5c8RQIOZsY6xeETDFvS3y5mYoBU
 UdTWVqIOiKg+eQyp0EuVyzfLRFQNLraqhi/NPwi5fpl4Dm04KptTNfB7svnGDJbVoLPV
 /TGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk4hEajZ8xc9BQw/xu4S5lxNXtKYjNoVJhbQmxJIP4arvwpUnZML1k398kV4r+AEVQjLgvDbRS6G4=@buildroot.org
X-Gm-Message-State: AOJu0YzYmoiISBBr89B3cTDW48MlPhUaVGc1lW7YUReG4drS9urOv0Pq
 qq2JomtgMzYpjAB9ttvn8DDg2VILQeljI7PU7s0GeRSDHiYb0pbMh1eoM+HinVS++ODC93ZbU2y
 zVX0u
X-Gm-Gg: ASbGncvHjFTuTkQdm0/m0+SDp0iyqMwkgVYadX6/ckLwbqDgKS6NA1BbPL8/ydjSdqk
 7QhFO2FsOcf9Swc0q3aaJUVz+gjbU3dxLr6WS8bRzVk6Ottv0sFXu6aj+W7ZU/o/Fxh1IF3whHc
 K/WOuZ9ALCDD5nK3Vw9dsRgDSfqBcOfF6Jfccng8iPOe4raKRvAKpfD15cz3ytG2Erw1sIvATvM
 D4FGs9LqAzUQQqe30eUAw5DCWg1YLqcriKSjE0KXZforUCb57kZjQd8qRhHEXyH0V5hGdWH0jr0
 zOZ5HJLY/XtxJ/gEBdnrBJXFY6wDkBpMsSq7XRTbDlBfmOG2aJ2As/NrCEnQdT6kyGBPyqEh4YX
 EHLFEWI76TGC2zE8P0YEsK/0LfLoTHsjDIllTZR1wCyedovGcSg==
X-Google-Smtp-Source: AGHT+IGz0EglpJ8siyCInovd/fchFNoOg/HokylnJpT2mdJRYQwo8j1u8malk7nRS7UBomoKSG6dFg==
X-Received: by 2002:a05:600c:4e05:b0:442:f4a3:8c5c with SMTP id
 5b1f17b1804b1-45381aeeb40mr37463245e9.10.1750863189700; 
 Wed, 25 Jun 2025 07:53:09 -0700 (PDT)
Received: from [10.5.90.80]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e811049bsm4802408f8f.88.2025.06.25.07.53.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 07:53:08 -0700 (PDT)
Message-ID: <8cca55f1-eab4-4cc6-aacb-2aec9809281d@smile.fr>
Date: Wed, 25 Jun 2025 16:53:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, =?UTF-8?Q?Vincent_Stehl=C3=A9?=
 <vincent.stehle@arm.com>
References: <20250623173733.16049-1-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20250623173733.16049-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1750863190; x=1751467990; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZftC9sgYI0Y2faSttdEPZvD4ba9viD+WvEfV4bPPtz0=;
 b=2bF1qhPvRp4TGrXWIRVRHH72+1Wh6Wrh5OJkfX9Hpn1aZtmUahXNP+m3kPm2R6oZuU
 mN3w9EaRnENUapBuEae5gPStg7mRLlH5w5LmSlw9nI3iWYHPvScTMASdYyKwujwOMmkK
 ryrM79chhuhJSWYdQrmRxFNwf7CRIBcpCSFCk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=2bF1qhPv
Subject: Re: [Buildroot] [PATCH 1/2] boot/edk2: add security fix for
 CVE-2024-38805
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLCBBbGwsCgpMZSAyMy8wNi8yMDI1IMOgIDE5OjM3LCBKdWxpZW4gT2xpdmFp
biBhIMOpY3JpdMKgOgo+IFRoaXMgY29tbWl0IGFkZHMgYSBzZWN1cml0eSBmaXggZnJvbSB0aGUg
dXBzdHJlYW0gY29tbWl0Ogo+IGh0dHBzOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRrMi9jb21t
aXQvYjNhMmY3ZmYyNGUxNTZlOGM0ZDY5NGZmZmZmMDFlOTVhMDQ4YzUzNgo+IAo+IEl0IGZpeGVz
IENWRS0yMDI0LTM4ODA1Ogo+IGh0dHBzOi8vd3d3LmN2ZS5vcmcvQ1ZFUmVjb3JkP2lkPUNWRS0y
MDI0LTM4ODA1Cj4gTm90ZTogYXQgdGhlIHRpbWUgb2YgdGhpcyBjb21taXQsIHRoaXMgQ1ZFIGlz
ICJyZXNlcnZlZCIgYnkgYSBDTkEuCj4gRGV0YWlscyB3aWxsIGNvbWUgbGF0ZXIuCj4gCj4gU2Vl
IGFsc28gdGhlIGFzc29jaWF0ZWQgcHVsbCByZXF1ZXN0Ogo+IGh0dHBzOi8vZ2l0aHViLmNvbS90
aWFub2NvcmUvZWRrMi9wdWxsLzExMDQyCj4gCj4gVGhpcyBjb21taXQgYWxzbyBhZGRzIHRoZSBj
b3JyZXNwb25kaW5nIF9JR05PUkVfQ1ZFUyBlbnRyeS4KClNpbmNlIHRoaXMgY29tbWl0IGlzIGZv
bGxvd2VkIGJ5IGFuIGVkazIgdmVyc2lvbiBidW1wLCBpdCBtZWFucyB0aGF0IHRoaXMgcGF0Y2gK
c2hvdWxkIGJlIGJhY2twb3J0ZWQgdG8gc3RhYmxlIDIwMjUuMDUgYW5kIExUUyAyMDI1LjAyIGJy
YW5jaGVzLgoKUmV2aWV3ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZy
PgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgo+IC0t
LQo+IEZvciBjb252ZW5pZW5jZSwgSSBhbHNvIHB1Ymxpc2hlZCB0aG9zZSBwYXRjaGVzIGhlcmU6
Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2pvbGl2YWluL2J1aWxkcm9vdC8tL2NvbW1pdHMvZWRrMi1z
dGFibGUyMDI1MDVfYnVtcAo+IFRoZSBCdWlsZHJvb3QgbWFpbGluZyBsaXN0IG1heSBjaGFuZ2Ug
RURLMiBwYXRjaCBET1MgbmV3bGluZXMgd2hpY2gKPiBtYWtlcyBwYXRjaGVzIG5vdCBhcHBseWlu
ZyB3aXRoIHBhdGNod29yay4KClRoYW5rcyEKCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IC0tLQo+
ICAuLi5EeGUtRml4LWZvci1vdXQtb2YtYm91bmQtbWVtb3J5LWFjY2UucGF0Y2ggfCA3NSArKysr
KysrKysrKysrKysrKysrCj4gIGJvb3QvZWRrMi9lZGsyLm1rICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAzICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCA3OCBpbnNlcnRpb25zKCspCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBib290L2VkazIvMDAwMS1OZXR3b3JrUGtnLUlTY3NpRHhlLUZpeC1m
b3Itb3V0LW9mLWJvdW5kLW1lbW9yeS1hY2NlLnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL2Jvb3Qv
ZWRrMi8wMDAxLU5ldHdvcmtQa2ctSVNjc2lEeGUtRml4LWZvci1vdXQtb2YtYm91bmQtbWVtb3J5
LWFjY2UucGF0Y2ggYi9ib290L2VkazIvMDAwMS1OZXR3b3JrUGtnLUlTY3NpRHhlLUZpeC1mb3It
b3V0LW9mLWJvdW5kLW1lbW9yeS1hY2NlLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwLi40Y2M2NmViMGZlCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2Jvb3Qv
ZWRrMi8wMDAxLU5ldHdvcmtQa2ctSVNjc2lEeGUtRml4LWZvci1vdXQtb2YtYm91bmQtbWVtb3J5
LWFjY2UucGF0Y2gKPiBAQCAtMCwwICsxLDc1IEBACj4gK0Zyb20gMGEzYjJhMjliOTZiMTFmYjg1
ODk3NDA0NDM1OWM4MDZjNmIwYTExMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTog
U2FudGhvc2ggS3VtYXIgViA8c2FudGhvc2hrdW1hcnZAYW1pLmNvbT4KPiArRGF0ZTogV2VkLCA3
IE1heSAyMDI1IDE4OjUzOjMwICswNTMwCj4gK1N1YmplY3Q6IFtQQVRDSF0gTmV0d29ya1BrZy9J
U2NzaUR4ZTpGaXggZm9yIG91dCBvZiBib3VuZCBtZW1vcnkgYWNjZXNzIGZvcgo+ICsgYno0MjA3
IChDVkUtMjAyNC0zODgwNSkKPiArCj4gK0luIElTY3NpQnVpbGRLZXlWYWx1ZUxpc3QsIGNoZWNr
IGlmIHdlIGhhdmUgYW55IGRhdGEgbGVmdCAoTGVuID4gMCkgYmVmb3JlIGFkdmFuY2luZyB0aGUg
RGF0YSBwb2ludGVyIGFuZCByZWR1Y2luZyBMZW4uCj4gK0F2b2lkcyB3cmFwcGluZyBMZW4uIEFs
c28gVXNlZCBTYWZlVWludDMyU3ViU2FmZVVpbnQzMlN1YiBjYWxsIHRvIHJlZHVjZSB0aGUgTGVu
IC4KPiArCj4gK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL2VkazIvY29t
bWl0L2IzYTJmN2ZmMjRlMTU2ZThjNGQ2OTRmZmZmZjAxZTk1YTA0OGM1MzYKPiArU2lnbmVkLW9m
Zi1ieTogc2FudGhvc2gga3VtYXIgViA8c2FudGhvc2hrdW1hcnZAYW1pLmNvbT4KPiArU2lnbmVk
LW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiArLS0tCj4gKyBOZXR3b3Jr
UGtnL0lTY3NpRHhlL0lTY3NpUHJvdG8uYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tCj4gKyAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
PiArCj4gK2RpZmYgLS1naXQgYS9OZXR3b3JrUGtnL0lTY3NpRHhlL0lTY3NpUHJvdG8uYyBiL05l
dHdvcmtQa2cvSVNjc2lEeGUvSVNjc2lQcm90by5jCj4gK2luZGV4IGVmNTg3NjQ5YTAuLjUzYTBm
ZjgwMWQgMTAwNjQ0Cj4gKy0tLSBhL05ldHdvcmtQa2cvSVNjc2lEeGUvSVNjc2lQcm90by5jCj4g
KysrKyBiL05ldHdvcmtQa2cvSVNjc2lEeGUvSVNjc2lQcm90by5jCj4gK0BAIC0xODgwLDYgKzE4
ODAsOCBAQCBJU2NzaUJ1aWxkS2V5VmFsdWVMaXN0ICgKPiArIHsKPiArICAgTElTVF9FTlRSWSAg
ICAgICAgICAgICpMaXN0SGVhZDsKPiArICAgSVNDU0lfS0VZX1ZBTFVFX1BBSVIgICpLZXlWYWx1
ZVBhaXI7Cj4gKysgIEVGSV9TVEFUVVMgICAgICAgICAgICBTdGF0dXM7Cj4gKysgIFVJTlQzMiAg
ICAgICAgICAgICAgICBSZXN1bHQ7Cj4gKyAKPiArICAgTGlzdEhlYWQgPSBBbGxvY2F0ZVBvb2wg
KHNpemVvZiAoTElTVF9FTlRSWSkpOwo+ICsgICBpZiAoTGlzdEhlYWQgPT0gTlVMTCkgewo+ICtA
QCAtMTkwMyw5ICsxOTA1LDE0IEBAIElTY3NpQnVpbGRLZXlWYWx1ZUxpc3QgKAo+ICsgICAgICAg
RGF0YSsrOwo+ICsgICAgIH0KPiArIAo+ICstICAgIGlmICgqRGF0YSA9PSAnPScpIHsKPiArKyAg
ICAvLyBIZXJlIExlbiBtdXN0IG5vdCBiZSB6ZXJvLgo+ICsrICAgIC8vIFRoZSB2YWx1ZSBvZiBM
ZW4gaXMgc2l6ZSBvZiBkYXRhIGJ1ZmZlci4gQWN0dWFsbHksIERhdGEgaXMgbWFrZSB1cCBvZiBz
dHJpbmdzLgo+ICsrICAgIC8vIEF1dGhNZXRob2Q9Tm9uZVwwVGFyZ2V0QWxpYXM9TElPIFRhcmdl
dFwwIFRhcmdldFBvcnRhbEdyb3VwVGFnPTFcMAo+ICsrICAgIC8vICgxKSBMZW4gPT0gMCwgKkRh
dGEgIT0gJz0nIGdvdG8gT05fRVJST1IKPiArKyAgICAvLyAoMikgKkRhdGEgPT0gJz0nLCBMZW4g
IT0gMCBub3JtYWwgY2FzZS4KPiArKyAgICAvLyAoMykgKkRhdGEgPT0gJz0nLCBMZW4gPT0gMCwg
QmV0d2VlbiBEYXRhIGFuZCBMZW4gYXJlIG1pc21hdGNoLCBMZW4gaXNuJ3QgYWxsIHNpemUgb2Yg
ZGF0YSwgYXMgZXJyb3IuCj4gKysgICAgaWYgKChMZW4gPiAwKSAmJiAoKkRhdGEgPT0gJz0nKSkg
ewo+ICsgICAgICAgKkRhdGEgPSAnXDAnOwo+ICstCj4gKyAgICAgICBEYXRhKys7Cj4gKyAgICAg
ICBMZW4tLTsKPiArICAgICB9IGVsc2Ugewo+ICtAQCAtMTkxNSwxMCArMTkyMiwyMiBAQCBJU2Nz
aUJ1aWxkS2V5VmFsdWVMaXN0ICgKPiArIAo+ICsgICAgIEtleVZhbHVlUGFpci0+VmFsdWUgPSBE
YXRhOwo+ICsgCj4gKy0gICAgSW5zZXJ0VGFpbExpc3QgKExpc3RIZWFkLCAmS2V5VmFsdWVQYWly
LT5MaXN0KTsKPiArKyAgICBTdGF0dXMgPSBTYWZlVWludDMyQWRkICgoVUlOVDMyKUFzY2lpU3Ry
TGVuIChLZXlWYWx1ZVBhaXItPlZhbHVlKSwgMSwgJlJlc3VsdCk7Cj4gKysgICAgaWYgKEVGSV9F
UlJPUiAoU3RhdHVzKSkgewo+ICsrICAgICAgREVCVUcgKChERUJVR19FUlJPUiwgIiVhIE1lbW9y
eSBPdmVyZmxvdyBpcyBEZXRlY3RlZC5cbiIsIF9fZnVuY19fKSk7Cj4gKysgICAgICBGcmVlUG9v
bCAoS2V5VmFsdWVQYWlyKTsKPiArKyAgICAgIGdvdG8gT05fRVJST1I7Cj4gKysgICAgfQo+ICsg
Cj4gKy0gICAgRGF0YSArPSBBc2NpaVN0ckxlbiAoS2V5VmFsdWVQYWlyLT5WYWx1ZSkgKyAxOwo+
ICstICAgIExlbiAgLT0gKFVJTlQzMilBc2NpaVN0ckxlbiAoS2V5VmFsdWVQYWlyLT5WYWx1ZSkg
KyAxOwo+ICsrICAgIFN0YXR1cyA9IFNhZmVVaW50MzJTdWIgKExlbiwgUmVzdWx0LCAmTGVuKTsK
PiArKyAgICBpZiAoRUZJX0VSUk9SIChTdGF0dXMpKSB7Cj4gKysgICAgICBERUJVRyAoKERFQlVH
X0VSUk9SLCAiJWEgT3V0IG9mIGJvdW5kIG1lbW9yeSBhY2Nlc3MgRGV0ZWN0ZWQuXG4iLCBfX2Z1
bmNfXykpOwo+ICsrICAgICAgRnJlZVBvb2wgKEtleVZhbHVlUGFpcik7Cj4gKysgICAgICBnb3Rv
IE9OX0VSUk9SOwo+ICsrICAgIH0KPiArKwo+ICsrICAgIEluc2VydFRhaWxMaXN0IChMaXN0SGVh
ZCwgJktleVZhbHVlUGFpci0+TGlzdCk7Cj4gKysgICAgRGF0YSArPSBSZXN1bHQ7Cj4gKyAgIH0K
PiArIAo+ICsgICByZXR1cm4gTGlzdEhlYWQ7Cj4gKy0tIAo+ICsyLjQ5LjAKPiArCj4gZGlmZiAt
LWdpdCBhL2Jvb3QvZWRrMi9lZGsyLm1rIGIvYm9vdC9lZGsyL2VkazIubWsKPiBpbmRleCBiYzQw
NDliMmRlLi5hZDg4ODM1ZjhmIDEwMDY0NAo+IC0tLSBhL2Jvb3QvZWRrMi9lZGsyLm1rCj4gKysr
IGIvYm9vdC9lZGsyL2VkazIubWsKPiBAQCAtMTQsNiArMTQsOSBAQCBFREsyX0RFUEVOREVOQ0lF
UyA9IGVkazItcGxhdGZvcm1zIGhvc3QtcHl0aG9uMyBob3N0LWFjcGljYSBob3N0LXV0aWwtbGlu
dXgKPiAgRURLMl9JTlNUQUxMX1RBUkdFVCA9IE5PCj4gIEVESzJfSU5TVEFMTF9JTUFHRVMgPSBZ
RVMKPiAgCj4gKyMgMDAwMS1OZXR3b3JrUGtnLUlTY3NpRHhlLUZpeC1mb3Itb3V0LW9mLWJvdW5k
LW1lbW9yeS1hY2NlLnBhdGNoCj4gK0VESzJfSUdOT1JFX0NWRVMgKz0gQ1ZFLTIwMjQtMzg4MDUK
PiArCj4gIGlmZXEgKCQoQlIyX0VOQUJMRV9ERUJVRykseSkKPiAgRURLMl9CVUlMRF9UWVBFID0g
REVCVUcKPiAgaWZlcSAoJChCUjJfVEFSR0VUX0VESzJfT1ZNRl9ERUJVR19PTl9TRVJJQUwpLHkp
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
