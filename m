Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4E3C48BF8
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 20:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70DD44060C;
	Mon, 19 Feb 2024 20:42:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LMzrPJgKGLrK; Mon, 19 Feb 2024 20:42:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4130F40B83
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4130F40B83;
	Mon, 19 Feb 2024 20:42:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 82EB41BF41C
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 20:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F6B04066D
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 20:42:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WaVEd3MhcMyS for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 20:42:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 24D294063A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24D294063A
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24D294063A
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 20:42:39 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4126cff604bso1626925e9.3
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 12:42:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708375358; x=1708980158;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aSFmGZg4Yiw3oIJoAIk/GtCVsKtWB8be+vKee6m25tI=;
 b=e7gQ8xnT4VDDu7C2JSx+n1WMfLrtRLM2bVCWEzNgKi35IZOXDxgGl+1RmINA1HIN2s
 QpWToUW8PYysk4HwN3G5usx7uJnUZF78ckO9mfTEn54Nghi8TsQZ5Ge0IeLDIlGH55uB
 BaC1+UToyxyhiMKcR50WfJS1dnvY51vfMSviZFL/X0w2IOT2xiN2XYBw+RDct/+LE/7Y
 CKcvYZnv6mUz5BjGhJ6EXzCNUAWqygdYfLMparRwFFaOmrzkuWfPf8098XCto820cww1
 tBnghZH7hiXKFe6SmpvOq+k6w9ka05sHqzbzPy+Q3dnT6tv1gyPLSc7ZSlCIGO8wXgwc
 1MFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBzxZKJhWS0/B2nP7ApoST7mtwgAI7azmk5TPjbfmRHNxFyAvrDwzaoro2ldrpatd9xvrq5z4ufFLA2SyVfjMUDzh3N6RVnQ==
X-Gm-Message-State: AOJu0YwrHexIdGkpAXHUizMuCgvqzSIy6fw7Cum5DG8yoM6ghEm/6IqO
 zxW89jHWd0m4l/p4NbaAYg22j0Xkf8S04BSDKlzJ/HqyNiBB3Hys
X-Google-Smtp-Source: AGHT+IGwBeVhq86Px2Uv9wB+WM/7NKhGONu8WQdtqr3qdXXeA3rgSD2JXhndTJi/DalAZ/Skb/gtIQ==
X-Received: by 2002:a05:600c:3108:b0:412:689a:864d with SMTP id
 g8-20020a05600c310800b00412689a864dmr1672470wmo.36.1708375357672; 
 Mon, 19 Feb 2024 12:42:37 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 fa24-20020a05600c519800b004126e2fd39csm40163wmb.25.2024.02.19.12.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 12:42:37 -0800 (PST)
Message-ID: <6948b9c91559db56060b09baa9e686761d589d62.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Andreas Dannenberg <dannenberg@ti.com>
Date: Mon, 19 Feb 2024 21:42:44 +0100
In-Reply-To: <20240219203656.5rb7xelxunbxwkka@dasso>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-8-dario.binacchi@amarulasolutions.com>
 <8e9c142cd6c74585b1545fd3a3f5e0b7fe221917.camel@gmail.com>
 <20240219203656.5rb7xelxunbxwkka@dasso>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708375358; x=1708980158; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aSFmGZg4Yiw3oIJoAIk/GtCVsKtWB8be+vKee6m25tI=;
 b=Hey7/P3umzCB3KN5JjsR7R76zT37hDa28vUXxZZErZ6NmZI995D4q00GJdKPQCYGl6
 wJJbr4YASsJ63/EhTc4cyvergZ97wUQSqsT7xDLa2cfCkcF1PEKTwkrx0GU02YiF6pRU
 R0wVbDEAS1JLNhne0CKN/qyl3iYxQY9IBg5t7GtbafZSzGdqkqolHs/kBOlvbb1UsjE9
 5obzzOwnYqGIEj1XMwIm01YAW+L3ljA3nklchT3CqYw9DbivrA08F+2RzJ/qJyIfdp2l
 xPW7+axbkhCcTyICoGILZCxyYK4AgLB9kQMmgDF58MIPnTg3sHMSEQv/ocP4D6lkNfUN
 KdkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Hey7/P3u
Subject: Re: [Buildroot] [PATCH v4 07/20] boot/ti-k3-image-gen: manage HS
 hardware
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQW5kcmVhcyEKCk9uIE1vbiwgMjAyNC0wMi0xOSBhdCAxNDozNiAtMDYwMCwgQW5kcmVhcyBE
YW5uZW5iZXJnIHdyb3RlOgo+ID4gwqDCoCAwwqAgZXh0bGludXjCoMKgwqDCoCByZWFkecKgwqAg
bW1jwqDCoMKgwqDCoMKgwqDCoMKgIDHCoCBtbWNAZmEwMDAwMC5ib290ZGV2LnBhcnRfIC9leHRs
aW51eC9leHRsaW51eC5jb25mCj4gPiAqKiBCb290aW5nIGJvb3RmbG93ICdtbWNAZmEwMDAwMC5i
b290ZGV2LnBhcnRfMScgd2l0aCBleHRsaW51eAo+ID4gMTrCoMKgwqDCoMKgIGFtNjJ4LXNrLWJ1
aWxkcm9vdAo+ID4gUmV0cmlldmluZyBmaWxlOiAvSW1hZ2UKPiA+IGFwcGVuZDogY29uc29sZT10
dHlTMiwxMTUyMDBuOCByb290PS9kZXYvbW1jYmxrMXAyIHJ3IHJvb3Rmc3R5cGU9ZXh0NCByb290
d2FpdCBlYXJseWNvbj1uczE2NTUwYSxtbWlvMzIsMHgwMjgwMDAwMAo+ID4gUmV0cmlldmluZyBm
aWxlOiAvazMtYW02MnguZHRiCj4gPiAjIyBGbGF0dGVuZWQgRGV2aWNlIFRyZWUgYmxvYiBhdCBm
ZmIxNDcwMAo+ID4gwqDCoMKgIEJvb3RpbmcgdXNpbmcgdGhlIGZkdCBibG9iIGF0IDB4ZmZiMTQ3
MDAKPiA+IFdvcmtpbmcgRkRUIHNldCB0byBmZmIxNDcwMAo+ID4gwqDCoMKgIExvYWRpbmcgRGV2
aWNlIFRyZWUgdG8gMDAwMDAwMDA4ZmZlZDAwMCwgZW5kIDAwMDAwMDAwOGZmZmY2ODcgLi4uIE9L
Cj4gPiBXb3JraW5nIEZEVCBzZXQgdG8gOGZmZWQwMDAKPiA+IAo+ID4gU3RhcnRpbmcga2VybmVs
IC4uLgo+ID4gCj4gPiBbwqDCoMKgIDAuMDAwMDAwXSBCb290aW5nIExpbnV4IG9uIHBoeXNpY2Fs
IENQVSAweDAwMDAwMDAwMDAgWzB4NDEwZmQwMzRdCj4gCj4gSnVzdCB3YW50aW5nIHRvIGRvdWJs
ZS1jaGVjayBvbmUgcXVpY2sgZGV0YWlsLiBEaWQgeW91IGhhdmUgdG8gbWFrZSBhbnkKPiBhZGRp
dGlvbmFsIG1vZGlmaWNhdGlvbnMgdG8gYm9vdC1tb2RlIHJlbGF0ZWQgVS1Cb290IHNldHRpbmdz
IG9yIEVOVgo+IHZhcmlhYmxlcz8gT3IgZGlkIHRoZSAibmV3IG5vcm1hbCIgb2YgQ09ORklHX0JP
T1RTVEQganVzdCB3b3JrIGZvciB5b3U/IAoKTm8gY2hhbmdlcyBpbiBVLUJvb3Qgd2hhdHNvZXZl
ciwgcGF0Y2hzZXQgZnJvbSBEYXJpbyB3b3JrcyBhcy1pcywgc2VlbXMKdGhhdCB0aGUgZXh0bGlu
dXguY29uZiB2aXNpYmxlIGluIHRoZSBsb2cgYWJvdmUgZGlkIHRoZSB0cmljay4KCi0tIApBbGV4
YW5kZXIgU3ZlcmRsaW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
