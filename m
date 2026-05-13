Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102DACD37AC
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 17:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9195B41A2F;
	Wed, 13 May 2026 17:13:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Ox3GB3B4K3x; Wed, 13 May 2026 17:13:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D95DF41A2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778692420;
	bh=6zuLLWh9vXIRRrlYUbhexk7/NaHk28hSOoMw4eX96zc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=M+oJBvYlMryEYtaqUcm1y4aBGpzfcenR3biaSxFZ4lJBFQPN5TyaGO0huoKuOygj1
	 urgmpeF7YBpMEazmfU0cAITd14AARP4tV3JlPO5+GHQhxc12ue6gFOBc1QsYA4v4FN
	 +MNk1wRpL1Ul6GYzLyL5eUUSIUPpyX7IF/0XBZIRpmj90ey4rxIplP+9l3xs2BWmaH
	 H10GxwUHQwMBv/UNRlXvaIrQu7hMMNbAKmT9Wf96UbVwemksw1Y6xs+kg3dArTRAVg
	 VEXCQjaEZdfY3wAKpmcHTAfpaLM6JRwXxtWkeu/QdEZxvx9bKBJtGpNW3Dr5C2GnM4
	 ymMkK1pofZTYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D95DF41A2E;
	Wed, 13 May 2026 17:13:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A72B270
 for <buildroot@buildroot.org>; Wed, 13 May 2026 17:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE8CD41A2E
 for <buildroot@buildroot.org>; Wed, 13 May 2026 17:13:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OKZ1psZXi-Cx for <buildroot@buildroot.org>;
 Wed, 13 May 2026 17:13:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 035BE41A2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 035BE41A2D
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 035BE41A2D
 for <buildroot@buildroot.org>; Wed, 13 May 2026 17:13:37 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48a563e4ef7so64591835e9.0
 for <buildroot@buildroot.org>; Wed, 13 May 2026 10:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778692415; x=1779297215;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GwDlDsTYWKQ/iZk+6fdc44hRPPXfLh+AR9iF7SWxRj0=;
 b=OqHklfSp6IAbABuzOpYQwEi0kU2q3/skEjQAJVwAuWxIu53Okje2X8yoO5QSYxu0Jm
 bNBdrSqALNyybD4hEbV6FuUQIYIYwbL582opMeGSaOkhFpgs8qhL9k+94amPvsvMm7Et
 fbaOa40MJrglmX8VaD8NuavgelxsmE9YhrpTcaMoS4mHBv+6XewjJHyltwL4YkimtQif
 1v1DdLAOuehUmPHZSYk52KRrvGfP/MwfrUPG6Tn/2027vqBxSSWg5Mbd5V2zAnUID9nE
 bm+L5CDMqbWiem14XAOD5OJmolchoFMzHKC9aPELvs3Nx/CPKcZuYCjHIXCUnBec5Xvc
 1D6g==
X-Forwarded-Encrypted: i=1;
 AFNElJ//SKyWd9/ZKQRmnZaRMhsMj5DmipDU1o3n8TklDLoUEPUhF+HGL6iAM+jKAH17MDRffBvIv5eMWL8=@buildroot.org
X-Gm-Message-State: AOJu0Yw3s6YMcEiEmlqZjOPzJDC+RD88LUlUySYIjfCb5XJjJwWW7JuP
 iSFxfcN2prXtO15dC5zBH7Ji3Jl44LrUCzcqZ0IPCDtKluZ1+BA1ic770+FgM4gv/rjFljn8Q5T
 t0NAmiKA=
X-Gm-Gg: Acq92OF0nsEejxKXbjquzl62tZqrrwo0Lt6XCNMMl+Qmo50wu7uFoy4kX+vL+1bktkT
 z8eYr/dD9CgVyU4lbtRp+qCoTElbea9V6ddJPzD2aP9+/JuVseP3pVE02n9MQJNzQt1rdY+1LGH
 bR/Yku63lZr8vZgM6I4N32hw46hqENqh00qqxQoycw17kG+X4Xe41LbA3+tucZkQWTWOgn985q7
 8ctuEU8sGPdLnPs3tgIy9HT+Gzfmq5PwvVzfNXZuemC8v5bNY+TmpMj+Wd0Zm9/7V2fRDVQA8zN
 g+YwXkohTKud0A23ovZb7NAuJPXeDj6F0v/9OiwjKIrhDE0z5OxFlSrHiaUSYA43H7DUtUpOlYv
 WSXJTLHZGpNeW1aY+IefghpPxf3NEsOV2ewJme8o9OmA1uzxazVHw4RfS7KISZpvTRU+YMJYwoP
 PzjbPkZE/6S9XGQsTdHK6XZbXPHbvhC+AEkvHbhHB5vmRCQCn3F9NjuwYEKlWbLK1kyYEAOgd/e
 r3zThtvtJZ2/9iRxBlvaWZakPNFTNCs4pefA/HBFrhTxtNHWAZk8fhYbVDk91rbng==
X-Received: by 2002:a05:600c:871b:b0:48a:75b9:b0bc with SMTP id
 5b1f17b1804b1-48fc9a5ed3amr61872095e9.29.1778692415405; 
 Wed, 13 May 2026 10:13:35 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fd62756e8sm3546995e9.0.2026.05.13.10.13.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 10:13:35 -0700 (PDT)
Message-ID: <079c18a5-cdcf-4b35-8f3c-f618c2c35b87@smile.fr>
Date: Wed, 13 May 2026 19:13:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>
References: <20260512-virglrenderer-v5-0-1806e588eb59@gmail.com>
 <20260512-virglrenderer-v5-4-1806e588eb59@gmail.com>
Content-Language: fr, en-US
In-Reply-To: <20260512-virglrenderer-v5-4-1806e588eb59@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778692415; x=1779297215; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GwDlDsTYWKQ/iZk+6fdc44hRPPXfLh+AR9iF7SWxRj0=;
 b=z9YmqSipOqusk4EuSE6nnmj5QKsopPdCUsFCBQobON26amH8vwS8UZdYtVH6arlPSn
 aQ/yLP2U+eEa2pq2iLG1X/G7ABbg+uKqHEdMTWTgk9XrD0cZgze4+M2lnmxl6UbDjA/e
 7DbWIb3fOIi8XKXYckMM04CDvUz19x73d+Ums=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=z9YmqSip
Subject: Re: [Buildroot] [PATCH RESEND v5 4/5] package/qemu: add OpenGL
 config
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

SGVsbG8gSm9zZXBoLCBBbGwsCgpMZSAxMi8wNS8yMDI2IMOgIDIxOjM2LCBKb3NlcGggS29ndXQg
YSDDqWNyaXTCoDoKPiBTaWduZWQtb2ZmLWJ5OiBKb3NlcGggS29ndXQgPGpvc2VwaC5rb2d1dEBn
bWFpbC5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvcWVtdS9Db25maWcuaW4gfCAxNCArKysrKysrKysr
KysrKwo+ICBwYWNrYWdlL3FlbXUvcWVtdS5tayAgIHwgIDggKysrKysrKy0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvcWVtdS9Db25maWcuaW4gYi9wYWNrYWdlL3FlbXUvQ29uZmlnLmluCj4gaW5kZXgg
ZTE2ZWFmZTQ0Ni4uZTRlOGViM2I2MyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3FlbXUvQ29uZmln
LmluCj4gKysrIGIvcGFja2FnZS9xZW11L0NvbmZpZy5pbgo+IEBAIC0xMTYsNiArMTE2LDIwIEBA
IGNvbmZpZyBCUjJfUEFDS0FHRV9RRU1VX1NETAo+ICAJICBTYXkgJ3knIHRvIGVuYWJsZSB0aGUg
U0RMIGZyb250ZW5kLCB0aGF0IGlzLCBhIGdyYXBoaWNhbAo+ICAJICB3aW5kb3cgcHJlc2VudGlu
ZyB0aGUgVk0ncyBkaXNwbGF5Lgo+ICAKPiArY29uZmlnIEJSMl9QQUNLQUdFX1FFTVVfT1BFTkdM
Cj4gKwlib29sICJFbmFibGUgT3BlbkdMIgo+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IQVNf
TElCRUdMIHx8IEJSMl9QQUNLQUdFX0hBU19MSUJHTCAjIGxpYmVwb3h5CgpXaXRoIHBhdGNoIDEv
NSByZW1vdmluZyBlZ2wgb3IgZ2wgZGVwZW5kZW5jaWVzIGluIGxpYmVwb3h5LCB0aGUgY29tbWVu
dCBhYm91dAp0aGlzIGVnbCBvciBnbCBkZXBlbmRlbmN5IGZvciB0aGUgUWVtdSBvcGVuZ2wgb3B0
aW9uIGlzIG5vIGxvbmdlciB0cnVlLgoKSXQncyB0aGUgUWVtdSBvcGVuZ2wgb3B0aW9uIGl0c2Vs
ZiB0aGF0IHJlcXVpcmUgZWdsIG9yIGdsLgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gKwlzZWxl
Y3QgQlIyX1BBQ0tBR0VfTElCRVBPWFkKPiArCWhlbHAKPiArCSAgU2F5ICd5JyB0byBlbmFibGUg
T3BlbkdMIGFjY2VsZXJhdGVkIGRpc3BsYXkgZnJvbnRlbmQgc3VwcG9ydC4KPiArCSAgVGhpcyBp
cyBuZWNlc3NhcnkgdG8gZWZmaWNpZW50bHkgZGlzcGxheSBmcmFtZXMgcmVuZGVyZWQgaW4gYQo+
ICsJICBndWVzdCBvbiB0aGUgaG9zdC4KPiArCj4gKwkgIFJ1biBxZW11IHdpdGggYC1kaXNwbGF5
IHNkbCxnbD1vbmAKPiArCj4gK2NvbW1lbnQgIk9wZW5HTCBzdXBwb3J0IG5lZWRzIGFuIE9wZW5H
TCBhbmQvb3IgT3BlbkdMIEVHTCBiYWNrZW5kIgo+ICsJZGVwZW5kcyBvbiAhKEJSMl9QQUNLQUdF
X0hBU19MSUJFR0wgfHwgQlIyX1BBQ0tBR0VfSEFTX0xJQkdMKQo+ICsKPiAgY29uZmlnIEJSMl9Q
QUNLQUdFX1FFTVVfRkRUCj4gIAlib29sICJFbmFibGUgRkRUIgo+ICAJc2VsZWN0IEJSMl9QQUNL
QUdFX0RUQwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3FlbXUvcWVtdS5tayBiL3BhY2thZ2UvcWVt
dS9xZW11Lm1rCj4gaW5kZXggOTdmOGUyMjA5MS4uOWI3ODA3OTdmYSAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL3FlbXUvcWVtdS5tawo+ICsrKyBiL3BhY2thZ2UvcWVtdS9xZW11Lm1rCj4gQEAgLTI3
NCw2ICsyNzQsMTMgQEAgZWxzZQo+ICBRRU1VX09QVFMgKz0gLS1kaXNhYmxlLXVzYi1yZWRpcgo+
ICBlbmRpZgo+ICAKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9RRU1VX09QRU5HTCkseSkKPiArUUVN
VV9PUFRTICs9IC0tZW5hYmxlLW9wZW5nbAo+ICtRRU1VX0RFUEVOREVOQ0lFUyArPSBsaWJlcG94
eQo+ICtlbHNlCj4gK1FFTVVfT1BUUyArPSAtLWRpc2FibGUtb3BlbmdsCj4gK2VuZGlmCj4gKwo+
ICBpZmVxICgkKEJSMl9TVEFUSUNfTElCUykseSkKPiAgUUVNVV9PUFRTICs9IC0tc3RhdGljCj4g
IGVuZGlmCj4gQEAgLTMzMCw3ICszMzcsNiBAQCBkZWZpbmUgUUVNVV9DT05GSUdVUkVfQ01EUwo+
ICAJCQktLWRpc2FibGUtbWVtYmFycmllciBcCj4gIAkJCS0tZGlzYWJsZS1tcGF0aCBcCj4gIAkJ
CS0tZGlzYWJsZS1uZXRtYXAgXAo+IC0JCQktLWRpc2FibGUtb3BlbmdsIFwKPiAgCQkJLS1kaXNh
YmxlLW9zcyBcCj4gIAkJCS0tZGlzYWJsZS1wYSBcCj4gIAkJCS0tZGlzYWJsZS1wbHVnaW5zIFwK
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
