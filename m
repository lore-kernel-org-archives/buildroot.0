Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87CFC5CFC1
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FE9340ECB;
	Fri, 14 Aug 2026 14:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 24bJyaHft4aq; Fri, 14 Aug 2026 14:18:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2FFE40E6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786717098;
	bh=spwmrm+od2PHNdT3gIRLIXDI0Q5k4Q4MoIJ1Mvl8qHA=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=IaRZ5nHdg8D3HsPXoGq9ivsh/84BrvLWiq9rKgPe3YkN58WuuogztAhX2WAErSYQT
	 wcfDo7YSRDKwLwSmwS9Hk6a3Xs/pHyhCwhpGxkPZ+bHvI91xJbjvu/OOqMuKenzRdD
	 M71YIgR1Rw56ixt4x3tredxkrImU5Bqn9lRHqOBRG+TLcIN6foAh8p8ktC69lVV9FU
	 3bWIr0teC5p4p1dW3hIS6kOMQthIRvtK/VDIqF0JbfkPG72MFvg6Dc/qdjQyqjj1jH
	 j9+AMmgb6wxRV3UsXvJBOgpZbd3KCNEPgrTuYRteXXG8WEZ9CiEbiVKUDPxMG5/ZKR
	 REUc/qtEDZH7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2FFE40E6F;
	Fri, 14 Aug 2026 14:18:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AE4B3DF
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0884B60834
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c6zh8c-IsU5E for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:18:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 31FD060817
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31FD060817
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31FD060817
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:18:16 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-47db714766aso1310944f8f.0
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786717094; x=1787321894;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HNw1n3f2XlIXFOsSRIu/CzvZDJhGGNEtqcEOe6YREWw=;
 b=kpwx4qW5wk6AcC2QSxD5W+1zNNqL6afSA4JD9iKkK76Do6/2Y9aMXloDdW96ja+Cn5
 8cEouoxVW4nxiko9GJQnlha7bdrGQI1t2Y0Gvpd7S7GuROLTCxJ4As5CNsKjenJV5l8S
 f+W5Z3tuxV4QkQSxy2F7tn+Mlj4WaNCi/0NvOXIEBaAwr15VhzRw+5JVRY1hw5hAo3DG
 IeaG16NG2GONU4d8XP+WLoGjkklTPnWjayH4Wv+k9aQof+evYAZkSe6uCVINvZ7L8paP
 b3+1ndRGsHivNBu+u8+22la37RGvzBgiTixPLI9qdAxZ/j+/NkyR1AcvJT1YeV185RxF
 K0aA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrk8cLzoS8jvLmKQq3NytLfRrkTSkk3N3s2cJKwzWJAXrr4QX9sxH4C7GSRl5gObTp63W+xYERxZ+M=@buildroot.org
X-Gm-Message-State: AOJu0Yw1PD1tFwUBn654ftmyVVCG/w4OeMksR9jhNWUN8mHLmtbJfeB+
 f0cTWcqIbFuA2AEjCkBLLPxEdT4OZ2wJCPqz0vU8nSTtmok02I85UeuT8rUieDcqQMTk2sSGPeu
 PrisLoPg=
X-Gm-Gg: AR+sD11MWckkcAp5BtFirMCnOnZ5XhcxpsCRLWPjTgfeQYnMu30h7+O2UrqH/NpVyO4
 dX/E10OvU/xUvIyVIkbCMLTM3MlF7NDazoKF2fIxFsU6JMsKjpp5Lx6pHjp+2dsIDQvIZ+TCO/Q
 dvZLS/k0gfNW/b/o+Ti+PCDEgc4XBGbiVSThvduQ/5WLKEq3EcdnlQEaB07Q8stEDP3TxStY6dH
 IvgVGKoZuErY9RL1+yr0L8N00kvHUF8N7wOuJJLmzpErTA8lV60Gf0szZRrDii9pBJcqdw3842U
 ryM7ICuRtMoIvNqvEjDTjnyidE1l0xEi3kGMgkL0bMK2l8xd+SLIOTs2WAAph5cupUyAYUDGF9o
 j0aVhMiJMDB87UTXiQrqtonxO2kLTrAwC/ETcFDzYTZSRxab/ShLUBa0C0K5nMRfDpvBK7K1+Ou
 m/lQQ/FeBxfk0JaLzvsgbkvAjbkoOIdCU9sqzAVZFBRRja0zOtT7b6xwUsBEWwvrwCTY9FsC+p4
 wZP4rRc++Mte2paf1b1JNiT3vJgyV9XfoshgsUluQtomK0y
X-Received: by 2002:a05:6000:4022:b0:47f:7ea0:6c20 with SMTP id
 ffacd0b85a97d-481607a6158mr9221785f8f.15.1786717094022; 
 Fri, 14 Aug 2026 07:18:14 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2b1fb7sm8896376f8f.17.2026.08.14.07.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:18:13 -0700 (PDT)
Message-ID: <b5808dab-88c5-4ac4-8f33-21ae3b3905cf@mind.be>
Date: Fri, 14 Aug 2026 16:18:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <ahPrm_0gVDGw5B5-@waldemar-brodkorb.de>
Content-Language: en-US
In-Reply-To: <ahPrm_0gVDGw5B5-@waldemar-brodkorb.de>
Subject: Re: [Buildroot] [PATCH for next] package/uclibc: bump to 1.0.58
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjUvMDUvMjYgMDg6MjYsIFdhbGRlbWFyIEJyb2Rrb3JiIHdyb3RlOgo+IE5ldyByZWxlYXNl
IHdpdGggZm9sbG93aW5nIGNoYW5nZXM6Cj4KPiBBZGFtIExhY2tvcnp5bnNraSAoMSk6Cj4gICAg
ICAgIHRlcm1pb3MuaDogQWRkIElCU0hJRlQKPgo+IENoYXJsZXMgTWlyYWJpbGUgKDExKToKPiAg
ICAgICAgcmlzY3Y6IGFkZCBkZWZjb25maWdzCj4gICAgICAgIHJpc2N2OiBhZGQgc3VwcG9ydCBm
b3Igc3RhdGljIHBpZSBiaW5hcmllcwo+ICAgICAgICByaXNjdjogYWRkIHN1cHBvcnQgZm9yIHVj
b250ZXh0IGZ1bmN0aW9ucwo+ICAgICAgICBwaXBlOiBkaXJlY3RseSBpbnZva2UgcGlwZTIgZnJv
bSBrZXJuZWwgd2hlbiAhVUNMSUJDX0xJTlVYX1NQRUNJRklDCj4gICAgICAgIEZpeCB7ZyxzfWV0
dGltZW9mZGF5IHdoZW4gIVVDTElCQ19IQVNfUkVBTFRJTUUKPiAgICAgICAgRml4IGJ1aWxkIHdp
dGggc3RhdGljLXBpZSBidXQgd2l0aG91dCBucHRsIHRocmVhZHMKPiAgICAgICAgZG8gbm90IHJl
bW92ZSBiaXRzL3VDbGliY19jdHlwZS5oIHdoZW4gIVVDTElCQ19IQVNfQ1RZUEVfVEFCTEVTCj4g
ICAgICAgIGdldG9wdC1zdXN2MzogcmVtb3ZlIGNhbGwgdG8gZ2V0dGV4dCBgX2AgbWFjcm8KPiAg
ICAgICAgcmVhZGRpcnssX3J9OiByZW1vdmUgbG9vcCB0byBza2lwIGZpbGVzIHdpdGggZF9pbm8g
PT0gMAo+ICAgICAgICBzcGF3bjogYWxsb3cgZmlsZSBhY3Rpb25zIG9uIG5vLW1tdSB0YXJnZXRz
Cj4gICAgICAgIGdldG9wdC1zdXN2MzogYWRkIHN1cHBvcnQgZm9yIHJlc2V0aW5nIHRoZSBzY2Fu
IGJ5IHNldHRpbmcgb3B0aW5kIHRvIHplcm8KPgo+IE1hcmN1cyBIYWVobmVsICgxKToKPiAgICAg
ICAgYWFyY2g2NC9mcHVfY29udHJvbC5oOiBEb24ndCB1c2UgZ2NjLWludGVybmFsIHR5cGVzCj4K
PiBKYW4gS2zDtnR6a2UgKDEpOgo+ICAgICAgICBlbGYvZGwtc3VwcG9ydC5jOiByZW1vdmUgdW5u
ZWNlc3NhcnkgbWVtc2V0Cj4KPiBSYW1pbiBNb3Vzc2F2aSAoOSk6Cj4gICAgICAgIGxpYnNhbml0
aXplcjogYXJtL3Vjb250ZXh0OiBmaXggVkZQIHNhdmUvcmVzdG9yZSB0byB1c2UgdWNfcmVnc3Bh
Y2UgYXJlYQo+ICAgICAgICBsaWJzYW5pdGl6ZXI6IGFybS91Y29udGV4dC5oOiBhZGQgZ2xpYmMt
c3R5bGUgUkVHX1IwLi5SRUdfUjE1IGFsaWFzZXMKPiAgICAgICAgbGlic2FuaXRpemVyOiBsaW5r
LmgvZGwtaXRlcmF0ZS1waGRyOiBleHBvc2UgZGxfcGhkcl9pbmZvIFRMUyBmaWVsZHMKPiAgICAg
ICAgbGlic2FuaXRpemVyOiBsZHNvOiB0cmFjayBfZGxfbG9hZF9hZGRzL19kbF9sb2FkX3N1YnMg
Y291bnRlcnMKPiAgICAgICAgbGlic2FuaXRpemVyOiBsZHNvOiBpbXBsZW1lbnQgX2RsX3Rsc19n
ZXRfYWRkcl9zb2Z0IGZvciBkbF9waGRyX2luZm86OmRscGlfdGxzX2RhdGEKPiAgICAgICAgbGli
c2FuaXRpemVyOiBkcm9wIF9fcGFnZXNpemUsIG1ha2UgX2RsX3BhZ2VzaXplIHRoZSBzaW5nbGUg
c291cmNlIG9mIHRydXRoCj4gICAgICAgIGxpYnNhbml0aXplcjogc3lzL3VzZXIuaDogcmVtb3Zl
IG9ic29sZXRlIEJGRCB0cmFkLWNvcmUgTkJQRy9VUEFHRVMgZGVmaW5lcwo+ICAgICAgICBsaWJz
YW5pdGl6ZXI6IGZlYXR1cmVzLmg6IGhhcmQtd2lyZSBfRklMRV9PRkZTRVRfQklUUz02NCB0byBt
YXRjaCBsaWJyYXJ5J3MgNjQtYml0IG9mZl90L2lub190Cj4gICAgICAgIGxpYnNhbml0aXplcjog
ZnRzLmg6IGRyb3AgdGhlIGJvZ3VzIF9GSUxFX09GRlNFVF9CSVRTPT02NCAjZXJyb3IKPgo+IFdh
bGRlbWFyIEJyb2Rrb3JiICg3KToKPiAgICAgICAgYml0cy9zdGF0eC5oOiBhZGQgc29tZSBtaXNz
aW5nIGRlZmluZXMKPiAgICAgICAgYml0cy9zdGF0eC5oOiBzeW5jIHN0cnVjdCB3aXRoIGdsaWJj
Cj4gICAgICAgIHN5cy9mYW5vdGlmeS5oOiBzeW5jIHdpdGggbXVzbAo+ICAgICAgICBsaWJpY29u
djogZml4IHR5cGVkZWYgb2YgaWNvbnZfdAo+ICAgICAgICBtaXNjOiBhZGQgdW5pY29kZSBjaGFy
YWN0ZXIgZnVuY3Rpb25zIChjMTEpCj4gICAgICAgIG5ldGluZXQvdGNwLmg6IHN5bmMgd2l0aCBn
bGliYwo+ICAgICAgICBidW1wIHZlcnNpb24gZm9yIDEuMC41OCByZWxlYXNlCj4KPiBTaWduZWQt
b2ZmLWJ5OiBXYWxkZW1hciBCcm9ka29yYiA8d2J4QG9wZW5hZGsub3JnPgoKQXBwbGllZCB0byAy
MDI1LjAyLnggYW5kIDIwMjYuMDUueCwgdGhhbmtzICEKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
