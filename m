Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1D1FD88C4
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 22:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D8DA40A80;
	Tue, 10 Mar 2026 22:07:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6sJ0vKYg9tWm; Tue, 10 Mar 2026 22:07:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6789140A01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773180474;
	bh=6xTMtW9DocX5R69mC9Qj1tTBI/hGdkTbC/N648GnoRM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=beJc/PWJ9i90i1NILgvq83mz7wVAV3lZYpmlwEgBj17yVZKh86xG8ovfFTHPFZfFs
	 VMf9rKt2V6BB2YLbcDyRtR52ULXzvBA+oX/9qxjYJKNvQs2JgtiZLTiP3Mk25Bs1tD
	 LH8qzmz1xxX5UDmTAi2gkm2zlOXGRewaW52p7r1mzDb9u8I/QgFXM2T0KrGVA2XSmc
	 c4GKvvJIjBdX4JpZU2J3F22l0uJS55AZbpsYv5QuZae/NqXJyS4DbwkRb6rILU8GPq
	 yfyo2RZ6ggrqgXAjNHqkcUcD7REt8m23/ZADAxrNXZ7TfDfSotaWebAUYpJgZqE+cJ
	 oCJ117YjaA+ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6789140A01;
	Tue, 10 Mar 2026 22:07:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 223A633A
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08120408A8
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fayiSnYF0jF3 for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 22:07:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D5FAB4006B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5FAB4006B
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5FAB4006B
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:07:50 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4853e1ce427so28806195e9.3
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 15:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773180469; x=1773785269;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SooweJlnd0m6nHTxPUOxcHMRkCOXX0AYUi3ODizkPzo=;
 b=Sj9E6W9cQMigDDTMUq/O5CYyNpeWzlVmfBtwuaGFt2JBz/yIofLcYpvFvS0r0VrsdH
 RVxRucry8akRMsrM7jY90Gmwi3oyiaxk9e9z1lvtAHsa2VnqCmyGKsDcqBy343spdfaz
 iIWcWIHOsttxzPo3XWH/b7S/89AP0F3RdPj/Eoe23Cp2UnWCP5psOtKldRhKwwXywFvH
 dJdOheZA3dQR8SMm0z3iytVbo1CK/f5lVWdCJtP7e7q+qisludekTy5aEWUomZx30+7R
 ZdfbY2zkHGjZCsJcMCKXmBO8s8LaBz9wYEO7zQhzBynuNnn+kVRoh4pgnebl4DG2wzIl
 aDZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmgQf/GCd5lfeb5nOarP3EwIyRRmBACCnQa8Vz+y5iW2o+r1BiT6W8DzGu/dqw9g14a2KyXPLgV/0=@buildroot.org
X-Gm-Message-State: AOJu0YybEg5QZdL2A6KpqSSEKtUNVX7GXfuwRTU75Z5gfhMVL2Wrx/+I
 oSv1PLupJooJ3HDkO+ROMtyMm3YKoTse2VgTDhPjGBprHxcF2lU0w+IeDBKgboShrAk=
X-Gm-Gg: ATEYQzyUd6E0aTDZePFQfTDBGoin8D/aNwSXiGMMHxhih1w1Yoj6hDgUKNUs8q4ubQ6
 HWytZc9YzZFVfalt+qmaTnWbveqA/oE30De6n7/cOJ1bU3JDer1Qdu/sYBYXX4H1bGqc34Ukv86
 lq6DneYGQ/gVwOjs1lt5DQmUWO1RVYHhVw43j0VErOO+pqMoeop3zzg2aBsBE2NzavCwatYsXGk
 w1MEjaTCuyo/76VgZT2JdWwe3nFk8z6MAZCJayZ7LIlele9izjfH29Kock/TsTUD4LAb/4YnAqa
 wyXU76ATzhO145G5+KdK9FAKNhCTVLI0m5V/69aVp1ZrpYDKwNQdUSoLda8icjS92hdwri5M/DA
 YWCmUcDFdJM6R8V1TDUXAwtCKnxPwsRZKyGmLBrumHb7EgA7O9WaqIZtLErLu9FqZ0ndfwA9ICJ
 OdKmnyA+uWbHk5ErKW0AP/zd3PyIXF0NsHBsP23+qJ3xzdg1v6pEDPJKWUnjfEYXCWaqSsadt1U
 TP5SyKhwqvYmcl9+iNdOpJySCFqfkcAA2cmXseiiqHcWf+3KW34CygC27ePR3sgZw==
X-Received: by 2002:a05:600c:8b13:b0:485:30d4:6b9e with SMTP id
 5b1f17b1804b1-4854b100b66mr6427305e9.21.1773180468521; 
 Tue, 10 Mar 2026 15:07:48 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b5e9179sm3508975e9.3.2026.03.10.15.07.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 15:07:47 -0700 (PDT)
Message-ID: <3723d980-5db5-41cf-9793-44726e88adb7@smile.fr>
Date: Tue, 10 Mar 2026 23:07:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 buildroot@buildroot.org
Cc: Thomas Huth <th.huth@posteo.eu>, Thomas Huth <th.huth+br@posteo.eu>,
 Cyril Bur <cyrilbur@gmail.com>
References: <20260225105537.1420002-1-alex.bennee@linaro.org>
 <20260225105537.1420002-3-alex.bennee@linaro.org>
 <5eeddaba-4f7e-492b-811b-c7377b69cb17@smile.fr>
Content-Language: fr
In-Reply-To: <5eeddaba-4f7e-492b-811b-c7377b69cb17@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773180469; x=1773785269; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SooweJlnd0m6nHTxPUOxcHMRkCOXX0AYUi3ODizkPzo=;
 b=WYfmlGE3qJERzqAZ9TQEqeVrRMU2n0Qe+B2PxESh/x0tygZdSZEr2yQLo2nFAyiews
 nd9PYZw+I8mW9dtKIQvxfdxLb9BXzVYt4feJv7I6WmPc47J4ySCxSgUaRtVojF8dpiIj
 Cc+CZexSXRXHjBCRZ2Bct50w94GK42LKzcbwg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=WYfmlGE3
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

TGUgMTAvMDMvMjAyNiDDoCAyMzowMiwgUm9tYWluIE5hb3VyIGEgw6ljcml0wqA6Cj4gSGVsbG8g
QWxleCwgQWxsLAo+IAo+IExlIDI1LzAyLzIwMjYgw6AgMTE6NTUsIEFsZXggQmVubsOpZSBhIMOp
Y3JpdMKgOgo+PiBUbyBydW4gdGhlIHRlc3RzIHdlIG5lZWQgYSBzeXN0ZW0gUUVNVSwgdGltZW91
dCwgZ2V0Y29uZiBhbmQgbm1hcC1uY2F0Cj4+IHNvIHVwZGF0ZSB0aGUgc2VsZWN0L2RlcGVuZHMg
Zm9yIHRoZW0uIEFzIHdlIG5lZWQgYXQgbGVhc3QgR0NDIDggd2UKPj4gY2FuIGRyb3AgdGhlIHNw
ZWNpZmljIHJlcXVpcmVtZW50IGZvciBvbGQgeDg2LTY0IHRlc3RzLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Cj4+IFJldmlld2VkLWJ5
OiBUaG9tYXMgSHV0aCA8dGguaHV0aEBwb3N0ZW8uZXU+Cj4+Cj4+IC0tLQo+PiB2Mgo+PiAgIC0g
cmVtb3ZlIG9sZCBnY2Mgbm90ZXMgYXMgd2UgbmVlZCBhdCBsZWFzdCA4IGFueXdheQo+PiAgIC0g
c2VsZWN0IFFFTVUgYW5kIG90aGVyIHJ1bnRpbWUgZGVwcwo+PiAgIC0gbWVudGlvbiB0aGUgcnVu
dGltZSBkZXBzCj4+ICAgLSBhZGQgc3VwcG9ydCBmb3IgZ2V0Y29uZiBmcm9tIGV4dGVybmFsIHRv
b2xjaGFpbgo+PiAgIC0gdXBkYXRlIGNvbW1lbnQgZmFsbGJhY2sKPj4gdjUKPj4gICAtIGtlZXAg
aTM4Ni94ODYtNjQgdGFyZ2V0L2hvc3QgY29tbWVudHMKPj4gICAtIGFkZCAhQlIyX1BBQ0tBR0Vf
UUVNVV9BUkNIX1NVUFBPUlRTX1RBUkdFVCB0byBjb21tZW50IGRlcHMKPj4gLS0tCj4+ICBwYWNr
YWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiB8IDIzICsrKysrKysrKysrKysrKysrKy0tLS0t
Cj4+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluIGIvcGFja2Fn
ZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4KPj4gaW5kZXggODE3ZDNjNGE4Zi4uNzRjMzJmNDZl
MCAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4KPj4gKysr
IGIvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4KPj4gQEAgLTE2LDExICsxNiwyMCBA
QCBjb25maWcgQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFNfQVJDSF9TVVBQT1JUUwo+PiAgY29u
ZmlnIEJSMl9QQUNLQUdFX0tWTV9VTklUX1RFU1RTCj4+ICAJYm9vbCAia3ZtLXVuaXQtdGVzdHMi
Cj4+ICAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9LVk1fVU5JVF9URVNUU19BUkNIX1NVUFBPUlRT
Cj4+IC0JIyBvbiBpMzg2IGFuZCB4ODYtNjQsIF9fYnVpbHRpbl9yZWFjaGFibGUgaXMgdXNlZCwg
c28gd2UgbmVlZAo+PiAtCSMgZ2NjIDQuNSBhdCBsZWFzdC4gb24gaTM4Niwgd2UgdXNlIHRoZSB0
YXJnZXQgZ2NjLCB3aGlsZSBvbgo+PiArCSMgT24gaTM4Niwgd2UgdXNlIHRoZSB0YXJnZXQgZ2Nj
LCB3aGlsZSBvbgo+PiAgCSMgeDg2LTY0IHdlIHVzZSB0aGUgaG9zdCBnY2MgKHNlZSAubWsgZmls
ZSBmb3IgZGV0YWlscykKPj4gLQlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNU
XzRfNSB8fCAhQlIyX2kzODYKPj4gIAlkZXBlbmRzIG9uIEJSMl9IT1NUQVJDSCA9ICJ4ODZfNjQi
IHx8ICFCUjJfeDg2XzY0Cj4+ICsJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFT
VF84ICMgcWVtdQo+PiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfUUVNVV9BUkNIX1NVUFBPUlRT
X1RBUkdFVAo+PiArCWRlcGVuZHMgb24gKEJSMl9QQUNLQUdFX0dMSUJDX1VUSUxTIHx8IFwKPj4g
KwkJICAgIEJSMl9VQ0xJQkNfSU5TVEFMTF9VVElMUyB8fCBcCj4+ICsJCSAgICBCUjJfVE9PTENI
QUlOX0VYVEVSTkFMX0xJQkNfVVRJTFNfQ09QWSkgIyBydW50aW1lIGdldGNvbmYKPj4gKwlzZWxl
Y3QgQlIyX1BBQ0tBR0VfUUVNVQo+PiArCXNlbGVjdCBCUjJfUEFDS0FHRV9RRU1VX1NZU1RFTSAj
IHJ1bnRpbWUgZm9yIHFlbXUtc3lzdGVtLSRBUkNICj4+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0NP
UkVVVElMUyAjIHJ1bnRpbWUgZm9yIHRpbWVvdXQKPj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfQkFT
SCAjIHJ1bnRpbWUKClNlbGVjdCBiYXNoIGhlcmUgcmVxdWlyZXMgdG8gc2VsZWN0IEJSMl9QQUNL
QUdFX0JVU1lCT1hfU0hPV19PVEhFUlMgZmlyc3QuCgpXQVJOSU5HOiB1bm1ldCBkaXJlY3QgZGVw
ZW5kZW5jaWVzIGRldGVjdGVkIGZvciBCUjJfUEFDS0FHRV9CQVNICiAgRGVwZW5kcyBvbiBbbl06
IEJSMl9VU0VfTU1VIFs9eV0gJiYgQlIyX1BBQ0tBR0VfQlVTWUJPWF9TSE9XX09USEVSUyBbPW5d
Cgo+PiArCXNlbGVjdCBCUjJfUEFDS0FHRV9OTUFQCj4+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX05N
QVBfTkNBVCAjIHJ1bnRpbWUgZm9yIG5jYXQKClNhbWUgZm9yIG5tYXAgYW5kIGNvcmV1dGlscyB0
aGV5IHJlcXVpcmVzIEJSMl9QQUNLQUdFX0JVU1lCT1hfU0hPV19PVEhFUlMuCgo+PiAgCXNlbGVj
dCBCUjJfSE9TVEFSQ0hfTkVFRFNfSUEzMl9DT01QSUxFUiBpZiBCUjJfeDg2XzY0Cj4+ICAJaGVs
cAo+PiAgCSAga3ZtLXVuaXQtdGVzdHMgaXMgYSBwcm9qZWN0IGFzIG9sZCBhcyBLVk0uIEFzIGl0
cyBuYW1lCj4+IEBAIC00MCw2ICs0OSwxMCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfS1ZNX1VOSVRf
VEVTVFMKPj4gIAo+PiAgCSAgaHR0cDovL3d3dy5saW51eC1rdm0ub3JnL3BhZ2UvS1ZNLXVuaXQt
dGVzdHMKPiAKPiBOb3QgcmVsYXRlZCB0byB0aGlzIHBhdGNoLCBidXQgdGhpcyBsaW5rIGNvdWxk
IGhhdmUgYmVlbiB1cGRhdGVkIHRvIGh0dHBzLgo+IAo+IFJldmlld2VkLWJ5OiBSb21haW4gTmFv
dXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KCldpdGggdGhhdCBmaXhlZC4uLgoKQmVzdCByZWdh
cmRzLApSb21haW4KCgo+IAo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPiAKPiAKPj4gIAo+PiAt
Y29tbWVudCAia3ZtLXVuaXQtdGVzdHMgbmVlZHMgYSB0b29sY2hhaW4gdy8gZ2NjID49IDQuNSIK
Pj4gK2NvbW1lbnQgImt2bS11bml0LXRlc3RzIG5lZWRzIGEgdG9vbGNoYWluIHcvIHV0aWxzLCBn
Y2MgPj0gOCBhbmQgcWVtdSIKPj4gIAlkZXBlbmRzIG9uIEJSMl9pMzg2Cj4+IC0JZGVwZW5kcyBv
biAhQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNF81Cj4+ICsJZGVwZW5kcyBvbiAhQlIyX1RP
T0xDSEFJTl9HQ0NfQVRfTEVBU1RfOAo+PiArCWRlcGVuZHMgb24gIShCUjJfUEFDS0FHRV9HTElC
Q19VVElMUyB8fCBcCj4+ICsJCUJSMl9VQ0xJQkNfSU5TVEFMTF9VVElMUyB8fCBcCj4+ICsJCUJS
Ml9UT09MQ0hBSU5fRVhURVJOQUxfTElCQ19VVElMU19DT1BZKQo+PiArCWRlcGVuZHMgb24gIUJS
Ml9QQUNLQUdFX1FFTVVfQVJDSF9TVVBQT1JUU19UQVJHRVQKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
