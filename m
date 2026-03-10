Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3018FD88C3
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 22:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A2C2418D1;
	Tue, 10 Mar 2026 22:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OdYK_OcYDr8s; Tue, 10 Mar 2026 22:02:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 884E740AEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773180166;
	bh=Sw2Ud09qCY16aGFjEMYBNdrcf85isUZ0kYS6OWP+TUw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QObG0sTUDTeN3ouCG6xHQB7CHQIY6AcX+6VBCf7l5MFhKCCJ9CeifPmbQ/J+ERVDA
	 wriNxZvDHuokJnaPvnZoKTU7pQu0zWbqpavU+mBvZIUW+X2mzxuMMYHTIwWh40ktVP
	 +9ORUZbSXPRzTYvUOuChlyHvpAKWTGIhUS6vVFxSqvrTbpYo66/rfAw/bX69o2zoTO
	 58CTY0WRjPrbjgiH+86xDt6t2amVMLnjXepZvoTpJV6PWc3KxcUcTrFsEHQbp0c/af
	 hysD0Qg5wEcXw2iSOBD/lzkR/1kGpdkZckeJkpHQTwIp/M7VL6904QuWDUVs2MrMGi
	 3XWVvgcTDMwcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 884E740AEE;
	Tue, 10 Mar 2026 22:02:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 698DF201
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B49B8291D
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZ1lO8VL-X00 for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 22:02:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3EDFB82884
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EDFB82884
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3EDFB82884
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:02:43 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48534b59cf3so26761945e9.2
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 15:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773180162; x=1773784962;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2W0bJNCR5Brn5LfNPETCYCevXtVFcYDmd0+V/ci4NqU=;
 b=KdLgdtztiQbHzElXs4LaEIgF/rw4ayc0Sj9Vq/suuxXLF/C0RPECImy8ZfhTmNqsPg
 XNcgc3bmySVqzX3NJBK1/Wk1dTSW27NT5eR1bCADOWFh9jH9AsBrAX39ZZbwOI+UOo+5
 tcmjQDJYrkI8ezUN1hdel/KOfrVIMrE2XuDsSagQrP3ed1cpgcBxKwhju9rJ9KjJdEo7
 UoZ7PBlOJAm7el+n0UKiCo5lfGaw8SfQg9cNiHMelefcMTuN6jx3P4XN67WUYCWxct+l
 j4JMDMksZQtNuWc/Vrreic5Mgb+TgWUXiIfahwEGqGl3NDhP/q4eXu4qaw05YJtDUWpm
 pspg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZOjOOEYzCs+RaktraXdUvFUWO3tJ2VAAT4QE7rnqNnKaFQhNblh1yZth/iz27b093vRSwQCAK8Hs=@buildroot.org
X-Gm-Message-State: AOJu0YxYe+7L+f+hxv61/ZvoUeGP8MGwuwZyFwic0PUlyLouVLxCrbmL
 lySVLcIBGKDtsBf/a6lLv9q726G870/r8JsH/Hh3TgP6WDAFrdHY1NItrvO8UVfJpxg=
X-Gm-Gg: ATEYQzxpf+iWoTti/twoOMerCH3QwuMVB715BqkNjW41o8kHPdjGC4Jp5jByXmByLIr
 KY4jPq6Ld7TeudfaIcF9cV5uu9G2fX3snt2tS3GyEmooEiAX2rpE3excezTBS05mvHTSCJC+vUF
 C9a9AQV/1Y92qr6qnEzqOenr1pUFW/kzENNeN3yn+OIyHzCp0OM3W9SrrYczxNPCCwurbvAxdgh
 xwtR+DZPecyZIXQjIylKXUXE8kySZutesP3d9oiN6WhB292nbm2WHHVJ/E2ohztCyATWiRdTFrs
 +kXyxKuoYxdiufdDpJ4o0eayjec/lV0oAozRlMvCAK/FsztLmaHnY9ILeuoMBfDtjcVzzXQVbbk
 XAJXZlcs9n30A6MfVzkUFWTGrqyb9PSKk8dZja6dd3Jc/b9zWZuoOdc1jJXrdxTCHNFeC1isyQa
 1gPNFWFyy3eMoR35Np7jz8ttcQ65g1+azPQBcU09X/haMDiJi2fGFq9Z+hVWkXd6VARB92HupBX
 9k5vrh3jUZljSBZnYxaX4oD+2wsbS9kMi2SNwHCsFmynJZgL01QnbgnwitN2WcxRA==
X-Received: by 2002:a05:600c:4752:b0:485:3692:e906 with SMTP id
 5b1f17b1804b1-4854b0c77f4mr5636215e9.13.1773180161908; 
 Tue, 10 Mar 2026 15:02:41 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541b6f708sm148857135e9.11.2026.03.10.15.02.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 15:02:41 -0700 (PDT)
Message-ID: <5eeddaba-4f7e-492b-811b-c7377b69cb17@smile.fr>
Date: Tue, 10 Mar 2026 23:02:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 buildroot@buildroot.org
Cc: Thomas Huth <th.huth@posteo.eu>, Thomas Huth <th.huth+br@posteo.eu>,
 Cyril Bur <cyrilbur@gmail.com>
References: <20260225105537.1420002-1-alex.bennee@linaro.org>
 <20260225105537.1420002-3-alex.bennee@linaro.org>
Content-Language: fr
In-Reply-To: <20260225105537.1420002-3-alex.bennee@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773180162; x=1773784962; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2W0bJNCR5Brn5LfNPETCYCevXtVFcYDmd0+V/ci4NqU=;
 b=VtKmly0CiJ07P45/wkhnW51GdP2FVQ/xmbFzVSdN0M9b62SzhTz4DHmw4TjM0i4dfy
 YE/n9JE/oJF64DBUyQPDtMOv37zm04HciRhy687VUd4WaBXpLQrAYovESxWd/Vg1dRgA
 /b9pmr2xMDDPAgFI6mHhc09CA2p4TAUJQflHA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=VtKmly0C
Subject: Re: [Buildroot] [PATCH v6 2/6] package/kvm-unit-tests: update
 dependencies
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

SGVsbG8gQWxleCwgQWxsLAoKTGUgMjUvMDIvMjAyNiDDoCAxMTo1NSwgQWxleCBCZW5uw6llIGEg
w6ljcml0wqA6Cj4gVG8gcnVuIHRoZSB0ZXN0cyB3ZSBuZWVkIGEgc3lzdGVtIFFFTVUsIHRpbWVv
dXQsIGdldGNvbmYgYW5kIG5tYXAtbmNhdAo+IHNvIHVwZGF0ZSB0aGUgc2VsZWN0L2RlcGVuZHMg
Zm9yIHRoZW0uIEFzIHdlIG5lZWQgYXQgbGVhc3QgR0NDIDggd2UKPiBjYW4gZHJvcCB0aGUgc3Bl
Y2lmaWMgcmVxdWlyZW1lbnQgZm9yIG9sZCB4ODYtNjQgdGVzdHMuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgo+IFJldmlld2VkLWJ5OiBU
aG9tYXMgSHV0aCA8dGguaHV0aEBwb3N0ZW8uZXU+Cj4gCj4gLS0tCj4gdjIKPiAgIC0gcmVtb3Zl
IG9sZCBnY2Mgbm90ZXMgYXMgd2UgbmVlZCBhdCBsZWFzdCA4IGFueXdheQo+ICAgLSBzZWxlY3Qg
UUVNVSBhbmQgb3RoZXIgcnVudGltZSBkZXBzCj4gICAtIG1lbnRpb24gdGhlIHJ1bnRpbWUgZGVw
cwo+ICAgLSBhZGQgc3VwcG9ydCBmb3IgZ2V0Y29uZiBmcm9tIGV4dGVybmFsIHRvb2xjaGFpbgo+
ICAgLSB1cGRhdGUgY29tbWVudCBmYWxsYmFjawo+IHY1Cj4gICAtIGtlZXAgaTM4Ni94ODYtNjQg
dGFyZ2V0L2hvc3QgY29tbWVudHMKPiAgIC0gYWRkICFCUjJfUEFDS0FHRV9RRU1VX0FSQ0hfU1VQ
UE9SVFNfVEFSR0VUIHRvIGNvbW1lbnQgZGVwcwo+IC0tLQo+ICBwYWNrYWdlL2t2bS11bml0LXRl
c3RzL0NvbmZpZy5pbiB8IDIzICsrKysrKysrKysrKysrKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxOCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMv
Q29uZmlnLmluCj4gaW5kZXggODE3ZDNjNGE4Zi4uNzRjMzJmNDZlMCAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2Uva3ZtLXVuaXQt
dGVzdHMvQ29uZmlnLmluCj4gQEAgLTE2LDExICsxNiwyMCBAQCBjb25maWcgQlIyX1BBQ0tBR0Vf
S1ZNX1VOSVRfVEVTVFNfQVJDSF9TVVBQT1JUUwo+ICBjb25maWcgQlIyX1BBQ0tBR0VfS1ZNX1VO
SVRfVEVTVFMKPiAgCWJvb2wgImt2bS11bml0LXRlc3RzIgo+ICAJZGVwZW5kcyBvbiBCUjJfUEFD
S0FHRV9LVk1fVU5JVF9URVNUU19BUkNIX1NVUFBPUlRTCj4gLQkjIG9uIGkzODYgYW5kIHg4Ni02
NCwgX19idWlsdGluX3JlYWNoYWJsZSBpcyB1c2VkLCBzbyB3ZSBuZWVkCj4gLQkjIGdjYyA0LjUg
YXQgbGVhc3QuIG9uIGkzODYsIHdlIHVzZSB0aGUgdGFyZ2V0IGdjYywgd2hpbGUgb24KPiArCSMg
T24gaTM4Niwgd2UgdXNlIHRoZSB0YXJnZXQgZ2NjLCB3aGlsZSBvbgo+ICAJIyB4ODYtNjQgd2Ug
dXNlIHRoZSBob3N0IGdjYyAoc2VlIC5tayBmaWxlIGZvciBkZXRhaWxzKQo+IC0JZGVwZW5kcyBv
biBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzUgfHwgIUJSMl9pMzg2Cj4gIAlkZXBlbmRz
IG9uIEJSMl9IT1NUQVJDSCA9ICJ4ODZfNjQiIHx8ICFCUjJfeDg2XzY0Cj4gKwlkZXBlbmRzIG9u
IEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzggIyBxZW11Cj4gKwlkZXBlbmRzIG9uIEJSMl9Q
QUNLQUdFX1FFTVVfQVJDSF9TVVBQT1JUU19UQVJHRVQKPiArCWRlcGVuZHMgb24gKEJSMl9QQUNL
QUdFX0dMSUJDX1VUSUxTIHx8IFwKPiArCQkgICAgQlIyX1VDTElCQ19JTlNUQUxMX1VUSUxTIHx8
IFwKPiArCQkgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9MSUJDX1VUSUxTX0NPUFkpICMgcnVu
dGltZSBnZXRjb25mCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUUVNVQo+ICsJc2VsZWN0IEJSMl9Q
QUNLQUdFX1FFTVVfU1lTVEVNICMgcnVudGltZSBmb3IgcWVtdS1zeXN0ZW0tJEFSQ0gKPiArCXNl
bGVjdCBCUjJfUEFDS0FHRV9DT1JFVVRJTFMgIyBydW50aW1lIGZvciB0aW1lb3V0Cj4gKwlzZWxl
Y3QgQlIyX1BBQ0tBR0VfQkFTSCAjIHJ1bnRpbWUKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9OTUFQ
Cj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTk1BUF9OQ0FUICMgcnVudGltZSBmb3IgbmNhdAo+ICAJ
c2VsZWN0IEJSMl9IT1NUQVJDSF9ORUVEU19JQTMyX0NPTVBJTEVSIGlmIEJSMl94ODZfNjQKPiAg
CWhlbHAKPiAgCSAga3ZtLXVuaXQtdGVzdHMgaXMgYSBwcm9qZWN0IGFzIG9sZCBhcyBLVk0uIEFz
IGl0cyBuYW1lCj4gQEAgLTQwLDYgKzQ5LDEwIEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9LVk1fVU5J
VF9URVNUUwo+ICAKPiAgCSAgaHR0cDovL3d3dy5saW51eC1rdm0ub3JnL3BhZ2UvS1ZNLXVuaXQt
dGVzdHMKCk5vdCByZWxhdGVkIHRvIHRoaXMgcGF0Y2gsIGJ1dCB0aGlzIGxpbmsgY291bGQgaGF2
ZSBiZWVuIHVwZGF0ZWQgdG8gaHR0cHMuCgpSZXZpZXdlZC1ieTogUm9tYWluIE5hb3VyIDxyb21h
aW4ubmFvdXJAc21pbGUuZnI+CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gIAo+IC1jb21tZW50
ICJrdm0tdW5pdC10ZXN0cyBuZWVkcyBhIHRvb2xjaGFpbiB3LyBnY2MgPj0gNC41Igo+ICtjb21t
ZW50ICJrdm0tdW5pdC10ZXN0cyBuZWVkcyBhIHRvb2xjaGFpbiB3LyB1dGlscywgZ2NjID49IDgg
YW5kIHFlbXUiCj4gIAlkZXBlbmRzIG9uIEJSMl9pMzg2Cj4gLQlkZXBlbmRzIG9uICFCUjJfVE9P
TENIQUlOX0dDQ19BVF9MRUFTVF80XzUKPiArCWRlcGVuZHMgb24gIUJSMl9UT09MQ0hBSU5fR0ND
X0FUX0xFQVNUXzgKPiArCWRlcGVuZHMgb24gIShCUjJfUEFDS0FHRV9HTElCQ19VVElMUyB8fCBc
Cj4gKwkJQlIyX1VDTElCQ19JTlNUQUxMX1VUSUxTIHx8IFwKPiArCQlCUjJfVE9PTENIQUlOX0VY
VEVSTkFMX0xJQkNfVVRJTFNfQ09QWSkKPiArCWRlcGVuZHMgb24gIUJSMl9QQUNLQUdFX1FFTVVf
QVJDSF9TVVBQT1JUU19UQVJHRVQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
