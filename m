Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E84ECD4F3D
	for <buildroot@archiver.kernel.org>; Sun, 17 May 2026 21:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07A1384ED3;
	Sun, 17 May 2026 21:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYtd59V-HD7b; Sun, 17 May 2026 21:56:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B9A585040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779055010;
	bh=zkiHYf+sOxZYZ25lB4mQXBDYlvtlkS1Bhs7HTav15A4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r8qckaDFIa92XOgPpH2XgBGsEiyQOHVIQ/+hgnawnWHdd98Bx3fvdbMsECO2XIjCL
	 kqwjcZ7nVV1z5mIdVVQ+CLcMvRfhDYNmCKY1LFMaWhADtZgQIYSgArSwS7DFlSUebZ
	 GDlenU2sKMDeB7z22ERZs3c/6cRf7JbYEqGaM2/PyzBqnE3UMPIruuCRNQSxfFjTQd
	 G0LdE3mTTTvx2pvCWYL5x+jrqAjF2goIaxbbx/jdu1sW6OuuWCzCCJ1um9qvccddwD
	 LVwgCQzRfxJEPZM+CB0l5aPMMndPqe9kXwhmeLjFhzcxy5J17fPJkbxF5eIlZICeRS
	 HjwdLYx6TJrgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B9A585040;
	Sun, 17 May 2026 21:56:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 24C86282
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A7E942886
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 21Re9g5sposM for <buildroot@buildroot.org>;
 Sun, 17 May 2026 21:56:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5242C422EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5242C422EC
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5242C422EC
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:56:46 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48e56c1bf5dso6604455e9.3
 for <buildroot@buildroot.org>; Sun, 17 May 2026 14:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779055004; x=1779659804;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2TPau/w6O6cdiZMKhRW1QmSal1/ypj+AWKgVbpSoKqY=;
 b=hsAA8wCxygqCNll4Va0ICo1Zqde3JQqLj/Py3l7fLmIHfLAAgqjyHdKu88TImgzEIJ
 htZ/YWXZj3NCyzKH6d1AeZTB3tYhE2sLyvYFHr/SmekxE8uj3r3+AWdtKhiOuSuZ7vrU
 mrMM7wg0DHv8fOM2IJjbTTzN2xu2+I3qcOL7Ta72qnUKIhYFtlWrV7U7gJdtvhwdlnGq
 b3iCGJ89zBREkOVJ94TvMjZ6p/baKQsLMwZnWU8657U391fnOGVco0oIt9UTbDToBWOf
 Ki3heFXf692Zzzbtz8x4CuAPguIz50gYMalZ8fitnkrP/3BkbOF8mjtJG+rXKCK4Mr1p
 sYUQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/cA77WkNnrnxNXQK+4Pw09uXWj/u8/ad7jrwXFkCOURMg2xnwRgQAVMHXJX4Yznpb9ViwMO2F039g=@buildroot.org
X-Gm-Message-State: AOJu0YwnTGelaLVGXI4g1oatVCWjvIekpwZK8G1bUpAMddhayTeUKriQ
 sKjDsJCczwTAyXubRMEjCPyFfpF2Uj+5HMvAkKUfuNWQK5U7U+6zDLtIE/Wo+DVTTpxQSVUzilT
 t8jIGYps=
X-Gm-Gg: Acq92OH8jG4g0Ytdz8s+nkzGJ3MmfKPFLcOCUPmDWrZUAbW7U/m4B42ydxDqgAPNTW2
 SVfKfk+BQupkpvYBEa/FVhSAgSvUGIxLF1sOycH0u8JjyQMNAmfAG85p8gDTmyALoxcB8iksRUn
 Q99iKJMYhY1k7M013/wfMdGNZVSPGwB4NaVcqGEqxW8gbbPo3GgzecyHXh37DBMETs3nEva0pe0
 xKo+BW8/PoU5dAKMDWzV24T2HRiJpHp4bi6hUp8aVd41Jrha7JKqhKRIPQ+GJxxDAwA25kdFu/W
 Usva6vGal5V1yyUeQf6HlETj/Rk4XVXkQ4+rsYyvzZS9gn5YZa/O3ccrsgMtjKfsomq9nqvOy0+
 7o06NBmW7QLvUkkKLWnNC/HTB6pZ1uKPnYiGf4LN5bLPnJiazepb2Vo5peJCoxt7MBmyby1ZA6K
 xPoM1RSpaVdk4DC5jDixkYM+PXft3YGhbART27jW+S2zaLWmCZEnOK14uA0NRfDuu9vtH+bRaGN
 QpsqGkvn5H9woEuv/dwjKGc9CvxJRWUJAai5EV6/8Ve1Qr8iyuZvp7kxvCjfdzLsS7CvUHz5iPX
 mqgvZi3XB60=
X-Received: by 2002:a05:600c:4f8a:b0:489:ad:7b5b with SMTP id
 5b1f17b1804b1-48fe62f8c6bmr187335365e9.24.1779055004194; 
 Sun, 17 May 2026 14:56:44 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5cab7c5sm219428155e9.12.2026.05.17.14.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 May 2026 14:56:43 -0700 (PDT)
Message-ID: <feb54ce4-37ed-4e9c-ad07-6776db769eb6@smile.fr>
Date: Sun, 17 May 2026 23:56:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>
References: <20260516195803.292097-1-giulio.benetti@benettiengineering.com>
Content-Language: fr
In-Reply-To: <20260516195803.292097-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1779055004; x=1779659804; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2TPau/w6O6cdiZMKhRW1QmSal1/ypj+AWKgVbpSoKqY=;
 b=ue32hm/nXOlHOu5GdqJK0F0xQ4s8j8U/8kyMfkKC/wxX8Jkqsf5xEBrQBQ4+kCJ7Wp
 k6QZgXAk7sS42vM0SuFBYe5KBGiQ7G8/BExGUeZL12sNGVS1n078qfmhtVDwdXYC3rQf
 WC4mBqPq0y+hsFX+aBBuYjv171sscica4pBnY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=ue32hm/n
Subject: Re: [Buildroot] [PATCH v2] package/libnss: fix build failure on big
 endian architectures
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

SGVsbG8gR2l1bGlvLCBBbGwsCgpMZSAxNi8wNS8yMDI2IMOgIDIxOjU4LCBHaXVsaW8gQmVuZXR0
aSBhIMOpY3JpdMKgOgo+IEFkZCBsb2NhbCBwYXRjaCBwZW5kaW5nIHVwc3RyZWFtIHRvIGZpeCBi
dWlsZCBmYWlsdXJlIGR1ZSB0byBtaXNzaW5nIGdjbQo+IHN0dWJzLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29t
Pgo+IC0tLQo+IFYxLT5WMjoKPiAqIHVwZGF0ZSBsb2NhbCBwYXRjaCB3aXRoIGxhdGVzdCBhcyBw
b2ludGVkIGJ5IFJvbWFpbiBOYW91cgoKVGhhbmtzIGZvciB0aGUgdXBkYXRlLgoKQXBwbGllZCB0
byBtYXN0ZXIuIFRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IC0tLQo+ICAuLi5idWls
ZC1mYWlsdXJlLWR1ZS10by1taXNzaW5nLWdjbS1zdHUucGF0Y2ggfCAxMTQgKysrKysrKysrKysr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMTQgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS9saWJuc3MvMDAwMi1CdWctMjAyNzc2OC1GaXgtYnVpbGQtZmFpbHVy
ZS1kdWUtdG8tbWlzc2luZy1nY20tc3R1LnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bGlibnNzLzAwMDItQnVnLTIwMjc3NjgtRml4LWJ1aWxkLWZhaWx1cmUtZHVlLXRvLW1pc3Npbmct
Z2NtLXN0dS5wYXRjaCBiL3BhY2thZ2UvbGlibnNzLzAwMDItQnVnLTIwMjc3NjgtRml4LWJ1aWxk
LWZhaWx1cmUtZHVlLXRvLW1pc3NpbmctZ2NtLXN0dS5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uMWRkZmM2MTU3Ngo+IC0tLSAvZGV2L251bGwKPiArKysg
Yi9wYWNrYWdlL2xpYm5zcy8wMDAyLUJ1Zy0yMDI3NzY4LUZpeC1idWlsZC1mYWlsdXJlLWR1ZS10
by1taXNzaW5nLWdjbS1zdHUucGF0Y2gKPiBAQCAtMCwwICsxLDExNCBAQAo+ICtGcm9tIDk3NDQ2
OTc0MGU2ZmE5YjdhZDE1ZjZkOWIzOTQ1MzcwZGMxMWZhMWUgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCj4gK0Zyb206IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5l
ZXJpbmcuY29tPgo+ICtEYXRlOiBNb24sIDMwIE1hciAyMDI2IDE3OjA2OjE0ICswMjAwCj4gK1N1
YmplY3Q6IFtQQVRDSF0gQnVnIDIwMjc3NjggLSBGaXggYnVpbGQgZmFpbHVyZSBkdWUgdG8gbWlz
c2luZyBnY20gc3R1YnMgaWYKPiArIG9uIGJpZyBlbmRpYW4KPiArCj4gK0J1aWxkaW5nIGdjbSBv
biBCaWcgRW5kaWFuIGFyY2hpdGVjdHVyZXMgbGVhZCB0byBsaW5raW5nIGZhaWx1cmUgZHVlIHRv
Cj4gK21pc3NpbmcgZ2NtIHN0dWJzLiBUaGlzIGlzIGJlY2F1c2UgdGhvc2Ugc3R1YnMgYXJlIGd1
YXJkZWQgYnkKPiArREhBVkVfUExBVEZPUk1fR0hBU0ggdGhhdCBhdCB0aGUgbW9tZW50IGlzIGRl
ZmluZWQgZm9yIGV2ZXJ5IGFyY2hpdGVjdHVyZQo+ICt0aGF0IHByb3ZpZGVzIGFjY2VsZXJhdGlv
bi4gQnV0IGF0IHRoZSBtb21lbnQgd2UgY2FuIGFsc28gYnVpbGQgd2l0aG91dAo+ICthY2NlbGVy
YXRpb24gYnV0IERIQVZFX1BMQVRGT1JNX0dIQVNIIGlzIGRlZmluZWQgaW4gYW55IGNhc2UuCj4g
K1NvIGxldCdzIGFkZCB0byBjb3JlY29uZi9MaW51eC5tayBhIHJ1bnRpbWUgdGVzdCB0byBmaW5k
IG91dCB3aGljaAo+ICtlbmRpYW5uZXNzIHRvb2xjaGFpbiBpcyBieSBzZXR0aW5nIHRoZSBuZXcg
aW50cm9kdWNlZCBMSVRUTEVfRU5ESUFOCj4gK3ZhcmlhYmxlLiBBbmQgbGF0ZXIgb24sIGluIGxp
Yi9mcmVlYmwvTWFrZWZpbGUgbGV0J3MgZ3VhcmQKPiArREhBVkVfUExBVEZPUk1fR0hBU0ggZGVm
aW5pdGlvbiBkZXBlbmRpbmcgb24gTElUVExFX0VORElBTiBWQVJJQUJMRS4KPiArCj4gK1Vwc3Ry
ZWFtOiBodHRwczovL2J1Z3ppbGxhLm1vemlsbGEub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDI3NzY4
Cj4gK1NpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRp
ZW5naW5lZXJpbmcuY29tPgo+ICstLS0KPiArIG5zcy9jb3JlY29uZi9MaW51eC5tayAgIHwgIDgg
KysrKysrKysKPiArIG5zcy9saWIvZnJlZWJsL01ha2VmaWxlIHwgMjggKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLQo+ICsgMiBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQo+ICsKPiArZGlmZiAtLWdpdCBhL2NvcmVjb25mL0xpbnV4Lm1rIGIvY29yZWNv
bmYvTGludXgubWsKPiAraW5kZXggZGNiNDMyNDE1Zi4uY2YxZjYyMzc4ZCAxMDA2NDQKPiArLS0t
IGEvbnNzL2NvcmVjb25mL0xpbnV4Lm1rCj4gKysrKyBiL25zcy9jb3JlY29uZi9MaW51eC5tawo+
ICtAQCAtMTg4LDYgKzE4OCwxNCBAQCBlbmRpZgo+ICsgZW5kaWYKPiArIGVuZGlmCj4gKyAKPiAr
KyMgVGVzdCB0b29sY2hhaW4gZm9yIGVuZGlhbm5lc3MgYW5kIHNldCBMSVRUTEVfRU5ESUFOIHZh
cmlhYmxlIGFjY29yZGluZ2x5Cj4gKytFTkRJQU5ORVNTIDo9ICQoc2hlbGwgZWNobyB8ICQoQ0Mp
IC1kTSAtRSAtIHwgZ3JlcCBfX0JZVEVfT1JERVJfXykKPiArK2lmZXEgKCQoZmluZHN0cmluZyBf
X09SREVSX0xJVFRMRV9FTkRJQU5fXywkKEVORElBTk5FU1MpKSxfX09SREVSX0xJVFRMRV9FTkRJ
QU5fXykKPiArKyAgICBMSVRUTEVfRU5ESUFOIDo9IDEKPiArK2Vsc2UKPiArKyAgICBMSVRUTEVf
RU5ESUFOIDo9IDAKPiArK2VuZGlmCj4gKysKPiArIFVTRV9TWVNURU1fWkxJQiA9IDEKPiArIFpM
SUJfTElCUyA9IC1sego+ICsgCj4gK2RpZmYgLS1naXQgYS9saWIvZnJlZWJsL01ha2VmaWxlIGIv
bGliL2ZyZWVibC9NYWtlZmlsZQo+ICtpbmRleCA0ZWU5ZDYxZjUwLi4zOWVmMjhlYzhjIDEwMDY0
NAo+ICstLS0gYS9uc3MvbGliL2ZyZWVibC9NYWtlZmlsZQo+ICsrKysgYi9uc3MvbGliL2ZyZWVi
bC9NYWtlZmlsZQo+ICtAQCAtMTEyLDcgKzExMiwxMCBAQCBlbmRpZgo+ICsgIyBOU1NfWDY0IG1l
YW5zIHRoZSB0YXJnZXQgaXMgYSA2NC1iaXRzIDY0IENQVSBhcmNoaXRlY3R1cmUKPiArICMgTlNT
X1g4Nl9PUl9YNjQgbWVhbnMgdGhlIHRhcmdldCBpcyBlaXRoZXIgeDg2IG9yIHg2NAo+ICsgaWZl
cSAoLCQoZmlsdGVyLW91dCBpMzg2IHgzODYgeDg2IHg4Nl82NCwkKENQVV9BUkNIKSkpCj4gKy0g
ICAgICAgIERFRklORVMgKz0gLUROU1NfWDg2X09SX1g2NCAtREhBVkVfUExBVEZPUk1fR0hBU0gK
PiArKyAgICAgICAgREVGSU5FUyArPSAtRE5TU19YODZfT1JfWDY0Cj4gKysgICAgICAgIGlmZXEg
KCQoTElUVExFX0VORElBTiksMSkKPiArKyAgICAgICAgICAgIERFRklORVMgKz0gLURIQVZFX1BM
QVRGT1JNX0dIQVNICj4gKysgICAgICAgIGVuZGlmCj4gKyAgICAgICAgIEVYVFJBX1NSQ1MgKz0g
Z2hhc2gteDg2LmMgYWVzLXg4Ni5jCj4gKyAkKE9CSkRJUikvZ2hhc2gteDg2Lm86IENGTEFHUyAr
PSAtbXBjbG11bCAtbWFlcwo+ICsgJChPQkpESVIpL2Flcy14ODYubzogQ0ZMQUdTICs9IC1tcGNs
bXVsIC1tYWVzCj4gK0BAIC0xMzgsNyArMTQxLDEwIEBAIGVuZGlmCj4gKyBlbmRpZgo+ICsgaWZl
cSAoJChDUFVfQVJDSCksYWFyY2g2NCkKPiArICAgICBpZmRlZiBDQ19JU19DTEFORwo+ICstICAg
ICAgICBERUZJTkVTICs9IC1EVVNFX0hXX0FFUyAtRFVTRV9IV19TSEExIC1EVVNFX0hXX1NIQTIg
LURIQVZFX1BMQVRGT1JNX0dIQVNICj4gKysgICAgICAgIERFRklORVMgKz0gLURVU0VfSFdfQUVT
IC1EVVNFX0hXX1NIQTEgLURVU0VfSFdfU0hBMgo+ICsrICAgICAgICBpZmVxICgkKExJVFRMRV9F
TkRJQU4pLDEpCj4gKysgICAgICAgICAgICBERUZJTkVTICs9IC1ESEFWRV9QTEFURk9STV9HSEFT
SAo+ICsrICAgICAgICBlbmRpZgo+ICsgICAgICAgICBFWFRSQV9TUkNTICs9IGFlcy1hcm12OC5j
IGdoYXNoLWFhcmNoNjQuYyBzaGExLWFybXY4LmMgc2hhMjU2LWFybXY4LmMKPiArICAgICBlbHNl
IGlmZXEgKDEsJChDQ19JU19HQ0MpKQo+ICsgICAgICAgICAjIEdDQyB2ZXJzaW9ucyBvbGRlciB0
aGFuIDQuOSBkb24ndCBzdXBwb3J0IEFSTSBBRVMuIFRoZSBjaGVjawo+ICtAQCAtMTQ2LDE4ICsx
NTIsMjYgQEAgaWZlcSAoJChDUFVfQVJDSCksYWFyY2g2NCkKPiArICAgICAgICAgIyBhbmQgdGhl
biByZWplY3RzIGFueSBtYWpvciB2ZXJzaW9ucyBwcmlvciB0byA1LiBOb3RlIHRoYXQKPiArICAg
ICAgICAgIyB0aGVyZSBoYXMgYmVlbiBubyBHQ0MgNC4xMCwgYXMgaXQgd2FzIHJlbmFtZWQgdG8g
R0NDIDUuCj4gKyAgICAgICAgIGlmbmVxICgsJChmaWx0ZXIgNC45LCQod29yZCAxLCQoR0NDX1ZF
UlNJT04pKS4kKHdvcmQgMiwkKEdDQ19WRVJTSU9OKSkpKQo+ICstICAgICAgICAgICAgREVGSU5F
UyArPSAtRFVTRV9IV19BRVMgLURVU0VfSFdfU0hBMSAtRFVTRV9IV19TSEEyIC1ESEFWRV9QTEFU
Rk9STV9HSEFTSAo+ICsrICAgICAgICAgICAgREVGSU5FUyArPSAtRFVTRV9IV19BRVMgLURVU0Vf
SFdfU0hBMSAtRFVTRV9IV19TSEEyCj4gKysgICAgICAgICAgICBpZmVxICgkKExJVFRMRV9FTkRJ
QU4pLDEpCj4gKysgICAgICAgICAgICAgICAgREVGSU5FUyArPSAtREhBVkVfUExBVEZPUk1fR0hB
U0gKPiArKyAgICAgICAgICAgIGVuZGlmCj4gKyAgICAgICAgICAgICBFWFRSQV9TUkNTICs9IGFl
cy1hcm12OC5jIGdoYXNoLWFhcmNoNjQuYyBzaGExLWFybXY4LmMgc2hhMjU2LWFybXY4LmMKPiAr
ICAgICAgICAgZW5kaWYKPiArICAgICAgICAgaWZlcSAoLCQoZmlsdGVyIDAgMSAyIDMgNCwkKHdv
cmQgMSwkKEdDQ19WRVJTSU9OKSkpKQo+ICstICAgICAgICAgICAgREVGSU5FUyArPSAtRFVTRV9I
V19BRVMgLURVU0VfSFdfU0hBMSAtRFVTRV9IV19TSEEyIC1ESEFWRV9QTEFURk9STV9HSEFTSAo+
ICsrICAgICAgICAgICAgREVGSU5FUyArPSAtRFVTRV9IV19BRVMgLURVU0VfSFdfU0hBMSAtRFVT
RV9IV19TSEEyCj4gKysgICAgICAgICAgICBpZmVxICgkKExJVFRMRV9FTkRJQU4pLDEpCj4gKysg
ICAgICAgICAgICAgICAgREVGSU5FUyArPSAtREhBVkVfUExBVEZPUk1fR0hBU0gKPiArKyAgICAg
ICAgICAgIGVuZGlmCj4gKyAgICAgICAgICAgICBFWFRSQV9TUkNTICs9IGFlcy1hcm12OC5jIGdo
YXNoLWFhcmNoNjQuYyBzaGExLWFybXY4LmMgc2hhMjU2LWFybXY4LmMKPiArICAgICAgICAgZW5k
aWYKPiArICAgICBlbmRpZgo+ICsgZW5kaWYKPiArIGlmZXEgKCQoQ1BVX0FSQ0gpLGFybSkKPiAr
IGlmbmRlZiBOU1NfRElTQUJMRV9BUk0zMl9ORU9OCj4gKy0gICAgREVGSU5FUyArPSAtREhBVkVf
UExBVEZPUk1fR0hBU0gKPiArKyAgICBpZmVxICgkKExJVFRMRV9FTkRJQU4pLDEpCj4gKysgICAg
ICAgIERFRklORVMgKz0gLURIQVZFX1BMQVRGT1JNX0dIQVNICj4gKysgICAgZW5kaWYKPiArICAg
ICBFWFRSQV9TUkNTICs9IGdoYXNoLWFybTMyLW5lb24uYwo+ICsgZW5kaWYKPiArICAgICBpZmRl
ZiBDQ19JU19DTEFORwo+ICtAQCAtMjkwLDcgKzMwNCw5IEBAIGlmZXEgKCQoQ1BVX0FSQ0gpLGFy
bSkKPiArICAgICBNUElfU1JDUyArPSBtcGlfYXJtLmMKPiArIGVuZGlmCj4gKyBpZmVxICgkKENQ
VV9BUkNIKSxwcGMpCj4gKy0gICAgREVGSU5FUyArPSAtREhBVkVfUExBVEZPUk1fR0hBU0gKPiAr
KyAgICBpZmVxICgkKExJVFRMRV9FTkRJQU4pLDEpCj4gKysgICAgICAgIERFRklORVMgKz0gLURI
QVZFX1BMQVRGT1JNX0dIQVNICj4gKysgICAgZW5kaWYKPiArICAgICBFWFRSQV9TUkNTICs9IGdo
YXNoLXBwYy5jCj4gKyBpZmRlZiBVU0VfNjQKPiArICAgICBERUZJTkVTICs9IC1ETlNTX05PX0lO
SVRfU1VQUE9SVAo+ICstLSAKPiArMi40Ny4zCj4gKwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
