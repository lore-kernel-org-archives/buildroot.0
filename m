Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5F6CA0EFF
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 18:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97A688145E;
	Sat, 23 Aug 2025 18:44:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NU25sh9WqY1w; Sat, 23 Aug 2025 18:44:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFFB4813F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFFB4813F9;
	Sat, 23 Aug 2025 18:44:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D9CE71E
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 18:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7447C41517
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 18:44:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUvlo7eIalXJ for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 18:44:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 43849414FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43849414FD
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43849414FD
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 18:44:32 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45a1b0d224dso15937165e9.3
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 11:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755974670; x=1756579470;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7W8VA3aRspJYnCEDEXn8cmglpM9Dh198Sz35dalCGj4=;
 b=JQ0Xy+sWadEpnsVwK++Oy0zvMB2p8mU1ko39BzYviRbzEo+XWhffaGwUElUXDN+Ui1
 tdylkRgyTKEPeWaiJuWKBEnWPLJpJu23Vu2ARnQ/6aERZKd/YYbKDQxt6lxkL+koUsKx
 wJJ3uOm5EMZ9h0n6Ded7u8gVwZhlTp5wDnAT0OW46RBITmvKi0maMtxRvxpgEhxOJw7O
 9jduvV7qo51bubqx64UpC8a4skdwDzRIcNNkcQLwD5up6vAV4t6Pwwi0aGL2AhlknBzI
 WyuQBb2S5Tl0/jMpVtpGMblZ1KzQsdYEuLJ8NgLoC1nLz7flQve7SWH+ckQy19ztqQ9Z
 Slyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZqRbcZFNymkjp/u/F6+DRYI27r4aRf9FGC5LI41kL9kTt++PqUPg63jDj31O+q6LYjoOmYslGtcY=@buildroot.org
X-Gm-Message-State: AOJu0YzgMmVtA7GUzNUoJyx4sdPgVoKp3DJwwaMKa13Vccjnei++xzYK
 Iofp3F0uHHMz0C9pw4MeeJP1e2GshEeetDjlF9CFYEAgoweaEJHWYvjje1Crp2z2NG8=
X-Gm-Gg: ASbGncsq1zxYSNbCzQXRxzDwtAljYkIr27E47VcQXdxyVkEheJgnsdfhk3zbckmQNFA
 aFd3/UiV4Uud67zHYy0lw+LzhqMmL01/Rn7vYbVzr078gsQWMy3v5attndxPHatu8xZNfajAELi
 KDbajkJVAIVB+HNFcNYntpb2fAPA+hfBBphwbxlgmAgpeTSMEneMZZSSLtgZfQ/0iR2o7hm7bNA
 riBVl99wnmNT1a/MobGfW8BNuNBziBjVpWlsXLoM2u977qAEyqG99RwnJ7rXXHKCg2nCLkgTD0n
 KJju09tO/WeVWgggI/ovYPBx/F2Ouvx8wtzDPSwayWOOiKEuo2agffxgJ+75VjpmNVechGpf7Yj
 Dd719B7O/z0uIK01D46m+X/EuhB0iOBBemVRm6UDDP2mHubV5jWHDNUru55fzghHfqP5M8myzAc
 BXh9AIibMwLwpefSZUP9CnP+mWwfpM6lUm0ex2z00KA+VWTtp+UKP2eml33G51HIFemIyREo4=
X-Google-Smtp-Source: AGHT+IHKKtr6OJq5okrC0W82ScWmYVbSO3+iSgAoCGh77OaXXq6cfWWR5jg2G83xToaNairGvQaVxw==
X-Received: by 2002:a05:6000:3105:b0:3b7:886b:fb76 with SMTP id
 ffacd0b85a97d-3c5da83b893mr6067836f8f.12.1755974670024; 
 Sat, 23 Aug 2025 11:44:30 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b5744a587sm45470775e9.9.2025.08.23.11.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Aug 2025 11:44:29 -0700 (PDT)
Message-ID: <f1d4dc36-ba37-4ae4-824d-5ec0fd47c605@smile.fr>
Date: Sat, 23 Aug 2025 20:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
References: <20250823150543.3233205-1-romain.naour@smile.fr>
 <3a50c498-08e6-4762-963b-4e05eac149fc@gmx.de>
Content-Language: fr
In-Reply-To: <3a50c498-08e6-4762-963b-4e05eac149fc@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1755974670; x=1756579470; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7W8VA3aRspJYnCEDEXn8cmglpM9Dh198Sz35dalCGj4=;
 b=WJbzk2VhNkib+YxMReconpR/ekjnnPQDL3P+Tn0ydARmoKaZU39X1mmfG39Kk2d6/p
 YQXAkzr0pAzlEXqzgkPQNzPPMgtDnVqicwuvBubCvzwfGs1q0Gm2/kkho7T2qT0ZGahQ
 9tQDTE1izygLJ5V3v7Fh3B0LkInUJbSyyMX+Q=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=WJbzk2Vh
Subject: Re: [Buildroot] [PATCH 1/4] package/busybox: add httpd server
 startup script
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

SGkgRmlvbmEsIEFsbCwKCkxlIDIzLzA4LzIwMjUgw6AgMjA6MTYsIEZpb25hIEtsdXRlIGEgw6lj
cml0wqA6Cj4gSGkgUm9tYWluLAo+IAo+IGEgZmV3IG5pdHMgb24gdGhlIGluaXQgc2NyaXB0IGJl
bG93Lgo+IAo+IEFtIDIzLjA4LjI1IHVtIDE3OjA1IHNjaHJpZWIgUm9tYWluIE5hb3VyIHZpYSBi
dWlsZHJvb3Q6Cj4+IEluIG9yZGVyIHRvIHJlbW92ZSB0aHR0cGQgcGFja2FnZSBmcm9tIEJ1aWxk
cm9vdCwgd2UgaGF2ZSB0byByZXBsYWNlIGl0Cj4+IGZyb20gb3VyIHRlc3RzdWl0ZSAoVGVzdFdn
ZXQgYW5kIFRlc3RMaWJDdXJsKS4KPj4KPj4gQnVzeWJveCBwcm92aWRlIGFuIGh0dHBkIHNlcnZl
ciBhcHBsZXQgYnV0IGl0J3Mgbm90IGVuYWJsZWQgaW4gb3VyCj4+IGRlZmF1bHQgYnVzeWJveCBj
b25maWd1cmF0aW9uLgo+Pgo+PiBGb3IgdGhlIHNha2Ugb2YgdGhvc2UgdGVzdHMsIGFkZCBhIG5l
dyBidXN5Ym94IG9wdGlvbiB0byBidWlsZCBhbmQKPj4gaW5zdGFsbCB0aGUgQnVzeWJveCdzIGh0
dHBkIHNlcnZlciBhbmQgaXRzIGluaXQgc2NyaXB0Lgo+Pgo+PiBDYzogSnVsaWVuIE9saXZhaW4g
PGp1Lm9AZnJlZS5mcj4KPj4gU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFv
dXJAc21pbGUuZnI+Cj4+IC0tLQo+PiDCoCBwYWNrYWdlL2J1c3lib3gvQ29uZmlnLmluwqAgfMKg
IDYgKysrKysKPj4gwqAgcGFja2FnZS9idXN5Ym94L1M5MGh0dHBkwqDCoCB8IDU0ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+IMKgIHBhY2thZ2UvYnVzeWJveC9idXN5
Ym94Lm1rIHwgMTYgKysrKysrKysrKysKPj4gwqAgMyBmaWxlcyBjaGFuZ2VkLCA3NiBpbnNlcnRp
b25zKCspCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2J1c3lib3gvUzkwaHR0cGQK
Pj4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYnVzeWJveC9Db25maWcuaW4gYi9wYWNrYWdlL2J1
c3lib3gvQ29uZmlnLmluCj4+IGluZGV4IDNjMmFhNTE1ZjguLjY1OWM2YWViZmMgMTAwNjQ0Cj4+
IC0tLSBhL3BhY2thZ2UvYnVzeWJveC9Db25maWcuaW4KPj4gKysrIGIvcGFja2FnZS9idXN5Ym94
L0NvbmZpZy5pbgo+PiBAQCAtNjksNiArNjksMTIgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0JVU1lC
T1hfSU5ESVZJRFVBTF9CSU5BUklFUwo+PiDCoCBjb21tZW50ICJCdXN5Ym94IGluZGl2aWR1YWwg
YmluYXJpZXMgbmVlZCBhIHRvb2xjaGFpbiB3LyBkeW5hbWljIGxpYnJhcnkiCj4+IMKgwqDCoMKg
wqAgZGVwZW5kcyBvbiBCUjJfU1RBVElDX0xJQlMKPj4gwqAgK2NvbmZpZyBCUjJfUEFDS0FHRV9C
VVNZQk9YX0hUVFBECj4+ICvCoMKgwqAgYm9vbCAiSW5zdGFsbCB0aGUgaHR0cGQgc2VydmVyIHN0
YXJ0dXAgc2NyaXB0Igo+PiArwqDCoMKgIGhlbHAKPj4gK8KgwqDCoMKgwqAgSW5zdGFsbCB0aGUg
aHR0cGQgc2VydmVyIHN0YXJ0dXAgc2NyaXB0LAo+PiArwqDCoMKgwqDCoCB0aGF0IGp1c3Qgc3Rh
cnQgYXQgdGhlIGJvb3QgdGhlIGJ1c3lib3ggaHR0cGQgc2VydmVyCj4+ICsKPj4gwqAgY29uZmln
IEJSMl9QQUNLQUdFX0JVU1lCT1hfV0FUQ0hET0cKPj4gwqDCoMKgwqDCoCBib29sICJJbnN0YWxs
IHRoZSB3YXRjaGRvZyBkYWVtb24gc3RhcnR1cCBzY3JpcHQiCj4+IMKgwqDCoMKgwqAgaGVscAo+
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9idXN5Ym94L1M5MGh0dHBkIGIvcGFja2FnZS9idXN5Ym94
L1M5MGh0dHBkCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAuLmMx
NDhkMTlhZGYKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9wYWNrYWdlL2J1c3lib3gvUzkwaHR0
cGQKPj4gQEAgLTAsMCArMSw1NCBAQAo+PiArIyEvYmluL3NoCj4+ICsKPj4gK0RBRU1PTj0iaHR0
cGQiCj4+ICtQSURGSUxFPSIvdmFyL3J1bi8kREFFTU9OLnBpZCIKPj4gKwo+PiArSFRUUERfQVJH
Uz0iLWggL3Zhci93d3cvZGF0YSIKPj4gKwo+PiArIyBzaGVsbGNoZWNrIHNvdXJjZT0vZGV2L251
bGwKPj4gK1sgLXIgIi9ldGMvZGVmYXVsdC8kREFFTU9OIiBdICYmIC4gIi9ldGMvZGVmYXVsdC8k
REFFTU9OIgo+PiArCj4+ICtzdGFydCgpIHsKPj4gK8KgwqDCoCBwcmludGYgJ1N0YXJ0aW5nICVz
OiAnICIkREFFTU9OIgo+PiArwqDCoMKgICMgc2hlbGxjaGVjayBkaXNhYmxlPVNDMjA4NiAjIHdl
IG5lZWQgdGhlIHdvcmQgc3BsaXR0aW5nCj4+ICvCoMKgwqAgc3RhcnQtc3RvcC1kYWVtb24gLVMg
LXEgLXAgIiRQSURGSUxFIiAteCAiL3Vzci9zYmluLyREQUVNT04iIFwKPiAKPiBQcmVmZXJhYmx5
IHVzZSBsb25nIG9wdGlvbnMgZm9yIHN0YXJ0LXN0b3AtZGFlbW9uIGZvciBjbGFyaXR5LgoKT2su
Cgo+IAo+PiArwqDCoMKgwqDCoMKgwqAgLS0gJEhUVFBEX0FSR1MKPj4gK8KgwqDCoCBzdGF0dXM9
JD8KPj4gK8KgwqDCoCBpZiBbICIkc3RhdHVzIiAtZXEgMCBdOyB0aGVuCj4+ICvCoMKgwqDCoMKg
wqDCoCBlY2hvICJPSyIKPj4gK8KgwqDCoCBlbHNlCj4+ICvCoMKgwqDCoMKgwqDCoCBlY2hvICJG
QUlMIgo+PiArwqDCoMKgIGZpCj4+ICvCoMKgwqAgcmV0dXJuICIkc3RhdHVzIgo+PiArfQo+PiAr
Cj4+ICtzdG9wKCkgewo+PiArwqDCoMKgIHByaW50ZiAnU3RvcHBpbmcgJXM6ICcgIiREQUVNT04i
Cj4+ICvCoMKgwqAgc3RhcnQtc3RvcC1kYWVtb24gLUsgLXEgLXAgIiRQSURGSUxFIgo+IAo+IFRo
ZSBzdG9wIGNvbW1hbmQgc2hvdWxkIHVzZSAtLWV4ZWMvLXgsIHRvbywgYXMgYSBzYWZlZ3VhcmQg
dG8gZW5zdXJlIHRoZSByaWdodAo+IHByb2Nlc3MgaXMgc3RvcHBlZC4KPiAKPj4gK8KgwqDCoCBz
dGF0dXM9JD8KPj4gK8KgwqDCoCBpZiBbICIkc3RhdHVzIiAtZXEgMCBdOyB0aGVuCj4+ICvCoMKg
wqDCoMKgwqDCoCAjIGh0dHBkIGRvZXMgbm90IHJlbW92ZSB0aGUgcGlkIGZpbGUgb24gZXhpdAo+
PiArwqDCoMKgwqDCoMKgwqAgcm0gLWYgIiRQSURGSUxFIgo+IAo+IEF0IHRoaXMgcG9pbnQgaXQn
cyBvbmx5IGNlcnRhaW4gdGhhdCBzdGFydC1zdG9wLWRhZW1vbiBzZW50IFNJR1RFUk0KPiBzdWNj
ZXNzZnVsbHksIG5vdCB0aGF0IHRoZSBzZXJ2aWNlIGFjdHVhbGx5IHN0b3BwZWQuIEZvciBzZXJ2
aWNlcyB0aGF0IGRvIG5vdAo+IGRlbGV0ZSB0aGVpciBQSUQgZmlsZSBvbiBleGl0IHRoZSBpbml0
IHNjcmlwdCBzaG91bGQgd2FpdCBmb3IgdGhlIHByb2Nlc3MgdG8KPiBzdG9wLCBzZWUgcGFja2Fn
ZS9idXN5Ym94L1MwMXN5c2xvZ2QgZm9yIGV4YW1wbGUsIGFsc28gZm9yIHRoZSBvdGhlciBwb2lu
dHMuCj4gCj4+ICvCoMKgwqDCoMKgwqDCoCBlY2hvICJPSyIKPj4gK8KgwqDCoCBlbHNlCj4+ICvC
oMKgwqDCoMKgwqDCoCBlY2hvICJGQUlMIgo+PiArwqDCoMKgIGZpCj4+ICvCoMKgwqAgcmV0dXJu
ICIkc3RhdHVzIgo+PiArfQo+PiArCj4+ICtyZXN0YXJ0KCkgewo+PiArwqDCoMKgIHN0b3AKPj4g
K8KgwqDCoCBzbGVlcCAxCj4gCj4gSWYgdGhlIHN0b3AgY29tbWFuZCB3YWl0cyBmb3IgdGhlIHBy
b2Nlc3MgdG8gYWN0dWFsbHkgc3RvcCBhcyBtZW50aW9uZWQgYWJvdmUsCj4gdGhpcyBzbGVlcCBp
c24ndCBuZWVkZWQgYW55IG1vcmUuCgpUaGFua3MgZm9yIHRoZSByZXZpZXchCgpJIHNpbXBseSBy
ZXVzZWQgdGhlIGV4aXN0aW5nIFM5MHRodHRwZCBmb3IgYnVzeWJveCBbMV0uLi4gbXkgYmFkLgoK
WzFdCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvbWFz
dGVyL3BhY2thZ2UvdGh0dHBkL1M5MHRodHRwZAoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+
IEJlc3QgcmVnYXJkcywKPiBGaW9uYQo+IAo+PiArwqDCoMKgIHN0YXJ0Cj4+ICt9Cj4+ICsKPj4g
K2Nhc2UgIiQxIiBpbgo+PiArwqDCoMKgIHN0YXJ0fHN0b3B8cmVzdGFydCkKPj4gK8KgwqDCoMKg
wqDCoMKgICIkMSI7Owo+PiArwqDCoMKgIHJlbG9hZCkKPj4gK8KgwqDCoMKgwqDCoMKgICMgUmVz
dGFydCwgc2luY2UgdGhlcmUgaXMgbm8gdHJ1ZSAicmVsb2FkIiBmZWF0dXJlLgo+PiArwqDCoMKg
wqDCoMKgwqAgcmVzdGFydDs7Cj4+ICvCoMKgwqAgKikKPj4gK8KgwqDCoMKgwqDCoMKgIGVjaG8g
IlVzYWdlOiAkMCB7c3RhcnR8c3RvcHxyZXN0YXJ0fHJlbG9hZH0iCj4+ICvCoMKgwqDCoMKgwqDC
oCBleGl0IDEKPj4gK2VzYWMKPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYnVzeWJveC9idXN5Ym94
Lm1rIGIvcGFja2FnZS9idXN5Ym94L2J1c3lib3gubWsKPj4gaW5kZXggNTMyOTMyZWM4Zi4uZDdl
ZGE3MWRiNiAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9idXN5Ym94L2J1c3lib3gubWsKPj4gKysr
IGIvcGFja2FnZS9idXN5Ym94L2J1c3lib3gubWsKPj4gQEAgLTI1OCw2ICsyNTgsMTkgQEAgZGVm
aW5lIEJVU1lCT1hfU0VUX1NFTElOVVgKPj4gwqAgZW5kZWYKPj4gwqAgZW5kaWYKPj4gwqAgK2lm
ZXEgKCQoQlIyX1BBQ0tBR0VfQlVTWUJPWF9IVFRQRCkseSkKPj4gK2RlZmluZSBCVVNZQk9YX1NF
VF9IVFRQRAo+PiArwqDCoMKgICQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0hUVFBE
KQo+PiArZW5kZWYKPj4gK2RlZmluZSBCVVNZQk9YX0lOU1RBTExfSFRUUERfU0NSSVBUCj4+ICvC
oMKgwqAgaWYgZ3JlcCAtcSBDT05GSUdfSFRUUEQ9eSAkKEBEKS8uY29uZmlnOyB0aGVuIFwKPj4g
K8KgwqDCoMKgwqDCoMKgIG1rZGlyIC1wICQoVEFSR0VUX0RJUikvdmFyL3d3dy9kYXRhIDtcCj4+
ICvCoMKgwqDCoMKgwqDCoCAkKElOU1RBTEwpIC1tIDA3NTUgLUQgcGFja2FnZS9idXN5Ym94L1M5
MGh0dHBkIFwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJChUQVJHRVRfRElSKS9ldGMvaW5p
dC5kL1M5MGh0dHBkIDsgXAo+PiArwqDCoMKgIGZpCj4+ICtlbmRlZgo+PiArZW5kaWYKPj4gKwo+
PiDCoCAjIGVuYWJsZSByZWxldmFudCBvcHRpb25zIHRvIGFsbG93IHRoZSBCdXN5Ym94IGxlc3Mg
YXBwbGV0IHRvIGJlIHVzZWQKPj4gwqAgIyBhcyBhIHN5c3RlbWQgcGFnZXIKPj4gwqAgaWZlcSAo
JChCUjJfUEFDS0FHRV9TWVNURU1EKTokKEJSMl9QQUNLQUdFX0xFU1MpLHk6KQo+PiBAQCAtNDE4
LDYgKzQzMSw3IEBAIGRlZmluZSBCVVNZQk9YX0tDT05GSUdfRklYVVBfQ01EUwo+PiDCoMKgwqDC
oMKgICQoQlVTWUJPWF9TRVRfV0FUQ0hET0cpCj4+IMKgwqDCoMKgwqAgJChCVVNZQk9YX1NFVF9T
RUxJTlVYKQo+PiDCoMKgwqDCoMKgICQoQlVTWUJPWF9TRVRfTEVTU19GTEFHUykKPj4gK8KgwqDC
oCAkKEJVU1lCT1hfU0VUX0hUVFBEKQo+PiDCoMKgwqDCoMKgICQoQlVTWUJPWF9TRVRfSU5ESVZJ
RFVBTF9CSU5BUklFUykKPj4gwqDCoMKgwqDCoCAkKEJVU1lCT1hfRElTQUJMRV9JUF9MSU5LX0NB
TikKPj4gwqDCoMKgwqDCoCAkKFBBQ0tBR0VTX0JVU1lCT1hfQ09ORklHX0ZJWFVQUykKPj4gQEAg
LTQ0Nyw2ICs0NjEsNyBAQCBkZWZpbmUgQlVTWUJPWF9JTlNUQUxMX0lOSVRfT1BFTlJDCj4+IMKg
wqDCoMKgwqAgJChCVVNZQk9YX0lOU1RBTExfSUZQTFVHRF9TQ1JJUFQpCj4+IMKgwqDCoMKgwqAg
JChCVVNZQk9YX0lOU1RBTExfQ1JPTkRfU0NSSVBUKQo+PiDCoMKgwqDCoMKgICQoQlVTWUJPWF9J
TlNUQUxMX1RFTE5FVF9TQ1JJUFQpCj4+ICvCoMKgwqAgJChCVVNZQk9YX0lOU1RBTExfSFRUUERf
U0NSSVBUKQo+PiDCoCBlbmRlZgo+PiDCoCDCoCBkZWZpbmUgQlVTWUJPWF9JTlNUQUxMX0lOSVRf
U1lTVEVNRAo+PiBAQCAtNDYxLDYgKzQ3Niw3IEBAIGRlZmluZSBCVVNZQk9YX0lOU1RBTExfSU5J
VF9TWVNWCj4+IMKgwqDCoMKgwqAgJChCVVNZQk9YX0lOU1RBTExfSUZQTFVHRF9TQ1JJUFQpCj4+
IMKgwqDCoMKgwqAgJChCVVNZQk9YX0lOU1RBTExfQ1JPTkRfU0NSSVBUKQo+PiDCoMKgwqDCoMKg
ICQoQlVTWUJPWF9JTlNUQUxMX1RFTE5FVF9TQ1JJUFQpCj4+ICvCoMKgwqAgJChCVVNZQk9YX0lO
U1RBTExfSFRUUERfU0NSSVBUKQo+PiDCoCBlbmRlZgo+PiDCoCDCoCAjIENoZWNrcyB0byBnaXZl
IGVycm9ycyB0aGF0IHRoZSB1c2VyIGNhbiB1bmRlcnN0YW5kCj4gCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
