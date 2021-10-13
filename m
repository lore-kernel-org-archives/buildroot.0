Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C7EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:10:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 703F9610C9
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 703F9610C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4202960B48;
	Wed, 13 Oct 2021 18:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YCc_7WkxVoCC; Wed, 13 Oct 2021 18:10:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 764B460BAE;
	Wed, 13 Oct 2021 18:10:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 420A21BF38C
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDF824021F
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:10:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id duGM0XFOUw1S for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 18:10:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 428D640155
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 18:10:01 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id y12so14187566eda.4
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 11:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/+1poIzfFNaTmk7DNmr+xDciQr0PK1yQdPwZTJr5FZU=;
 b=Yua9jQhI6KVlkq9qh8SqSW+MwXtcH5WQbvj2+NmXFdZ3pylZ96kQnn7ibvSRY0e/5d
 h1Kjw02Kgm0wFkoa2RAq+b30M93GUhRn/kyFZtJ2BanpE+XVeQb2W+Qb1iEeol045s8S
 K7wehDrIYupbBZhh/6VzBURv45rEhNrIG2lyvWgVpT9J4tXQ1ziJIHuFlKaZX30IW23H
 3kGPATUulR1oV5tX5A6zd1mWOQKis+vuqPwB0MoPDXSBtlAITpyoL5BFMYFcfHyQbVZR
 uidAYFYDM0k4v9GC2Pzy9X11jutOuQXur9+DJxZsMImsJTQdvVCgehIdR1Q/785ozsAC
 BhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/+1poIzfFNaTmk7DNmr+xDciQr0PK1yQdPwZTJr5FZU=;
 b=x4ch55ikM+GlVo1jaGPX+gHYgI7iaCPDHuWdbNF/Vel+WcaDFmL89hHuafybTQ0yK2
 XHze8emCqwwi4Qe+1v9cD4LdAqNva8P9Qf5pWPAOxXVXjir8E05npHRPj+nMxQsycBD0
 68RYY5LLBy/c1p/HQ2DGhqmShEm7uRQts+YtOpz9wasr5f7nNiQLc1zCkE2eFf6n3dng
 5RBHWVls4/uecG1g+sRWsRmQTlvaYyTVjBJzLrgHB/ydIFbu6d7Xih142QCoU+CkODyj
 Z61yaALbyWaFjWxBzb5+Z7KdVRZ/vPZcZXJTXs7lV9kTFTe2AQi7ABti/zUjR0aXZXPV
 ivHw==
X-Gm-Message-State: AOAM530nqaWJTMQErlOHOp6kdkOMcsjL5M8OhlA3jYeqVJSNaBA/yJ+Z
 /wFGn0ziMBwjHBseGj8iubzcftRF/ugk0hgz
X-Google-Smtp-Source: ABdhPJwbdYBDqaFfDwk3MKrbXn2khhICzqHUq3Yw9XgSyTqSsl07g1kf89ph7X5Pd+n0mwAGVU4ZqA==
X-Received: by 2002:a05:6402:42d1:: with SMTP id
 i17mr1243876edc.320.1634148599157; 
 Wed, 13 Oct 2021 11:09:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id jt24sm216311ejb.59.2021.10.13.11.09.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 11:09:58 -0700 (PDT)
Message-ID: <4382a5a2-c37f-be63-093a-a8d61c464627@mind.be>
Date: Wed, 13 Oct 2021 20:09:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Herve Codina <herve.codina@bootlin.com>, buildroot@buildroot.org
References: <20211004124316.355770-1-herve.codina@bootlin.com>
 <20211004124316.355770-2-herve.codina@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211004124316.355770-2-herve.codina@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/3] package/libdbi: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNC8xMC8yMDIxIDE0OjQzLCBIZXJ2ZSBDb2RpbmEgd3JvdGU6Cj4gbGliZGJpIGltcGxl
bWVudHMgYSBkYXRhYmFzZS1pbmRlcGVuZGVudCBhYnN0cmFjdGlvbiBsYXllciBpbiBDLAo+IHNp
bWlsYXIgdG8gdGhlIERCSS9EQkQgbGF5ZXIgaW4gUGVybC4KPiAKPiBodHRwOi8vbGliZGJpLnNv
dXJjZWZvcmdlLm5ldC8KPiAKPiBCYXNlZCBvbiBpbml0aWFsIHdvcmsgZnJvbSBOaWNvbGFzIENh
cnJpZXIgPG5pY29sYXMuY2FycmllckBvcm9saWEuY29tPgo+IAo+IFNpZ25lZC1vZmYtYnk6IEhl
cnZlIENvZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPgo+IC0tLQo+ICAgREVWRUxPUEVS
UyAgICAgICAgICAgICAgICAgfCAgNCArKysrCj4gICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAg
ICB8ICAxICsKPiAgIHBhY2thZ2UvbGliZGJpL0NvbmZpZy5pbiAgIHwgIDcgKysrKysrKwo+ICAg
cGFja2FnZS9saWJkYmkvbGliZGJpLmhhc2ggfCAgMyArKysKPiAgIHBhY2thZ2UvbGliZGJpL2xp
YmRiaS5tayAgIHwgMTUgKysrKysrKysrKysrKysrCj4gICA1IGZpbGVzIGNoYW5nZWQsIDMwIGlu
c2VydGlvbnMoKykKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYmRiaS9Db25maWcu
aW4KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYmRiaS9saWJkYmkuaGFzaAo+ICAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGliZGJpL2xpYmRiaS5tawo+IAo+IGRpZmYgLS1n
aXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+IGluZGV4IDFmOTc3MTkwYWIuLjMwYmYyOWZm
ZDYgMTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RFVkVMT1BFUlMKPiBAQCAtMTE0
OCw2ICsxMTQ4LDkgQEAgRjoJcGFja2FnZS9zeXNyZXBvLwo+ICAgTjoJSGVucmlxdWUgQ2FtYXJn
byA8aGVucmlxdWVAaGVucmlxdWVjYW1hcmdvLmNvbT4KPiAgIEY6CXBhY2thZ2UvanNvbi1nbGli
Lwo+ICAgCj4gK046CUhlcnbDqSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4KPiAr
RjoJcGFja2FnZS9saWJkYmkvCj4gKwo+ICAgTjoJSGlyb3NoaSBLYXdhc2hpbWEgPGtlaS1rQGNh
Mi5zby1uZXQubmUuanA+Cj4gICBGOglwYWNrYWdlL2dhdWNoZS8KPiAgIEY6CXBhY2thZ2UvZ21y
ZW5kZXItcmVzdXJyZWN0Lwo+IEBAIC0xOTgwLDYgKzE5ODMsNyBAQCBGOgljb25maWdzL2dhbGls
ZW9fZGVmY29uZmlnCj4gICAKPiAgIE46CU5pY29sYXMgQ2FycmllciA8bmljb2xhcy5jYXJyaWVy
QG9yb2xpYS5jb20+Cj4gICBGOglwYWNrYWdlL2JtYXAtdG9vbHMvCj4gK0Y6CXBhY2thZ2UvbGli
ZGJpLwo+ICAgRjoJcGFja2FnZS9waHAteGRlYnVnLwo+ICAgRjoJcGFja2FnZS9weXRob24tYXVn
ZWFzLwo+ICAgRjoJcGFja2FnZS9weXRob24tZmxhc2stZXhwZWN0cy1qc29uLwo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCj4gaW5kZXggMmY4M2M4
NzU4Mi4uMWIwN2VlZDVlMCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgo+ICsrKyBi
L3BhY2thZ2UvQ29uZmlnLmluCj4gQEAgLTE0MTQsNiArMTQxNCw3IEBAIG1lbnUgIkRhdGFiYXNl
Igo+ICAgCXNvdXJjZSAicGFja2FnZS9oaXJlZGlzL0NvbmZpZy5pbiIKPiAgIAlzb3VyY2UgInBh
Y2thZ2Uva29tcGV4c3FsaXRlL0NvbmZpZy5pbiIKPiAgIAlzb3VyY2UgInBhY2thZ2UvbGV2ZWxk
Yi9Db25maWcuaW4iCj4gKwlzb3VyY2UgInBhY2thZ2UvbGliZGJpL0NvbmZpZy5pbiIKPiAgIAlz
b3VyY2UgInBhY2thZ2UvbGliZ2l0Mi9Db25maWcuaW4iCj4gICAJc291cmNlICJwYWNrYWdlL2xp
Ym1kYngvQ29uZmlnLmluIgo+ICAgCXNvdXJjZSAicGFja2FnZS9saWJvZGIvQ29uZmlnLmluIgo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmRiaS9Db25maWcuaW4gYi9wYWNrYWdlL2xpYmRiaS9D
b25maWcuaW4KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmRlZDJi
YzZlNTMKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9saWJkYmkvQ29uZmlnLmluCj4g
QEAgLTAsMCArMSw3IEBACj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9MSUJEQkkKPiArCWJvb2wgImxp
ZGJpIgo+ICsJaGVscAo+ICsJICBsaWJkYmkgaW1wbGVtZW50cyBhIGRhdGFiYXNlLWluZGVwZW5k
ZW50IGFic3RyYWN0aW9uIGxheWVyCj4gKwkgIGluIEMsIHNpbWlsYXIgdG8gdGhlIERCSS9EQkQg
bGF5ZXIgaW4gUGVybC4KPiArCj4gKwkgIGh0dHA6Ly9saWJkYmkuc291cmNlZm9yZ2UubmV0Cj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliZGJpL2xpYmRiaS5oYXNoIGIvcGFja2FnZS9saWJkYmkv
bGliZGJpLmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjZi
ZWNlNjZiZWEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9saWJkYmkvbGliZGJpLmhh
c2gKPiBAQCAtMCwwICsxLDMgQEAKPiArIyBMb2NhbGx5IGNvbXB1dGVkOgo+ICtzaGEyNTYgOTU4
NDc1ZTAwMTBhM2Q4ZTQzY2U5ZWNkNmE2NGQyNWVhY2NhNmFkYTQ2YzM5YmM2OWY5NDlkZDcwZjky
YWI3YSAgbGliZGJpLTg4Yjg0NzdkNTcxNTNiOWY3MzZkZDE5ZDQzMmQzYjdhYjFjNDkwNzMtYnIx
LnRhci5nego+ICtzaGEyNTYgNWJiY2JiNzM3ZTYwZmU5ZGViYTA4ZWNiZDAwOTIwY2ZjYzM0MDNi
YTJlNTM0YzY0ZmRlZWE0OWQ2YmI4NzUwOSAgQ09QWUlORwoKICBDaGFuZ2VkIHRvIHR3byBzcGFj
ZXMuCgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmRiaS9saWJkYmkubWsgYi9wYWNrYWdlL2xp
YmRiaS9saWJkYmkubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAu
LjkyMDI1MDc3YmIKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9saWJkYmkvbGliZGJp
Lm1rCj4gQEAgLTAsMCArMSwxNSBAQAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4g
KyMgbGliZGJpCj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArCj4gK0xJQkRCSV9W
RVJTSU9OID0gODhiODQ3N2Q1NzE1M2I5ZjczNmRkMTlkNDMyZDNiN2FiMWM0OTA3Mwo+ICtMSUJE
QklfU0lURSA9IGh0dHBzOi8vZ2l0LmNvZGUuc2YubmV0L3AvbGliZGJpL2xpYmRiaQo+ICtMSUJE
QklfU0lURV9NRVRIT0QgPSBnaXQKPiArTElCREJJX0xJQ0VOU0UgPSBMR1BMLTIuMSsKPiArTElC
REJJX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCj4gK0xJQkRCSV9JTlNUQUxMX1NUQUdJTkcgPSBZ
RVMKPiArTElCREJJX0FVVE9SRUNPTkYgPSBZRVMKCiAgSSd2ZSBhZGRlZCBhIGNvbW1lbnQgYWJv
dmUgdG8gZXhwbGFpbiB3aHkgdGhpcyBpcyBuZWVkZWQuCgogIEFwcGxpZWQgdG8gbWFzdGVyIHdp
dGggdGhvc2UgdHdvIGZpeGVkLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+ICsKPiAr
JChldmFsICQoYXV0b3Rvb2xzLXBhY2thZ2UpKQo+IApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
