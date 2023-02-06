Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473A4C636D3
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 18:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA58E41723;
	Mon,  6 Feb 2023 18:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA58E41723
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cVV5Z7ZsurSM; Mon,  6 Feb 2023 18:38:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F83241705;
	Mon,  6 Feb 2023 18:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F83241705
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E5D3A1BF2CD
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 18:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BED9C41705
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 18:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BED9C41705
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QAxiMdpjL1Uv for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 18:38:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15884416E2
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15884416E2
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 18:38:25 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id bg26so9372631wmb.0
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 10:38:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6+XP9XbrJdzDTzmodZV1HsHsEa2Y2xh6PZ2XuZUiA2I=;
 b=c82F+YNdG7+Ov0Cla+iJDBPnaxJ9Zvo6T475HS3DPcBjXTvZEFii4kkKY6O0T5dQgN
 i9z4iZer4h2QWkY1LLG6eUektb6B3lyoV6Rwr+unk7unAU6oGzdKHB2foafbxMU8Zdkz
 4ZMzE8gEDZ+8YXguyQLNk2G+s4hdUhcQ44xQ8t+FEACTf6iK6hzTC0uooRIijBaHqxtN
 /9sOwpGqulkJcvAJ0yL8D8VB0uVeYBtQHqHG2dFjV4RjOu8Fbk7gx1mrX1b6gAW+9ZdZ
 cfly4PKF2WLNYHJTPMOsFJbOWJV6ixxN1qAUlXuWMooEFUdCGs5elE4mT9LWDhF894mo
 48Rw==
X-Gm-Message-State: AO0yUKX3MkD7oKmSKu6Gyp0FsQc2y4zsuUTx0aeHBGRKjqcwYD9cSsld
 ReAJmpegObC43KLMq/ZH7ar2VQ==
X-Google-Smtp-Source: AK7set+XN7pJP7Yhz8UGksHDVFoJORavHWeKfRbEjSjI3f68f3vzhR9ddjNknHZzLzzfTeUCC6gvew==
X-Received: by 2002:a05:600c:43d2:b0:3d3:513c:240b with SMTP id
 f18-20020a05600c43d200b003d3513c240bmr653239wmn.7.1675708703274; 
 Mon, 06 Feb 2023 10:38:23 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a05600c4f4200b003dc522dd25esm12537100wmq.30.2023.02.06.10.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 10:38:22 -0800 (PST)
Message-ID: <cb3c8f80-6864-f1a5-d917-13bff3ac9bc2@smile.fr>
Date: Mon, 6 Feb 2023 19:38:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230130002854.2300661-1-james.hilliard1@gmail.com>
 <20230130002854.2300661-3-james.hilliard1@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230130002854.2300661-3-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6+XP9XbrJdzDTzmodZV1HsHsEa2Y2xh6PZ2XuZUiA2I=;
 b=DyQ2GykstFJTe4nvGP64fcikjiZHgn0/ojZfFjNIPdO89svkSuAvPQHbBfECYj3QDE
 KfPn/Cua0kNtMpDZAXdR46zYMcsKnlq4zwGH6bT4Mi++L2+DsFi+e5PUuZ7119SX/uSK
 owP3LUX7Oe80Gpx+XfrRHgU7HB5D6Ubl8+rO+dZJeSQM/iSkOopj01TEdOM6vC9U5jhU
 SddJFdOaTmgTWe12nMCg8361rLG/kUs8r3sdOyjB8MluNLJdsEdgPZtBH6ExX19zcUSv
 Qy1FiClEQdTm5ndS4nh3BaPbc37LVYLfYxgbUsL91HQ+jPX1ugP41kyhBSdMOei4+JC3
 EnOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=DyQ2Gyks
Subject: Re: [Buildroot] [PATCH v5 03/10] package/gemmlowp: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtZXMsCgpMZSAzMC8wMS8yMDIzIMOgIDAxOjI4LCBKYW1lcyBIaWxsaWFyZCBhIMOp
Y3JpdMKgOgo+IEZyb206IFN0ZWZhbiBIYWdlciA8c3RlZmFuLmhhZ2VyQGdpbnppbmdlci5jb20+
Cj4gCj4gVGhpcyBwYWNrYWdlIGlzIHJlcXVpcmVkIGJ5IHRlbnNvcmZsb3ctbGl0ZS4KPiAKPiBU
ZXN0ZWQtYnk6IFN0ZWZhbiBIYWdlciA8c3RlZmFuLmhhZ2VyQGdpbnppbmdlci5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogU3RlZmFuIEhhZ2VyIDxzdGVmYW4uaGFnZXJAZ2luemluZ2VyLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4K
PiAtLS0KPiBDaGFuZ2VzIHY0IC0+IHY1Ogo+ICAgLSBhZGQgY29tbWVudCBpbmRpY2F0aW5nIGxp
YnJhcnkgaXMgaGVhZGVyIG9ubHkKPiBDaGFuZ2VzIHYyIC0+IHYzOgo+ICAgLSBhZGQgQysrMTEg
ZGVwZW5kZW5jeQo+IC0tLQo+ICBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgfCAgMSAr
Cj4gIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS9nZW1t
bG93cC9Db25maWcuaW4gICAgIHwgMTIgKysrKysrKysrKysrCj4gIHBhY2thZ2UvZ2VtbWxvd3Av
Z2VtbWxvd3AuaGFzaCB8ICA0ICsrKysKPiAgcGFja2FnZS9nZW1tbG93cC9nZW1tbG93cC5tayAg
IHwgMTYgKysrKysrKysrKysrKysrKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMo
KykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZ2VtbWxvd3AvQ29uZmlnLmluCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2dlbW1sb3dwL2dlbW1sb3dwLmhhc2gKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UvZ2VtbWxvd3AvZ2VtbWxvd3AubWsKPiAKPiBkaWZmIC0tZ2l0
IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPiBpbmRleCA1N2QzNjQwMTJjLi4wMWU2NGU1ZmM1
IDEwMDY0NAo+IC0tLSBhL0RFVkVMT1BFUlMKPiArKysgYi9ERVZFTE9QRVJTCj4gQEAgLTI3MjUs
NiArMjcyNSw3IEBAIEY6CXBhY2thZ2UvdGktZ2Z4Lwo+ICAKPiAgTjoJU3RlZmFuIEhhZ2VyIDxz
dGVmYW4uaGFnZXJAZ2luemluZ2VyLmNvbT4KPiAgRjoJcGFja2FnZS9jcHVpbmZvLwo+ICtGOglw
YWNrYWdlL2dlbW1sb3dwLwo+ICBGOglwYWNrYWdlL3J1eS8KPiAgCj4gIE46CVN0ZWZhbiBPdHQg
PHN0ZWZhbkBvdHQubmV0Pgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2th
Z2UvQ29uZmlnLmluCj4gaW5kZXggMGQzZmQzNzc5Ni4uOGZkOGYwNWJkNiAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluCj4gQEAgLTIwMTgs
NiArMjAxOCw3IEBAIG1lbnUgIk90aGVyIgo+ICAJc291cmNlICJwYWNrYWdlL2Z4ZGl2L0NvbmZp
Zy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9nY29uZi9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBh
Y2thZ2UvZ2RhbC9Db25maWcuaW4iCj4gKwlzb3VyY2UgInBhY2thZ2UvZ2VtbWxvd3AvQ29uZmln
LmluIgo+ICAJc291cmNlICJwYWNrYWdlL2dmbGFncy9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBh
Y2thZ2UvZ2xpL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9nbGlibW0vQ29uZmlnLmlu
Igo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dlbW1sb3dwL0NvbmZpZy5pbiBiL3BhY2thZ2UvZ2Vt
bWxvd3AvQ29uZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAw
Li4zNzk0NTBkMWIwCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvZ2VtbWxvd3AvQ29u
ZmlnLmluCj4gQEAgLTAsMCArMSwxMiBAQAo+ICtjb25maWcgQlIyX1BBQ0tBR0VfR0VNTUxPV1AK
PiArCWJvb2wgImdlbW1sb3dwIgo+ICsJZGVwZW5kcyBvbiBCUjJfSU5TVEFMTF9MSUJTVERDUFAK
PiArCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNF84ICMgQysrMTEKPiAr
CWhlbHAKPiArCSAgTG93LXByZWNpc2lvbiBtYXRyaXggbXVsdGlwbGljYXRpb24uCj4gKwo+ICsJ
ICBodHRwczovL2dpdGh1Yi5jb20vZ29vZ2xlL2dlbW1sb3dwCj4gKwo+ICtjb21tZW50ICJnZW1t
bG93cCBuZWVkcyBhIHRvb2xjaGFpbiB3LyBDKysxMSIKPiArCWRlcGVuZHMgb24gIUJSMl9JTlNU
QUxMX0xJQlNURENQUCB8fCBcCj4gKwkJIUJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzRfOAo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dlbW1sb3dwL2dlbW1sb3dwLmhhc2ggYi9wYWNrYWdlL2dl
bW1sb3dwL2dlbW1sb3dwLmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAuLjdjNTZhMThiYjYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9nZW1tbG93
cC9nZW1tbG93cC5oYXNoCj4gQEAgLTAsMCArMSw0IEBACj4gKyMgTG9jYWxseSBjYWxjdWxhdGVk
Cj4gK3NoYTI1NiAgY2M4YTIyYjZmMDcxYzM3ODFlNmI0YjcyNjU0Yzg5YjFjZGMxOThlNzJlYmFk
ZWJiMTc2MzhlYWMyMDUzNDRjMSAgZ2VtbWxvd3AtMDhlNGJiMzM5ZTM0MDE3YTA4MzUyNjlkNGEz
N2M0ZWEwNGQxNWE2OS50YXIuZ3oKPiArIyBMaWNlbnNlIGZpbGVzLCBsb2NhbGx5IGNhbGN1bGF0
ZWQKPiArc2hhMjU2ICBjZmM3NzQ5Yjk2ZjYzYmQzMWMzYzQyYjVjNDcxYmY3NTY4MTQwNTNlODQ3
YzEwZjNlYjAwMzQxN2JjNTIzZDMwICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ2Vt
bWxvd3AvZ2VtbWxvd3AubWsgYi9wYWNrYWdlL2dlbW1sb3dwL2dlbW1sb3dwLm1rCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi45NDg5ZGNjYmU1Cj4gLS0tIC9kZXYv
bnVsbAo+ICsrKyBiL3BhY2thZ2UvZ2VtbWxvd3AvZ2VtbWxvd3AubWsKPiBAQCAtMCwwICsxLDE2
IEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyBnZW1tbG93cAo+ICsjCj4g
KyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKwo+ICtHRU1NTE9XUF9WRVJTSU9OID0gMDhlNGJi
MzM5ZTM0MDE3YTA4MzUyNjlkNGEzN2M0ZWEwNGQxNWE2OQo+ICtHRU1NTE9XUF9TSVRFID0gJChj
YWxsIGdpdGh1Yixnb29nbGUsZ2VtbWxvd3AsJChHRU1NTE9XUF9WRVJTSU9OKSkKPiArR0VNTUxP
V1BfTElDRU5TRSA9IEFwYWNoZS0yLjAKPiArR0VNTUxPV1BfTElDRU5TRV9GSUxFUyA9IExJQ0VO
U0UKPiArR0VNTUxPV1BfSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4gKyMgT25seSBpbnN0YWxscyBh
IGhlYWRlcgo+ICtHRU1NTE9XUF9JTlNUQUxMX1RBUkdFVCA9IE5PCgpPayBidXQgbGliZWlnaHRf
Yml0X2ludF9nZW1tLnNvIGlzIGluc3RhbGxlZCBpbiBzdGFnaW5nLgpXaGF0IGNhbiBnbyB3cm9u
ZyBpZiBzb21ldGhpbmcgaXMgbGlua2luZyBhZ2FpbnN0IGl0ID8KCkJlc3QgcmVnYXJkcywKUm9t
YWluCgo+ICtHRU1NTE9XUF9TVUJESVIgPSBjb250cmliCj4gKwo+ICskKGV2YWwgJChjbWFrZS1w
YWNrYWdlKSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
