Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E78C3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65797401BB;
	Fri, 12 Jul 2024 20:53:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HL8Uix9Ps17J; Fri, 12 Jul 2024 20:53:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7B7C408FE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7B7C408FE;
	Fri, 12 Jul 2024 20:53:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E7B91BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C2A860651
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:53:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWBwnuOImVxI for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:53:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE06D6063D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE06D6063D
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE06D6063D
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:53:27 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-426717a2d12so14830625e9.0
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:53:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720817606; x=1721422406;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ySYL23tAhtx175ZMGxXn21oap9YxnR3vhlEGffeNcAg=;
 b=fkFroyw98tTiW+aa89VO4KyUyfAba3lEjEYeyh3+s2iRgz56RZzlf8OWwF5uvXtOfH
 D4WapRdqzepxbPjSTFN2lj4DS7ryWFJe4not4f5XId0trjdAmmnCC+d0cbBYpcxVK2XA
 GO8ZUFz1esymhkqv8vASe0NzlopkLbl619kM+lVYsdlQSsiXv+bWbP73JY2xPdA7vtje
 xpTiWLY9i0gQ/d8ZOlhUdgN0oL1muj4GykA4kVgdDQfaXDyp9teDBN+Xg3cpeSzQ7UKq
 IswWIlfo+PklIJ7+P0RvwPlXbP/DLf/kr/a5kmzQS8oARuM7oMumtfYtLR8ymL8cYx/L
 74aQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQR3M7aRBegnnG1MTaE3j8HcyHg7bbo53/pkdq6gN5xpolppLIUjoN04KZRwXYGX45Q4nGkORf43ABKTnyT86CtP6mtnnrJQ==
X-Gm-Message-State: AOJu0Yw/b4uMRIeTSqehaci0BFoPBO93ijMMKUq/jF/p9AmAPxkOblca
 yh7dKnQc9m2GePGqf9B6ZCwl6fSJFNn82dAdrjNuZN+IiKK27k3Zf++qKmJ+elqBuNZRfJV6i5a
 M
X-Google-Smtp-Source: AGHT+IFQO/BSbQTy1eD9bSj3PHFZpoWohHHFKIIkICrNvZ782rcIHpDW7sXP2AUD4yPJZiOhK397Eg==
X-Received: by 2002:a05:600c:49a6:b0:426:6dc7:da94 with SMTP id
 5b1f17b1804b1-4279da43575mr25483835e9.20.1720817605683; 
 Fri, 12 Jul 2024 13:53:25 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfab0bfsm10956384f8f.99.2024.07.12.13.53.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 13:53:25 -0700 (PDT)
Message-ID: <15553cba-9508-4097-b879-131ab1cf59bb@smile.fr>
Date: Fri, 12 Jul 2024 22:53:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryan Brattlof <bb@ti.com>
References: <20240711060531.4067193-1-p-bhagat@ti.com>
 <e0c35138-a12c-42e3-9c7e-1eb9113b001e@smile.fr>
 <20240712203934.zbqkteq4ggtkat4f@bryanbrattlof.com>
Content-Language: en-US
In-Reply-To: <20240712203934.zbqkteq4ggtkat4f@bryanbrattlof.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720817606; x=1721422406; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ySYL23tAhtx175ZMGxXn21oap9YxnR3vhlEGffeNcAg=;
 b=gPY6yzXKebsKRJHeHIOzpPpQitq2jgQAsnOrhgEuzI8gtOlCBgm1e509vUS3QbKP1g
 ww2AAtc9aI1YBqQrRksSkeWJdPnwq6ChRzqUHzNaJtDzHv0enV35LLz9C2KdSw9WrelC
 XD1v6nRiqvHo0X6XwjjZ9oFwgc3SBza1gJ6e4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=gPY6yzXK
Subject: Re: [Buildroot] [PATCH v4] boot/ti-k3-boot-firmware: Add config
 option to specify version
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Chirag Shilwant <c-shilwant@ti.com>, Gyan Gupta <g-gupta@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>, Paresh Bhagat <p-bhagat@ti.com>,
 Syed Mohammed Khasim <khasim@ti.com>, buildroot@buildroot.org,
 Andreas Dannenberg <dannenberg@ti.com>,
 Sai Sree Kartheek Adivi <s-adivi@ti.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQnJ5YW4sCgpMZSAxMi8wNy8yMDI0IMOgIDIyOjM5LCBCcnlhbiBCcmF0dGxvZiBhIMOpY3Jp
dMKgOgo+IE9uIEp1bHkgMTIsIDIwMjQgdGh1cyBzYXlldGggUm9tYWluIE5hb3VyIHZpYSBidWls
ZHJvb3Q6Cj4+IEhlbGxvIFBhcmVzaCwgQWxsLAo+Pgo+PiBMZSAxMS8wNy8yMDI0IMOgIDA4OjA1
LCBQYXJlc2ggQmhhZ2F0IHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPj4+IFByZXZpb3VzbHkg
dGhlIHZlcnNpb24gb2YgdGktazMtYm9vdC1maXJtd2FyZSAoVElfSzNfQk9PVF9GSVJNV0FSRV9W
RVJTSU9OKSB3YXMKPj4+IGZpeGVkIGluIG1rIGZpbGUuIEludHJvZHVjZSBhIG5ldyBjb25maWcg
b3B0aW9uIEJSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTgo+Pj4g
c28gdGhhdCB1c2VyIGNhbiBjaGFuZ2UgdGhlIHZlcnNpb24gZm9yIHRpLWszLWJvb3QtZmlybXdh
cmUgdXNpbmcgbWVudWNvbmZpZy4KPj4+Cj4+PiBUaGlzIHByb3ZpZGVzIGdyZWF0ZXIgZmxleGli
aWxpdHkgZm9yIHVzZXJzIHRvIHNlbGVjdCBkaWZmZXJlbnQgdmVyc2lvbnMgb2YKPj4+IHRpLWsz
LWJvb3QtZmlybXdhcmUgd2l0aG91dCBtb2RpZnlpbmcgdGhlIGJ1aWxkIHNjcmlwdCBkaXJlY3Rs
eS4KPj4KPj4gSXMgdGhlIG1haW4gcmVhc29uIHRvIGFkZCBhbiBvcHRpb24gdG8gc3BlY2lmeSB0
aGUgdGktazMtYm9vdC1maXJtd2FyZSB2ZXJzaW9uCj4+IGlzIGJlY2F1c2UgaXQgbXVzdCBtYXRj
aCBleGFjdGx5IHdpdGggdGhlIHNlbGVjdGVkIHUtYm9vdCBvciB0aS1rMy1yNS1sb2FkZXIKPj4g
dmVyc2lvbiBkdWUgdG8gdGhlIFRJLVNDSSBwcm90b2NvbCBhbmQgdGhlIERNU0MgcHJlYnVpbHQg
ZmlybXdhcmUgYmluYXJ5Cj4+IChwcm92aWRlZCBieSBUSSkgKERNU0MgaXMgdGhlIFNlY3VyaXR5
IE1hbmFnZXIgQ29yZSBpbiB0aGUgU29DKT8KPj4KPiAKPiBUaGUgVEktU0NJIHByb3RvY29sIHdp
bGwgYWx3YXlzIGJlIGJhY2t3YXJkIGNvbXBhdGlibGUuIFRoZXJlIHNob3VsZCBiZSAKPiBubyB3
b3JyaWVzIGFib3V0IHVzaW5nIGFuIG9sZGVyIFRJRlMvRE0vRE1TQyBmaXJtd2FyZSB3aXRoIG5l
d2VyIGtlcm5lbHMgCj4gYW5kIGJvb3Rsb2FkZXJzIGFuZCBhbnkgZXJyb3JzIGFueW9uZSBzZWVz
IHNob3VsZCBiZSByZXBvcnRlZCB0byBUSSBzbyAKPiBpdCBjYW4gYmUgYWRkcmVzc2VkLgo+IAo+
IEl0IGdldHMgYSBsaXR0bGUgd2VpcmQgd2l0aCB0aGUgVElGUyA8LT4gRE0gY29tbXVuaWNhdGlv
biBzbyBpdCdzIAo+IHJlY29tbWVuZGVkIHRvIGtlZXAgdGhvc2UgaW4gc3luYy4gSSBoYXZlbid0
IHNlZW4gYW55IGlzc3VlcyBidXQgdGhhdCAKPiBkb2Vzbid0IG1lYW4gdGhleSBkb24ndCBleGlz
dC4KClRoYW5rcyBmb3IgdGhlIGluZm8sIGNhbiB5b3UgYWRkIHRoaXMgcmVjb21tZW5kYXRpb24g
aW4gdGhlIGNvbW1pdCBsb2c/Cgo+IAo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFBhcmVzaCBCaGFn
YXQgPHAtYmhhZ2F0QHRpLmNvbT4KPj4+Cj4+PiAtLS0KPj4+IENoYW5nZXMgdjMgLT4gdjQ6Cj4+
PiAgIC0gVGkgazMgLT4gVEkgSzMgKFN1Z2dlc3RlZCBieSBBbmRyZWFzIERhbm5lbmJlcmcpCj4+
PiAgIC0gZ2l0LnRpLm9yZyAtPiBnaXQudGkuY29tIChTdWdnZXN0ZWQgYnkgQW5kcmVhcyBEYW5u
ZW5iZXJnKQo+Pj4KPj4+IENoYW5nZXMgdjIgLT4gdjM6Cj4+PiAgIC0gZmxleGliaWx0eSAtPiBm
bGV4aWJpbGl0eSAoU3VnZ2VzdGVkIGJ5IENoaXJhZyBTaGlsd2FudCkKPj4+Cj4+PiBDaGFuZ2Vz
IHYxIC0+IHYyOgo+Pj4gICAtIEZpeCB3aGl0ZXNwYWNlcy9pbmRlbnRhdGlvbiBpbiBDb25maWcu
aW4gZmlsZSAoU3VnZ2VzdGVkIGJ5IEJyeWFuIEJyYXR0bG9mKQo+Pj4KPj4+IC0tLQo+Pj4gIGJv
b3QvdGktazMtYm9vdC1maXJtd2FyZS9Db25maWcuaW4gICAgICAgICAgICB8IDMwICsrKysrKysr
KysrKysrKysrKysKPj4+ICAuLi4vdGktazMtYm9vdC1maXJtd2FyZS5tayAgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQo+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9ib290L3RpLWszLWJvb3QtZmlybXdhcmUv
Q29uZmlnLmluIGIvYm9vdC90aS1rMy1ib290LWZpcm13YXJlL0NvbmZpZy5pbgo+Pj4gaW5kZXgg
ZDgwYmI0YmRiMy4uNTgxZWMwYzNiOSAxMDA2NDQKPj4+IC0tLSBhL2Jvb3QvdGktazMtYm9vdC1m
aXJtd2FyZS9Db25maWcuaW4KPj4+ICsrKyBiL2Jvb3QvdGktazMtYm9vdC1maXJtd2FyZS9Db25m
aWcuaW4KPj4+IEBAIC01LDMgKzUsMzMgQEAgY29uZmlnIEJSMl9UQVJHRVRfVElfSzNfQk9PVF9G
SVJNV0FSRQo+Pj4gIAkgIFRoaXMgcGFja2FnZSBkb3dubG9hZHMgYW5kIGluc3RhbGxzIHRoZSBU
SS1zcGVjaWZpYyB0aS1zeXNmdwo+Pj4gIAkgIGFuZCB0aS1kbSBmaXJtd2FyZSBuZWVkZWQgdG8g
Ym9vdCBUSSBLMyBwbGF0Zm9ybXMgKHdoaWNoCj4+PiAgCSAgaW5jbHVkZSBBTTYyeCwgQU02NHgs
IEFNNjV4IGFuZCBtb3JlKS4KPj4+ICsKPj4+ICtpZiBCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklS
TVdBUkUKPj4+ICtjaG9pY2UKPj4+ICsJcHJvbXB0ICJ0aS1rMy1ib290LWZpcm13YXJlIHZlcnNp
b24iCj4+PiArCWRlZmF1bHQgQlIyX1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJFX0xBVEVTVF9W
RVJTSU9OCj4+PiArCWhlbHAKPj4+ICsJICBTZWxlY3QgdGhlIHZlcnNpb24gb2YgVEkgSzMgYm9v
dCBmaXJtd2FyZSB5b3Ugd2FudCB0byB1c2UuCj4+PiArCj4+PiArY29uZmlnIEJSMl9UQVJHRVRf
VElfSzNfQk9PVF9GSVJNV0FSRV9MQVRFU1RfVkVSU0lPTgo+Pj4gKwlib29sICIwOS4wMi4wMC4w
MDkiCj4+PiArCj4+PiArY29uZmlnIEJSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FSRV9DVVNU
T01fVkVSU0lPTgo+Pj4gKwlib29sICJDdXN0b20gdmVyc2lvbiIKPj4+ICsJaGVscAo+Pj4gKwkg
IFRoaXMgb3B0aW9uIGFsbG93cyB0byB1c2UgYSBzcGVjaWZpYyBvZmZpY2lhbCB2ZXJzaW9uIGZy
b20KPj4+ICsJICBnaXQudGkuY29tLgo+Pgo+PiBXaGVuIHlvdSB1c2UgdGhpcyBvcHRpb24sIHlv
dSBuZWVkIHRvIGRpc2FibGUgdGhlIGhhc2ggY2hlY2tpbmcgd2l0aDoKPj4KPj4gQlJfTk9fQ0hF
Q0tfSEFTSF9GT1IgKz0gJChUSV9LM19CT09UX0ZJUk1XQVJFX1NPVVJDRSkKPj4KPj4gT3RoZXJ3
aXNlIHlvdSBnZXQ6Cj4+Cj4+IEVSUk9SOiBObyBoYXNoIGZvdW5kIGZvciB0aS1saW51eC1maXJt
d2FyZS0xMC4wMC4wNS50YXIueHoKPj4KPj4gU2VlIGhvdyBpdCdzIGRvbmUgZm9yIHRpLWszLXI1
LWxvYWRlcjoKPj4KPj4gaWZlcSAoJChCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUikkKEJSMl9U
QVJHRVRfVElfSzNfUjVfTE9BREVSX0xBVEVTVF9WRVJTSU9OKSx5KQo+PiBCUl9OT19DSEVDS19I
QVNIX0ZPUiArPSAkKFRJX0szX1I1X0xPQURFUl9TT1VSQ0UpCj4+IGVuZGlmCj4+Cj4gCj4gQWgg
eWVhaCBhbmQgd2Ugc2hvdWxkIHByb2JhYmx5IGFkZCB0aGUgY29ycmVzcG9uZGluZyBoYXNoIGZp
bGVzIGluIHRoZSAKPiBib2FyZCBkaXJlY3Rvcnkgb2YgdGhlIGJvYXJkcyB3aG8gdXNlIHRoaXMg
Zm9yIHdoZW4gdGhpcyB2ZXJzaW9uIAo+IGNoYW5nZXMuIE9vcHMKClllcywgcGVyZmVjdCEKCkJl
c3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiB+QnJ5YW4KPiAKPj4gQmVzdCByZWdhcmRzLAo+PiBS
b21haW4KPj4KPj4KPj4+ICsKPj4+ICtlbmRjaG9pY2UKPj4+ICsKPj4+ICtjb25maWcgQlIyX1RB
UkdFVF9USV9LM19CT09UX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OX1ZBTFVFCj4+PiArCXN0cmlu
ZyAiQ3VzdG9tIHRpLWszLWJvb3QtZmlybXdhcmUgdmVyc2lvbiIKPj4+ICsJZGVwZW5kcyBvbiBC
UjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT04KPj4+ICsKPj4+ICtj
b25maWcgQlIyX1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJFX1ZFUlNJT04KPj4+ICsJc3RyaW5n
Cj4+PiArCWRlZmF1bHQgIjA5LjAyLjAwLjAwOSIgICAgIGlmIEJSMl9UQVJHRVRfVElfSzNfQk9P
VF9GSVJNV0FSRV9MQVRFU1RfVkVSU0lPTgo+Pj4gKwlkZWZhdWx0IEJSMl9UQVJHRVRfVElfSzNf
Qk9PVF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTl9WQUxVRSBcCj4+PiArCQkJCWlmIEJSMl9UQVJH
RVRfVElfSzNfQk9PVF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTgo+Pj4gKwo+Pj4gK2VuZGlmCj4+
PiBkaWZmIC0tZ2l0IGEvYm9vdC90aS1rMy1ib290LWZpcm13YXJlL3RpLWszLWJvb3QtZmlybXdh
cmUubWsgYi9ib290L3RpLWszLWJvb3QtZmlybXdhcmUvdGktazMtYm9vdC1maXJtd2FyZS5tawo+
Pj4gaW5kZXggOTMzMjczMmFkNC4uMzUwMzgxZWJiZSAxMDA2NDQKPj4+IC0tLSBhL2Jvb3QvdGkt
azMtYm9vdC1maXJtd2FyZS90aS1rMy1ib290LWZpcm13YXJlLm1rCj4+PiArKysgYi9ib290L3Rp
LWszLWJvb3QtZmlybXdhcmUvdGktazMtYm9vdC1maXJtd2FyZS5tawo+Pj4gQEAgLTQsNyArNCw3
IEBACj4+PiAgIwo+Pj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4+PiAgCj4+PiAtVElfSzNf
Qk9PVF9GSVJNV0FSRV9WRVJTSU9OID0gMDkuMDIuMDAuMDA5Cj4+PiArVElfSzNfQk9PVF9GSVJN
V0FSRV9WRVJTSU9OID0gJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJN
V0FSRV9WRVJTSU9OKSkKPj4+ICBUSV9LM19CT09UX0ZJUk1XQVJFX1NJVEUgPSBodHRwczovL2dp
dC50aS5jb20vY2dpdC9wcm9jZXNzb3ItZmlybXdhcmUvdGktbGludXgtZmlybXdhcmUvc25hcHNo
b3QKPj4+ICBUSV9LM19CT09UX0ZJUk1XQVJFX1NPVVJDRSA9IHRpLWxpbnV4LWZpcm13YXJlLSQo
VElfSzNfQk9PVF9GSVJNV0FSRV9WRVJTSU9OKS50YXIueHoKPj4+ICBUSV9LM19CT09UX0ZJUk1X
QVJFX0lOU1RBTExfSU1BR0VTID0gWUVTCj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
