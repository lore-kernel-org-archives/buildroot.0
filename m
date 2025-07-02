Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB1FC8303C
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 21:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF6DA60F77;
	Wed,  2 Jul 2025 21:42:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vtpL_IXpphNQ; Wed,  2 Jul 2025 21:42:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04459612AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04459612AB;
	Wed,  2 Jul 2025 21:42:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F1C0128
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 21:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50FA880F1F
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 21:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ns_BroMZsKTr for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 21:42:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 92A6080EC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92A6080EC5
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92A6080EC5
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 21:42:51 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-453643020bdso64097005e9.1
 for <buildroot@buildroot.org>; Wed, 02 Jul 2025 14:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751492570; x=1752097370;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SOp374MsObDzqaYqc7o8gzYjj+6sNeiOeD7WkOmoAIk=;
 b=JHCV/0mbxXGQhTyTeCDHXx3lezGn3i89kNhoMXvj6iI2sjmRKDlwVvpYTj9JDY0cwn
 tehku0HBwyZ21bBsPVtSgGTqRL7WlLxPEjyhIlNzWFFOMvAjBmH4gM+e6bg9AnE2IU0V
 X3NUzR1TlAT7NVe4Ot13wE9kquED+W3bEoFO0CImX4aVvpdlu4/rWtjMnr7zoQSVecd/
 QGwUVlfz+VzRRedz/zBPjNmMdlTAGVuYBpwQ+bn4n4IFuwQ+Vdf8C0S0Pzo09JW4UvRv
 1rK5N9gFEOIcxRzAk4WaQ1UShmvC8rReuRi+taUwX4/aYqZEdXSJcdz1csprAnb6avf6
 AreA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWImomCzKPfvc552lf7OyEquexiRD/Wc7sOKqusxcPfamNbnE8G2ZDGukGeRHGhnFZcNVPdtq9QYXU=@buildroot.org
X-Gm-Message-State: AOJu0YyruWSkuHTKLgKFGG3MKwY5qVbFKJMZ+f38PWDpJzLhkReJB04q
 WZpA+2xwvxBO5ydHcLYHQiCHNNFAexVCjlAidINeiUMRHBFndmLY5xDMzP7tC907xdw=
X-Gm-Gg: ASbGncvX8Y1g3ftqJdURldb4/GwklEtzwpGdfIPNDpqFIVIVsHe8XMeAKKdgXSUNIiT
 8AP5MBpGPTnG/l7dDrSYilRXXTihzDhcTsoZRJ9futUD8qK2jI2sXjlKakyBMmgNcGkCc4Rgxe7
 w7ZlxXABR54iaApA+rC+6awbKZKJNnvIBwnlaruXroZEwiYpr3tJFvjj/od4wjgB+Ux9G+UAg3X
 Vj4UUrHC2NuBSpV9Vec+Pfwhqf1p/F5xwnPq40RIhbYK+8VxkDBX4UtB1MSmeE1RTM3mzNDLiLZ
 TdFJkIb92butKqaryAANIMapMlAsC4b15G0U97TgnuSHf5+9cxmJUAxSQQ2wxKzvs7SdsEjgu/W
 cC90+OwfKNl9X6lwidTKyhjU6VrX/PlFJuZD7UYN8ova1ign0z+n2L3YyRTRE+rwakTNXH7yum8
 RvUu/oxfrlan1kmj8uVPbfGAE1
X-Google-Smtp-Source: AGHT+IHtXqLJuZc0vfG8N+SX0ktg0mxJRX6ykBJFVG+Z6TONrpXKpHIZ+/lnVjLqQ7J7Hnr35uQoHA==
X-Received: by 2002:a05:600c:3504:b0:442:d9f2:ded8 with SMTP id
 5b1f17b1804b1-454a36e9937mr45920475e9.15.1751492569624; 
 Wed, 02 Jul 2025 14:42:49 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9beb22asm8374125e9.36.2025.07.02.14.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 14:42:49 -0700 (PDT)
Message-ID: <06125214-3ab6-4e72-a813-420d39663993@smile.fr>
Date: Wed, 2 Jul 2025 23:42:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Daniel Lang <dalang@gmx.at>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
References: <20250626111642.228223-1-alex.bennee@linaro.org>
 <20250626111642.228223-3-alex.bennee@linaro.org>
Content-Language: fr
In-Reply-To: <20250626111642.228223-3-alex.bennee@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751492570; x=1752097370; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SOp374MsObDzqaYqc7o8gzYjj+6sNeiOeD7WkOmoAIk=;
 b=nzEZpmrqscdBb5aYd251PA6+xOKD4BylBkX6ogwNfKqxItfSVGp/tz2TeM+s83+37i
 vm5/AFHuhhDcreOukvFar0GjSyAiZnVFCHhc4jJLjTRDGXC+fwVk4k6us1eJ2lZl22h+
 gqy5+nzlRoCoVHwaubq3nnbwaXnnDFyklDP7I=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=nzEZpmrq
Subject: Re: [Buildroot] [RFC PATCH 2/3] package/llvm-project: drop unused
 TERMINFO config flags
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

SGVsbG8gQWxleCwgQWxsLAoKTGUgMjYvMDYvMjAyNSDDoCAxMzoxNiwgQWxleCBCZW5uw6llIGEg
w6ljcml0wqA6Cj4gVGhlIGJ1aWxkIGNvbXBsYWlucyBhYm91dCB0aGVzZSBiZWluZyB1bnVzZWQg
c28gZHJvcCB0aGVtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5u
ZWVAbGluYXJvLm9yZz4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMs
ClJvbWFpbgoKCj4gLS0tCj4gIHBhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0vbGx2bS5tayB8IDQg
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS9sbHZtLm1rIGIvcGFja2FnZS9sbHZtLXByb2plY3Qv
bGx2bS9sbHZtLm1rCj4gaW5kZXggOGZlN2QxMGZlMC4uNzhhYTZmZTQ2NyAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtL2xsdm0ubWsKPiArKysgYi9wYWNrYWdlL2xsdm0t
cHJvamVjdC9sbHZtL2xsdm0ubWsKPiBAQCAtMTMzLDEwICsxMzMsNiBAQCBMTFZNX0NPTkZfT1BU
UyArPSAtREVOQUJMRV9DUkFTSF9PVkVSUklERVM9T04KPiAgSE9TVF9MTFZNX0NPTkZfT1BUUyAr
PSAtRExMVk1fRU5BQkxFX0ZGST1PRkYKPiAgTExWTV9DT05GX09QVFMgKz0gLURMTFZNX0VOQUJM
RV9GRkk9T0ZGCj4gIAo+IC0jIERpc2FibGUgdGVybWluZm8gZGF0YWJhc2UgKG5lZWRzIG5jdXJz
ZXMgbGlidGluZm8uc28pCj4gLUhPU1RfTExWTV9DT05GX09QVFMgKz0gLURMTFZNX0VOQUJMRV9U
RVJNSU5GTz1PRkYKPiAtTExWTV9DT05GX09QVFMgKz0gLURMTFZNX0VOQUJMRV9URVJNSU5GTz1P
RkYKPiAtCj4gICMgRW5hYmxlIHRocmVhZCBzdXBwb3J0Cj4gIEhPU1RfTExWTV9DT05GX09QVFMg
Kz0gLURMTFZNX0VOQUJMRV9USFJFQURTPU9OCj4gIExMVk1fQ09ORl9PUFRTICs9IC1ETExWTV9F
TkFCTEVfVEhSRUFEUz1PTgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
