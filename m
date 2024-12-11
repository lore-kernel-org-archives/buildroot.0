Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EE9E77180
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 15:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8961B4069A;
	Wed, 11 Dec 2024 15:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28CKqhxajJ81; Wed, 11 Dec 2024 15:45:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B0844071C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B0844071C;
	Wed, 11 Dec 2024 15:45:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E1296F
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 15:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E5AB40116
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 15:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZVSG3Rtjoy6 for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 15:45:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B66FE40165
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B66FE40165
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B66FE40165
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 15:45:01 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-434f3d934fcso24944355e9.3
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 07:45:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733931899; x=1734536699;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aaEIi1o8IHsa4q6DrfjslFAUgaWFcWpL4qXNCjIAYpY=;
 b=aUN/vmdDADZ2ntfWM/HHNF1U8l13JfoWxD2hgLxgEmaR9fWt+J1w+ieysK9ipWihKs
 GhdMOtGdx010k/3JbhzOsiMVnobxf+jB4b3IWbV4Geqa4kZvAsC/srwkV17Uq5fYqp0i
 8LDQPMcjrMK43A00nUeCMIbyZYuRCOeRtyI2d3jJSmQQQ1yYkg6Mj2ioRk7yxT9LOm7q
 ti43I7/exzfAr1KvAC9sJWTCIuG/YqlY89earLZ0TCF+EdHzdwjZZNpAkEwjeKIpfwBy
 uuqp4bAEOi2ByWzDeFcF8Xbg8Q2Wd2Ye3rytXO2c0IuRl6XFzqsa6+SLa03pDSgMTAw0
 s8aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsTFo8r457I9NIfSUQN5aqfwpQ9989U+vORM+C50HlH8750g9k5tVmCWpRWX+mJeADkFrnWVMpY4w=@buildroot.org
X-Gm-Message-State: AOJu0YxKKa9PdC6CDX/PwWYOlAjCHxQAKkm3xNMWXCfmgvsblbTS/J+o
 gACZ53deR5wMzUfXxZUlCOUjKUck+PzSVp5XkWYODP/NGSSgQABGxsTjlCgtqnw=
X-Gm-Gg: ASbGncvk4IMAH+MynGGRDz5WdxwQzWiCOiUZ2XzvQoRpJkmFcpHv6qUxZgynCb0nPoY
 L+Lz7JfqZ6lEDmCGStdDLBKZv97Lt8f0jH8MiQ3YiOCDoNysJ8u9Dc/1gzurAlZTto7sDyAXeBj
 bpUcuLq2nfhepBoOJSbZZDJ+2ozVDW/dS2mtuGUab15G7EKBOgujyELKShHRIa1sPbe9l89wDZ+
 cORO/iUBBnM0jVGNbSTwj2CMhEwt/95c79XE7M20uRFfSVTD028YpEDUxgKl2p6KnaB+uwJOjiE
 oy3zo9/yoLhEAq1vdw7iITbl3U6hPkNT9Qs+17fYHA==
X-Google-Smtp-Source: AGHT+IEAuE1waxL3oFlAO38EBmT544hPRO9TRLlLJ9SY19FCWfp1AU+Kc89CLj87Je/4kbi0IUBYjA==
X-Received: by 2002:a05:600c:19cd:b0:434:a07d:b709 with SMTP id
 5b1f17b1804b1-4361c441bcdmr23125885e9.29.1733931899575; 
 Wed, 11 Dec 2024 07:44:59 -0800 (PST)
Received: from [10.5.90.20]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4361968eed5sm42408485e9.42.2024.12.11.07.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 07:44:59 -0800 (PST)
Message-ID: <382abf3e-02a0-4900-8ab0-3f48f01602b7@smile.fr>
Date: Wed, 11 Dec 2024 16:44:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
Cc: Alexey Brodkin <alexey.brodkin@synopsys.com>
References: <20241206030420.246832-1-fancp2007@gmail.com>
 <20241206030420.246832-2-fancp2007@gmail.com>
Content-Language: fr
In-Reply-To: <20241206030420.246832-2-fancp2007@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1733931899; x=1734536699; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aaEIi1o8IHsa4q6DrfjslFAUgaWFcWpL4qXNCjIAYpY=;
 b=jqXy+R42+UT9jgq9xG34PFpAnDt2/Gz4Mqkq2CKgYl/sIIuw7xwx6/SljmiToRxFy0
 Rt8tpAZXFeUDx50zyHHtUudYAdJQSqeffI1rSu7LZmppl7qqkUA6rFBbVwCq0kEJTTjv
 NSqT3lMYz7UXEHPVn6CYUQH1nJdkRbJr7Lm/8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=jqXy+R42
Subject: Re: [Buildroot] [PATCH v3 2/2] configs/cubieboard2: switch to use
 extlinux.conf
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

SGVsbG8gU2NvdHQsIEFsbCwKCkxlIDA2LzEyLzIwMjQgw6AgMDQ6MDQsIFNjb3R0IEZhbiBhIMOp
Y3JpdMKgOgo+IFN3aXRjaCB0byBleHRsaW51eCBpbnN0ZWFkIG9mIFUtQm9vdCBib290IHNjcmlw
dC4KPiBSZW1vdmUgb2Jzb2xldGUgZW50cnkgZnJvbSB0aGUgLmNoZWNrcGFja2FnZWlnbm9yZSBm
aWxlLgo+IERyb3AgY3VzdG9tIGJvb3Qgc2NyaXB0IGFuZCBnZW5pbWFnZSBjb25maWcuCj4gRHJv
cCB1bm5lY2Vzc2FyeSBnZW5lcmljIGFuZCBob3N0IGNvbmZpZ3MuCgpUaGlzIGxhc3QgY2hhbmdl
IGlzIG5vdCByZWxhdGVkIHRvIHRoZSBzd2l0Y2ggdG8gZXh0bGludXguY29uZiBhbmQgY291bGQg
aGF2ZQpiZWVuIGRvbmUgaW4gYSBmb2xsb3d1cCBjb21taXQuCgpBcHBsaWVkIHRvIG1hc3Rlciwg
dGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNjb3R0
IEZhbiA8ZmFuY3AyMDA3QGdtYWlsLmNvbT4KPiAKPiAtLS0KPiBDaGFuZ2VzIHYxIC0+IHYyOgo+
ICAgLSBkcm9wIHVubmVjZXNzYXJ5IGxpbmUgaW4gdGhlIGV4dGxpbnV4LmNvbmYgZmlsZQo+ICAg
LSB1c2UgbG93ZXJjYXNlIGxhYmVsLCBrZXJuZWwsIGRldmljZXRyZWUgYW5kIGFwcGVuZCBrZXl3
b3Jkcwo+IC0tLQo+ICAuY2hlY2twYWNrYWdlaWdub3JlICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMSAtCj4gIGJvYXJkL2N1YmlldGVjaC9jdWJpZWJvYXJkMi9ib290LmNtZCAgICAgICAg
ICB8ICA1IC0tLS0tCj4gIGJvYXJkL2N1YmlldGVjaC9jdWJpZWJvYXJkMi9nZW5pbWFnZS5jZmcg
ICAgICB8IDIyIC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgYm9hcmQvY3ViaWV0ZWNoL2N1YmllYm9h
cmQyL3Bvc3QtaW1hZ2Uuc2ggICAgIHwgMTYgLS0tLS0tLS0tLS0tLS0KPiAgLi4uL2Jvb3QvZXh0
bGludXgvZXh0bGludXguY29uZiAgICAgICAgICAgICAgIHwgIDQgKysrKwo+ICBjb25maWdzL2N1
YmllYm9hcmQyX2RlZmNvbmZpZyAgICAgICAgICAgICAgICAgfCAxMyArKysrLS0tLS0tLQo+ICA2
IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNTMgZGVsZXRpb25zKC0pCj4gIGRlbGV0
ZSBtb2RlIDEwMDY0NCBib2FyZC9jdWJpZXRlY2gvY3ViaWVib2FyZDIvYm9vdC5jbWQKPiAgZGVs
ZXRlIG1vZGUgMTAwNzU1IGJvYXJkL2N1YmlldGVjaC9jdWJpZWJvYXJkMi9wb3N0LWltYWdlLnNo
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9jdWJpZXRlY2gvY3ViaWVib2FyZDIvcm9vdGZz
X292ZXJsYXkvYm9vdC9leHRsaW51eC9leHRsaW51eC5jb25mCj4gCj4gZGlmZiAtLWdpdCBhLy5j
aGVja3BhY2thZ2VpZ25vcmUgYi8uY2hlY2twYWNrYWdlaWdub3JlCj4gaW5kZXggN2ZlMTk0NGFl
Ni4uOGI2ZTI1NzZjNSAxMDA2NDQKPiAtLS0gYS8uY2hlY2twYWNrYWdlaWdub3JlCj4gKysrIGIv
LmNoZWNrcGFja2FnZWlnbm9yZQo+IEBAIC0yNSw3ICsyNSw2IEBAIGJvYXJkL2Nocm9tZWJvb2sv
ZWxtL3NpZ24uc2ggU2hlbGxjaGVjawo+ICBib2FyZC9jaHJvbWVib29rL21rc2Quc2ggU2hlbGxj
aGVjawo+ICBib2FyZC9jaHJvbWVib29rL3Nub3cvc2lnbi5zaCBTaGVsbGNoZWNrCj4gIGJvYXJk
L2NpMjAvcGF0Y2hlcy91Ym9vdC8wMDAxLW1pcHMtUmVtb3ZlLWRlZmF1bHQtZW5kaWFubmVzLnBh
dGNoIGxpYl9wYXRjaC5VcHN0cmVhbQo+IC1ib2FyZC9jdWJpZXRlY2gvY3ViaWVib2FyZDIvcG9z
dC1pbWFnZS5zaCBTaGVsbGNoZWNrCj4gIGJvYXJkL2ZyZWVzY2FsZS9jb21tb24vaW14L2lteDgt
Ym9vdGxvYWRlci1wcmVwYXJlLnNoIFNoZWxsY2hlY2sKPiAgYm9hcmQvZnJlZXNjYWxlL2NvbW1v
bi9teHMvcG9zdC1pbWFnZS5zaCBTaGVsbGNoZWNrCj4gIGJvYXJkL2ZyaWVuZGx5YXJtL25hbm9w
aS1yMnMvcG9zdC1idWlsZC5zaCBTaGVsbGNoZWNrCj4gZGlmZiAtLWdpdCBhL2JvYXJkL2N1Ymll
dGVjaC9jdWJpZWJvYXJkMi9ib290LmNtZCBiL2JvYXJkL2N1YmlldGVjaC9jdWJpZWJvYXJkMi9i
b290LmNtZAo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IGE5YWUwZTI0ZTYuLjAw
MDAwMDAwMDAKPiAtLS0gYS9ib2FyZC9jdWJpZXRlY2gvY3ViaWVib2FyZDIvYm9vdC5jbWQKPiAr
KysgL2Rldi9udWxsCj4gQEAgLTEsNSArMCwwIEBACj4gLXNldGVudiBmZHRfaGlnaCBmZmZmZmZm
Zgo+IC1zZXRlbnYgYm9vdGFyZ3MgY29uc29sZT10dHlTMCwxMTUyMDAgZWFybHlwcmludGsgcm9v
dD0vZGV2L21tY2JsazBwMiByb290d2FpdAo+IC1mYXRsb2FkIG1tYyAwICRrZXJuZWxfYWRkcl9y
IHpJbWFnZQo+IC1mYXRsb2FkIG1tYyAwICRmZHRfYWRkcl9yIHN1bjdpLWEyMC1jdWJpZWJvYXJk
Mi5kdGIKPiAtYm9vdHogJGtlcm5lbF9hZGRyX3IgLSAkZmR0X2FkZHJfcgo+IGRpZmYgLS1naXQg
YS9ib2FyZC9jdWJpZXRlY2gvY3ViaWVib2FyZDIvZ2VuaW1hZ2UuY2ZnIGIvYm9hcmQvY3ViaWV0
ZWNoL2N1YmllYm9hcmQyL2dlbmltYWdlLmNmZwo+IGluZGV4IGY4YThlYzA1YzguLjkyYzg2Nzc1
NDUgMTAwNjQ0Cj4gLS0tIGEvYm9hcmQvY3ViaWV0ZWNoL2N1YmllYm9hcmQyL2dlbmltYWdlLmNm
Zwo+ICsrKyBiL2JvYXJkL2N1YmlldGVjaC9jdWJpZWJvYXJkMi9nZW5pbWFnZS5jZmcKPiBAQCAt
MSwxOCArMSwzIEBACj4gLSMgTWluaW1hbCBTRCBjYXJkIGltYWdlIGZvciB0aGUgQ3ViaWVib2Fy
ZDIKPiAtIyBCYXNlZCBpbiB0aGUgT3JhbmdlIFBpIGdlbmltYWdlLmNmZwo+IC0KPiAtaW1hZ2Ug
Ym9vdC52ZmF0IHsKPiAtCXZmYXQgewo+IC0JCWZpbGVzID0gewo+IC0JCQkiekltYWdlIiwKPiAt
CQkJInN1bjdpLWEyMC1jdWJpZWJvYXJkMi5kdGIiLAo+IC0JCQkiYm9vdC5zY3IiCj4gLQkJfQo+
IC0JfQo+IC0KPiAtCXNpemUgPSAxNk0KPiAtfQo+IC0KPiAgaW1hZ2Ugc2RjYXJkLmltZyB7Cj4g
IAloZGltYWdlIHsKPiAgCX0KPiBAQCAtMjQsMTUgKzksOCBAQCBpbWFnZSBzZGNhcmQuaW1nIHsK
PiAgCQlzaXplID0gMTAxNksgIyAxTUIgLSA4S0IKPiAgCX0KPiAgCj4gLQlwYXJ0aXRpb24gYm9v
dCB7Cj4gLQkJcGFydGl0aW9uLXR5cGUgPSAweEMKPiAtCQlib290YWJsZSA9ICJ0cnVlIgo+IC0J
CWltYWdlID0gImJvb3QudmZhdCIKPiAtCX0KPiAtCj4gIAlwYXJ0aXRpb24gcm9vdGZzIHsKPiAg
CQlwYXJ0aXRpb24tdHlwZSA9IDB4ODMKPiAgCQlpbWFnZSA9ICJyb290ZnMuZXh0NCIKPiAtCQlz
aXplID0gNTEyTQo+ICAJfQo+ICB9Cj4gZGlmZiAtLWdpdCBhL2JvYXJkL2N1YmlldGVjaC9jdWJp
ZWJvYXJkMi9wb3N0LWltYWdlLnNoIGIvYm9hcmQvY3ViaWV0ZWNoL2N1YmllYm9hcmQyL3Bvc3Qt
aW1hZ2Uuc2gKPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA3NTUKPiBpbmRleCA5Y2NhMWIxNzg5Li4w
MDAwMDAwMDAwCj4gLS0tIGEvYm9hcmQvY3ViaWV0ZWNoL2N1YmllYm9hcmQyL3Bvc3QtaW1hZ2Uu
c2gKPiArKysgL2Rldi9udWxsCj4gQEAgLTEsMTYgKzAsMCBAQAo+IC0jIS9iaW4vc2gKPiAtCj4g
LUJPQVJEX0RJUj0iJChkaXJuYW1lICQwKSIKPiAtR0VOSU1BR0VfQ0ZHPSIke0JPQVJEX0RJUn0v
Z2VuaW1hZ2UuY2ZnIgo+IC1HRU5JTUFHRV9UTVA9IiR7QlVJTERfRElSfS9nZW5pbWFnZS50bXAi
Cj4gLQo+IC1ybSAtcmYgIiR7R0VOSU1BR0VfVE1QfSIKPiAtCj4gLWdlbmltYWdlICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+IC0JLS1yb290cGF0aCAiJHtUQVJHRVRfRElSfSIgICAgIFwK
PiAtCS0tdG1wcGF0aCAiJHtHRU5JTUFHRV9UTVB9IiAgICBcCj4gLQktLWlucHV0cGF0aCAiJHtC
SU5BUklFU19ESVJ9IiAgXAo+IC0JLS1vdXRwdXRwYXRoICIke0JJTkFSSUVTX0RJUn0iIFwKPiAt
CS0tY29uZmlnICIke0dFTklNQUdFX0NGR30iCj4gLQo+IC1leGl0ICQ/Cj4gZGlmZiAtLWdpdCBh
L2JvYXJkL2N1YmlldGVjaC9jdWJpZWJvYXJkMi9yb290ZnNfb3ZlcmxheS9ib290L2V4dGxpbnV4
L2V4dGxpbnV4LmNvbmYgYi9ib2FyZC9jdWJpZXRlY2gvY3ViaWVib2FyZDIvcm9vdGZzX292ZXJs
YXkvYm9vdC9leHRsaW51eC9leHRsaW51eC5jb25mCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwLi4xNGM4NzNlMTY3Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2JvYXJk
L2N1YmlldGVjaC9jdWJpZWJvYXJkMi9yb290ZnNfb3ZlcmxheS9ib290L2V4dGxpbnV4L2V4dGxp
bnV4LmNvbmYKPiBAQCAtMCwwICsxLDQgQEAKPiArbGFiZWwgY3ViaWVib2FyZC1idWlsZHJvb3QK
PiArICBrZXJuZWwgL2Jvb3QvekltYWdlCj4gKyAgZGV2aWNldHJlZSAvYm9vdC9zdW43aS1hMjAt
Y3ViaWVib2FyZDIuZHRiCj4gKyAgYXBwZW5kIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGVhcmx5cHJp
bnRrIHJvb3Q9L2Rldi9tbWNibGswcDEgcm9vdHdhaXQKPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9j
dWJpZWJvYXJkMl9kZWZjb25maWcgYi9jb25maWdzL2N1YmllYm9hcmQyX2RlZmNvbmZpZwo+IGlu
ZGV4IDQyMzQ0ZWFmOWUuLjljMGU1MWIzN2QgMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy9jdWJpZWJv
YXJkMl9kZWZjb25maWcKPiArKysgYi9jb25maWdzL2N1YmllYm9hcmQyX2RlZmNvbmZpZwo+IEBA
IC00LDE2ICs0LDE2IEBAIEJSMl9BUk1fRlBVX05FT05fVkZQVjQ9eQo+ICBCUjJfUEFDS0FHRV9I
T1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfMTE9eQo+ICBCUjJfR0xPQkFMX1BBVENIX0RJUj0i
Ym9hcmQvY3ViaWV0ZWNoL2N1YmllYm9hcmQyL3BhdGNoZXMiCj4gIEJSMl9ET1dOTE9BRF9GT1JD
RV9DSEVDS19IQVNIRVM9eQo+IC1CUjJfVEFSR0VUX0dFTkVSSUNfSE9TVE5BTUU9IkN1YmllYm9h
cmQyIgo+IC1CUjJfVEFSR0VUX0dFTkVSSUNfSVNTVUU9IldlbGNvbWUgdG8gQ3ViaWVib2FyZDIh
Igo+IC1CUjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9SVD0idHR5UzAiCj4gLUJSMl9ST09URlNf
UE9TVF9JTUFHRV9TQ1JJUFQ9ImJvYXJkL2N1YmlldGVjaC9jdWJpZWJvYXJkMi9wb3N0LWltYWdl
LnNoIgo+ICtCUjJfUk9PVEZTX09WRVJMQVk9ImJvYXJkL2N1YmlldGVjaC9jdWJpZWJvYXJkMi9y
b290ZnNfb3ZlcmxheSIKPiArQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0ic3VwcG9ydC9z
Y3JpcHRzL2dlbmltYWdlLnNoIgo+ICtCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9Ii1jIGJv
YXJkL2N1YmlldGVjaC9jdWJpZWJvYXJkMi9nZW5pbWFnZS5jZmciCj4gIEJSMl9MSU5VWF9LRVJO
RUw9eQo+ICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKPiAgQlIyX0xJTlVYX0tF
Uk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4xMS4xMSIKPiAgQlIyX0xJTlVYX0tFUk5FTF9E
RUZDT05GSUc9Im11bHRpX3Y3Igo+ICBCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKPiAg
QlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9ImFsbHdpbm5lci9zdW43aS1hMjAtY3Vi
aWVib2FyZDIiCj4gK0JSMl9MSU5VWF9LRVJORUxfSU5TVEFMTF9UQVJHRVQ9eQo+ICBCUjJfVEFS
R0VUX1JPT1RGU19FWFQyPXkKPiAgQlIyX1RBUkdFVF9ST09URlNfRVhUMl80PXkKPiAgQlIyX1RB
UkdFVF9VQk9PVD15Cj4gQEAgLTI2LDkgKzI2LDQgQEAgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19Q
WUxJQkZEVD15Cj4gIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfT1BFTlNTTD15Cj4gIEJSMl9UQVJH
RVRfVUJPT1RfU1BMPXkKPiAgQlIyX1RBUkdFVF9VQk9PVF9TUExfTkFNRT0idS1ib290LXN1bnhp
LXdpdGgtc3BsLmJpbiIKPiAtQlIyX1BBQ0tBR0VfSE9TVF9ET1NGU1RPT0xTPXkKPiAgQlIyX1BB
Q0tBR0VfSE9TVF9HRU5JTUFHRT15Cj4gLUJSMl9QQUNLQUdFX0hPU1RfTVRPT0xTPXkKPiAtQlIy
X1BBQ0tBR0VfSE9TVF9VQk9PVF9UT09MUz15Cj4gLUJSMl9QQUNLQUdFX0hPU1RfVUJPT1RfVE9P
TFNfQk9PVF9TQ1JJUFQ9eQo+IC1CUjJfUEFDS0FHRV9IT1NUX1VCT09UX1RPT0xTX0JPT1RfU0NS
SVBUX1NPVVJDRT0iYm9hcmQvY3ViaWV0ZWNoL2N1YmllYm9hcmQyL2Jvb3QuY21kIgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
