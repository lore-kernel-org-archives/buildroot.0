Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC1CC3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 15:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CC8160643;
	Sat, 13 Jul 2024 15:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7CFj3_4o2bK6; Sat, 13 Jul 2024 15:56:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 883B260769
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 883B260769;
	Sat, 13 Jul 2024 15:56:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C67751BF406
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 15:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFD614018E
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 15:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qjL2ZIZvJbzp for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 15:56:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 55F2240096
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55F2240096
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55F2240096
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 15:56:17 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-426636ef8c9so19496075e9.2
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 08:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720886176; x=1721490976;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HNU/PLe1Nv9v7RU8s4kc8ekRDtgp/M25nOKvYFW9Gc0=;
 b=irUI6Ud3YnncV8/GGToHbn0j4zKFsCRbTocRldp/uPEvtficanff5mZfzazbuL4HmY
 lqYlpoU9wyGlSx8tmMfP4CsxolxQ38yXrSrBiqt7YsQLrn+EeFuJPPFZ68mFgENIzh8h
 bq/y7LxchzbHwyb3kNA8muAxfyVdiCP+zxdWok6NbSDBcEb2EQ/RojMVrg4DcYNYHsR+
 7CIo7oGaZlQPK996ZzFSX47F0+LHWMxyYFqJbLtf7ENip5/SCMyvX8iVbo7DQohQ8IWf
 50SfCKu/dTy613MYEe6DY5aK5hQuE1F8ZSDlh+p7xpURjduEBaeyBZkiucNZ7kJzRWOu
 zZ4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqanLEfi+kzDp/oq219OPKD6iIDD++ORTujB1sTdBtnLlqHjKlVmmhsjgCMLX/pKNuRvnvzcgFSJosfA7kd6jeR7OhuHAolg==
X-Gm-Message-State: AOJu0YxmH7MFaGWZB95Bi4NCOhe/Z3+zlMTLhv7W1qS5jS+Wv9wSDwqj
 XL7aNhK8YUogAUs6E7PgEgYOpmOQCOer/kkTgv3+gsbLKH38k5JpT+/G/lSzQbYPT6VGkW4a0D6
 0s90=
X-Google-Smtp-Source: AGHT+IGOH38N9IcB6AEQchkCN1gxAMINqudoB2u7tbGI8inZjHPGMvHJQO4xbDytoujQkIFK4deGAw==
X-Received: by 2002:a05:600c:1587:b0:426:5e91:3920 with SMTP id
 5b1f17b1804b1-426708f1df1mr114743795e9.29.1720886175818; 
 Sat, 13 Jul 2024 08:56:15 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f23981fsm60471765e9.4.2024.07.13.08.56.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jul 2024 08:56:15 -0700 (PDT)
Message-ID: <3ffc6462-8ea2-4733-9e1d-5a8c9abdd32a@smile.fr>
Date: Sat, 13 Jul 2024 17:56:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
References: <20240713120927.2620819-1-thomas.petazzoni@bootlin.com>
Content-Language: fr
In-Reply-To: <20240713120927.2620819-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720886176; x=1721490976; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HNU/PLe1Nv9v7RU8s4kc8ekRDtgp/M25nOKvYFW9Gc0=;
 b=J/e/MbIBUmCm8ASvNS9c3q8cSGWwcgvxt+UOB9/Eqdh0m1kd+Cma+c8dL3PAIGxoSi
 DHAtnTHV6JkherKtAOThh9hJAswxYZ9tdR7rFaWPAMAulZWPbW2GymDx3m2UyMconNJr
 0SOa9LDCjdz8YHv6f19dreqCRke9duv2B5OWI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=J/e/MbIB
Subject: Re: [Buildroot] [PATCH] package/gcc: disallow Fortran on gcc 12/13
 on Microblaze
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgMTMvMDcvMjAyNCDDoCAxNDowOSwgVGhvbWFzIFBldGF6em9uaSB2
aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gVGhlIGJ1aWxkIG9mIGdjYyB3aXRoIEZvcnRyYW4g
c3VwcG9ydCBpcyBicm9rZW4gb24gZ2NjIDEyLnggYW5kIGdjYwo+IDEzLngsIGl0IGZhaWxzIHdp
dGg6Cj4gCj4gLi4vLi4vLi4vbGliZ2ZvcnRyYW4vZ2VuZXJhdGVkL2Jlc3NlbF9yOC5jOiBJbiBm
dW5jdGlvbiAnYmVzc2VsX3luX3I4JzoKPiAuLi8uLi8uLi9saWJnZm9ydHJhbi9nZW5lcmF0ZWQv
YmVzc2VsX3I4LmM6MTc4OjE6IGludGVybmFsIGNvbXBpbGVyIGVycm9yOiBpbiBnZW5fcmVnX3J0
eCwgYXQgZW1pdC1ydGwuY2M6MTE2Nwo+IAo+IFRoaXMgaXNzdWUgaGFzIGJlZW4gZml4ZWQgaW4g
Z2NjIDE0LngsIHdoaWNoIGJ1aWxkcyBhIE1pY3JvYmxhemUKPiBGb3J0cmFuLWNhcGFibGUgdG9v
bGNoYWluIHN1Y2Nlc3NmdWxseS4KPiAKPiBTaW5jZSB3ZSdyZSBub3QgcmVhbGx5IGludGVyZXN0
ZWQgaW4gZmlndXJpbmcgb3V0IHRoZSBjb21taXQgdGhhdAo+IGZpeGVkIHRoZSBwcm9ibGVtLCBs
ZXQncyBzaW1wbHkgZGlzYWxsb3cgdGhlIHNlbGVjdGlvbiBvZiBGb3J0cmFuIHdpdGgKPiBnY2Mx
Mi8xMyBvbiBNaWNyb2JsYXplLgo+IAo+IEZpeGVzOgo+IAo+ICAgaHR0cDovL2F1dG9idWlsZC5i
dWlsZHJvb3QubmV0L3Jlc3VsdHMvNWI0ZWVlMWQ5YjExOWM5ZjkyM2Y5NTE4NjE4ZjQ1YTY0ODJk
ZGM4NS8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6
b25pQGJvb3RsaW4uY29tPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJk
cywKUm9tYWluCgoKPiAtLS0KPiAgcGFja2FnZS9nY2MvQ29uZmlnLmluLmhvc3QgfCA0ICsrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL2djYy9Db25maWcuaW4uaG9zdCBiL3BhY2thZ2UvZ2NjL0NvbmZpZy5pbi5ob3N0Cj4gaW5k
ZXggOTY5NzAyYjcwNy4uMDEzNTI3YzM0ZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2djYy9Db25m
aWcuaW4uaG9zdAo+ICsrKyBiL3BhY2thZ2UvZ2NjL0NvbmZpZy5pbi5ob3N0Cj4gQEAgLTEwMyw2
ICsxMDMsMTAgQEAgY29uZmlnIEJSMl9UT09MQ0hBSU5fQlVJTERST09UX0ZPUlRSQU4KPiAgCSMg
b24gYXJjaGl0ZWN0dXJlIGJ1aWxkaW5nIGxpYnF1YWRtYXRoLCB3Y2hhciBpcyByZXF1aXJlZAo+
ICAJZGVwZW5kcyBvbiAhQlIyX1RPT0xDSEFJTl9IQVNfTElCUVVBRE1BVEggfHwgXAo+ICAJCShC
UjJfVE9PTENIQUlOX0hBU19MSUJRVUFETUFUSCAmJiBCUjJfVVNFX1dDSEFSKQo+ICsJIyBpbnRl
cm5hbCBjb21waWxlciBlcnJvcjogaW4gZ2VuX3JlZ19ydHgsIGF0IGVtaXQtcnRsLmNjOjExNjcK
PiArCSMgZml4ZWQgaW4gZ2NjIDE0LngsIHNvIGRpc2FibGUgZ2NjIDEyLngvMTMueAo+ICsJZGVw
ZW5kcyBvbiAhKEJSMl9taWNyb2JsYXplICYmIFwKPiArCQkoQlIyX0dDQ19WRVJTSU9OXzEyX1gg
fHwgQlIyX0dDQ19WRVJTSU9OXzEzX1gpKQo+ICAJc2VsZWN0IEJSMl9UT09MQ0hBSU5fSEFTX0ZP
UlRSQU4KPiAgCWhlbHAKPiAgCSAgRW5hYmxlIHRoaXMgb3B0aW9uIGlmIHlvdSB3YW50IHlvdXIg
dG9vbGNoYWluIHRvIHN1cHBvcnQgdGhlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
