Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8650C433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 19:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83FA884291;
	Wed, 18 May 2022 19:40:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zQsRsE53TXWC; Wed, 18 May 2022 19:40:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E60A8428F;
	Wed, 18 May 2022 19:40:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C0FBD1BF427
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B035D41C96
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:40:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I4NWxHXuAH0S for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 19:40:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 78162408A7
 for <buildroot@buildroot.org>; Wed, 18 May 2022 19:40:22 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id u27so3243316wru.8
 for <buildroot@buildroot.org>; Wed, 18 May 2022 12:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4MwKGsTlhSVuW8AZzq9SfCZInuTf8P3dO6fEddixYAc=;
 b=LAJIW5kVDnKPzyyFjrg0HHhO3C2oIN8MEbQnCgXONo0GsgPi4ysDEHc53ArkT0dfyd
 Ah5QUbOktINdtXPmSH/oan8KQsIavrpdGZQ95PhjxWWZ9eiZtjV943qdobSx9lQ7s21M
 OEDG1D2qsjZf7wF079Z0fqHXOVh3o46XTKrmZ/qw+N46Me/ipV7gN+pgaRAIWdU6whTQ
 TqkES0P15Gxc0XcjBo9TpmiJssUxiG5zii5KtM1RstYGa0VJ67QldVn2lO/T7BM3iFEu
 W1rmlrx7TZ7luBTsNSf83994+Osrpc4QML9rt7nUBmsy5BN8daMBJxYRJoAgUqUzz4yO
 031g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4MwKGsTlhSVuW8AZzq9SfCZInuTf8P3dO6fEddixYAc=;
 b=ITqjkMSg/M+RwLEVGqW90dJcOsyBAdBzXGmgT1SPYJVDa8xLqEU8xa8amxkscKGR3h
 JiHtDnOY4bzk5tvJjjOl96/fBCkylTgnuHOrOfwFZ7pA2dKf1rjpGXttg7RyHMJkhY6E
 QL7HV3UTcz2cf3C4mKSIK8iTuOFsw+552fNQRhSjr/cYrrcTmPD+Zek89tb/FAhhrue0
 JCwTv8trZwiYrljAE4T8ptqGK8ka7dGRL4AfHRpEFkqDOMbEnD0q0It0PW6tCV6snoTJ
 WfzTDeojq1LataW9msxlPtATpbVuQZNJOwT9hd8AU6+Hf5yoKwD45u/GP0yfaVZbr8us
 2okg==
X-Gm-Message-State: AOAM533p+8xbcwzgsaMndceB+K13ZZCLgKZdU9wAz4kk+LdQ4vE9Eb4e
 j3OoJjZceRrzmheP0XJPao0=
X-Google-Smtp-Source: ABdhPJyIzwl38Rwsjk+RCzDwdt2V5M+XOye0pcjLH2/JCaRa5qTlwSGgee07DzXdfkz7016KI/El9w==
X-Received: by 2002:a5d:4351:0:b0:20c:f52c:f869 with SMTP id
 u17-20020a5d4351000000b0020cf52cf869mr1046365wrr.516.1652902820620; 
 Wed, 18 May 2022 12:40:20 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 u20-20020adfa194000000b0020d02262664sm2900242wru.25.2022.05.18.12.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 12:40:19 -0700 (PDT)
Message-ID: <6f7604b9-aaf7-1afb-1c7d-51fdad013c00@gmail.com>
Date: Wed, 18 May 2022 21:40:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, buildroot@buildroot.org
References: <20220518044859.2901762-1-clg@kaod.org>
 <20220518044859.2901762-2-clg@kaod.org>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220518044859.2901762-2-clg@kaod.org>
Subject: Re: [Buildroot] [PATCH v2 2/2] configs/qemu_ppc64*: downgrade
 binutils to 2.36.1
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>, Joel Stanley <joel@jms.id.au>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAxOC8wNS8yMDIyIMOgIDA2OjQ4LCBDw6lkcmljIExlIEdvYXRlciBhIMOpY3Jp
dMKgOgo+IHBwYzY0IG9yIHBvd2VybnYgTGludXggZGVmY29uZmlnIGZhaWwgdG8gYnVpbGQgd2l0
aCBnY2MgMTEgYW5kL29yCj4gYmludXRpbHMgMi4zNyBbMV0gOgo+IAo+ICAgQ0MgICAgICBrZXJu
ZWwva2V4ZWNfZmlsZS5vCj4gICBDYW5ub3QgZmluZCBzeW1ib2wgZm9yIHNlY3Rpb24gMTA6IC50
ZXh0LnVubGlrZWx5Lgo+ICAga2VybmVsL2tleGVjX2ZpbGUubzogZmFpbGVkCj4gCj4gUGF0Y2hl
cyBoYXZlIGJlZW4gc2VudCB1cHN0cmVhbSBhbmQgc2hvdWxkIHJlYWNoIExpbnV4IDUuMTguIFVu
dGlsCj4gdGhlbiwgbGltaXQgYmludXRpbHMgdG8gMi4zNi4xIHdoaWNoIGRvZXNuJ3QgcmFpc2Ug
dGhlIGlzc3VlLgo+IAo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vbGludXhwcGMvaXNzdWVzL2lz
c3Vlcy8zODgKCkl0IGZpeGVzIHBwYzY0IGlzc3VlcyByZXBvcnRlZCBvbiAyMDIyLjA1LXJjMToK
Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL3BpcGVsaW5lcy81
NDE5MjExNzAvZmFpbHVyZXMKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBDYzogSm9lbCBT
dGFubGV5IDxqb2VsQGptcy5pZC5hdT4KPiBTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRl
ciA8Y2xnQGthb2Qub3JnPgo+IC0tLQo+IAo+ICBodHRwczovL2dpdGxhYi5jb20vbGVnb2F0ZXIv
YnVpbGRyb290Ly0vcGlwZWxpbmVzLzUzOTU1OTIwOQo+ICAKPiAgY29uZmlncy9xZW11X3BwYzY0
X2U1NTAwX2RlZmNvbmZpZyAgICAgIHwgMSArCj4gIGNvbmZpZ3MvcWVtdV9wcGM2NF9wc2VyaWVz
X2RlZmNvbmZpZyAgICB8IDEgKwo+ICBjb25maWdzL3FlbXVfcHBjNjRsZV9wb3dlcm52OF9kZWZj
b25maWcgfCAxICsKPiAgY29uZmlncy9xZW11X3BwYzY0bGVfcHNlcmllc19kZWZjb25maWcgIHwg
MSArCj4gIDQgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBh
L2NvbmZpZ3MvcWVtdV9wcGM2NF9lNTUwMF9kZWZjb25maWcgYi9jb25maWdzL3FlbXVfcHBjNjRf
ZTU1MDBfZGVmY29uZmlnCj4gaW5kZXggMDgyNWQwYWI5YjMwLi44NDU4ZjI3MzlhNjYgMTAwNjQ0
Cj4gLS0tIGEvY29uZmlncy9xZW11X3BwYzY0X2U1NTAwX2RlZmNvbmZpZwo+ICsrKyBiL2NvbmZp
Z3MvcWVtdV9wcGM2NF9lNTUwMF9kZWZjb25maWcKPiBAQCAtMyw2ICszLDcgQEAgQlIyX3Bvd2Vy
cGM2ND15Cj4gIEJSMl9wb3dlcnBjX2U1NTAwPXkKPiAgCj4gICMgU3lzdGVtCj4gK0JSMl9CSU5V
VElMU19WRVJTSU9OXzJfMzZfWD15Cj4gIEJSMl9TWVNURU1fREhDUD0iZXRoMCIKPiAgQlIyX1RB
UkdFVF9HRU5FUklDX0dFVFRZX1BPUlQ9InR0eVMwIgo+ICAKPiBkaWZmIC0tZ2l0IGEvY29uZmln
cy9xZW11X3BwYzY0X3BzZXJpZXNfZGVmY29uZmlnIGIvY29uZmlncy9xZW11X3BwYzY0X3BzZXJp
ZXNfZGVmY29uZmlnCj4gaW5kZXggYzQ1MDE0ZjJhYzNmLi40ODBlYmVhMjlkNzAgMTAwNjQ0Cj4g
LS0tIGEvY29uZmlncy9xZW11X3BwYzY0X3BzZXJpZXNfZGVmY29uZmlnCj4gKysrIGIvY29uZmln
cy9xZW11X3BwYzY0X3BzZXJpZXNfZGVmY29uZmlnCj4gQEAgLTMsNiArMyw3IEBAIEJSMl9wb3dl
cnBjNjQ9eQo+ICBCUjJfcG93ZXJwY19wb3dlcjc9eQo+ICAKPiAgIyBTeXN0ZW0KPiArQlIyX0JJ
TlVUSUxTX1ZFUlNJT05fMl8zNl9YPXkKPiAgQlIyX1NZU1RFTV9ESENQPSJldGgwIgo+ICBCUjJf
VEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9SVD0iaHZjMCIKPiAgCj4gZGlmZiAtLWdpdCBhL2NvbmZp
Z3MvcWVtdV9wcGM2NGxlX3Bvd2VybnY4X2RlZmNvbmZpZyBiL2NvbmZpZ3MvcWVtdV9wcGM2NGxl
X3Bvd2VybnY4X2RlZmNvbmZpZwo+IGluZGV4IDgyMjE0NWU5MjdhMS4uOGRlNGNmNTE4OWI1IDEw
MDY0NAo+IC0tLSBhL2NvbmZpZ3MvcWVtdV9wcGM2NGxlX3Bvd2VybnY4X2RlZmNvbmZpZwo+ICsr
KyBiL2NvbmZpZ3MvcWVtdV9wcGM2NGxlX3Bvd2VybnY4X2RlZmNvbmZpZwo+IEBAIC0zLDYgKzMs
NyBAQCBCUjJfcG93ZXJwYzY0bGU9eQo+ICBCUjJfcG93ZXJwY19wb3dlcjg9eQo+ICAKPiAgIyBT
eXN0ZW0KPiArQlIyX0JJTlVUSUxTX1ZFUlNJT05fMl8zNl9YPXkKPiAgQlIyX1RBUkdFVF9HRU5F
UklDX0dFVFRZX1BPUlQ9Imh2YzAiCj4gIEJSMl9TWVNURU1fREhDUD0iZXRoMCIKPiAgCj4gZGlm
ZiAtLWdpdCBhL2NvbmZpZ3MvcWVtdV9wcGM2NGxlX3BzZXJpZXNfZGVmY29uZmlnIGIvY29uZmln
cy9xZW11X3BwYzY0bGVfcHNlcmllc19kZWZjb25maWcKPiBpbmRleCA1ZWFhM2U5NTNmNzguLjk4
YzZhZmRmOTM5OSAxMDA2NDQKPiAtLS0gYS9jb25maWdzL3FlbXVfcHBjNjRsZV9wc2VyaWVzX2Rl
ZmNvbmZpZwo+ICsrKyBiL2NvbmZpZ3MvcWVtdV9wcGM2NGxlX3BzZXJpZXNfZGVmY29uZmlnCj4g
QEAgLTMsNiArMyw3IEBAIEJSMl9wb3dlcnBjNjRsZT15Cj4gIEJSMl9wb3dlcnBjX3Bvd2VyOD15
Cj4gIAo+ICAjIFN5c3RlbQo+ICtCUjJfQklOVVRJTFNfVkVSU0lPTl8yXzM2X1g9eQo+ICBCUjJf
VEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9SVD0iaHZjMCIKPiAgQlIyX1NZU1RFTV9ESENQPSJldGgw
Igo+ICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
