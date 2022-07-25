Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A72C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 10:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CD6741675;
	Mon, 25 Jul 2022 10:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CD6741675
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T1ffFAsfUEd6; Mon, 25 Jul 2022 10:36:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1F95410B1;
	Mon, 25 Jul 2022 10:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1F95410B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E101B1BF371
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 10:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C60FD410B1
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 10:36:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C60FD410B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HDhbEXbE420U for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 10:36:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4748240873
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4748240873
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 10:36:04 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id h8so15327213wrw.1
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 03:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Lhsu2zEs6dVVYKXtifwxwGU4WDW5cH9heP8u3E8fk+E=;
 b=GgXGHiHTnwZG/IVAPHdTNQHN+g691RgyNQV2y03C2c/GX/wfHQF3MexUhUbTM0cF3i
 e2jBp9q0mcjr//gw1A854lUB8xHXIn3/DpXkjTukFoqA4J50Xy+uqK3ktd7XjCFlFfp6
 7KmK+btHN+zNkpEHftZgjV6DwEZnIFu/JMidX91OKDBWzN6an0QLUUg1Z7JK4lpb/bVg
 tIz+bQ2BvLaoLHvcee+ScEyC86HQO443LjBMriSHFCJW0seT3knR5wS8DaSVoCoNrIby
 zgjofdzYJZIvPzxFtawYYDx4sECthUZ/zsL8pE25uSHDDcxi5CGIDtYPrjRJB9s6v/eq
 UeWg==
X-Gm-Message-State: AJIora/oegqCpZKJoMTa35igEVDmHCakl18Q/Dg7zv06yIwX4VBNfgt3
 VkVLeCpWKmIG+trc1k1AZ7MSTg==
X-Google-Smtp-Source: AGRyM1vfIYWbbTcJRC0KM/Lcoxaz3xGUIwkN9M5cHvRid5jyalOYo64aHwiNW3R1GHC8A5NjbowPGA==
X-Received: by 2002:adf:fcca:0:b0:21d:68ff:2e5a with SMTP id
 f10-20020adffcca000000b0021d68ff2e5amr7627095wrs.453.1658745362113; 
 Mon, 25 Jul 2022 03:36:02 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 a8-20020adfe5c8000000b0021e5d77a489sm9494584wrn.31.2022.07.25.03.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 03:36:01 -0700 (PDT)
Message-ID: <e9ecf933-a008-e01d-d278-e621b4121384@mind.be>
Date: Mon, 25 Jul 2022 12:36:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20220725100745.2878896-1-arnout@mind.be>
 <4b407a41-7f31-01d3-ac93-61807be070be@smile.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <4b407a41-7f31-01d3-ac93-61807be070be@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Lhsu2zEs6dVVYKXtifwxwGU4WDW5cH9heP8u3E8fk+E=;
 b=ETPXHAeFVAiBuLu8xtP/YBzCdkKhSGHowmLBZ24EYZ9+eaOSHJN38c/7hdaPp36fky
 EcrRltJmU2CuqH+jxmux/m6zELQw5//jQiKxgIPdki38Sjgf6sOnjY4B2PZF7vjuObpF
 Fz1hhefAYtbs2akg6Xs8S35eTY9bHTq6+qyYLkizpvxiaJegyICGAIJn55J01CCVLH8t
 JLUOHCrR+UQ+nNWrQ1m4OwhHfrTjrwdoG8kmKkCFbicSexLsluQbJNfCLdsj8JGkdan4
 SZfB+7dyJlPuVCmk9N467aQ9YibuPXlphUn9nP9Zcz9A2V9x/yhfZkqcGzJLvjKU3OBQ
 tfmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ETPXHAeF
Subject: Re: [Buildroot] [PATCH] package/glibc: fix struct stat for
 microblaze with largefile
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNS8wNy8yMDIyIDEyOjI0LCBSb21haW4gTmFvdXIgd3JvdGU6Cj4gSGVsbG8gQXJub3V0
LAo+IAo+IExlIDI1LzA3LzIwMjIgw6AgMTI6MDcsIEFybm91dCBWYW5kZWNhcHBlbGxlIChFc3Nl
bnNpdW0vTWluZCkgYSDDqWNyaXTCoDoKPj4gT24gbWljcm9ibGF6ZSwgdGhlcmUgaXMgYSBzZXBh
cmF0ZSB2ZXJzaW9uIG9mIHN0cnVjdCBzdGF0IGZvciBsYXJnZWZpbGUKPj4gYW5kIGZvciBub24t
bGFyZ2VmaWxlLiBXaGVuIHRoZSBzdHJ1Y3Qgd2FzIHVwZGF0ZWQgdG8gaW5jbHVkZSB0aGUKPj4g
c3RfbXRpbSwgc3RfYXRpbSBhbmQgc3RfY3RpbSBtZW1iZXJzIGZvciBQT1NJWCwgdGhlIGxhcmdl
ZmlsZSB2ZXJzaW9uCj4+IHdhcyBmb3Jnb3R0ZW4uIFNpbmNlIHdlIG9ubHkgdXNlIGxhcmdlZmls
ZSBpbiBCdWlsZHJvb3QsIHRoYXQgbWVhbnMgdGhhdAo+PiBtaWNyb2JsYXplIGRpZG4ndCBoYXZl
IHRoZXNlIG1lbWJlcnMgaW4gc3RydWN0IHN0YXQuIFRoaXMgYnJlYWtzIHRoZQo+PiBidWlsZCBv
ZiBzb21lIHBhY2thZ2VzLgo+Pgo+PiBDaGFuZ2UgdGhlIGRlZmluZSBhcm91bmQgc3RfbXRpbSBl
dGMuIHRvIF9fVVNFX1hPUEVOMks4IHRvIGVuYWJsZSBpdCBpbgo+PiBwb3NpeCBjb250ZXh0IChp
LmUuIGJ5IGRlZmF1bHQpLgo+IAo+IEl0IG1lYW5zIHRoYXQgZ2xpYmMgZm9yIG1pY3JvYmxhemUg
d2l0aCBsYXJnZWZpbGUgc3VwcG9ydCBmYWlsIHRvIGJ1aWxkIHNvbWUKPiBwYWNrYWdlcyBzaW5j
ZSAyLjIyIChyZWxlYXNlZCBpbiAyMDE1KS4KCiAgWWVwLiBCdXQgd2UgZGlkbid0IGJ1aWxkIG1p
Y3JvYmxhemUgd2l0aCBnbGliYyB1bnRpbCByZWNlbnRseSwgc28gd2UgbmV2ZXIgCm5vdGljZWQu
CgogIFRoZXJlJ3MgYSByZWxhdGVkIG5vdGUgSSBmb3Jnb3QgdG8gYWRkIHRvIG15IHBhdGNoLiBU
aGlzIHBhdGNoIGZpeGVzIHRoZSBpc3N1ZSAKZm9yIGludGVybmFsIHRvb2xjaGFpbnMsIGJ1dCBv
ZiBjb3Vyc2Ugbm90IGZvciBleHRlcm5hbCB0b29sY2hhaW4uIFdlIGhhdmUganVzdCAKb25lIHBy
ZWRlZmluZWQgZXh0ZXJuYWwgdG9vbGNoYWluIHRoYXQgaXMgaW4gdGhpcyBzaXR1YXRpb24sIGJv
b3RsaW4gbWljcm9ibGF6ZSAKZ2xpYmMuIFRoYXQgb25lIHNob3VsZCBiZSB1cGRhdGVkIGluIFNl
cHRlbWJlciBvciBzby4gSSB0aGluayB3ZSBjYW4gbGl2ZSB3aXRoIAp0aGlzIHByb2JsZW0gKHdo
aWNoIGV4aXN0ZWQgZm9yIHllYXJzKSBhIGZldyBtb250aHMgbG9uZ2VyLiBTbyBJIG1hcmtlZCAK
RmFicmljZSdzIHdvcmthcm91bmRzIGZvciB6c3RkIGFuZCBkaWVoYXJkZXIgYXMgU3VwZXJzZWRl
ZC4KCiAgUmVnYXJkcywKICBBcm5vdXQKCgo+IAo+IFJldmlld2VkLWJ5OiBSb21haW4gTmFvdXIg
PHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KPiAKPiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWluCj4gCj4+
Cj4+IEZpeGVzOgo+PiAgIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMv
ZGQ5NDRhM2JkNGFjMGM5NGIyYmVjOGFjMjA5MTAwZGFhZjQzOTAzZCAoenN0ZCkKPj4gICAtIGh0
dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzQ2MDljOGUyYWYyNGQ5NTM2ZWIz
MzM5N2E0NjU5YWQ3NDBhY2E3NDIgKGRpZWhhcmRlcikKPj4KPj4gU2lnbmVkLW9mZi1ieTogQXJu
b3V0IFZhbmRlY2FwcGVsbGUgKEVzc2Vuc2l1bS9NaW5kKSA8YXJub3V0QG1pbmQuYmU+Cj4+IENj
OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPj4gQ2M6IFJv
bWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KPj4gLS0tCj4+ICAgLi4ub3QtcG9z
aXgtY29uZm9ybWFudC1vbi1taWNyb2JsYXplLXdpLnBhdGNoIHwgMzcgKysrKysrKysrKysrKysr
KysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspCj4+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvZ2xpYmMvMDAwMi1zdHJ1Y3Qtc3RhdC1pcy1ub3QtcG9zaXgtY29u
Zm9ybWFudC1vbi1taWNyb2JsYXplLXdpLnBhdGNoCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L2dsaWJjLzAwMDItc3RydWN0LXN0YXQtaXMtbm90LXBvc2l4LWNvbmZvcm1hbnQtb24tbWljcm9i
bGF6ZS13aS5wYXRjaCBiL3BhY2thZ2UvZ2xpYmMvMDAwMi1zdHJ1Y3Qtc3RhdC1pcy1ub3QtcG9z
aXgtY29uZm9ybWFudC1vbi1taWNyb2JsYXplLXdpLnBhdGNoCj4+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAuLjk3OTdmM2E5MzUKPj4gLS0tIC9kZXYvbnVsbAo+PiAr
KysgYi9wYWNrYWdlL2dsaWJjLzAwMDItc3RydWN0LXN0YXQtaXMtbm90LXBvc2l4LWNvbmZvcm1h
bnQtb24tbWljcm9ibGF6ZS13aS5wYXRjaAo+PiBAQCAtMCwwICsxLDM3IEBACj4+ICtGcm9tIDg3
ZDQxNWNjMTMzZmY0OTNjY2QwMjQ2NGMwNjFjYjE3MWQxMWVmMmYgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCj4+ICtGcm9tOiAiQXJub3V0IFZhbmRlY2FwcGVsbGUgKEVzc2Vuc2l1bS9NaW5kKSIg
PGFybm91dEBtaW5kLmJlPgo+PiArRGF0ZTogTW9uLCAyNSBKdWwgMjAyMiAxMToyNToxNSArMDIw
MAo+PiArU3ViamVjdDogW1BBVENIXSBzdHJ1Y3Qgc3RhdCBpcyBub3QgcG9zaXggY29uZm9ybWFu
dCBvbiBtaWNyb2JsYXplIHdpdGgKPj4gKyBfX1VTRV9GSUxFX09GRlNFVDY0Cj4+ICsKPj4gK0Nv
bW1pdCBhMDZiNDBjZGY1YmEwZDJhYjRmOWI0Yzc3ZDIxZTQ1ZmYyODRmYWM3IHVwZGF0ZWQgc3Rh
dC5oIHRvIHVzZQo+PiArX19VU0VfWE9QRU4ySzggaW5zdGVhZCBvZiBfX1VTRV9NSVNDIHRvIGFk
ZCB0aGUgc3RfYXRpbSwgc3RfbXRpbSBhbmQKPj4gK3N0X2N0aW0gbWVtYmVycyB0byBzdHJ1Y3Qg
c3RhdC4gSG93ZXZlciwgZm9yIG1pY3JvYmxhemUsIHRoZXJlIGFyZSB0d28KPj4gK2RlZmluaXRp
b25zIG9mIHN0cnVjdCBzdGF0LCBkZXBlbmRpbmcgb24gdGhlIF9fVVNFX0ZJTEVfT0ZGU0VUNjQg
bWFjcm8uCj4+ICtUaGUgc2Vjb25kIG9uZSB3YXMgbm90IHVwZGF0ZWQuCj4+ICsKPj4gK0NoYW5n
ZSBfX1VTRV9NSVNDIHRvIF9fVVNFX1hPUEVOMks4IGluIHRoZSBfX1VTRV9GSUxFX09GRlNFVDY0
IHZlcnNpb24KPj4gK29mIHN0cnVjdCBzdGF0IGZvciBtaWNyb2JsYXplLgo+PiArCj4+ICtVcHN0
cmVhbTogaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9Mjk0
MDMKPj4gK1NpZ25lZC1vZmYtYnk6IEFybm91dCBWYW5kZWNhcHBlbGxlIChFc3NlbnNpdW0vTWlu
ZCkgPGFybm91dEBtaW5kLmJlPgo+PiArLS0tCj4+ICsgc3lzZGVwcy91bml4L3N5c3YvbGludXgv
bWljcm9ibGF6ZS9iaXRzL3N0cnVjdF9zdGF0LmggfCAyICstCj4+ICsgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+ICsKPj4gK2RpZmYgLS1naXQgYS9zeXNk
ZXBzL3VuaXgvc3lzdi9saW51eC9taWNyb2JsYXplL2JpdHMvc3RydWN0X3N0YXQuaCBiL3N5c2Rl
cHMvdW5peC9zeXN2L2xpbnV4L21pY3JvYmxhemUvYml0cy9zdHJ1Y3Rfc3RhdC5oCj4+ICtpbmRl
eCBhMjc4N2U4ODM0My4uODUwNjk3ZjRmYTYgMTAwNjQ0Cj4+ICstLS0gYS9zeXNkZXBzL3VuaXgv
c3lzdi9saW51eC9taWNyb2JsYXplL2JpdHMvc3RydWN0X3N0YXQuaAo+PiArKysrIGIvc3lzZGVw
cy91bml4L3N5c3YvbGludXgvbWljcm9ibGF6ZS9iaXRzL3N0cnVjdF9zdGF0LmgKPj4gK0BAIC04
OSw3ICs4OSw3IEBAIHN0cnVjdCBzdGF0Cj4+ICsgICAgICAgICBfX2Jsa3NpemVfdCAgICAgICAg
ICAgICBzdF9ibGtzaXplOyAvKiBPcHRpbWFsIGJsb2NrIHNpemUgZm9yIEkvTy4gICovCj4+ICsg
ICAgICAgICBpbnQgICAgICAgICAgICAgICAgICAgICBfX3BhZDM7Cj4+ICsgICAgICAgICBfX2Js
a2NudDY0X3QgICAgICAgICAgICBzdF9ibG9ja3M7ICAvKiBOdW1iZXIgNTEyLWJ5dGUgYmxvY2tz
IGFsbG9jYXRlZC4gICovCj4+ICstIyBpZmRlZiBfX1VTRV9NSVNDCj4+ICsrIyBpZmRlZiBfX1VT
RV9YT1BFTjJLOAo+PiArICAgICAgICAgLyogTmFub3NlY29uZCByZXNvbHV0aW9uIHRpbWVzdGFt
cHMgYXJlIHN0b3JlZCBpbiBhIGZvcm1hdAo+PiArICAgICAgICAgICogZXF1aXZhbGVudCB0byAn
c3RydWN0IHRpbWVzcGVjJy4gVGhpcyBpcyB0aGUgdHlwZSB1c2VkCj4+ICsgICAgICAgICAgKiB3
aGVuZXZlciBwb3NzaWJsZSBidXQgdGhlIFVuaXggbmFtZXNwYWNlIHJ1bGVzIGRvIG5vdCBhbGxv
dyB0aGUKPj4gKy0tCj4+ICsyLjM1LjMKPj4gKwo+IApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
