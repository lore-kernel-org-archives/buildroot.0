Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A307BC19F4F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 21:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48E2D400D2;
	Tue, 30 Apr 2024 21:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2nlKtWoEH5-5; Tue, 30 Apr 2024 21:54:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 397E14156F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 397E14156F;
	Tue, 30 Apr 2024 21:54:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4AA421BF3EB
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 21:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35564812B9
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 21:54:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sa-ZwiKKhuST for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 21:54:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE6A7812AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE6A7812AF
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE6A7812AF
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 21:54:18 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-418e4cd2196so48967835e9.1
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 14:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714514056; x=1715118856;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1Gxw8DSFA/R+SHDDYWRS16tF3t91KZQvAL+K2+5AjGE=;
 b=kq2KJs5VkFOlWQYyI6lF3ADS585hX7d89s1aNbmXvw0C6UyL/NK9BZORBJ8D0hFC/c
 6s8R1FCRmbVNjzZD6/zYKiqEN0ewXD+W4PqvRTcgIlKqnG9Yse0NSxJE0R2Iaf7KVROB
 9LRnyMHv66Ie/bi+v6qvtU1FDDO7lfFX9sqE736Se6kKMsSpOh5FiFHXL99nJpihW5O9
 UAzAWEgyg71PcnpKoxRQ+5DjwvkxgWibv6GJzXRgiNg34SirZagjabf+qqNxpaGEy+ad
 DaCQf28fc538YMndTE1eNgXyAbF7ssfMKYBOw8PKcmhdPI5rox8r6UAwuEzQ61FVr94m
 yj+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjDHmdLChxYxq7jPz1HOjLOBuwB+Q3HrOKH/V9I5IKJPB/7K8W16J3ojvMsKFyn5pKBiqHajON1RxC1XrP2zzYqo6TljkGAg==
X-Gm-Message-State: AOJu0Ywf/RML3BvBoP0lgAMAssgtppGouXE7AYuo2hZAFPR6JRN6RKvm
 o0dpxQ1IMX3T8vy3ZRj/jxgnHcPjARxKKfrLd23x5Z2GDMKRA+CxeNqS20LAfh4=
X-Google-Smtp-Source: AGHT+IGwDAkbyegXLwMrlp0KKFX2vK8VvfpRx6id30CQc5zTAd5O0JxGRIGbb1zJIJ3NoFh8e6+aOA==
X-Received: by 2002:a5d:474e:0:b0:34a:cc2:1a34 with SMTP id
 o14-20020a5d474e000000b0034a0cc21a34mr502304wrs.42.1714514056146; 
 Tue, 30 Apr 2024 14:54:16 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a056000195200b003462fec9f5asm32870751wry.62.2024.04.30.14.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 14:54:15 -0700 (PDT)
Message-ID: <1a2d6700-e47a-48bd-a4bb-6c8f28e32178@smile.fr>
Date: Tue, 30 Apr 2024 23:54:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240415193522.7719-1-ju.o@free.fr>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240415193522.7719-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714514056; x=1715118856;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1Gxw8DSFA/R+SHDDYWRS16tF3t91KZQvAL+K2+5AjGE=;
 b=gHnAKB8MIb47oQx3Htj49jYwtBp2zZCyTfZgDR/vmCswTe6sUTY2X/nyBb0ABSZF6K
 fuElPiJ0Pbv1LzisB4Bq4WUTZULVxn+t8AYC//IglVqUdQ6DXMvL3lhzxnVHukclfhxl
 0tF/r4fbv9OUCUK02XageITP3ve5XI8DGb5lW44qOJ9BQpGC7YVvv9zOhu5dIh+wuCy3
 KQ51XQF5FUaaTpJKAQTCqH4rsC3MSk9K/EnSwpPZiTuW9EE/90MICVSjQgbx1cpe2TqL
 KpnZF4BgoycrsgUoP9xc+3FCcyWnYim9nlf12dZ3Onw3m0xg7bzAO1J168+mVaqOJtp+
 I01g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=gHnAKB8M
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: fs: f2fs: bump test
 Kernel to 6.6.27
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLAoKTGUgMTUvMDQvMjAyNCDDoCAyMTozNSwgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBTaW5jZSB0aGUgdG9vbGNoYWluIEJvb3RsaW4gdXBkYXRlIHRvIDIwMjMuMTEt
MSBbMV0sIHRoZSBhcm0gTGludXgKPiBrZXJuZWwgYnVpbGQgaXMgYnJva2VuIHdpdGggYmludXRp
bHMgPj0gMi40MSB3aXRoOgo+IAo+ICAgICBhcmNoL2FybS9tbS9wcm9jLXY3LlM6IEFzc2VtYmxl
ciBtZXNzYWdlczoKPiAgICAgYXJjaC9hcm0vbW0vcHJvYy12Ny5TOjY0MDogRXJyb3I6IGp1bmsg
YXQgZW5kIG9mIGxpbmUsIGZpcnN0IHVucmVjb2duaXplZCBjaGFyYWN0ZXIgaXMgJyMnCj4gCj4g
VGhpcyBjb21taXQgZml4ZXMgdGhlIGlzc3VlIGJ5IGJ1bXBpbmcgdGhlIHRlc3QgS2VybmVsIHZl
cnNpb24gdG8gdGhlCj4gbGF0ZXN0IExUUyB2ZXJzaW9uIDYuNi4yNy4gV2UgYnVtcCB0byB0aGUg
Ni42Lnggc2VyaWVzIHRvIHJlZnJlc2ggdGhlCj4gdGVzdCwgYXMgdGhlIDQuMTkueCBzZXJpZXMg
aXMgcGxhbm5lZCB0byBiZSBlbmQtb2YtbGlmZSBzb29uLCBpbgo+IERlY2VtYmVyIDIwMjQuCj4g
Cj4gRml4ZXM6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0v
am9icy82NjIzNDAxNDQ3Cj4gCj4gWzFdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3Jn
L2J1aWxkcm9vdC8tL2NvbW1pdC83ZTBlNmUzYjg2MThhYjk0MmYyNWIxMWVlNzJmYmM1YTRkZWVm
ZGYxCgpJIG1pc3NlZCB5b3UgcGF0Y2ggYW5kIG1lcmdlZCBhbG1vc3QgdGhlIHNhbWUgb25lIFsx
XS4gU29ycnkgZm9yIHRoYXQuCgpIb3dldmVyIEkgY291bGQgc3RpbGwgYXBwbHkgeW91ciBwYXRj
aCBhZnRlciByZWJhc2luZyBpdCBvbiB0b3Agb2YgbWFzdGVyIHRvCmJlbmVmaXQgZnJvbSB0aGUg
a2VybmVsIHZlcnNpb24gYnVtcC4KClsxXQpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9y
Zy9idWlsZHJvb3QvLS9jb21taXQvN2UxMjZiZDM4ZDVlZWRiNDljZDI5Njk5YzFhZmU4YjUzZWRk
NzFlMAoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBP
bGl2YWluIDxqdS5vQGZyZWUuZnI+Cj4gLS0tCj4gIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9mcy90
ZXN0X2YyZnMucHkgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvZnMvdGVz
dF9mMmZzLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2ZzL3Rlc3RfZjJmcy5weQo+IGluZGV4
IDQyNWZiZTMxY2FjLi41OTE4ZmU4Y2E4YyAxMDA2NDQKPiAtLS0gYS9zdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvZnMvdGVzdF9mMmZzLnB5Cj4gKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2ZzL3Rl
c3RfZjJmcy5weQo+IEBAIC0yMCw3ICsyMCw3IEBAIGNsYXNzIFRlc3RGMkZTKGluZnJhLmJhc2V0
ZXN0LkJSVGVzdCk6Cj4gICAgICAgICAgIyBCUjJfVEFSR0VUX1JPT1RGU19UQVIgaXMgbm90IHNl
dAo+ICAgICAgICAgIEJSMl9MSU5VWF9LRVJORUw9eQo+ICAgICAgICAgIEJSMl9MSU5VWF9LRVJO
RUxfQ1VTVE9NX1ZFUlNJT049eQo+IC0gICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZF
UlNJT05fVkFMVUU9IjQuMTkuMjA0Igo+ICsgICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9N
X1ZFUlNJT05fVkFMVUU9IjYuNi4yNyIKPiAgICAgICAgICBCUjJfTElOVVhfS0VSTkVMX1VTRV9E
RUZDT05GSUc9eQo+ICAgICAgICAgIEJSMl9MSU5VWF9LRVJORUxfREVGQ09ORklHPSJ2ZXhwcmVz
cyIKPiAgICAgICAgICBCUjJfTElOVVhfS0VSTkVMX0NPTkZJR19GUkFHTUVOVF9GSUxFUz0ie30i
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
