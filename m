Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD0AE77187
	for <buildroot@archiver.kernel.org>; Wed, 18 Dec 2024 14:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49825848D0;
	Wed, 18 Dec 2024 14:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BKZLR5yFfWNr; Wed, 18 Dec 2024 14:55:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B7BB84740
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B7BB84740;
	Wed, 18 Dec 2024 14:55:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D81AC0
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 14:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57B5784740
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 14:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ai80PYhFF84C for <buildroot@buildroot.org>;
 Wed, 18 Dec 2024 14:55:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 83C0C820D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83C0C820D9
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83C0C820D9
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 14:55:36 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso5846265e9.1
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 06:55:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734533734; x=1735138534;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cAXm9vUioiNxC2Y1EcaA/GpssouO+htabCJnomPmPrc=;
 b=NHgrdbnZChom+au2ZRpgnLPJzQDC17/ILTsOaVhKdRpS1TWHgEtaBiBi6qjKF27pBE
 JfpEorvLno29/7G5Thhfgyov1UMYDzsjdiq0eTobv7PBp7s155twN9o+UIsExwSmxBf1
 n2HxYvaV8WpHYXYLfJPPBUrqo0Clg9xWVXQ++IOuPylLRhb1nZ3s2TuJlPVmvBb3nK1p
 ognVhu7LnySDW3eMUv1lXI9bRROHX7PGVmnvYiyNXe5/5WeKuqoa+J3sK5KoKP5i00lV
 m9NVXzAq4rNzCKHLEiSA7wtVPkZCxTAMts7oyfeMhK5As9iT55eaMC0Vms91Gk7kMPyG
 AjwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhXmKR+xHLnh7A66Afm0S5RQX0VSyoZYND9bpO4nw2kxoaQyZ1hMpROMRsAvIdWL2s/8ma8YqQf4M=@buildroot.org
X-Gm-Message-State: AOJu0YxkirndhQIkY2F686vKt7Lp5Gu+/6+lfONz1cF6W5f9pV3PWf7p
 DDRsvFWe7IcmKVLLg4JQY0FBW3SRlwx156/1JQtY+0DeOuH2T1pyKjpW0i0slXQ=
X-Gm-Gg: ASbGnctDbl5WS43u5Ic0aI3C1zWWZ1B5lAwxQai0/loq0hoMbZbuKFsUdJN8+OHB0v0
 VSC+IAEnqB3+EfdvaV+sDdGGm4JTpY7F2tnXYdM7CVyQvetpWkBtEOw/xk7SJdYesxQ5wHCgw1V
 gTTMsM+N65xqOaBy2LB0d9FXVQYuJowbR2mb4msHFsNA4w5lQ0EMT1DatXlIHJGGyFlLti7gblO
 OObgw2cQeGbKdZTTdQa82Knb53v2ThAt8w5SlwQN8idqBHqF2zRaNfxzY6FtQb29UPtZfTORFrN
 jZKvIfYUr6EPvU6OvbxUh44qZm240gUzSerDB5phDPhFzwKaAJUyNqwHVc8iMeqNjpPgGXYUmK4
 78XiCni06VR4WJuZ3
X-Google-Smtp-Source: AGHT+IEhJ6ETMNJJDC6Gl+fDnF2HHreoSy+DRse4bYampVK/xYD9APZA31T8FOBoeU4vMH2MQQoA5A==
X-Received: by 2002:a05:600c:138d:b0:434:f2af:6e74 with SMTP id
 5b1f17b1804b1-436553e65b7mr28853045e9.15.1734533734237; 
 Wed, 18 Dec 2024 06:55:34 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b441bbsm22480095e9.40.2024.12.18.06.55.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 06:55:33 -0800 (PST)
Message-ID: <3ea35c40-07d1-41d3-b4f9-08bbb0336d24@smile.fr>
Date: Wed, 18 Dec 2024 15:55:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Buildroot development <buildroot@buildroot.org>
Cc: Michael Walle <mwalle@kernel.org>, Chris Packham
 <judge.packham@gmail.com>, Sergey Matyukevich <geomatsi@gmail.com>
References: <035d6d78-0a31-4083-8fa1-65f5be5f74b5@grenoble.cnrs.fr>
Content-Language: en-US
In-Reply-To: <035d6d78-0a31-4083-8fa1-65f5be5f74b5@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1734533734; x=1735138534; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cAXm9vUioiNxC2Y1EcaA/GpssouO+htabCJnomPmPrc=;
 b=2nAx/Sjnq1OQCLkKbB4tGooHiaxexENMN/WoZbRX/8JViVoqtztNJMrHlq/zxtppkf
 q1U3zEu2l0QtbXta8rbQvu10SDiLoMqUoU3VJ2bQwxVzGbMFflktxuCyBJL29nevpoCr
 4Se53V53a5EeU4nG/q7TVG7j6gRMcH+3UveLs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=2nAx/Sjn
Subject: Re: [Buildroot] [PATCH v2 1/1] linux: make out-of-tree DTS work
 with newest kernels
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

SGVsbG8gRWRnYXIsCgpMZSAxNy8xMi8yMDI0IMOgIDEwOjU1LCBFZGdhciBCb25ldCBhIMOpY3Jp
dMKgOgo+IFNpbmNlIExpbnV4IDYuMTIgKGNvbW1pdCBlN2UyOTQxMzAwZDIsICJrYnVpbGQ6IHNw
bGl0IGRldmljZSB0cmVlIGJ1aWxkCj4gcnVsZXMgaW50byBzY3JpcHRzL01ha2VmaWxlLmR0YnMi
KSwgdGhlIGtlcm5lbCBidWlsZCBwcm9jZXNzIGRvZXMgbm90Cj4gYnVpbGQgdGhlIERUQnMgZnJv
bSB0aGUgc291cmNlIGZpbGVzIGxpc3RlZCBpbgo+IEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RU
U19QQVRILlsxXSBUaGlzIGlzIGJlY2F1c2UgaXQgZXhwZWN0cyBhbGwgdGhlCj4gRFRTIGZpbGVz
IHRvIGxpdmUgaW4gdmVuZG9yLXNwZWNpZmljIHN1YmRpcmVjdG9yaWVzIG9mCj4gYXJjaC8kQVJD
SC9ib290L2R0cy8gLCB3aGVyZWFzIEJ1aWxkcm9vdCBkcm9wcyB0aGVtIGluIHRoZSB0b3AgZHRz
Cj4gZGlyZWN0b3J5LgoKTWF5YmUgd2UgY291bGQgYWRkIHNvbWUgYWRkaXRpb25hbCBleHBsYW5h
dGlvbjoKCkJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRIIHdhcyBpbnRyb2R1Y2VkIGlu
IEJ1aWxkcm9vdCAyMDEyLjA4IFsxXSBhdCB0aGUKdGltZSB0aGUga2VybmVsIGRpZG4ndCBoYXZl
IGFueSB2ZW5kb3Itc3BlY2lmaWMgc3ViZGlyZWN0b3J5IGluCmFyY2gvJEFSQ0gvYm9vdC9kdHMv
LgoKdmVuZG9yLXNwZWNpZmljIHN1YmRpcmVjdG9yeSB3YXMgaW50cm9kdWNlZCBpbiBrZXJuZWwg
djMuMTkgWzJdIGZvciBBUk02NCBhbmQgaW4Ka2VybmVsIHY2LjUgZm9yIEFSTSBbM10uIE5vdGUs
IG90aGVyIGFyY2ggdGhhbiBBUk0gYW5kIEFSTTY0IGRvZXNuJ3QgYWN0dWFsbHkKdXNlIGEgdmVu
ZG9yLXNwZWNpZmljIHN1YmRpcmVjdG9yeSAobm90IGV2ZW4gcG93ZXJwYykuCgpZb3VyIGNvbW1l
bnQgZG9lc24ndCBzZWVtcyB0byBhcHBseSBmb3Igbm9uIEFSTXssNjR9IGFyY2g6CiJUaGlzIGlz
IGJlY2F1c2UgaXQgZXhwZWN0cyBhbGwgdGhlIERUUyBmaWxlcyB0byBsaXZlIGluIHZlbmRvci1z
cGVjaWZpYwpzdWJkaXJlY3RvcmllcyBvZiBhcmNoLyRBUkNIL2Jvb3QvZHRzLyIKClsxXQpodHRw
czovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvNjlmYzQ5N2Rm
MGFlNTFiY2M4YTA2N2M4NDk0NDdhYmRlYjNjYjJiZQpbMl0KaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9jb21taXQvP2lkPWNh
NWIzNDEwMGM1NzE2NThlNjA1YzU1NTRhYWMzNzQ2NDk1OTMzMjcKWzNdCmh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvY29tbWl0
Lz9pZD03MjRiYTY3NTE1MzIwNTVkYjc1OTkyZmM2YWUyMWMzZTMyMmU5NGE3CgoKPiAKPiBGdWxm
aWxsaW5nIHRoaXMga2VybmVsIGV4cGVjdGF0aW9uIHdvdWxkIHJlcXVpcmUgYSBuZXcgY29uZmln
dXJhdGlvbgo+IHBhcmFtZXRlciBmb3IgdGhlIG5hbWUgb2YgdGhlIGFwcHJvcHJpYXRlIHZlbmRv
ciBzdWJkaXJlY3RvcnkuIEl0IHdvdWxkCj4gYWxzbyByZXF1aXJlIGNoYW5naW5nIHRoZSByZWxh
dGl2ZSBwYXRocyB0byBpbmNsdWRlZCAuZHRzaSBmaWxlcy4KPiAKPiBMZXQncyBhZGQgaW5zdGVh
ZCBhIHJ1bGUgdG8gdGhlIHRvcCBkdHMvTWFrZWZpbGUgZm9yIGVhY2ggRFRCIHdlIHdhbnQgdG8K
PiBidWlsZC4gVGhpcyBhdm9pZHMgYnJlYWtpbmcgdXNlcidzIG91dC1vZi10cmVlIGNvbmZpZ3Vy
YXRpb25zLgo+IAo+IFsxXSBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvcGlwZXJtYWlsL2J1
aWxkcm9vdC8yMDI0LU9jdG9iZXIvNzY1NDYzLmh0bWwKCk5vdGU6IFlvY3RvIGRvZXNuJ3QgcmVs
eSBvbiB0aGUga2VybmVsIGJ1aWxkIGluZnJhc3RydWN0dXJlIHRvIGJ1aWxkIHVzZXIKcHJvdmlk
ZWQgZGV2aWNldHJlZSBbNF0uCgpNYXliZSB3ZSBzaG91bGQgY29uc2lkZXIgYWRkaW5nIGEgbmV3
IHBhY2thZ2UgaW5mcmFzdHJ1Y3R1cmUgbGlrZSBrZXJuZWwtbW9kdWxlPwoKWzRdCmh0dHBzOi8v
Z2l0aHViLmNvbS9vcGVuZW1iZWRkZWQvb3BlbmVtYmVkZGVkLWNvcmUvYmxvYi9mNjQyZWRiMDA2
YThjMTZkYmU0NTY4MWFmZTU0N2VhYmZhZTE3MDczL21ldGEvY2xhc3Nlcy1yZWNpcGUvZGV2aWNl
dHJlZS5iYmNsYXNzI0w1OUMxLUw1OUM5CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gUmVw
b3J0ZWQtYnk6IENocmlzIFBhY2toYW0gPGp1ZGdlLnBhY2toYW1AZ21haWwuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IEVkZ2FyIEJvbmV0IDxib25ldEBncmVub2JsZS5jbnJzLmZyPgo+IC0tLQo+IENo
YW5nZXMgdjEgLT4gdjI6Cj4gICAtIGRlZmluZSBhIGhvb2sgZm9yIExJTlVYX1BPU1RfUEFUQ0hf
SE9PS1MgYW5kIExJTlVYX1BPU1RfUlNZTkNfSE9PS1MKPiAgICAgaW5zdGVhZCBvZiBtb2RpZnlp
bmcgTElOVVhfQlVJTERfQ01EUwo+ICAgLSB1c2UgJChwYXRzdWJzdCAlLmR0cywlLmR0YiwkKGR0
cykpIGluc3RlYWQgb2YgJChkdHM6JS5kdHM9JS5kdGIpCj4gYm90aCBjaGFuZ2VzIHN1Z2dlc3Rl
ZCBieSBBcm5vdXQgVmFuZGVjYXBwZWxsZS4KPiAKPiBJIHJhbiB0aGUgZm9sb3dpbmcgYnVpbGQg
dGVzdHM6Cj4gCj4gICAgICMgVGVzdCB3aXRoIGFuIG9sZCBrZXJuZWw6IHY2LjYuMzAKPiAgICAg
bWFrZSBhY21lc3lzdGVtc19hY3F1YV9hNV81MTJtYl9kZWZjb25maWcKPiAgICAgbWFrZSBsaW51
eAo+IAo+ICAgICAjIFRlc3Qgd2l0aCBhIG5ldyBrZXJuZWw6IHY2LjEyLjUKPiAgICAgbWFrZSBs
aW51eC1kaXJjbGVhbgo+ICAgICBnaXQgY2hlcnJ5LXBpY2sgMDkzODM0NmNkZSAgIyBidW1wIEFj
cXVhJ3Mga2VybmVsIHRvIHY2LjEyLjUKPiAgICAgbWFrZSBhY21lc3lzdGVtc19hY3F1YV9hNV81
MTJtYl9kZWZjb25maWcKPiAgICAgbWFrZSBsaW51eAo+IAo+ICAgICAjIFRlc3QgdGhlIE9WRVJS
SURFX1NSQ0RJUiBjYXNlLgo+ICAgICBtYWtlIGxpbnV4LWRpcmNsZWFuCj4gICAgIGdpdCAtQyAk
SE9NRS9zcmMvbGludXggY2hlY2tvdXQgdjYuMTIuNQo+ICAgICBlY2hvICJMSU5VWF9PVkVSUklE
RV9TUkNESVIgPSAkSE9NRS9zcmMvbGludXgiID4gbG9jYWwubWsKPiAgICAgbWFrZSBhY21lc3lz
dGVtc19hY3F1YV9hNV81MTJtYl9kZWZjb25maWcKPiAgICAgbWFrZSBsaW51eAo+IAo+ICBsaW51
eC9saW51eC5tayB8IDExICsrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRp
b25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2xpbnV4L2xpbnV4Lm1rIGIvbGludXgvbGludXgubWsK
PiBpbmRleCAxZDNkOGZmZmE2Li5lYjUwOWZkNzQ3IDEwMDY0NAo+IC0tLSBhL2xpbnV4L2xpbnV4
Lm1rCj4gKysrIGIvbGludXgvbGludXgubWsKPiBAQCAtMzI3LDYgKzMyNywxNyBAQCBkZWZpbmUg
TElOVVhfVFJZX1BBVENIX1RJTUVDT05TVAo+ICBlbmRlZgo+ICBMSU5VWF9QT1NUX1BBVENIX0hP
T0tTICs9IExJTlVYX1RSWV9QQVRDSF9USU1FQ09OU1QKPiAgCj4gKyMgS2VybmVscyA2LjEyKyB3
b24ndCBjb21waWxlIHRoZSBjdXN0b20gRFRTIGZpbGVzIHdlIGRyb3AgaW50bwo+ICsjIGFyY2gv
JEFSQ0gvYm9vdC9kdHMgdW5sZXNzIHdlIGFkZCBzcGVjaWZpYyBydWxlcyB0byB0aGF0IGRpcmVj
dG9yeSdzCj4gKyMgTWFrZWZpbGUuCj4gK2RlZmluZSBMSU5VWF9BRERfRFRCX01BS0VfUlVMRVMK
PiArCSQoZm9yZWFjaCBkdHMsJChjYWxsIHFzdHJpcCwkKEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9N
X0RUU19QQVRIKSksIFwKPiArCQllY2hvICJkdGIteSArPSAkKHBhdHN1YnN0ICUuZHRzLCUuZHRi
LCQobm90ZGlyICQoZHRzKSkpIiA+PiAkKExJTlVYX0FSQ0hfUEFUSCkvYm9vdC9kdHMvTWFrZWZp
bGUKPiArCSkKPiArZW5kZWYKPiArTElOVVhfUE9TVF9QQVRDSF9IT09LUyArPSBMSU5VWF9BRERf
RFRCX01BS0VfUlVMRVMKPiArTElOVVhfUE9TVF9SU1lOQ19IT09LUyArPSBMSU5VWF9BRERfRFRC
X01BS0VfUlVMRVMKPiArCj4gIExJTlVYX0tFUk5FTF9DVVNUT01fTE9HT19QQVRIID0gJChjYWxs
IHFzdHJpcCwkKEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0xPR09fUEFUSCkpCj4gIGlmbmVxICgk
KExJTlVYX0tFUk5FTF9DVVNUT01fTE9HT19QQVRIKSwpCj4gIExJTlVYX0RFUEVOREVOQ0lFUyAr
PSBob3N0LWltYWdlbWFnaWNrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
