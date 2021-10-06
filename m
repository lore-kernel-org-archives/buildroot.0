Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B8EC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:23:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0193861186
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0193861186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C87A840386;
	Wed,  6 Oct 2021 19:23:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oiZot-2bBycH; Wed,  6 Oct 2021 19:23:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CF9240370;
	Wed,  6 Oct 2021 19:23:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 252541BF350
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 209C3840F7
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:23:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FmtAW1i4bwax for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:23:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C7CC84026
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:23:50 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id g10so13438433edj.1
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 12:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=25jG/ERXoLRLxzoxSNy/rV/AMkItWwr5lA0sVAQEMXQ=;
 b=E39FlFnHLqEsN/VSYhnZsu3VKg2pUNHDZOrwyqTxQ+K/0Gr+r4ppgTdlX652/WpVK5
 9eYVJsmuDj7vTvBzvAGsY9QZmhtl7XTsU302h9Eu4C7GblT2oQA2CALfaqM19YMM/mFL
 p5HeKI6g3OVm2QliziLk7uSacoDgl1BrNB62Ypqt45xYTlMaEtsoBCYEEe7rkKFskeAN
 phg5rcK0lBiTIboNWrZQHhqcF5kdhCqNN2bzy2P3GnHvj13/5a82F/w5NCflFQNelP+5
 t8sVm8ENk65piqOuLp9bPsnQ3cfr4hgmzOvfmpeUR3o66m/OPKhF5RT8eMhXP0dmyFhz
 8EnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=25jG/ERXoLRLxzoxSNy/rV/AMkItWwr5lA0sVAQEMXQ=;
 b=GDjVjtgDbNmZGJrdQDBgDXnY5bkCFT2puLHntqixTw/xnWBEnCr4ws6smczGG3/Wnt
 d+r387e+nTrwG2C916WqtcjXeVJyQF94Abg8Z1cKPJ2Ul3A9a2SN149HeVUpLOZBG2HS
 DmvIMNGqLzmioXgvh5ph4OB+w9ZSjJbtcGaws3Ccvl+aORc7D/pR0q5PYyeEW4oS0tCQ
 AcuoVFz/BAbXeJXSMMIcSxvXnmwwn4l9EEaGUy/5TUKYEIHuQgLeKFfLl7r3Ld83+ZBn
 0pmOPW4R1msfLarO6NahgHfnXTh/ga0CGCaGz0gZnL4u25wfdfmJyoomda2iOtpPWrx6
 EIBg==
X-Gm-Message-State: AOAM5321tAAIZPWaPmojYRMkbxQMbmTMbvjgxr3CUnwTOYLHAanyd5em
 g+BRqVGayDox7FE0Jp51JKBuIK6CRqDbNcAg
X-Google-Smtp-Source: ABdhPJxEj3V30ZhK3KE+suf2+XVSFnyZqWJkoPy+HZOZz2NmdEVnTdyhnrd2AoHA5O9e5xPKURtYhQ==
X-Received: by 2002:a17:907:1b06:: with SMTP id
 mp6mr50189ejc.188.1633548228369; 
 Wed, 06 Oct 2021 12:23:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id l6sm1737599edt.21.2021.10.06.12.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 12:23:47 -0700 (PDT)
Message-ID: <62f5735f-8b4e-c807-1ba5-0c0ff68f4dfd@mind.be>
Date: Wed, 6 Oct 2021 21:23:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
References: <2426ca2d-7fa8-d8a1-c542-0abbfcec3ec8@grenoble.cnrs.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <2426ca2d-7fa8-d8a1-c542-0abbfcec3ec8@grenoble.cnrs.fr>
Subject: Re: [Buildroot] [PATCH 1/1] support/kconfig: fix compiler warnings
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMi8wOS8yMDIxIDE2OjA4LCBFZGdhciBCb25ldCB3cm90ZToKPiBDb21waWxpbmcgb24g
VWJ1bnR1IDIwLjA0IGdlbmVyYXRlcyB0aGlzOgo+IAo+IC4vdXRpbC5jOiBJbiBmdW5jdGlvbiDi
gJhmaWxlX3dyaXRlX2RlcOKAmQo+IC4vdXRpbC5jOjU0OjE4OiB3YXJuaW5nOiDigJguLmNvbmZp
Zy50bXDigJkgZGlyZWN0aXZlIHdyaXRpbmcgMTIgYnl0ZXMgaW50byBhIHJlZ2lvbiBvZiBzaXpl
IGJldHdlZW4gMSBhbmQgNDA5NyBbLVdmb3JtYXQtb3ZlcmZsb3c9XQo+ICAgICA1NCB8ICBzcHJp
bnRmKGJ1ZiwgIiVzLi5jb25maWcudG1wIiwgZGlyKTsKPiAgICAgICAgfCAgICAgICAgICAgICAg
ICAgIF5+fn5+fn5+fn5+fgo+IC4vdXRpbC5jOjU0OjI6IG5vdGU6IOKAmHNwcmludGbigJkgb3V0
cHV0IGJldHdlZW4gMTMgYW5kIDQxMDkgYnl0ZXMgaW50byBhIGRlc3RpbmF0aW9uIG9mIHNpemUg
NDA5Nwo+ICAgICA1NCB8ICBzcHJpbnRmKGJ1ZiwgIiVzLi5jb25maWcudG1wIiwgZGlyKTsKPiAg
ICAgICAgfCAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAKPiBhbmQgc2lt
aWxhciB3YXJuaW5ncyBvbiBjb25mZGF0YS5jLCBsaW5lcyA3NzgsIDk4OSwgOTk1LCAxMDAwLCAx
MDA3LAo+IDEwNDAsIDEwNDYgYW5kIDEwNTQuIEF2b2lkIHRoZSB3YXJuaW5ncyBieSBlbmxhcmdp
bmcgdGhlIGRlc3RpbmF0aW9uCj4gYnVmZmVyIG9mIGZwcmludGYoKS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBFZGdhciBCb25ldCA8Ym9uZXRAZ3Jlbm9ibGUuY25ycy5mcj4KPiAtLS0KPiAgIHN1cHBv
cnQva2NvbmZpZy9jb25mZGF0YS5jIHwgNCArKy0tCj4gICBzdXBwb3J0L2tjb25maWcvdXRpbC5j
ICAgICB8IDIgKy0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKICBOb3JtYWxseSwgd2hlbiB3ZSBtYWtlIGNoYW5nZXMgdG8gdGhlIGtjb25maWcg
c291cmNlcywgd2Ugd2FudCB0byBrZWVwIHRyYWNrIApvZiB0aGF0IHdpdGggcGF0Y2hlcyBpbiBz
dXBwb3J0L2tjb25maWcvcGF0Y2hlcy4gVGhpcyBhbGxvd3MgdXMgdG8gdHJhY2sgCnVwc3RyZWFt
IHdpdGhvdXQgbG9vc2luZyB0aGUgbW9kaWZpY2F0aW9ucyB3ZSBtYWtlLgoKICBIb3dldmVyLCBp
biB0aGlzIGNhc2UsIHVwc3RyZWFtIGhhcyBhbHJlYWR5IGhlYXZpbHkgbW9kaWZpZWQgdGhvc2Ug
ZmlsZXMsIGFuZCAKZml4ZWQgdGhlIGlzc3Vlcy4gU28gd2UgdGhlcmUncyBubyBuZWVkIHRvIGtl
ZXAgaXQgYXMgcGF0Y2hlcy4KCiAgVGhlcmVmb3JlLCBhcHBsaWVkIHRvIG1hc3Rlciwgd2l0aCBh
biB1cGRhdGVkIGNvbW1pdCBtZXNzYWdlIHRoYXQgZXhwbGFpbnMgdGhlIAphYm92ZSwgdGhhbmtz
LgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9rY29uZmln
L2NvbmZkYXRhLmMgYi9zdXBwb3J0L2tjb25maWcvY29uZmRhdGEuYwo+IGluZGV4IDg5MmRhNzRm
ZGMuLjlhYjk4MGVkZDggMTAwNjQ0Cj4gLS0tIGEvc3VwcG9ydC9rY29uZmlnL2NvbmZkYXRhLmMK
PiArKysgYi9zdXBwb3J0L2tjb25maWcvY29uZmRhdGEuYwo+IEBAIC03NDQsNyArNzQ0LDcgQEAg
aW50IGNvbmZfd3JpdGUoY29uc3QgY2hhciAqbmFtZSkKPiAgIAlzdHJ1Y3QgbWVudSAqbWVudTsK
PiAgIAljb25zdCBjaGFyICpiYXNlbmFtZTsKPiAgIAljb25zdCBjaGFyICpzdHI7Cj4gLQljaGFy
IGRpcm5hbWVbUEFUSF9NQVgrMV0sIHRtcG5hbWVbUEFUSF9NQVgrMV0sIG5ld25hbWVbUEFUSF9N
QVgrMV07Cj4gKwljaGFyIGRpcm5hbWVbUEFUSF9NQVgrMV0sIHRtcG5hbWVbUEFUSF9NQVgrMjBd
LCBuZXduYW1lW1BBVEhfTUFYKzFdOwo+ICAgCWNoYXIgKmVudjsKPiAgIAo+ICAgCWlmICghbmFt
ZSkKPiBAQCAtOTc0LDcgKzk3NCw3IEBAIGludCBjb25mX3dyaXRlX2F1dG9jb25mKHZvaWQpCj4g
ICAJY29uc3QgY2hhciAqbmFtZTsKPiAgIAlGSUxFICpvdXQsICp0cmlzdGF0ZSwgKm91dF9oOwo+
ICAgCWludCBpOwo+IC0JY2hhciBkaXJbUEFUSF9NQVgrMV0sIGJ1ZltQQVRIX01BWCsxXTsKPiAr
CWNoYXIgZGlyW1BBVEhfTUFYKzFdLCBidWZbUEFUSF9NQVgrMjBdOwo+ICAgCWNoYXIgKnM7Cj4g
ICAKPiAgIAlzdHJjcHkoZGlyLCBjb25mX2dldF9jb25maWduYW1lKCkpOwo+IGRpZmYgLS1naXQg
YS9zdXBwb3J0L2tjb25maWcvdXRpbC5jIGIvc3VwcG9ydC9rY29uZmlnL3V0aWwuYwo+IGluZGV4
IDE4YThlNTIzOTEuLjg2NjVmNWJiODkgMTAwNjQ0Cj4gLS0tIGEvc3VwcG9ydC9rY29uZmlnL3V0
aWwuYwo+ICsrKyBiL3N1cHBvcnQva2NvbmZpZy91dGlsLmMKPiBAQCAtMzUsNyArMzUsNyBAQCBz
dHJ1Y3QgZmlsZSAqZmlsZV9sb29rdXAoY29uc3QgY2hhciAqbmFtZSkKPiAgIGludCBmaWxlX3dy
aXRlX2RlcChjb25zdCBjaGFyICpuYW1lKQo+ICAgewo+ICAgCWNoYXIgKnN0cjsKPiAtCWNoYXIg
YnVmW1BBVEhfTUFYKzFdLCBidWYyW1BBVEhfTUFYKzFdLCBkaXJbUEFUSF9NQVgrMV07Cj4gKwlj
aGFyIGJ1ZltQQVRIX01BWCsyMF0sIGJ1ZjJbUEFUSF9NQVgrMV0sIGRpcltQQVRIX01BWCsxXTsK
PiAgIAlzdHJ1Y3Qgc3ltYm9sICpzeW0sICplbnZfc3ltOwo+ICAgCXN0cnVjdCBleHByICplOwo+
ICAgCXN0cnVjdCBmaWxlICpmaWxlOwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
