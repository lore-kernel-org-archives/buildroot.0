Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA71EC48BC4
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 20:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 472EB81F89;
	Sat, 17 Feb 2024 20:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fyYsMEd1IsXM; Sat, 17 Feb 2024 20:08:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60CC281FB6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60CC281FB6;
	Sat, 17 Feb 2024 20:08:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 240561BF59E
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 20:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EF9A60675
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 20:08:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aROihOvr2zQ9 for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 20:08:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 15F6E60665
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15F6E60665
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15F6E60665
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 20:08:13 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41258904302so6091965e9.3
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 12:08:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708200492; x=1708805292;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jxudWLb5vtj5jND71jCriEjWsjhWLGeWcb1F1qhIDcQ=;
 b=AK8CGxyvKResQb1rhN+BJSUNdmrzaKVeoOgMFKC9pqdHykZZq0wYCH63Gr6XQxY09B
 orKa4ILXpPOovYlExKmdZNx40YOwpLDhUG3bkRptX2j2kwNNM2c1dNPtX+Bjs8VX0J6C
 BoPkcD/d3Lf1pyR+4m18B41k/uL0jDGFxa8b2ZmKaERK9pcLNPNlJtr2xo176+2g/1NV
 WWh41e/kK4jXNhy5z48VylaL0gNiDgzyFMRyk5U6x2FNLUPICQCqRr9FITbBpToTQwWi
 BRolYZr3A5lE3n49TQMnCZpmwCzybDYKLWS7lR1EadEnXIb5OB8XPJa8/xn/y2MD2aJ9
 TGPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUohpOUDipyMGUOd6qRdO58/EkOkLT0n89jCPUz+2F9//SQ3tpCRHhPueYmHjpSzfiu5odNtTX/wD6nwrCa3+8xaHKWQ1suKQ==
X-Gm-Message-State: AOJu0YwCJtp+HUM+kdGx+uFNWAbsIrNwoTwm9QMyHqXnpA9ZIfzQJ6Zk
 CaRtPiIKOejy5m+KSdB0gNbFjPDrhO8tricv1jfjYDXYIZvo+ktu
X-Google-Smtp-Source: AGHT+IGv9xc6V/rluPCdrS3fjGLpKgh1r7s+IimEmUj+T+dsBxiue4Ilv0SUeHkcd0w0gyMucR+d9g==
X-Received: by 2002:a05:600c:4fc9:b0:412:5652:2875 with SMTP id
 o9-20020a05600c4fc900b0041256522875mr2239770wmq.17.1708200491964; 
 Sat, 17 Feb 2024 12:08:11 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 k35-20020a05600c1ca300b00410cfc34260sm6279165wms.2.2024.02.17.12.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 12:08:11 -0800 (PST)
Message-ID: <69a15ccedfcde5649a770aff60752f5ecc3ece88.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 buildroot@buildroot.org
Date: Sat, 17 Feb 2024 21:08:14 +0100
In-Reply-To: <20240217160244.1320482-3-dario.binacchi@amarulasolutions.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-3-dario.binacchi@amarulasolutions.com>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708200492; x=1708805292; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jxudWLb5vtj5jND71jCriEjWsjhWLGeWcb1F1qhIDcQ=;
 b=c2RQrJvkeapzp2rNhzdOlqgntRvTvBlCGuXFlA9YhoKxsUhZzvl/yC0gwJCpToQe0s
 kPUiyIPCei26jqA/paZOZjAn0UFKgrec02dOb1FoSd16YI2abKFtQcwVT8Q1Dfy39Atm
 VeQxmy0Z3XV7ZZmL8VQFIJ6h66lg5mlJYaevxw1Ricz8oGsCFVmP+481CvA/8rQA+OxM
 p5pcOVOut3t8zBuETvN37KZMrx7Rtl4PhXm1JMlUhSX2uimo/Dr6DJajvxh+Bkc13T/C
 PUMdbI2grfvwmVtjJAS47AZ/ZE01V+oHnUFvEZ+RI+ETscLBbgfreSrKbn6eNPQ8rBYB
 I9eQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=c2RQrJvk
Subject: Re: [Buildroot] [PATCH v4 02/20] configs/ti_am64x_sk_defconfig: fix
 BR2_TARGET_OPTEE_OS_PLATFORM setting
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRGFyaW8sCgpPbiBTYXQsIDIwMjQtMDItMTcgYXQgMTc6MDIgKzAxMDAsIERhcmlvIEJpbmFj
Y2hpIHdyb3RlOgo+IENoZWNraW5nIHRoZSBvdXRwdXQgb2YgdGhlIGNvbW1hbmQgYGdpdCBncmVw
IFBMQVRGT1JNIHwgZ3JlcCBrM2AsIHdlIGNhbgo+IGZvdW5kIHRoZSBwcm9wZXIgc2V0dGluZ3Mg
Zm9yIHRoZSBvcHRlZS1vcyBwYWNrYWdlOgo+IAo+IC5naXRodWIvd29ya2Zsb3dzL2NpLnltbDrC
oMKgwqDCoMKgwqDCoMKgwqAgX21ha2UgUExBVEZPUk09azMtYW02NHgKPiAuZ2l0aHViL3dvcmtm
bG93cy9jaS55bWw6wqDCoMKgwqDCoMKgwqDCoMKgIF9tYWtlIFBMQVRGT1JNPWszLWFtNjR4IENG
R19BUk02NF9jb3JlPXkKPiAuLi4KPiBjb3JlL2FyY2gvYXJtL3BsYXQtazMvY29uZi5tazppZm5l
cSAoLCQoZmlsdGVyICR7UExBVEZPUk1fRkxBVk9SfSxhbTY1eCBqNzIxZSBqNzg0czQgYW02NHgg
YW02MngpKQo+IAo+IFN1Z2dlc3RlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21p
bGUuZnI+Cj4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFt
YXJ1bGFzb2x1dGlvbnMuY29tPgo+IAo+IC0tLQo+IAo+IEFkZGVkIGluIHY0Cj4gCj4gU2lnbmVk
LW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMu
Y29tPgo+IC0tLQo+IMKgY29uZmlncy90aV9hbTY0eF9za19kZWZjb25maWcgfCAzICsrLQo+IMKg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9jb25maWdzL3RpX2FtNjR4X3NrX2RlZmNvbmZpZyBiL2NvbmZpZ3MvdGlfYW02NHhf
c2tfZGVmY29uZmlnCj4gaW5kZXggNGJmZDMxZjBjOGQzLi45ODQ3NmM4ODYyNmIgMTAwNjQ0Cj4g
LS0tIGEvY29uZmlncy90aV9hbTY0eF9za19kZWZjb25maWcKPiArKysgYi9jb25maWdzL3RpX2Ft
NjR4X3NrX2RlZmNvbmZpZwo+IEBAIC0yMSw3ICsyMSw4IEBAIEJSMl9UQVJHRVRfQVJNX1RSVVNU
RURfRklSTVdBUkVfUExBVEZPUk09ImszIgo+IMKgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJN
V0FSRV9UQVJHRVRfQk9BUkQ9ImxpdGUiCj4gwqBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1X
QVJFX0JMMzJfT1BURUU9eQo+IMKgQlIyX1RBUkdFVF9PUFRFRV9PUz15Cj4gLUJSMl9UQVJHRVRf
T1BURUVfT1NfUExBVEZPUk09ImszIgo+ICtCUjJfVEFSR0VUX09QVEVFX09TX1BMQVRGT1JNPSJr
My1hbTY0eCIKPiArQlIyX1RBUkdFVF9PUFRFRV9PU19QTEFURk9STV9GTEFWT1I9ImFtNjR4Igo+
IMKgQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU49eQo+IMKgQlIyX1RBUkdFVF9USV9LM19JTUFH
RV9HRU5fU09DX0FNNjRYPXkKPiDCoEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSPXkKCmFnYWlu
LCBtb3JlIGNvbXBsZXRlIHRoYW4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0
L2J1aWxkcm9vdC9wYXRjaC8yMDI0MDIxMzE3MjgxNy4yODcyODQ5LTQtcm9tYWluLm5hb3VyQHNt
aWxlLmZyLwoKUmV2aWV3ZWQtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJk
bGluQGdtYWlsLmNvbT4KCi0tIApBbGV4YW5kZXIgU3ZlcmRsaW4uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
