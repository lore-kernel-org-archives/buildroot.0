Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC68C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 21:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EAC581461;
	Tue, 26 Jul 2022 21:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EAC581461
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dtl9qNKwvQsb; Tue, 26 Jul 2022 21:49:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D65380C89;
	Tue, 26 Jul 2022 21:49:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D65380C89
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA93E1BF59F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3CAA402E7
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3CAA402E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cslnqgRFen5t for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 21:49:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1591140133
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1591140133
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 21:49:12 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v17so2906049wrr.10
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 14:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/0kamVw2OBrzC/5rQCf18elOCVXznIL7JE0omvHqKAE=;
 b=P2ShVr89u/l07eXP5uh57VmHdmzz2ZoVaHMB0ipUANcLivcTSI+qM76h02zvM7/wzZ
 BhHfDx4l8J2ugkab8Z6NjfwE5w2oChy/V45b/v60E3MO6Mb8gnqklOf32AT0+pFx4N34
 7t5RSTibH5iJCDhgSQdYSiGUzASmOoK8gh5LXQ9rMqWd22zwhn66QtY/fHftmu448fsS
 7NmTtn7YORE1qvQsq9UqIAlkyG3Rs+goC8weEnYltsldOn3x4xiFVI092TslXgHkVryN
 9LK3maY8jabeZPHRxlfRB/n86jvADk1eraasQHwPXbGDpHgvzbL5aXrI3QRuonB2E/nh
 JKMQ==
X-Gm-Message-State: AJIora+4Jai8tr/ZT5BI/JrTkcmOz6hE5T7ODUmVfI+B0WjnnK5Hm/PV
 I19osGE/Aw5IDgqcZki8qO1unO6OJAlR/w==
X-Google-Smtp-Source: AGRyM1tYdfkGp1afpPUi4izhcY9LPX0spH7RW2+g8rOUdHjFlKnUOEIky9jxNn7bvTtFGcisnSfoSg==
X-Received: by 2002:a05:6000:81e:b0:21d:8811:777b with SMTP id
 bt30-20020a056000081e00b0021d8811777bmr12438092wrb.647.1658872151063; 
 Tue, 26 Jul 2022 14:49:11 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:86bb:8231:62d7:1874?
 ([2a01:cb19:8acf:5600:86bb:8231:62d7:1874])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a05600c3b9200b003a31b79dc0esm5107310wms.1.2022.07.26.14.49.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 14:49:10 -0700 (PDT)
Message-ID: <5e884286-3554-a6c6-5dec-493ddf9dd73d@smile.fr>
Date: Tue, 26 Jul 2022 23:49:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20220326220727.827332-1-angelo@amarulasolutions.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220326220727.827332-1-angelo@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=/0kamVw2OBrzC/5rQCf18elOCVXznIL7JE0omvHqKAE=;
 b=cqGlu1+LmO3S0h1vP3CAbC7eQq3vViIkPQESeGW1ko7ePpzl3iEeKQwauHFHvdn6sk
 cGTbcy7oSjMZo+Fk8PXDFr63aZnr7ncQ4nWlkdNhK3OcmBsxCu+1FZxH5PbmnEyORHcL
 ywSLiiFhH948e7+YGPqy+qT7JigoAP9SU9GDAHEaos271r8l7m4gWODVh6xWBA5Dc/r2
 yZr7wGLoWDr8+hkQMUWqseSdZSKYixv6GZtJHeg0vB+o+dtPzStrKedD76qQW9uk1uyc
 ME4rSoMZ22Q141ah79RriLwYVgbOok6X9jy95l6EHiUXjnpk6bJNJMk61f4xFHmK6oB1
 /NdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=cqGlu1+L
Subject: Re: [Buildroot] [PATCH v2] package/libdill: new package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQW5nZWxvLAoKTGUgMjYvMDMvMjAyMiDDoCAyMzowNywgQW5nZWxvIENvbXBhZ251Y2Np
IGEgw6ljcml0wqA6Cj4gTGliZGlsbCBpcyBhIEMgbGlicmFyeSB0aGF0IG1ha2VzIHdyaXRpbmcg
c3RydWN0dXJlZCBjb25jdXJyZW50IHByb2dyYW1zCj4gZWFzeS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBBbmdlbG8gQ29tcGFnbnVjY2kgPGFuZ2Vsb0BhbWFydWxhc29sdXRpb25zLmNvbT4KPiAtLS0K
PiB2MS12MjoKPiBCZXR0ZXIgY29uZmlndXJhdGlvbiBvcHRpb25zIGhhbmRsaW5nOgo+IGxpYmRp
bGwgYnVpbGQgY2FuIGFjdHVhbGx5IGJlIGN1c3RvbWl6ZWQgb25seSB3aGVuIHVzaW5nIGNvbmZp
Z3VyZQo+IGluZGVlZCBjbWFrZSBkb2Vzbid0IG9mZmVyIHRoZSBzYW1lIGNvbmZpZ3VyYXRpb24g
b3B0aW9uLAo+IAo+ICBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBwYWNr
YWdlL0NvbmZpZy5pbiAgICAgICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL2xpYmRpbGwvQ29uZmln
LmluICAgIHwgIDcgKysrKysrKwo+ICBwYWNrYWdlL2xpYmRpbGwvbGliZGlsbC5oYXNoIHwgIDMg
KysrCj4gIHBhY2thZ2UvbGliZGlsbC9saWJkaWxsLm1rICAgfCAyNSArKysrKysrKysrKysrKysr
KysrKysrKysrCj4gIDUgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS9saWJkaWxsL0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9saWJkaWxsL2xpYmRpbGwuaGFzaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9saWJkaWxsL2xpYmRpbGwubWsKPiAKPiBkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RF
VkVMT1BFUlMKPiBpbmRleCA3MGQ3MTE4NmVkLi45NDEwOTQ0NTg0IDEwMDY0NAo+IC0tLSBhL0RF
VkVMT1BFUlMKPiArKysgYi9ERVZFTE9QRVJTCj4gQEAgLTE2Nyw2ICsxNjcsNyBAQCBGOglwYWNr
YWdlL2kyYy10b29scy8KPiAgRjoJcGFja2FnZS9qcS8KPiAgRjoJcGFja2FnZS9saWJhcHBhcm1v
ci8KPiAgRjoJcGFja2FnZS9saWJiNjQvCj4gK0Y6CXBhY2thZ2UvbGliZGlsbC8KPiAgRjoJcGFj
a2FnZS9tZW5kZXIvCj4gIEY6CXBhY2thZ2UvbWVuZGVyLWFydGlmYWN0Lwo+ICBGOglwYWNrYWdl
L21vbm8vCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcu
aW4KPiBpbmRleCAwZDVkNzYzMTgwLi40N2Y4NGEwOGRjIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
Q29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiBAQCAtMTk2OCw2ICsxOTY4LDcg
QEAgbWVudSAiT3RoZXIiCj4gIAlzb3VyY2UgInBhY2thZ2UvbGliY3Jvc3NndWlkL0NvbmZpZy5p
biIKPiAgCXNvdXJjZSAicGFja2FnZS9saWJjc3YvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNr
YWdlL2xpYmRhZW1vbi9Db25maWcuaW4iCj4gKwlzb3VyY2UgInBhY2thZ2UvbGliZGlsbC9Db25m
aWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvbGliZWFzdGwvQ29uZmlnLmluIgo+ICAJc291cmNl
ICJwYWNrYWdlL2xpYmVlL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9saWJldi9Db25m
aWcuaW4iCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliZGlsbC9Db25maWcuaW4gYi9wYWNrYWdl
L2xpYmRpbGwvQ29uZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAw
MDAwLi4wZTY3NTdiODA5Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvbGliZGlsbC9D
b25maWcuaW4KPiBAQCAtMCwwICsxLDcgQEAKPiArY29uZmlnIEJSMl9QQUNLQUdFX0xJQkRJTEwK
CkhhdmUgeW91IGNoZWNrZWQgd2l0aCB0ZXN0LXBrZyA/Cgo+ICsJYm9vbCAibGliZGlsbCIKPiAr
CWhlbHAKPiArCSAgTGliZGlsbCBpcyBhIEMgbGlicmFyeSB0aGF0IG1ha2VzIHdyaXRpbmcgc3Ry
dWN0dXJlZCBjb25jdXJyZW50Cj4gKwkgIHByb2dyYW1zIGVhc3kuCj4gKwo+ICsJICBodHRwOi8v
bGliZGlsbC5vcmcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJkaWxsL2xpYmRpbGwuaGFzaCBi
L3BhY2thZ2UvbGliZGlsbC9saWJkaWxsLmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGlu
ZGV4IDAwMDAwMDAwMDAuLjRhMWZiOTFhNTcKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2Fn
ZS9saWJkaWxsL2xpYmRpbGwuaGFzaAo+IEBAIC0wLDAgKzEsMyBAQAo+ICsjIHNoYTI1NiBsb2Nh
bGx5IGNvbXB1dGVkCj4gK3NoYTI1NiAgNmRmNzUyN2U4ZjFlOTFmNTEwNmMyMWM1YmZlYWE2OWVl
ZTQ3MGJlYzQ3NmM3NDU4NTE0M2UzZTQzOTg2NDQwNCAgbGliZGlsbC1mYTAxNjQ4Y2YyYThkMDZl
NTNjOTY1YjQ1ZWVhY2ZiM2FjNTdiZDA0LnRhci5nego+ICtzaGEyNTYgIDNmNzhkOWM0MmM4OTE5
Y2I2ZGM2M2U1MWRlMTdiOWViNDBhNDlkOWNkZDg3NmNlNTllNzczOTI3MjFlOGMyYzYgIENPUFlJ
TkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJkaWxsL2xpYmRpbGwubWsgYi9wYWNrYWdlL2xp
YmRpbGwvbGliZGlsbC5tawo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAw
MC4uOGVmZTFmZjM1Ngo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2xpYmRpbGwvbGli
ZGlsbC5tawo+IEBAIC0wLDAgKzEsMjUgQEAKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAr
Iwo+ICsjIGxpYmRpbGwKPiArIwo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsKPiArTElC
RElMTF9WRVJTSU9OID0gZmEwMTY0OGNmMmE4ZDA2ZTUzYzk2NWI0NWVlYWNmYjNhYzU3YmQwNAo+
ICtMSUJESUxMX1NJVEUgPSAkKGNhbGwgZ2l0aHViLHN1c3RyaWssbGliZGlsbCwkKExJQkRJTExf
VkVSU0lPTikpCj4gK0xJQkRJTExfTElDRU5TRSA9IE1JVAo+ICtMSUJESUxMX0xJQ0VOU0VfRklM
RVMgPSBDT1BZSU5HCj4gK0xJQkRJTExfQ1BFX0lEX1ZFTkRPUiA9IGxpYmRpbGwKPiArTElCRElM
TF9DUEVfSURfUFJPRFVDVCA9IGxpYmRpbGwKPiArTElCRElMTF9JTlNUQUxMX1NUQUdJTkcgPSBZ
RVMKPiArTElCRElMTF9BVVRPUkVDT05GID0gWUVTCgpVc3VhbGx5IHdlIHJlcXVpcmVzIGEgY29t
bWVudCB0byByZW1lbWJlciB3aHkgYXV0b3JlY29uZiBpcyBuZWVkZWQuCkhlcmUgaXQncyBkaXJl
Y3RseSBmZXRjaGVkIGZyb20gZ2l0aHViIGFuZCB3ZSBuZWVkIGF1dG9yZWNvbmYgdG8gZ2VuZXJh
dGUgdGhlCmNvbmZpZ3VyZSBzY3JpcHQuCgo+ICsKPiAraWZuZXEgKCQoQlIyX1RPT0xDSEFJTl9I
QVNfVEhSRUFEUykseSkKPiArTElCRElMTF9DT05GX09QVFMgKz0gLS1kaXNhYmxlLXRocmVhZHMK
PiArZW5kaWYKPiArCj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfT1BFTlNTTCkseSkKPiArTElCRElM
TF9ERVBFTkRFTkNJRVMgPSBvcGVuc3NsCgpPcGVuc3NsIGlzIGEgdmlydHVhbCBwYWNrYWdlLiBE
aWQgeW91IGNoZWNrIHdpdGggb3RoZXIgc3NsIHByb3ZpZGVkIHN1Y2ggbGlicmVzc2wgPwoKQmVz
dCByZWdhcmRzLApSb21haW4KCgo+ICtMSUJESUxMX0NPTkZfT1BUUyArPSAtLWVuYWJsZS10bHMK
PiArZW5kaWYKPiArCj4gKyQoZXZhbCAkKGF1dG90b29scy1wYWNrYWdlKSkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
