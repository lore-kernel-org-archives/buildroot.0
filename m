Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968C7F4BB9A
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 10:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67133846C1;
	Wed, 25 Feb 2026 10:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B76o8m-F8wBs; Wed, 25 Feb 2026 10:55:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0646B843D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772016951;
	bh=VWonk2jLPV+MVnUAf3VbrKlmiRCn7+U1+E6TatPTwfA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YzTKN7NSYlkDwoaVVQKAJBN2cWY3fUr6WCM+tJPQKu6IsgXfAq6FRQkIgV9LgajvD
	 OX9UsRZgAYjMLDz66sphcqJxzxJo2yZBuOi9+4MFtGakmr9ezZb4xnXxSzf5v6V4Kg
	 nfZcSO1DzUvAoAQFgBkSZzQmb2pfaCVQyXqOHSWsPDnjBE+eaM1nPxZb8HZRfLXnxZ
	 16KwahrbAU5ymi8EoF8huW1XspBI7waCAnKHYtB+NGag92hNxjkHqfsbMa/Z0/aEIX
	 DUo+yPCJoa/4NMjj9wRpAN+jrXMA+3+/xcg3M2i5Ti94ZHN0Dv6+mVFtJTXZYqGgN9
	 Humsetn5apaHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0646B843D0;
	Wed, 25 Feb 2026 10:55:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 358481B8
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3341640C95
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gugNAJVXRBRn for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 10:55:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3CFD4404F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CFD4404F5
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CFD4404F5
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:55:44 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b8f86167d39so854931666b.0
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 02:55:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772016942; x=1772621742;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=K1QzDZpLRyEHB7ao0vOllIGXvfDCKK6b7iHnIlWwv0w=;
 b=QqdOAs/fPFig06nOlr7EFLVsl6AKSzg6UDpSSvgn/rpYkT9ayR8q4sbSXr/o5qsVzu
 RsuKVbeeorAuHZI3hsubGl1RF+aouCjz2DMGF+i83nBZJQsSrHF3r5PE5tLqtEXWrtbI
 MZO2OcMHJzNChij0I9AnzpqLEGwJfqFOJTQGQfSAtU7y5hYoLU05qatSMa/dgB1xCTWq
 c8rmAamSGCjWIP7xqkoB5uNvnPafk81KYo1mhcNuftpXYve7axHOeslRyDZIwtiJQ0HY
 1lCKieDWMYeP556UPiQ8z2bSk5rFG+vU537+0r+MW1tFqaTGOALnugDfbjONawWCm9Dq
 xJMg==
X-Gm-Message-State: AOJu0YyWmEe60szZF9rrIoDKb5mXqLBx1SyKFUdvVcXg48NK7ggSffVY
 jpiGDwx29K6fbbfRVvvvpUEdNBn67Gm/6HKiAY2Rh5/lJkZ5lFaZOVNXn0q5Pq6NgbJNZD759z/
 jPo9y
X-Gm-Gg: ATEYQzyN4h6FuNZuR1HiX15TMGTkOVMIOUM02qrZGQ+2fo6N+TGmFgR46mncR+QP3mt
 qaIEO0+/Z/EkEf+1pXMGoGAvTi8FQlvJ6+oQnLZiUC/eGU0dQbFacGaE+6OsYTkRGiemHs+dxL5
 FhW4GTVcG7SAcIu4ubz0fWyOLY8QUcyMeyHKHJ5yuywzno4Wq8U7kjNJ4Ou7XIBM7uh084pvJcL
 uh4WuWM2ED6pFEMm1Ks7fzE33yoRmDAWuZst3zrbBI7XXPFr5FmLOuMJjsCFJHdllezQcp0HqCZ
 B4Pq2qOsffeLn6jLYkDo2KnXy7ixl78Upznzyy2JVlPznKWRzzRIFoqdeVVFK+vfs2ZMgI4p5G0
 X3Bp9tbO+7dvRuHFOjZ0cUF5xQ5nbDqcuTOx7LJcWCVKQgtLclPAYpxA/n709zFZ9QrmdLoXuEk
 PIWPFGBWp7xuZ5VGklYy+wAAo=
X-Received: by 2002:a17:907:97ca:b0:b8f:d13:dec8 with SMTP id
 a640c23a62f3a-b90819c076dmr1022270466b.22.1772016941842; 
 Wed, 25 Feb 2026 02:55:41 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65f72019b60sm1016980a12.1.2026.02.25.02.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 02:55:40 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 11D635F834;
 Wed, 25 Feb 2026 10:55:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Wed, 25 Feb 2026 10:55:34 +0000
Message-ID: <20260225105537.1420002-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225105537.1420002-1-alex.bennee@linaro.org>
References: <20260225105537.1420002-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772016942; x=1772621742; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K1QzDZpLRyEHB7ao0vOllIGXvfDCKK6b7iHnIlWwv0w=;
 b=b6HLl4AHi1jQnp3shuGkKjsq58vvBmgTL2v82BgT2bliozEYA+9K9Tq4AspzNcjltx
 M0l3XmvqyNkEiypYlzNtKPlb6Cr8K3n/5iCwxGwseWLZxaVt4FcQBbHrZxWXBRnXqkj4
 2gItN+spYCfCcCPOVXVyZS7P5bVnK6Wh1Z2JCZNQYFnBpWkAcw7vQ3jpBc5rxiQX8voz
 aH2OiB9998OVshJY1c8HzGFlqcI2Yktae5wlTeAesLruCssvF4awuu/Wn1U5+IHl8nw8
 IIlxIrEybq3V4eKj7h6pNOWby+kI2GMrBlSnu43DRteDzUkjIbbTrEf4md3BJgzCVTl9
 4pIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=b6HLl4AH
Subject: [Buildroot] [PATCH v6 5/6] support/testing: add test for
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
