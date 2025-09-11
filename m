Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE27CAC594
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 21:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A1DB4271D;
	Thu, 11 Sep 2025 21:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NVtGFUmADQ5e; Thu, 11 Sep 2025 21:28:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAB884270D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAB884270D;
	Thu, 11 Sep 2025 21:28:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B8256F06
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B7CB84D63
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fc8mwlQjdqQc for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 21:28:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D2B5C84D7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2B5C84D7C
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2B5C84D7C
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:28:01 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45cb6428c46so14032575e9.1
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 14:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757626079; x=1758230879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K1QzDZpLRyEHB7ao0vOllIGXvfDCKK6b7iHnIlWwv0w=;
 b=eFPexXPIdRY55PXRxkrt+LteylXSEViNO6Td0746YOfBMR6mcO6G8x+z27d9sUFUOI
 iPIZ0jcncggBjuGoK9059jo/2NfX0DnARZZJhtW8OBhFjsWATgcXMWvRjLc1O8mmVfLq
 CSFRg/ao7YKjz/2mM8PSStf4/D1IWh/nr3mxroyM91tFlTaxDnNbtdmDaGS4U4RyUVnF
 SxUML6vpbJWzFEnlNH9iYxe6ZTUCdsaXb/Z3YIwZxGeZaHNnebHrmJlp08k7FN59o3iM
 wRvavNPyeQ4zlfYRwIBW+rLTx0rR/XBVd3vweQnxo+2jvOaSTG6y6YT6471KPcwQKrxM
 cMMw==
X-Gm-Message-State: AOJu0YxckQ7ULzoEteHnlV1KXcbb4kc1Bz3xU6xlJWg+xC4e5SHa7sgP
 1Y3xM4TjsyR6Tsm+1oCjol6PFiaV2CRHQcRwi6SsTAHV7bPLZIj/VawsnneR3UQHXp6AkUS7cTa
 spYhpYmU=
X-Gm-Gg: ASbGncvBBta6X9anCVHh8S0QdnAl7/TuNzrGxZ3RHXe14w4DWzaxhrfaDVvLFPtHQ+m
 7bWwgKvmOC2Ki4Y+Pq5M6CN1nxZJxeJwQpsfcADlPcNr2zflowtySVD/mSgvNUvFbeV7uOF/Nsn
 lGcFrZSObJcXDmFFv7DArEcSwXnWyaVq+kLSL//hYAZzlfGhcXX8/nnOE5Z9fteRQBevCwvVg8Q
 tQIEWhPr12EVDDkTCwmSRg2QmTJzaANQPwTzkeFouw+UQRpuLPeaDWf2kOSehyLXgMAk7qc1S8n
 +ebRLV6+93fjOazMcjlmfyBOOnkq3nJHnga4W1ftfn57CdsAymG4OFz4oUt8wOQtOlB+hgGeONw
 4Flz918Xdg6mF6jiS9kIcEH0=
X-Google-Smtp-Source: AGHT+IH4cs0DgGcBXGmpENDu6WVHs98TjRgIuO05XVKaCwaI2qi6Q8RpQrW4URL5LvcAHPaB5etvig==
X-Received: by 2002:a05:600c:c4aa:b0:45b:7d24:beac with SMTP id
 5b1f17b1804b1-45f211d4635mr8295265e9.10.1757626078902; 
 Thu, 11 Sep 2025 14:27:58 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e0153fbd5sm20684755e9.5.2025.09.11.14.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 14:27:55 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 364EF5F8AB;
 Thu, 11 Sep 2025 22:27:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 22:27:47 +0100
Message-ID: <20250911212752.266940-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250911212752.266940-1-alex.bennee@linaro.org>
References: <20250911212752.266940-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757626079; x=1758230879; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K1QzDZpLRyEHB7ao0vOllIGXvfDCKK6b7iHnIlWwv0w=;
 b=z1JvTLKqwI/ZsWr8R8PaxNTan0iAu5EK/rZW8nChGcN4BYrz85yNLZz4+aaRdGUxPj
 xZxXENQNUW707nsLI66MrVPr/OGq6Cg7m2lLHxjr7Kptz/nJN5DelcWjoalb9+imCi0U
 IlwnAGp0VaU1BIE9WTcqvR4w60xlmGFUVApw+wQ387DXA7B+rW7tpqMh8k1Qb+ceBz6J
 Lxt41YgiJM+LaxIiYZ+LuqmUOpP7IPNI4gtfpTPp10vpmZ/zfizYST2ahD9Ny8bkeOqA
 YJm8nFzMB+tB+DHJnR5/PAoQHrxdD15ExTynuVZO0R9dzl+mWLopz/bfPdMrmG8I67VH
 HvJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=z1JvTLKq
Subject: [Buildroot] [PATCH v5 7/9] support/testing: add test for
 kvm-unit-tests
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tm93IHdlIGhhdmUgdXBkYXRlZCBrdm0tdW5pdC10ZXN0cyB3ZSBzaG91bGQgZGVmZW5kIGl0IHdp
dGggYSB0ZXN0LiBUbwpzdXBwb3J0IHRoYXQgZW5hYmxlIEtWTSBpbiB0aGUgcWVtdSBrZXJuZWwg
Y29uZmlnIGFuZCBib290IGFuIGltYWdlCndoZXJlIHdlIGNhbiBydW4gdGhlIGJhc2ljIHRlc3Rz
LgoKU2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgot
LS0KIGJvYXJkL3FlbXUvYWFyY2g2NC12aXJ0L2xpbnV4LmNvbmZpZyAgICAgIHwgIDIgKwogc3Vw
cG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9rdm0ucHkgfCA0NyArKysrKysrKysrKysr
KysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9rdm0ucHkKCmRpZmYg
LS1naXQgYS9ib2FyZC9xZW11L2FhcmNoNjQtdmlydC9saW51eC5jb25maWcgYi9ib2FyZC9xZW11
L2FhcmNoNjQtdmlydC9saW51eC5jb25maWcKaW5kZXggOTcxYjlmY2Y4Ni4uOWQxOTM0YzY0OCAx
MDA2NDQKLS0tIGEvYm9hcmQvcWVtdS9hYXJjaDY0LXZpcnQvbGludXguY29uZmlnCisrKyBiL2Jv
YXJkL3FlbXUvYWFyY2g2NC12aXJ0L2xpbnV4LmNvbmZpZwpAQCAtNzQsMyArNzQsNSBAQCBDT05G
SUdfVklSVElPX0ZTPXkKIENPTkZJR19PVkVSTEFZX0ZTPXkKIENPTkZJR19UTVBGUz15CiBDT05G
SUdfVE1QRlNfUE9TSVhfQUNMPXkKK0NPTkZJR19WSVJUVUFMSVpBVElPTj15CitDT05GSUdfS1ZN
PXkKZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfa3ZtLnB5
IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9rdm0ucHkKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZGE1ZWJmYjFiNwotLS0gL2Rldi9udWxsCisrKyBi
L3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfa3ZtLnB5CkBAIC0wLDAgKzEsNDcg
QEAKK2ltcG9ydCBvcworaW1wb3J0IGluZnJhLmJhc2V0ZXN0CisKK0tWTV9USU1FT1VUID0gMTIw
CisKKworY2xhc3MgVGVzdEtWTShpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgorICAgIGNvbmZpZyA9
IFwKKyAgICAgICAgIiIiCisgICAgICAgIEJSMl9hYXJjaDY0PXkKKyAgICAgICAgQlIyX2NvcnRl
eF9hNzI9eQorICAgICAgICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKKyAgICAgICAgQlIyX1RP
T0xDSEFJTl9FWFRFUk5BTF9MSUJDX1VUSUxTX0NPUFk9eQorICAgICAgICBCUjJfT1BUSU1JWkVf
Uz15CisgICAgICAgIEJSMl9UQVJHRVRfUk9PVEZTX0NQSU89eQorICAgICAgICBCUjJfTElOVVhf
S0VSTkVMPXkKKyAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9VU0VfQ1VTVE9NX0NPTkZJRz15Cisg
ICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0NPTkZJR19GSUxFPSJib2FyZC9xZW11L2Fh
cmNoNjQtdmlydC9saW51eC5jb25maWciCisgICAgICAgIEJSMl9QQUNLQUdFX0JVU1lCT1hfU0hP
V19PVEhFUlM9eQorICAgICAgICBCUjJfUEFDS0FHRV9LVk1fVU5JVF9URVNUUz15CisgICAgICAg
ICMgQlIyX1BBQ0tBR0VfUUVNVV9TWVNURU1fVENHIGlzIG5vdCBzZXQKKyAgICAgICAgIyBCUjJf
UEFDS0FHRV9RRU1VX0JMT0JTIGlzIG5vdCBzZXQKKyAgICAgICAgQlIyX1RBUkdFVF9ST09URlNf
RVhUMj15CisgICAgICAgICIiIgorCisgICAgZGVmIHRlc3RfcnVuKHNlbGYpOgorICAgICAgICBr
ZXJuID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAiSW1hZ2UiKQorICAg
ICAgICBpbWcgPSBvcy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwgImltYWdlcyIsICJyb290ZnMu
ZXh0MiIpCisKKyAgICAgICAgcWVtdV9vcHRzID0gWyItTSIsICJ2aXJ0LGdpYy12ZXJzaW9uPTMs
dmlydHVhbGl6YXRpb249b24iLAorICAgICAgICAgICAgICAgICAgICAgIi1jcHUiLCAiY29ydGV4
LWE3MiIsCisgICAgICAgICAgICAgICAgICAgICAiLXNtcCIsICIyIiwKKyAgICAgICAgICAgICAg
ICAgICAgICItbSIsICI1MTJNIiwKKyAgICAgICAgICAgICAgICAgICAgICItZHJpdmUiLCBmImZp
bGU9e2ltZ30saWY9dmlydGlvLGZvcm1hdD1yYXciLCAiLXNuYXBzaG90Il0KKworICAgICAgICBz
ZWxmLmVtdWxhdG9yLmJvb3QoYXJjaD0iYWFyY2g2NCIsCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICBrZXJuZWw9a2VybiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGtlcm5lbF9jbWRs
aW5lPVsicm9vdD0vZGV2L3ZkYSBjb25zb2xlPXR0eUFNQTAiXSwKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgIG9wdGlvbnM9cWVtdV9vcHRzKQorCisgICAgICAgIHNlbGYuZW11bGF0b3IubG9n
aW4oKQorCisgICAgICAgICMgUnVuIHRoZSBzZWxmdGVzdHMKKyAgICAgICAgc2VsZi5hc3NlcnRS
dW5PaygiL3Vzci9zaGFyZS9rdm0tdW5pdC10ZXN0cy9zZWxmdGVzdC1zZXR1cCIpCisgICAgICAg
IHNlbGYuYXNzZXJ0UnVuT2soIi91c3Ivc2hhcmUva3ZtLXVuaXQtdGVzdHMvc2VsZnRlc3Qtc21w
IikKKyAgICAgICAgc2VsZi5hc3NlcnRSdW5PaygiL3Vzci9zaGFyZS9rdm0tdW5pdC10ZXN0cy9z
ZWxmdGVzdC12ZWN0b3JzLWtlcm5lbCIpCisgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soIi91c3Iv
c2hhcmUva3ZtLXVuaXQtdGVzdHMvc2VsZnRlc3QtdmVjdG9ycy11c2VyIikKLS0gCjIuNDcuMwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
