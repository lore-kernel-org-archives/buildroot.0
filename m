Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93BDCD4851
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 11:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 844DB41A50;
	Fri, 15 May 2026 11:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UxFPzNR7ytIs; Fri, 15 May 2026 11:56:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9E7E41A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778846217;
	bh=Awjco2GVabi55gw+ntkE+t1Ji/pc2qIdoYpM5TYObrI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Bfzu19Nwb3/8iKbmNxLjxS+ThkR3Tf+tw1uDBn8OviqcCqBz2ANDDpDXgN8MALuN7
	 n9wqA/yFE2Ua5+1O6oaVpguptJpK9q5P5ol20dqA3qjEjMAeXeoNNCLOG2G4OcyKB+
	 OE3/k1iIk0fqPcP8UbQ3Ohi04lm5Mj7YM55QLJWoM9gXHnNJdX49wDlmK+aKiZjxN7
	 C1qQASd6gMd3H1O8uTc2Wf8Fzm1uQOxKkPkmsyOO9yqkd3lnywHyXwI+CZ3IAFmUi8
	 zWnkV9D6WDDgAs0fwztRJDWkCqu6BP9Wg8Ztyl3Lzzb9KlFI0SRndi90Q+wwWRO3EZ
	 jiTfIVaiuce5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9E7E41A4B;
	Fri, 15 May 2026 11:56:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C7D0BE7
 for <buildroot@buildroot.org>; Fri, 15 May 2026 11:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B978861542
 for <buildroot@buildroot.org>; Fri, 15 May 2026 11:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxae6G5Ewll5 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 11:56:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9089F60F29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9089F60F29
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9089F60F29
 for <buildroot@buildroot.org>; Fri, 15 May 2026 11:56:55 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-488b150559bso71638365e9.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 04:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778846213; x=1779451013;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T3XJtQrU3So/Hp0K3DrUNk8WlbsXeyyIMGSDeLo+Z/s=;
 b=InIwpvF7ALNXjPgJARO6PJHpXJJ2c/9M280pxtbyoG5KXXNZvMdEWL3F8xiIMjA6JS
 4OLp57CYqxlLvdxlJfsXMog85/lNXLMermDLi3MLPFldDoht06wwv49mABReZ/bEWUSA
 ReYPOIEiuavsQnz/x/+g3+mV27mz8Q5h56YIKtglgMkZBTrDXIrbOB9lxVhfmsuV4wOs
 enYVBN0Hjupb7PUzieOvUmK7OWimBaUTqw5eDZOguLWLsy1MuOUXQMtbgBhwbSf4gnrS
 KFkPPAPpfO4lYK2YXcrBm9LF1WSKbwytlNZr2QJAti/9ZcP5Tp/T2qzJ1hQKRCxXAPWf
 tYnA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+JYmd/2+0MZkwNNrtPQCB9srjPYIXaN8POcPJPuS97ob7ZKTzsJqVYK53tM94WW+AuKEpbYoRnLgM=@buildroot.org
X-Gm-Message-State: AOJu0Yx5KD4nb4RApYNLMqLABTbOaKKY/KzzK7afh9cp+b61Kagrg6/2
 UaLVATKYtOB5JEoVQmiLJKjJRup2SpKcDch9ekl8eL+Fy5zygBbENV12XbDVXIK4Vgo=
X-Gm-Gg: Acq92OExDnOu/qSFfyt32TDcYUl5OCcAgJeMksqFmHpVZUDpawfzPf3QEmzdZwQ2y6k
 278H0OfgadgP02KXAuhtOIHMkWEXKJfJh3ee9dS3hD3gjeHnR8cBhUmRmGsTASZos309Szr57aT
 NfwjS/aIeqC7tfLUiI1JFp8rB79Y++lqxXm5Rzyk/qc2yiUqKSHizECGl3TECI1QfVcS/7HfsSz
 +/5K6ccpwMlmFa1/WHzFNxikdLqXEde6rLzYM8CR22X8chMoJSIGeJHOrGyVjKxo/rViZcEBAxH
 BSKxsBpZDJ7FWReD1iGdLQHyGQomQAPHBOtaaNQnQcVohCmQ2dz0TwiYbUFGKXQxopoBPl7/Yi6
 ikNtmPTg6bDzWrlgRfi+J85PHjcITlMP4VTPPzRaRNTDtlknbN2mXxklvuUuW7MfT8qxgzBKB7w
 LDxeqxxvX/IWwYNOcizkfWOy/J3QsASlpKmeXGyfhmZ1N526ezuEusTDR/TSC19sjS0/KiwgArO
 XVm2VEWdolRGDcAZZZMhA0wmClqUGqUg3B63UJDfiiRWXgAHtoI22H2YMaSUUQt1g==
X-Received: by 2002:a05:600c:8b4b:b0:48f:d2fc:d025 with SMTP id
 5b1f17b1804b1-48fe60e14d0mr45510645e9.6.1778846213129; 
 Fri, 15 May 2026 04:56:53 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febe79ce3sm12648665e9.31.2026.05.15.04.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 04:56:52 -0700 (PDT)
Message-ID: <e41d50e2-d237-4f98-8d93-195d3ab6b520@smile.fr>
Date: Fri, 15 May 2026 13:56:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Kogut <joseph@anodize.com>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
References: <20260514-mesa3d-amdgpu-virtio-v3-0-dd75eca7fa50@anodize.com>
 <20260514-mesa3d-amdgpu-virtio-v3-1-dd75eca7fa50@anodize.com>
Content-Language: fr, en-US
In-Reply-To: <20260514-mesa3d-amdgpu-virtio-v3-1-dd75eca7fa50@anodize.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778846213; x=1779451013; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T3XJtQrU3So/Hp0K3DrUNk8WlbsXeyyIMGSDeLo+Z/s=;
 b=qk1zjpW7ru7K15I+PghG11KQBmrlbM0ZobqATtNFNUN3Zse8jH/caHwNDTYfRdUzdK
 QeIl5uBkJF7Ir/5yx5mFJqbcmKyzP+Z+HfvcNiu0q0BLk1LVK8k7E7a05byJvpEltkpP
 YCcTKMTPRftHP/nRZJ9jNZ0sYUc5JN9cPYCsk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=qk1zjpW7
Subject: Re: [Buildroot] [PATCH v3 1/4] package/mesa3d: add amdgpu-virtio
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

SGVsbG8gSm9zZXBoLAoKTGUgMTQvMDUvMjAyNiDDoCAyMzo0MywgSm9zZXBoIEtvZ3V0IGEgw6lj
cml0wqA6Cj4gQWRkIGEgY29uZmlnIHNlY3Rpb24gZm9yIGhvc3QgbmF0aXZlIGNvbnRleHQgZHJp
dmVycywgd2hpY2ggY3VycmVudGx5Cj4gdXNlIHZpcnRpby1ncHUgYXMgYSBiYWNrZW5kIHRvIG1l
ZGlhdGUgYWNjZXNzIHRvIHRoZSBob3N0IGtlcm5lbCdzIERSTQo+IHVBUEkuCj4gCj4gaHR0cHM6
Ly93d3cuY29sbGFib3JhLmNvbS9uZXdzLWFuZC1ibG9nL2Jsb2cvMjAyNS8wMS8xNS90aGUtc3Rh
dGUtb2YtZ2Z4LXZpcnR1YWxpemF0aW9uLXVzaW5nLXZpcmdscmVuZGVyZXIvCj4gCj4gU2lnbmVk
LW9mZi1ieTogSm9zZXBoIEtvZ3V0IDxqb3NlcGhAYW5vZGl6ZS5jb20+Cj4gUmV2aWV3ZWQtYnk6
IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoKU2VyaWVzIGFwcGxpZWQgdG8g
bmV4dCwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gLS0tCj4gIHBhY2thZ2UvbWVz
YTNkL0NvbmZpZy5pbiB8IDE5ICsrKysrKysrKysrKysrKysrKysKPiAgcGFja2FnZS9tZXNhM2Qv
bWVzYTNkLm1rIHwgIDYgKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygr
KQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4gYi9wYWNrYWdlL21l
c2EzZC9Db25maWcuaW4KPiBpbmRleCA2NmViZTA0Mzk0Li42MzNmOWVlYzFmIDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvbWVzYTNkL0NvbmZp
Zy5pbgo+IEBAIC0yNTQsNiArMjU0LDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9HQUxM
SVVNX0RSSVZFUl9SQURFT05TSQo+ICAJZGVwZW5kcyBvbiBCUjJfaTM4NiB8fCBCUjJfeDg2XzY0
Cj4gIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX01FU0EzRF9MTFZNCj4gIAlzZWxlY3QgQlIyX1BB
Q0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTUVTQTNE
X0hPU1RfTkFUSVZFX0NPTlRFWFRfU1VQUE9SVEVEX0RSSVZFUgo+ICAJc2VsZWN0IEJSMl9QQUNL
QUdFX0xJQkRSTV9BTURHUFUKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJEUk1fUkFERU9OCj4g
IAlzZWxlY3QgQlIyX1BBQ0tBR0VfTExWTV9BTURHUFUKPiBAQCAtMzM4LDYgKzMzOSw3IEBAIGNv
bmZpZyBCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUl9BTUQKPiAgCWRlcGVuZHMgb24g
QlIyX1RPT0xDSEFJTl9IQVNfU1lOQ180IHx8ICFCUjJfUEFDS0FHRV9YT1JHNyAjIGxpYnhzaG1m
ZW5jZQo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQkRSTV9BTURHUFUKPiAgCXNlbGVjdCBCUjJf
UEFDS0FHRV9MTFZNX0FNREdQVSBpZiBCUjJfUEFDS0FHRV9NRVNBM0RfTExWTQo+ICsJc2VsZWN0
IEJSMl9QQUNLQUdFX01FU0EzRF9IT1NUX05BVElWRV9DT05URVhUX1NVUFBPUlRFRF9EUklWRVIK
PiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUgo+ICAJaGVscAo+ICAJ
ICBSQURWIGlzIGEgdXNlcnNwYWNlIGRyaXZlciB0aGF0IGltcGxlbWVudHMgdGhlCj4gQEAgLTQx
Miw2ICs0MTQsMjMgQEAgY29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9WVUxLQU5fRFJJVkVSX1ZJ
UlRJTwo+ICAJaGVscAo+ICAJICBWdWxrYW4gVmlydElPICh2ZW51cykgZHJpdmVyLgo+ICAKPiAr
Y29tbWVudCAiSG9zdCBuYXRpdmUgY29udGV4dCBkcml2ZXJzIgo+ICsJZGVwZW5kcyBvbiBCUjJf
UEFDS0FHRV9NRVNBM0RfSE9TVF9OQVRJVkVfQ09OVEVYVF9TVVBQT1JURURfRFJJVkVSCj4gKwo+
ICtjb25maWcgQlIyX1BBQ0tBR0VfTUVTQTNEX0hPU1RfTkFUSVZFX0NPTlRFWFRfRFJJVkVSX0FN
REdQVQo+ICsJYm9vbCAiYW1kZ3B1LXZpcnRpbyIKPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0Vf
TUVTQTNEX0dBTExJVU1fRFJJVkVSX1JBREVPTlNJIHx8IFwKPiArCQlCUjJfUEFDS0FHRV9NRVNB
M0RfVlVMS0FOX0RSSVZFUl9BTUQKPiArCWhlbHAKPiArCSAgRW5hYmxlIFZpcnRJTyBzdXBwb3J0
IGZvciBBTURHUFUgbmF0aXZlIGNvbnRleHRzCj4gKwkgIHVzZWQgYnkgdGhlIHJhZGVvbnNpIChP
cGVuR0wpIGFuZCBSQURWIChWdWxrYW4pIGRyaXZlcnMuCj4gKwo+ICsJICBTZWxlY3QgdGhpcyB3
aGVuIHJ1bm5pbmcgTWVzYSBpbnNpZGUgYSB2aXJ0dWFsIG1hY2hpbmUKPiArCSAgd2l0aCB2aXJ0
aW8tZ3B1IGhvc3QgbmF0aXZlIGNvbnRleHQgc3VwcG9ydC4KPiArCj4gK2NvbmZpZyBCUjJfUEFD
S0FHRV9NRVNBM0RfSE9TVF9OQVRJVkVfQ09OVEVYVF9TVVBQT1JURURfRFJJVkVSCj4gKwlib29s
Cj4gKwo+ICBpZiBCUjJfUEFDS0FHRV9NRVNBM0RfRFJJVkVSCj4gIAo+ICBjb21tZW50ICJPcGVu
R0wgQVBJIFN1cHBvcnQiCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tayBi
L3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tawo+IGluZGV4IDFlYWE0YzU3N2UuLjM0NTk3OTY2YWYg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rCj4gKysrIGIvcGFja2FnZS9t
ZXNhM2QvbWVzYTNkLm1rCj4gQEAgLTE1MSw2ICsxNTEsMTIgQEAgaWZlcSAoJChCUjJfUEFDS0FH
RV9NRVNBM0RfR0FMTElVTV9EUklWRVJfRVROQVZJVikseSkKPiAgTUVTQTNEX0RFUEVOREVOQ0lF
UyArPSBob3N0LXB5dGhvbi1weWNwYXJzZXIKPiAgZW5kaWYKPiAgCj4gK2lmZXEgKCQoQlIyX1BB
Q0tBR0VfTUVTQTNEX0hPU1RfTkFUSVZFX0NPTlRFWFRfRFJJVkVSX0FNREdQVSkseSkKPiArTUVT
QTNEX0NPTkZfT1BUUyArPSAtRGFtZGdwdS12aXJ0aW89dHJ1ZQo+ICtlbHNlCj4gK01FU0EzRF9D
T05GX09QVFMgKz0gLURhbWRncHUtdmlydGlvPWZhbHNlCj4gK2VuZGlmCj4gKwo+ICBpZmVxICgk
KEJSMl9QQUNLQUdFX01FU0EzRF9WVUxLQU5fRFJJVkVSX0lOVEVMKSx5KQo+ICBNRVNBM0RfREVQ
RU5ERU5DSUVTICs9IGhvc3QtcHl0aG9uLXBseQo+ICBlbmRpZgo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
