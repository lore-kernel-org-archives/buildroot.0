Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5E2C27C55
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 06:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E49BD41A68;
	Fri,  7 Jun 2024 06:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0zYcXKsI5qEd; Fri,  7 Jun 2024 06:34:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53AAA413CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53AAA413CB;
	Fri,  7 Jun 2024 06:34:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22D0B1BF4E4
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 06:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D63F80E02
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 06:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PcOR4BKUoZZw for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 06:34:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6886680DF3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6886680DF3
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6886680DF3
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 06:34:09 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52b93370ad0so2360007e87.2
 for <buildroot@buildroot.org>; Thu, 06 Jun 2024 23:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717742047; x=1718346847;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p6PcKl4HU22bHklcNAUpDDSZPGccWcy1J6P3e8+keXE=;
 b=ErJfHgTUVlNrBUaje5U9tt48xN5lJ+4nMfg++Vr8MnY7ubBvLzOoKbfNDz04h2F7n8
 1H+QtxhalkFlrhOvjBwkYJzN26x6PxZFMItduKEZfdGwDj6W/IvDI2eyHpNN2j6YC7zV
 +nqO/CMgXB9Pg7zIUCKOEtb6rs6vvpHt9wt1HsOZjjkwslU5cVEErGVQRC0zBvbn7PmE
 jKxJcL/tF4KBdPN70xtJ1SClCuaZOVC/ozPPM8AACox3eovj+S+BpgOxXZcd+krlDR/U
 KBuFPE12Tn8gr+xaoAZJN23TSJG77i2iD+dALlDyJRu5jat/HyBO9PegzKO5JmIKp701
 OFsg==
X-Gm-Message-State: AOJu0YyKR2Cs7TYLC1evHBA5+jKJP+vLR8hn6NGofEV8CyZdkzzif33u
 9Isd+4PsonbmMjcVLMra6kKsRY4PmhnFIvX1SYwBFCmUbGZgR1D31vUZIfU+ck9igonRJPlTH1G
 fQi/StYeuwhbQPQvKwbSHf7kz0YQ=
X-Google-Smtp-Source: AGHT+IF/AVlk20PnwjkuNIOurs1iFig1fJJ+f0kOasJPeCvZByymNIGAYL9atAU64AXkjJWPvECB9fjb5oCJ3N9Sfjw=
X-Received: by 2002:ac2:43ad:0:b0:529:b718:8d00 with SMTP id
 2adb3069b0e04-52bb9f624f4mr1228448e87.8.1717742046571; Thu, 06 Jun 2024
 23:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240606182124.4069700-1-yegorslists@googlemail.com>
 <ZmIausTMGdCgzXgC@landeda>
In-Reply-To: <ZmIausTMGdCgzXgC@landeda>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 7 Jun 2024 08:36:33 +0200
Message-ID: <CAGm1_ktbeung88prt=EXm_PzC+MCaeFHGurmzCA9SYF4HEkosg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1717742047; x=1718346847; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p6PcKl4HU22bHklcNAUpDDSZPGccWcy1J6P3e8+keXE=;
 b=GBM580n/m4MQKTiw0LkgCfYvgoGG0osOkAonXvZ6Kk05vjTI2BTAc7VO4kYF4bNrNl
 SAjZVk3zj7OzhuPIjFhg+Fregue66GSkfvfQ9Gh09dqkpVlojOCz1t8Dx6nWWIPXGjy+
 SOw4ws5t2g0Hh8tdTuJxHLVMYDv0DJ8yB7yCAa1gfVeZGC7dfThPBbC2rJPycYbO8sS/
 env2/2Gu7sqfgvis+JgPea+g56UKOflOoy+X1rkE49kNCjSHxFDEN+eMD4qoN+cDRDgt
 wOsG/ZE2fzLg0ijh05ttm+tvCXBddtTaFEx/D44gA7ag1eNtPSTtieS0ddHdNWYDC6Wa
 V41Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GBM580n/
Subject: Re: [Buildroot] [PATCH] package/ntp: remove the obsolete patch
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwgQWxsLAoKT24gVGh1LCBKdW4gNiwgMjAyNCBhdCAxMDoyM+KAr1BNIFlhbm4gRS4gTU9S
SU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IFllZ29yLCBBbGwsCj4KPiBP
biAyMDI0LTA2LTA2IDIwOjIxICswMjAwLCB5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbSBzcGFr
ZSB0aHVzbHk6Cj4gPiBGcm9tOiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFp
bC5jb20+Cj4gPgo+ID4gMDAwMS1uYW5vLnBhdGNoOiBib3RoIE1PRF9OQU5PIGFuZCBNT0RfVEFJ
IHdlcmUgYWRkZWQgdG8gZ2xpYmMKPiA+IG9uIDIwMTEtMDMtMzAgaW4gY29tbWl0IDgzZmUxMDhi
MGE5YmM0ZjJkZWIxNDY5NWJiMGM4YjIwMTFlNzlmMjguCj4KPiBJdCB3b3VsZCBoYXZlIGJlZW4g
Z29vZCB0byBzdGF0ZSB3aGF0IGdsaWJjIHZlcnNpb24gZmlyc3QgaGFkIHRoYXQKPiBjb21taXQu
IEl0IHdhcyBnbGliYyAyLjE0LCByZWxlYXNlZCAyMDExLTA1LTMxIChmdW5ueSwgd2UgYWxzbyBy
ZWNlbnRseQo+IGRlY2lkZWQgdG8gYXNzdW1lIHRoYXQgaG9zdCB3b3VsZCBhaHZlIGF0IGxlYXN0
IGdsaWJjIDMuMTQgOy0pICkuCj4KPiBIb3dldmVyLCBpbiA4M2ZlMTA4YjBhOWJjNGYyZGViMTQ2
OTViYjBjOGIyMDExZTc5ZjI4LCBJIG9ubHkgbm90aWNlIHRoYXQKPiBib3RoIE1PRF9OQU5PIGFu
ZCBNT0RfVEFJIGFyZSBhY3R1YWxseSBfcmVtb3ZlZF86Cj4KPiAgICAgLS0tIGEvc3lzZGVwcy91
bml4L3N5c3YvbGludXgvc3lzL3RpbWV4LmgKPiAgICAgKysrIGIvc3lzZGVwcy91bml4L3N5c3Yv
bGludXgvc3lzL3RpbWV4LmgKPiAgICAgLi4uCj4gICAgICsjaW5jbHVkZSA8Yml0cy90aW1leC5o
Pgo+ICAgICAuLi4KPiAgICAgLSNkZWZpbmUgTU9EX01JQ1JPICAgICAgQURKX01JQ1JPCj4gICAg
IC0jZGVmaW5lIE1PRF9OQU5PICAgICAgIEFESl9OQU5PCj4KPiBTbywgdGVjaG5pY2FsbHksIGl0
IF9oYWRfIGJvdGggZXZlbiBiZWZvcmUgdGhhdC4gQW5kIGJpdHMvdGltZXguaCB3YXMKPiBpbnRy
b2R1Y2VkIGluIHRoZSBzYW1lIGNvbW1pdCwgYXMgYSBjb3B5LXdpdGgtZGlmZiBmcm9tIHN5cy90
aW1leC5oLgoKWW91J3JlIHJpZ2h0LCB0aGUgb3JpZ2luYWwgY29tbWl0IGZvciBNT0RfVEFJIGFu
ZCBNT0RfTkFOTyBpcwo4OWI0MzJkN2E1YmVmYjg1MDQ4Yzk3ZTg4MWIyMTA2ZThkZjU4ZTQzIGku
ZS4gZ2xpYmMgMi4xMi4KCj4gRm9yIG11c2wsIHRoZXkgd2VyZSBib3RoIGFkZGVkIGluIGY1YmEy
YmM5YywgYWxzbyAyMDExLTAzLTE4LCBmaXJzdAo+IHJlbGVhc2VkIGFzIDAuNy41Lgo+Cj4gRm9y
IHVjbGliYywgdGhleSBib3RoIHdlcmUgYWRkZWQgaW4gMmQ4ZWEwNTI0YiwgMjAxNy0wMy0xNywg
Zmlyc3QKPiByZWxlYXNlZCBhcyAxLjAuMjMuCj4KPiBTbywgZG8gd2UgY29uc2lkZXIgdGhhdCB1
Y2xpYmMgMS4wLjIzIGlzIG9sZCBlbm91Z2ggdGhhdCB0aGV5IGFyZQo+IGd1YXJhbnRlZWQgdG8g
ZXhpc3QsIG9yIGRvIHdlIHN0aWxsIHdhbnQgdG8ga2VlcCB0aGVtIGp1c3QgaW4gY2FzZT8KCkkg
ZG9uJ3QgdXNlIHVjbGliYyBhbmQgaGVuY2UgY2Fubm90IGp1ZGdlIGFib3V0IHRoaXMuIElzIHZl
cnNpb24KMS4wLjIzIGZlYXR1cmUtcmljaCBlbm91Z2ggZm9yIHRoZSBsYXRlc3QgQlI/CgpZZWdv
cgoKPiA+IFJlbnVtYmVyIHRoZSByZW1haW5pbmcgcGF0Y2hlcy4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cj4gPiAtLS0K
PiA+ICAuY2hlY2twYWNrYWdlaWdub3JlICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMyAr
LQo+ID4gIHBhY2thZ2UvbnRwLzAwMDEtbmFuby5wYXRjaCAgICAgICAgICAgICAgICAgICB8IDI4
IC0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICAuLi5wYXRjaCA9PiAwMDAxLW50cC1zeXNjYWxscy1m
YWxsYmFjay5wYXRjaH0gfCAgMAo+ID4gIC4uLmNoID0+IDAwMDItZml4LXB0aHJlYWQtZGV0YWNo
LWNoZWNrLnBhdGNofSB8ICAwCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MzAgZGVsZXRpb25zKC0pCj4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbnRwLzAwMDEt
bmFuby5wYXRjaAo+ID4gIHJlbmFtZSBwYWNrYWdlL250cC97MDAwMi1udHAtc3lzY2FsbHMtZmFs
bGJhY2sucGF0Y2ggPT4gMDAwMS1udHAtc3lzY2FsbHMtZmFsbGJhY2sucGF0Y2h9ICgxMDAlKQo+
ID4gIHJlbmFtZSBwYWNrYWdlL250cC97MDAwMy1maXgtcHRocmVhZC1kZXRhY2gtY2hlY2sucGF0
Y2ggPT4gMDAwMi1maXgtcHRocmVhZC1kZXRhY2gtY2hlY2sucGF0Y2h9ICgxMDAlKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS8uY2hlY2twYWNrYWdlaWdub3JlIGIvLmNoZWNrcGFja2FnZWlnbm9yZQo+
ID4gaW5kZXggZDBiZDE3OWE1Yy4uYTdkMzUzZTdkOCAxMDA2NDQKPiA+IC0tLSBhLy5jaGVja3Bh
Y2thZ2VpZ25vcmUKPiA+ICsrKyBiLy5jaGVja3BhY2thZ2VpZ25vcmUKPiA+IEBAIC0xMTE4LDgg
KzExMTgsNyBAQCBwYWNrYWdlL25vcm0vMDAwMS1wcm90b2xpYi1kcm9wLWxpbnV4LXZlcnNpb24t
Y2hlY2sucGF0Y2ggbGliX3BhdGNoLlVwc3RyZWFtCj4gPiAgcGFja2FnZS9ub3JtLzAwMDItVXNl
LXByaW50LWFzLWZ1bmN0aW9uLWNhbGwtZm9yLVB5dGhvbjMtY29tcGF0aWJpbGl0eS5wYXRjaCBs
aWJfcGF0Y2guVXBzdHJlYW0KPiA+ICBwYWNrYWdlL25vcm0vMDAwMy1GaXgtbWl4ZWQtdGFicy1z
cGFjZXMtaW4tcHJvdG9saWItd3NjcmlwdC5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KPiA+ICBw
YWNrYWdlL25zcy1wYW0tbGRhcGQvUzQ1bnNsY2QgU2hlbGxjaGVjayBsaWJfc3lzdi5FbXB0eUxh
c3RMaW5lIGxpYl9zeXN2LkluZGVudCBsaWJfc3lzdi5WYXJpYWJsZXMKPiA+IC1wYWNrYWdlL250
cC8wMDAxLW5hbm8ucGF0Y2ggbGliX3BhdGNoLlVwc3RyZWFtCj4gPiAtcGFja2FnZS9udHAvMDAw
Mi1udHAtc3lzY2FsbHMtZmFsbGJhY2sucGF0Y2ggbGliX3BhdGNoLlVwc3RyZWFtCj4gPiArcGFj
a2FnZS9udHAvMDAwMS1udHAtc3lzY2FsbHMtZmFsbGJhY2sucGF0Y2ggbGliX3BhdGNoLlVwc3Ry
ZWFtCj4gPiAgcGFja2FnZS9udHAvUzQ5bnRwLmluIGxpYl9zeXN2LlZhcmlhYmxlcwo+ID4gIHBh
Y2thZ2UvbnRwc2VjLzAwMDEtd3NjcmlwdC1yZW1vdmUtY2hlY2tzLWZvci1ic2Qtc3RyaW5nLmgt
Zml4ZXMtaG9zdC1jby5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KPiA+ICBwYWNrYWdlL251bWFj
dGwvMDAwMS1saW5rLXdpdGgtbGF0b21pYy1pZi1uZWVkZWQtYWdhaW4ucGF0Y2ggbGliX3BhdGNo
LlVwc3RyZWFtCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9udHAvMDAwMS1uYW5vLnBhdGNoIGIv
cGFja2FnZS9udHAvMDAwMS1uYW5vLnBhdGNoCj4gPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQK
PiA+IGluZGV4IGJjZTM0NzgyNjEuLjAwMDAwMDAwMDAKPiA+IC0tLSBhL3BhY2thZ2UvbnRwLzAw
MDEtbmFuby5wYXRjaAo+ID4gKysrIC9kZXYvbnVsbAo+ID4gQEAgLTEsMjggKzAsMCBAQAo+ID4g
LUZpeGVzIGlzc3VlcyB3aXRoIGdsaWJjIGhlYWRlciBmaWxlcywgc2VlCj4gPiAtaHR0cDovL2J1
Z3MuZ2VudG9vLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjcwNDgzCj4gPiAtCj4gPiAtU2lnbmVkLW9m
Zi1ieTogR3VzdGF2byBaYWNhcmlhcyA8Z3VzdGF2b0B6YWNhcmlhcy5jb20uYXI+Cj4gPiAtCj4g
PiAtUmViYXNlIHRvIGFwcGx5IGNsZWFubHkuCj4gPiAtCj4gPiAtU2lnbmVkLW9mZi1ieTogRGFu
b21pIE1hbmNoZWdvIDxkYW5vbWltYW5jaGVnbzEyM0BnbWFpbC5jb20+Cj4gPiAtCj4gPiAtCj4g
PiAtZGlmZiAtcHVyTiBhL2luY2x1ZGUvbnRwX3N5c2NhbGwuaCBiL2luY2x1ZGUvbnRwX3N5c2Nh
bGwuaAo+ID4gLS0tLSBhL2luY2x1ZGUvbnRwX3N5c2NhbGwuaCAgMjAxNS0wMi0xMSAwODo0Mjoz
Ny43OTQ1NzY0NjkgLTA1MDAKPiA+IC0rKysgYi9pbmNsdWRlL250cF9zeXNjYWxsLmggIDIwMTUt
MDItMTEgMDg6NDM6MDMuMjE2OTU3Mjc5IC0wNTAwCj4gPiAtQEAgLTEwLDYgKzEwLDE0IEBACj4g
PiAtICMgaW5jbHVkZSA8c3lzL3RpbWV4Lmg+Cj4gPiAtICNlbmRpZgo+ID4gLQo+ID4gLSsjaWYg
ZGVmaW5lZChBREpfTkFOTykgJiYgIWRlZmluZWQoTU9EX05BTk8pCj4gPiAtKyNkZWZpbmUgTU9E
X05BTk8gQURKX05BTk8KPiA+IC0rI2VuZGlmCj4gPiAtKwo+ID4gLSsjaWYgZGVmaW5lZChBREpf
VEFJKSAmJiAhZGVmaW5lZChNT0RfVEFJKQo+ID4gLSsjZGVmaW5lIE1PRF9UQUkgQURKX1RBSQo+
ID4gLSsjZW5kaWYKPiA+IC0rCj4gPiAtICNpZm5kZWYgTlRQX1NZU0NBTExTX0xJQkMKPiA+IC0g
IyBpZmRlZiBOVFBfU1lTQ0FMTFNfU1RECj4gPiAtICMgIGRlZmluZSBudHBfYWRqdGltZSh0KSAg
ICBzeXNjYWxsKFNZU19udHBfYWRqdGltZSwgKHQpKQo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bnRwLzAwMDItbnRwLXN5c2NhbGxzLWZhbGxiYWNrLnBhdGNoIGIvcGFja2FnZS9udHAvMDAwMS1u
dHAtc3lzY2FsbHMtZmFsbGJhY2sucGF0Y2gKPiA+IHNpbWlsYXJpdHkgaW5kZXggMTAwJQo+ID4g
cmVuYW1lIGZyb20gcGFja2FnZS9udHAvMDAwMi1udHAtc3lzY2FsbHMtZmFsbGJhY2sucGF0Y2gK
PiA+IHJlbmFtZSB0byBwYWNrYWdlL250cC8wMDAxLW50cC1zeXNjYWxscy1mYWxsYmFjay5wYXRj
aAo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbnRwLzAwMDMtZml4LXB0aHJlYWQtZGV0YWNoLWNo
ZWNrLnBhdGNoIGIvcGFja2FnZS9udHAvMDAwMi1maXgtcHRocmVhZC1kZXRhY2gtY2hlY2sucGF0
Y2gKPiA+IHNpbWlsYXJpdHkgaW5kZXggMTAwJQo+ID4gcmVuYW1lIGZyb20gcGFja2FnZS9udHAv
MDAwMy1maXgtcHRocmVhZC1kZXRhY2gtY2hlY2sucGF0Y2gKPiA+IHJlbmFtZSB0byBwYWNrYWdl
L250cC8wMDAyLWZpeC1wdGhyZWFkLWRldGFjaC1jaGVjay5wYXRjaAo+ID4gLS0KPiA+IDIuMzQu
MQo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+
ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cj4KPiAtLQo+IC4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCj4gfCAgWWFubiBFLiBNT1JJTiAgfCBS
ZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6
IHwKPiB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlH
TiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAo+IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0t
LS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4g
fCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAg
IHwgICB2ICAgY29uc3BpcmFjeS4gIHwKPiAnLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Xi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
