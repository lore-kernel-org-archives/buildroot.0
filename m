Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC87C0218A
	for <buildroot@archiver.kernel.org>; Thu, 30 Jan 2025 18:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60E2042581;
	Thu, 30 Jan 2025 18:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r-Mm37HJx_Kr; Thu, 30 Jan 2025 18:18:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D763F4254F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D763F4254F;
	Thu, 30 Jan 2025 18:18:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A3F1B128
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 18:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93FDA4254F
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 18:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uormWO9Sg7Gv for <buildroot@buildroot.org>;
 Thu, 30 Jan 2025 18:18:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B561E424FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B561E424FF
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B561E424FF
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 18:18:24 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43618283dedso11841525e9.3
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 10:18:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738261102; x=1738865902;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tQF5UK+/wQBerO8kS+2OGdldU0h7CTwQ6jKxyvHKIO0=;
 b=eDxoVfGKIbr8j2eOdG8Sw4Ol6fYEkSiEk43VQNQNjQ6M9/uethgFZTCXXQujfKEMwR
 8lnY4YwtweSF2L8ooYCiTPqe3eaXouDzApKFj9QVcDndemRFlcx5CUuit4rtC8SsxqV2
 122P5ZfBDRNyg21eW4gcJLhqJ0O94IbdUUgRd6nUrb3OOr69Pn0rnYGmhxeDQHCCATjx
 e0U/tSI8ykPmH+MxHgYh6DRGwybEpM2rWv+SN1pt0FQavspg0grHkcAaLJ7CHKD9qNnw
 JN1AR6Lr4rBbzhiSk+zeVl7hSEuHC4S8dxXP/C3wSYcxFELmFFKgafwlag4/zdNUYCae
 f2kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyJ4cJ1GmbYAEtjaOV+WZz2dF4A97tVom5Idkx6Hvr0Xww29nUrkxC6yHk5orHZNKto0D5A92UC2Q=@buildroot.org
X-Gm-Message-State: AOJu0YzjtJpKOzcqgs+GEcF33MrxI7b5pz3+6/3YPPDQAYyZmt9o8qxa
 iYAb+RhXN11ZQNKMpTPn6GwRWymD9eAeQJyQrUbdmjFoNMbtOHLGnCWn5pD5SMhugQdn27kpMMH
 Y
X-Gm-Gg: ASbGncvcviCbjzO7troj076cot5refQU84Qu+L97Bok0z87ppvkLeH7/W1c3fdmiHeH
 ZsfplMZgRwfhAEXOvpAA5uhJk97exD938NzIX/r/TspqLObQmRtOFXWapmAMmph4ZUTIGNxjFvT
 Q5SncYnDNZ17giVK8UTF+Mh1/8dGFWhso0X3btryE1l9aL0A7cAkfgzdOd5gy/Tev907UOP+1TI
 I9QIb3vpfFjlzCXutx9rFaltN/5ePk6Mn0oxhqJiMGJ+t1f7NbgYtOuzN6POWFuHWAVkuxExJIS
 9uyS7EYx47sqKF3N2xe3TgIMZbfsLmt1jXJM8eiQQEcNY/DsIFvmUqYfO4BuLndwoU0t8MCeD2Q
 Ck7Oz7aA0coCVheaBnI/vIgwti409MsRfXm7BrhsfNn+W3EABtRg=
X-Google-Smtp-Source: AGHT+IFvQfPFjdFqzCIPaOpY2gCSqYrwe0aG/jQIXCzQ+g7ry6IOg+Ay3rbQv+BljHwXKvDJEPHuhQ==
X-Received: by 2002:a05:600c:3c88:b0:434:9c60:95a3 with SMTP id
 5b1f17b1804b1-438dc3c2992mr93492215e9.11.1738261102505; 
 Thu, 30 Jan 2025 10:18:22 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23d42c7sm31811425e9.3.2025.01.30.10.18.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 10:18:22 -0800 (PST)
Message-ID: <b7a90157-749b-42c8-8c88-b2eebde00fc4@smile.fr>
Date: Thu, 30 Jan 2025 19:18:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
References: <20250129095716.2511434-1-romain.naour@smile.fr>
 <20250129095716.2511434-2-romain.naour@smile.fr>
 <e68817f0-312c-4980-837c-7264656457ca@grenoble.cnrs.fr>
Content-Language: fr
In-Reply-To: <e68817f0-312c-4980-837c-7264656457ca@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738261102; x=1738865902; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tQF5UK+/wQBerO8kS+2OGdldU0h7CTwQ6jKxyvHKIO0=;
 b=ga+F4vmoeSG/DmTtkcO0cuEoSCUM6zj0Hn1yK64DF1kdHQfu3PGjcFoOJQMao80UtB
 pLvVPKcz+kpOunnqNYY1B5gga4S1wEFij/70yYReArlk4SK77uwXhZLN4Pay+/H6iWbo
 XiE2Y0gRde3VNWHPI4JCozjfgW3onzuQNkgo8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ga+F4vmo
Subject: Re: [Buildroot] [PATCHv4 2/2] configs/acmesystems_acqua_a5_*: bump
 to Linux 6.12.9
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

SGVsbG8gRWRnYXIsCgpMZSAyOS8wMS8yMDI1IMOgIDE3OjUxLCBFZGdhciBCb25ldCBhIMOpY3Jp
dMKgOgo+IEhpIQo+IAo+IE9uIDIwMjUtMDEtMjksIDEwOjU3LCBSb21haW4gTmFvdXIgd3JvdGU6
Cj4+IFVzZSB0aGUgbmV3bHkgaW50cm9kdWNlZCBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9EVFNf
T1ZFUkxBWQo+PiBvcHRpb24gdG8gcHJvdmlkZSB0aGUgT3V0LW9mLXRyZWUgRGV2aWNlIFRyZWUg
U291cmNlIGZpbGUgd2l0aAo+PiBpdHMgdmVuZG9yIHN1YmRpcmVjdG9yeSB0aGF0IGlzIG5lZWRl
ZCBzaW5jZSBrZXJuZWwgNi4xMiBbMV0uCj4+Cj4+IFJldmVydCB0aGUgc2FtYTVkMzEuZHRzaSBp
bmNsdWRlIHBhdGggdXBkYXRlIGFkZGVkIGJ5IHRoZSBwcmV2aW91cwo+PiBrZXJuZWwgdmVyc2lv
biBidW1wIDYuNi4xMiBbMl0uCj4+Cj4+IEFzIG5vdGljZWQgYnkgTWljaGFlbCBXYWxsZSwgbmV3
ZXIgT09UIGRldmljZSB0cmVlcyBzaG91bGQgdXNlIHRoZQo+PiBzYW1lICNpbmNsdWRlIGRpcmVj
dGl2ZXMgYXMgdGhlIGluLXRyZWUgZGV2aWNlIHRyZWVzIHRvIGVhc2UKPj4gc2hhcmluZyB0aGUg
ZmlsZXMgYmV0d2VlbiB1LWJvb3QsIGxpbnV4IGFuZCBPT1QgZXh0ZXJuYWwgdHJlZXMgWzNdLgo+
Pgo+PiBbMV0gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL3BpcGVybWFpbC9idWlsZHJvb3Qv
MjAyNC1PY3RvYmVyLzc2NTQ2My5odG1sCj4+IFsyXSA4ZmI1MjA5ODg1ICgiY29uZmlncy9hY21l
c3lzdGVtc19hY3F1YV9hNV8qOiBidW1wIHRvIExpbnV4IDYuNi4xMiIpCj4+IFszXSBodHRwczov
L2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvRDZVRzVaMUhVTjlOLkdXVkhCNEw4MjNaQ0BrZXJu
ZWwub3JnLwo+Pgo+PiBDYzogRWRnYXIgQm9uZXQgPGJvbmV0QGdyZW5vYmxlLmNucnMuZnI+Cj4+
IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+IAo+
IEFja2VkLWJ5OiBFZGdhciBCb25ldCA8Ym9uZXRAZ3Jlbm9ibGUuY25ycy5mcj4KPiBUZXN0ZWQt
Ynk6IEVkZ2FyIEJvbmV0IDxib25ldEBncmVub2JsZS5jbnJzLmZyPgo+IAo+IEFmdGVyIGJ1aWxk
LXRlc3RpbmcgdGhlIHByZXZpb3VzIHBhdGNoIGluIHRoZSBzZXJpZXMsIEkgYWRkZWQgdGhpcyBv
bmUKPiBvbiB0b3AgYW5kIGJ1aWxkLXRlc3RlZCBhZ2FpbjoKPiAKPiAgICAgIyBUZXN0IHRoZSBy
ZWd1bGFyLCBuby1PVkVSUklERV9TUkNESVIgY2FzZS4KPiAgICAgbWFrZSBsaW51eC1kaXJjbGVh
bgo+ICAgICBnaXQgYW0gMDAwMi1jb25maWdzLWFjbWVzeXN0ZW1zX2FjcXVhX2E1Xy1idW1wLXRv
LUxpbnV4LTYuMTIuOS5wYXRjaAo+ICAgICBtYWtlIGFjbWVzeXN0ZW1zX2FjcXVhX2E1XzUxMm1i
X2RlZmNvbmZpZwo+ICAgICBtYWtlIGxpbnV4Cj4gCj4gICAgICMgVGVzdCB0aGUgT1ZFUlJJREVf
U1JDRElSIGNhc2UuCj4gICAgIG1ha2UgbGludXgtZGlyY2xlYW4KPiAgICAgZ2l0IC1DICRIT01F
L3NyYy9saW51eCBjaGVja291dCB2Ni4xMi45Cj4gICAgIGVjaG8gIkxJTlVYX09WRVJSSURFX1NS
Q0RJUiA9ICRIT01FL3NyYy9saW51eCIgPiBsb2NhbC5tawo+ICAgICBtYWtlIGFjbWVzeXN0ZW1z
X2FjcXVhX2E1XzUxMm1iX2RlZmNvbmZpZwo+ICAgICBtYWtlIGxpbnV4Cj4gCj4gSSB0aGVuIGJ1
aWx0IGEgY29tcGxldGUgc3lzdGVtLCBhbmQgcnVuLXRlc3RlZCBpdCBvbiBhbiBhY3R1YWwgQWNx
dWEKPiBib2FyZC4gSSBhbHNvIHRlc3RlZCB3aXRoIHRoZSBsYXRlc3QgcG9pbnQgcmVsZWFzZSAo
Ni4xMi4xMSkuCgpJJ2xsIGxldCB5b3UgZG8gdGhlIG5leHQgdmVyc2lvbiBidW1wLCBqdXN0IHRv
IGJlIG9uIHRoZSBzYWZlIHNpZGUgOikKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBCZXN0
IHJlZ2FyZHMsCj4gCj4gRWRnYXIgQm9uZXQuCj4gCj4+IC0tLQo+PiAgLi4uL2FjcXVhLWE1L3sg
PT4gZHRzL21pY3JvY2hpcH0vYXQ5MS1zYW1hNWQzX2FjcXVhLmR0cyAgICAgfCAyICstCj4+ICBi
b2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNS9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2ggICAgICAg
ICB8IDIgKy0KPj4gIGNvbmZpZ3MvYWNtZXN5c3RlbXNfYWNxdWFfYTVfMjU2bWJfZGVmY29uZmln
ICAgICAgICAgICAgICAgIHwgNiArKystLS0KPj4gIGNvbmZpZ3MvYWNtZXN5c3RlbXNfYWNxdWFf
YTVfNTEybWJfZGVmY29uZmlnICAgICAgICAgICAgICAgIHwgNiArKystLS0KPj4gIDQgZmlsZXMg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+PiAgcmVuYW1lIGJvYXJk
L2FjbWVzeXN0ZW1zL2FjcXVhLWE1L3sgPT4gZHRzL21pY3JvY2hpcH0vYXQ5MS1zYW1hNWQzX2Fj
cXVhLmR0cyAoOTklKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYm9hcmQvYWNtZXN5c3RlbXMvYWNxdWEt
YTUvYXQ5MS1zYW1hNWQzX2FjcXVhLmR0cyBiL2JvYXJkL2FjbWVzeXN0ZW1zL2FjcXVhLWE1L2R0
cy9taWNyb2NoaXAvYXQ5MS1zYW1hNWQzX2FjcXVhLmR0cwo+PiBzaW1pbGFyaXR5IGluZGV4IDk5
JQo+PiByZW5hbWUgZnJvbSBib2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNS9hdDkxLXNhbWE1ZDNf
YWNxdWEuZHRzCj4+IHJlbmFtZSB0byBib2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNS9kdHMvbWlj
cm9jaGlwL2F0OTEtc2FtYTVkM19hY3F1YS5kdHMKPj4gaW5kZXggNDExZDE5NDJmNS4uNjBiZThh
NjdjZCAxMDA2NDQKPj4gLS0tIGEvYm9hcmQvYWNtZXN5c3RlbXMvYWNxdWEtYTUvYXQ5MS1zYW1h
NWQzX2FjcXVhLmR0cwo+PiArKysgYi9ib2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNS9kdHMvbWlj
cm9jaGlwL2F0OTEtc2FtYTVkM19hY3F1YS5kdHMKPj4gQEAgLTksNyArOSw3IEBACj4+ICAgKiBM
aWNlbnNlZCB1bmRlciBHUEx2MiBvciBsYXRlci4KPj4gICAqLwo+PiAgL2R0cy12MS87Cj4+IC0j
aW5jbHVkZSAibWljcm9jaGlwL3NhbWE1ZDMxLmR0c2kiCj4+ICsjaW5jbHVkZSAic2FtYTVkMzEu
ZHRzaSIKPj4gIAo+PiAgLyB7Cj4+ICAJbW9kZWwgPSAiQWNtZSBTeXN0ZW1zIEFjcXVhIFNPTSI7
Cj4+IGRpZmYgLS1naXQgYS9ib2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNS9wYXRjaGVzL2xpbnV4
L2xpbnV4Lmhhc2ggYi9ib2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNS9wYXRjaGVzL2xpbnV4L2xp
bnV4Lmhhc2gKPj4gaW5kZXggNGIyMGEwMDlhNy4uN2E0YzRlNTdjOSAxMDA2NDQKPj4gLS0tIGEv
Ym9hcmQvYWNtZXN5c3RlbXMvYWNxdWEtYTUvcGF0Y2hlcy9saW51eC9saW51eC5oYXNoCj4+ICsr
KyBiL2JvYXJkL2FjbWVzeXN0ZW1zL2FjcXVhLWE1L3BhdGNoZXMvbGludXgvbGludXguaGFzaAo+
PiBAQCAtMSwyICsxLDIgQEAKPj4gICMgTG9jYWxseSBjYWxjdWxhdGVkCj4+IC1zaGEyNTYgIGI2
NmE1Yjg2M2IwZjg2Njk0NDhiNzRjYTgzYmQ2NDFhODU2ZjE2NGIyOTk1NmU1MzliYmNiNWZkZWVh
YjljYzYgIGxpbnV4LTYuNi4zMC50YXIueHoKPj4gK3NoYTI1NiAgODdiZTAzNjBkZjA5MzFiMzQw
ZDJiYWMzNTE2MWE1NDgwNzBmYmMzYThjMzUyYzQ5ZTIxZTk2NjY2YzI2YWViNCAgbGludXgtNi4x
Mi45LnRhci54ego+PiBkaWZmIC0tZ2l0IGEvY29uZmlncy9hY21lc3lzdGVtc19hY3F1YV9hNV8y
NTZtYl9kZWZjb25maWcgYi9jb25maWdzL2FjbWVzeXN0ZW1zX2FjcXVhX2E1XzI1Nm1iX2RlZmNv
bmZpZwo+PiBpbmRleCBiMTAyZGRlMGJhLi44YTFmNjMyOGEwIDEwMDY0NAo+PiAtLS0gYS9jb25m
aWdzL2FjbWVzeXN0ZW1zX2FjcXVhX2E1XzI1Nm1iX2RlZmNvbmZpZwo+PiArKysgYi9jb25maWdz
L2FjbWVzeXN0ZW1zX2FjcXVhX2E1XzI1Nm1iX2RlZmNvbmZpZwo+PiBAQCAtMiw3ICsyLDcgQEAg
QlIyX2FybT15Cj4+ICBCUjJfY29ydGV4X2E1PXkKPj4gIEJSMl9BUk1fRU5BQkxFX1ZGUD15Cj4+
ICBCUjJfQVJNX0lOU1RSVUNUSU9OU19USFVNQjI9eQo+PiAtQlIyX1BBQ0tBR0VfSE9TVF9MSU5V
WF9IRUFERVJTX0NVU1RPTV82XzY9eQo+PiArQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJT
X0NVU1RPTV82XzEyPXkKPj4gIEJSMl9HTE9CQUxfUEFUQ0hfRElSPSJib2FyZC9hY21lc3lzdGVt
cy9hY3F1YS1hNS9wYXRjaGVzIgo+PiAgQlIyX0RPV05MT0FEX0ZPUkNFX0NIRUNLX0hBU0hFUz15
Cj4+ICBCUjJfU1lTVEVNX0RIQ1A9ImV0aDAiCj4+IEBAIC0xMCwxMCArMTAsMTAgQEAgQlIyX1JP
T1RGU19QT1NUX0lNQUdFX1NDUklQVD0ic3VwcG9ydC9zY3JpcHRzL2dlbmltYWdlLnNoIgo+PiAg
QlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdTPSItYyBib2FyZC9hY21lc3lzdGVtcy9hY3F1YS1h
NS9nZW5pbWFnZS5jZmciCj4+ICBCUjJfTElOVVhfS0VSTkVMPXkKPj4gIEJSMl9MSU5VWF9LRVJO
RUxfQ1VTVE9NX1ZFUlNJT049eQo+PiAtQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9W
QUxVRT0iNi42LjMwIgo+PiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0i
Ni4xMi45Igo+PiAgQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9InNhbWE1Igo+PiAgQlIyX0xJ
TlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15Cj4+IC1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9EVFNf
UEFUSD0iYm9hcmQvYWNtZXN5c3RlbXMvYWNxdWEtYTUvYXQ5MS1zYW1hNWQzX2FjcXVhLmR0cyIK
Pj4gK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19PVkVSTEFZPSJib2FyZC9hY21lc3lzdGVt
cy9hY3F1YS1hNS9kdHMiCj4+ICBCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTD15
Cj4+ICBCUjJfVEFSR0VUX1JPT1RGU19FWFQyPXkKPj4gIEJSMl9UQVJHRVRfUk9PVEZTX0VYVDJf
ND15Cj4+IGRpZmYgLS1naXQgYS9jb25maWdzL2FjbWVzeXN0ZW1zX2FjcXVhX2E1XzUxMm1iX2Rl
ZmNvbmZpZyBiL2NvbmZpZ3MvYWNtZXN5c3RlbXNfYWNxdWFfYTVfNTEybWJfZGVmY29uZmlnCj4+
IGluZGV4IGRhNTRlYWY2MjAuLmI0N2RhYTE1ZjkgMTAwNjQ0Cj4+IC0tLSBhL2NvbmZpZ3MvYWNt
ZXN5c3RlbXNfYWNxdWFfYTVfNTEybWJfZGVmY29uZmlnCj4+ICsrKyBiL2NvbmZpZ3MvYWNtZXN5
c3RlbXNfYWNxdWFfYTVfNTEybWJfZGVmY29uZmlnCj4+IEBAIC0yLDcgKzIsNyBAQCBCUjJfYXJt
PXkKPj4gIEJSMl9jb3J0ZXhfYTU9eQo+PiAgQlIyX0FSTV9FTkFCTEVfVkZQPXkKPj4gIEJSMl9B
Uk1fSU5TVFJVQ1RJT05TX1RIVU1CMj15Cj4+IC1CUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURF
UlNfQ1VTVE9NXzZfNj15Cj4+ICtCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9N
XzZfMTI9eQo+PiAgQlIyX0dMT0JBTF9QQVRDSF9ESVI9ImJvYXJkL2FjbWVzeXN0ZW1zL2FjcXVh
LWE1L3BhdGNoZXMiCj4+ICBCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tfSEFTSEVTPXkKPj4gIEJS
Ml9TWVNURU1fREhDUD0iZXRoMCIKPj4gQEAgLTEwLDEwICsxMCwxMCBAQCBCUjJfUk9PVEZTX1BP
U1RfSU1BR0VfU0NSSVBUPSJzdXBwb3J0L3NjcmlwdHMvZ2VuaW1hZ2Uuc2giCj4+ICBCUjJfUk9P
VEZTX1BPU1RfU0NSSVBUX0FSR1M9Ii1jIGJvYXJkL2FjbWVzeXN0ZW1zL2FjcXVhLWE1L2dlbmlt
YWdlLmNmZyIKPj4gIEJSMl9MSU5VWF9LRVJORUw9eQo+PiAgQlIyX0xJTlVYX0tFUk5FTF9DVVNU
T01fVkVSU0lPTj15Cj4+IC1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2
LjYuMzAiCj4+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjEyLjki
Cj4+ICBCUjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJRz0ic2FtYTUiCj4+ICBCUjJfTElOVVhfS0VS
TkVMX0RUU19TVVBQT1JUPXkKPj4gLUJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRIPSJi
b2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNS9hdDkxLXNhbWE1ZDNfYWNxdWEuZHRzIgo+PiArQlIy
X0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX09WRVJMQVk9ImJvYXJkL2FjbWVzeXN0ZW1zL2FjcXVh
LWE1L2R0cyIKPj4gIEJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NMPXkKPj4gIEJS
Ml9UQVJHRVRfUk9PVEZTX0VYVDI9eQo+PiAgQlIyX1RBUkdFVF9ST09URlNfRVhUMl80PXkKPiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
