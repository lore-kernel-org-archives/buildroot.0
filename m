Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2083C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 14:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8532161003;
	Sat, 23 Jul 2022 14:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8532161003
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IqUYEEVrJn0P; Sat, 23 Jul 2022 14:07:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6153F60FF0;
	Sat, 23 Jul 2022 14:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6153F60FF0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C56F61BF85D
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACB6F403A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:07:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACB6F403A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vjhcXfBg1kDq for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 14:07:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5295A40143
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5295A40143
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:07:04 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id z13so9962571wro.13
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 07:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zyDobT9LG7qIjmRiqmYC5mmOPR/kgvxUa4UsgPUEM4c=;
 b=5RUmUfxElHlUpBsUbPfZ+7Wq9fRbnRkDZYV7ZrmiYB2MsmjFhbnBod4Ice6LC1kFMf
 ZhM36uarwZh5g+PnBMDec6UB5wn58Ah4AkST4bU8J4lP4VQ2jp1XqRhhMjEAOmRi55XN
 SgOpF+mDuh4vuwaSiIcbYCP8mI1Mi2KqFVeqQQMc6WsH19SPFqx/mGuGaHxOdu0M57oO
 QAKJCb8NT0zlYMfkvlx3OjA0dy8pavQXbRMKvIDWEjwSwXtT5WmWScHbl9lymS0hnK7C
 u5WyfgN9O1k4O6qweakAETdqRBOZrVPb6F/2rUtDh2NhmYHB48/dLQqb40rcpR66/ZRV
 orHg==
X-Gm-Message-State: AJIora9BVguDJcb8Vza1sQpSf4avQF80of6fWjApL4U7oBT7S172wx9d
 NbtCGNW3rwnd6sb5Z2gfSL54qg==
X-Google-Smtp-Source: AGRyM1tbo4NCzLeTOkp0LYamcGlk7J+OIvZZbqiSAyp/fCapRGGF1JDdzuOuBV0cjduImEutoJ29lA==
X-Received: by 2002:adf:fccf:0:b0:21e:4bb7:4c64 with SMTP id
 f15-20020adffccf000000b0021e4bb74c64mr2850099wrs.382.1658585222466; 
 Sat, 23 Jul 2022 07:07:02 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a5d6148000000b0021e46d518c7sm7071740wrt.106.2022.07.23.07.07.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 07:07:02 -0700 (PDT)
Message-ID: <8fc9a7e8-13eb-8771-5f48-6a21e9a6aefa@smile.fr>
Date: Sat, 23 Jul 2022 16:07:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Abel Bernabeu <abel@x-silicon.com>, buildroot@buildroot.org
References: <20220704085552.3499243-1-abel@x-silicon.com>
 <20220704085552.3499243-2-abel@x-silicon.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220704085552.3499243-2-abel@x-silicon.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zyDobT9LG7qIjmRiqmYC5mmOPR/kgvxUa4UsgPUEM4c=;
 b=0pLB7FAmhoDYa0nfr/JG332bsWhOnAlGY0+gZncSSisC4Yn5kebJli8sjXd6imuJcg
 S8aODxIZ4TG/pLQRoMZqiF/jLk11HphEsjCqjvKsvtH4o4r8cdAl5myYxmNpyKebTGDg
 ee/qgFPdVLsRi7Kv0k92bh4VVXGDyaj7Bj5kCijW6plOrFT/lhypDTWzRaEc8UiN30Ga
 YZlW7JOR0BoQFYc08EwsnpZe3Hfrmleqyy9VeDbFaLpDmIYytDs79u0OfHH8YaVRzHt1
 LHiKxAS9gXl6WLcf9jb79JGqdmXxxjupq9tORj0DGfYQYymYX8NFvbfNS037f/cokU0Y
 IiHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=0pLB7FAm
Subject: Re: [Buildroot] [PATCH 2/2] arch/riscv: Added support for RISC-V
 vector extension on the architecture menu.
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Mark Corbin <mark@dibsco.co.uk>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWRlbCwKCkxlIDA0LzA3LzIwMjIgw6AgMTA6NTUsIEFiZWwgQmVybmFiZXUgYSDDqWNy
aXTCoDoKPiBUaGlzIG5ldyBzZXR0aW5nIHdpbGwgYWxsb3cgdG8gdGVzdCBuZXcgdG9vbGNoYWlu
cyBhbHJlYWR5IGF2YWlsYWJsZQo+IHRoYXQgc3VwcG9ydCB0aGUgdmVjdG9yIGV4dGVuc2lvbiAo
bW9yZSBwYXRjaGVzIGNvbWluZyBzb29uKS4KCldlIHJlY2VpdmVkIGEgc2ltaWxhciBwYXRjaCBb
MV0gZnJvbSBhbm90aGVyIGNvbnRyaWJ1dG9yLgpBY3R1YWxseSB0aGlzIGlzIHRoZSBzYW1lIGNv
bnRlbnQgd2l0aCB0aGUgc2FtZSBtaXNzaW5nIGRlcGVuZGVuY3kgb24gZ2NjLTEyLgoKU2VlIGFs
c28gYSBjb21tZW50IFsyXToKCiJZZXMsIFYgZGVmaW5pdGVseSBuZWVkcyBhbiBvcHRpb24sIGFz
IHRoZXJlIHdpbGwgY2xlYXJseSBiZQpMaW51eC1jYXBhYmxlIFJJU0MtViBjb3JlcyB0aGF0IGRv
IG5vdCBpbXBsZW1lbnQgdGhlIFYgZXh0ZW5zaW9uLgoKVGhlIG9wdGlvbiBmb3IgdGhlIFYgZXh0
ZW5zaW9uIHdpbGwgaGF2ZSB0byBzZWxlY3QKQlIyX0FSQ0hfTkVFRFNfR0NDX0FUX0xFQVNUXzEy
LiIKClsxXSBodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvcGlwZXJtYWlsL2J1aWxkcm9vdC8yMDIy
LUp1bmUvNjQ1MzgxLmh0bWwKWzJdIGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9waXBlcm1haWwv
YnVpbGRyb290LzIwMjItSnVseS82NDY3MjQuaHRtbAoKU2VlIGhvdyB0byByZXZpZXcgcGF0Y2hl
czoKaHR0cHM6Ly9uaWdodGx5LmJ1aWxkcm9vdC5vcmcvbWFudWFsLmh0bWwjX3Jldmlld2luZ19h
bmRfdGVzdGluZ19wYXRjaGVzCgpJIGhhdmUgbWFya2VkIHRoaXMgcGF0Y2ggYXMgIkNoYW5nZXMg
UmVxdWVzdGVkIi4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFi
ZWwgQmVybmFiZXUgPGFiZWxAeC1zaWxpY29uLmNvbT4KPiAtLS0KPiAgYXJjaC9Db25maWcuaW4u
cmlzY3YgfCA3ICsrKysrKysKPiAgYXJjaC9hcmNoLm1rLnJpc2N2ICAgfCA0ICsrKysKPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvQ29u
ZmlnLmluLnJpc2N2IGIvYXJjaC9Db25maWcuaW4ucmlzY3YKPiBpbmRleCAyODhlZDgzM2ViLi5l
NGRjOTM2Y2Y4IDEwMDY0NAo+IC0tLSBhL2FyY2gvQ29uZmlnLmluLnJpc2N2Cj4gKysrIGIvYXJj
aC9Db25maWcuaW4ucmlzY3YKPiBAQCAtMTgsNiArMTgsOSBAQCBjb25maWcgQlIyX1JJU0NWX0lT
QV9SVkQKPiAgY29uZmlnIEJSMl9SSVNDVl9JU0FfUlZDCj4gIAlib29sCj4gIAo+ICtjb25maWcg
QlIyX1JJU0NWX0lTQV9SVlYKPiArCWJvb2wKPiArCj4gIGNob2ljZQo+ICAJcHJvbXB0ICJUYXJn
ZXQgQXJjaGl0ZWN0dXJlIFZhcmlhbnQiCj4gIAlkZWZhdWx0IEJSMl9yaXNjdl9nCj4gQEAgLTYz
LDYgKzY2LDEwIEBAIGNvbmZpZyBCUjJfUklTQ1ZfSVNBX0NVU1RPTV9SVkQKPiAgY29uZmlnIEJS
Ml9SSVNDVl9JU0FfQ1VTVE9NX1JWQwo+ICAJYm9vbCAiQ29tcHJlc3NlZCBJbnN0cnVjdGlvbnMg
KEMpIgo+ICAJc2VsZWN0IEJSMl9SSVNDVl9JU0FfUlZDCj4gKwo+ICtjb25maWcgQlIyX1JJU0NW
X0lTQV9DVVNUT01fUlZWCj4gKwlib29sICJWZWN0b3IgSW5zdHJ1Y3Rpb25zIChWKSIKPiArCXNl
bGVjdCBCUjJfUklTQ1ZfSVNBX1JWVgo+ICBlbmRpZgo+ICAKPiAgY2hvaWNlCj4gZGlmZiAtLWdp
dCBhL2FyY2gvYXJjaC5tay5yaXNjdiBiL2FyY2gvYXJjaC5tay5yaXNjdgo+IGluZGV4IGYzYmYy
YjM0NjcuLjA3YTk0YWE2YTQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcmNoLm1rLnJpc2N2Cj4gKysr
IGIvYXJjaC9hcmNoLm1rLnJpc2N2Cj4gQEAgLTI2LDUgKzI2LDkgQEAgZW5kaWYKPiAgaWZlcSAo
JChCUjJfUklTQ1ZfSVNBX1JWQykseSkKPiAgR0NDX1RBUkdFVF9BUkNIIDo9ICQoR0NDX1RBUkdF
VF9BUkNIKWMKPiAgZW5kaWYKPiAraWZlcSAoJChCUjJfUklTQ1ZfSVNBX1JWVikseSkKPiArR0ND
X1RBUkdFVF9BUkNIIDo9ICQoR0NDX1RBUkdFVF9BUkNIKXYKPiArZW5kaWYKPiArCj4gIAo+ICBl
bmRpZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
