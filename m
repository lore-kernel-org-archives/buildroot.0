Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F047EE77180
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 14:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76BE64124C;
	Wed, 11 Dec 2024 14:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2O-C09swB-_V; Wed, 11 Dec 2024 14:59:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A69541208
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A69541208;
	Wed, 11 Dec 2024 14:59:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 89AFBED2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 14:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7610B42F69
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 14:59:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZJWacXwdrMAB for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 14:59:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 96CD642F63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96CD642F63
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96CD642F63
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 14:59:07 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-434a7ee3d60so4608045e9.1
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 06:59:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733929145; x=1734533945;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O0IyfLhxaI5j9egbKvFZM5v94qDkrzbCZoHbgVBpK4w=;
 b=MA4U14gggHRn5qbLcrElp9MbU051YzFCtgFEyy9XYXyrJAtLIpcrUir6FRrnTGAcAv
 0nvvymKhsIrGnlvukjB/Sqb3B2d6bzCU3URk7KWbD4SBD8I9OYws9K+xgMUyHvLEt4eT
 M+ippolJEyLBV3wCZbxuzVcoNVDy+lNbTmfmqQCvFssaC5f5/U9C1xsnksh/cvYCNnHY
 txjtCjDAFkfHqpfj/qNzVIFaiDYR2ueXbA0k7sCornBsQCFLHBfbKZo413KyUlU87Oei
 x7jRogJ9G7zkLwNvc8TXVTaA2xU+SIa99mbgn2NPE8+WBM5K3Iha/tGVKPsdBRELlSyu
 qiZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnaziMtTzFlTyXYYwW7RvHjztGSs8T0iFXfHGGUIum2kVLDn0Yh3WhjoX+umy1qqaEBTavKQgSQVY=@buildroot.org
X-Gm-Message-State: AOJu0YyCtgn9P1DLjmnQA4eaW0kSmSsyuDOEmQe6fCKxLfiDSl8u1YUD
 +xFPml9vZJys3CibzKBZ+bf5K7zlmr+8IXuUk9uxpb7lQEYTQvwtCElYrMu6NXo=
X-Gm-Gg: ASbGncuhbTFgxxbs9e3bm6WIXKBoq7UKjLX3VJMKcpzTSu1a0Mi/jBzZaAt4M3uXZJN
 l59lLxr4ie51he+2U9qI40rLV3o4gTmlYHahkXnZjq/Pb0RMATCFQ7xW98nXCQT8xu94c3AmwqX
 3fiSWeS22+UePag31x3L96Dxn8xeX+G+9jlab7j0jvi6LnsCWzlanbLW4rIHSnVoZF6IM8a5rmj
 lfGXtESmjaQGDnTYZjbiPDlvIthLQespoDxnDAUYhnzmDF7huljvCuQr/ycpOqTlKfkOboEy5Bp
 H6S06rPx3gl++JktJqs3KvGCT/ST+Ihw6zV+rl00Vg==
X-Google-Smtp-Source: AGHT+IGwlt+nEiMDWZvvm6HJgtRLgsAnfTflMAPBLOv7GfeAp5FJugLlh7FpUoahwLYt5ZRb4Gom+g==
X-Received: by 2002:a05:6000:1567:b0:386:32ca:7b5e with SMTP id
 ffacd0b85a97d-3864debe8a5mr2423564f8f.16.1733929145250; 
 Wed, 11 Dec 2024 06:59:05 -0800 (PST)
Received: from [10.5.90.20]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-387824a4c23sm1472755f8f.36.2024.12.11.06.59.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 06:59:04 -0800 (PST)
Message-ID: <c627b3d7-5f98-48c5-8053-e2b740549271@smile.fr>
Date: Wed, 11 Dec 2024 15:59:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Paresh Bhagat <p-bhagat@ti.com>, buildroot@buildroot.org
Cc: Bryan Brattlof <bb@ti.com>, Chirag Shilwant <c-shilwant@ti.com>,
 Gyan Gupta <g-gupta@ti.com>, Xuanhao Shi <X15000177@gmail.com>,
 Syed Mohammed Khasim <khasim@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Sai Sree Kartheek Adivi <s-adivi@ti.com>,
 Romain Naour <romain.naour@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
References: <20240722133804.2794134-1-p-bhagat@ti.com>
Content-Language: en-US
In-Reply-To: <20240722133804.2794134-1-p-bhagat@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1733929145; x=1734533945; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O0IyfLhxaI5j9egbKvFZM5v94qDkrzbCZoHbgVBpK4w=;
 b=ec93gvTvjbmAXRbQSvZHJiSsKZoiNj3VPWMOhFGPiprEqfVnJPIR6sxui6WeBxqXOB
 tUGjjzRj88X6y1qKGJFbBtHpiLwsGfm8Kokg9GeQccbchv/7rcygtqN4ivet3i0yKEBV
 HnTKlg9+2x79dlwhSONY/6tm93EntR35L7cOU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=ec93gvTv
Subject: Re: [Buildroot] [PATCH v5] boot/ti-k3-boot-firmware: Add config
 option to specify version
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

SGVsbG8gUGFyZXNoLCBBbGwsCgpMZSAyMi8wNy8yMDI0IMOgIDE1OjM4LCBQYXJlc2ggQmhhZ2F0
IHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBQcmV2aW91c2x5IHRoZSB2ZXJzaW9uIG9mIHRp
LWszLWJvb3QtZmlybXdhcmUgKFRJX0szX0JPT1RfRklSTVdBUkVfVkVSU0lPTikgd2FzCj4gZml4
ZWQgaW4gbWsgZmlsZS4gSW50cm9kdWNlIGEgbmV3IGNvbmZpZyBvcHRpb24gCj4gQlIyX1RBUkdF
VF9USV9LM19CT09UX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OIHNvIHRoYXQgdXNlciBjYW4gY2hh
bmdlIHRoZSB2ZXJzaW9uIAo+IGZvciB0aS1rMy1ib290LWZpcm13YXJlIHVzaW5nIG1lbnVjb25m
aWcuCj4gCj4gVGhpcyBwcm92aWRlcyBncmVhdGVyIGZsZXhpYmlsaXR5IGZvciB1c2VycyB0byBz
ZWxlY3QgZGlmZmVyZW50IHZlcnNpb25zIG9mCj4gdGktazMtYm9vdC1maXJtd2FyZSB3aXRob3V0
IG1vZGlmeWluZyB0aGUgYnVpbGQgc2NyaXB0IGRpcmVjdGx5LiBOb3RlIHRoYXQKPiB0aGVyZSBt
aWdodCBiZSB2ZXJzaW9uIGRpZmZlcmVuY2UgYmV0d2VlbiB0aS1rMy1ib290LWZpcm13YXJlIGFu
ZCB1LWJvb3Qgb3IKPiBraS1rMy1yNS1ib290bG9hZGVyLCB0aGV5IHNob3VsZCBzdGlsbCB3b3Jr
IHRvZ2V0aGVyIGR1ZSB0byBUSS1TQ0kgcHJvdG9jb2wKPiBiZWluZyBiYWNrd2FyZCBjb21wYXRp
YmxlLiBIb3dldmVyLCB0byBhdm9pZCBhbnkgcG90ZW50aWFsIGlzc3VlcyAoIGUuZy4gaW4KPiBj
YXNlIG9mIFRJRlMtRE0gKSwgaXQgaXMgcmVjb21tZW5kZWQgdG8gc3luY2hyb25pemUgdGhlc2Ug
Y29tcG9uZW50cwo+IHdoZW4gdXNpbmcgY3VzdG9tIHZlcnNpb24gb3Igc291cmNlcyBmb3IgdGhl
IGJ1aWxkLiBGb3Igc3RyaWN0ZXIgdmVyc2lvbiAKPiBjaGVjaywgaGFzaCBjaGVja2luZyBpcyBu
b3QgZGlzYWJsZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGFyZXNoIEJoYWdhdCA8cC1iaGFnYXRA
dGkuY29tPgoKSSByZW1lbWJlcmVkIHByZXZpb3VzIGRpc2N1c3Npb25zIGFib3V0IHRpLWszLWJv
b3QtZmlybXdhcmUgcGFja2FnZSBhbmQgcmV0cmlldmUKdGhlIGZpcnN0IGNvbW1lbnQgZnJvbSBC
cnlhbiBCcmF0dGxvZiBbMV06CgoiTG9va3MgZ3JlYXQgdG8gbWUhIEkgd2lsbCBzYXkgdGhlIHBy
b2Nlc3MgaXMgc3RhcnRpbmcgaW50ZXJuYWxseSB0byBtb3ZlCmF3YXkgZnJvbSB0aGlzIGxpbnV4
LWZpcm13YXJlIGZvcmsgaW4gZmF2b3IgZm9yIHNlbmRpbmcgdGhpbmdzIHRvCmxpbnV4LWZpcm13
YXJlIGRpcmVjdGx5LiBNeSBob3BlIGlzIHdlIGNhbiBiZWdpbiBkZXByZWNhdGluZyB0aGlzCnBh
Y2thZ2UgaW4gYSBmZXcgbW9udGhzIGRlcGVuZGluZyBvbiBob3cgdGhpbmdzIGdvLiIKCkZvciBu
b3cgd2UgYXJlIGZpbmUgdXNpbmcgdGhlIHZlcnNpb24gcHJvdmlkZWQgYnkgdGhlIC5tayBmaWxl
IGFuZCBzaW5jZSB0aGUKZ29hbCBpcyB0byBkZXByZWNhdGUgdGktazMtYm9vdC1maXJtd2FyZSBh
bmQgcmVwbGFjZSBieSBsaW51eC1maXJtd2FyZSwgSSdtIG5vdApzdXJlIGl0IHdvcnRoIHRoZSBl
ZmZvcnQ/CgpJZiByZWFsbHkgbmVlZGVkLCB1c2VycyBjYW4gc3RpbGwgdXNlIE9WRVJSSURFX1NS
Q0RJUiB0byByZXBsYWNlCnRpLWszLWJvb3QtZmlybXdhcmUgc291cmNlcyBbMl0uCgpUaG91Z2h0
cz8KClsxXQpodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvMjAyNDA2MDUxNzAyMDUu
YWM0Y21tN3E1b25kcWdpcUBicnlhbmJyYXR0bG9mLmNvbS8KWzJdIGh0dHBzOi8vYnVpbGRyb290
Lm9yZy9kb3dubG9hZHMvbWFudWFsL21hbnVhbC5odG1sI19hZHZhbmNlZF91c2FnZQoKQmVzdCBy
ZWdhcmRzLApSb21haW4KCgo+IAo+IC0tLQo+IENoYW5nZXMgdjQgLT4gdjU6Cj4gCS0gSW5jbHVk
ZSByZWNvbW1lbmRhdGlvbiByZWdhcmRpbmcgdmVyc2lvbiBtaXNtYXRjaCBpbiBjb21taXQgbXNn
Cj4gCSAgKFN1Z2dlc3RlZCBieSBCcnlhbiBhbmQgUm9tYWluKQo+IAo+IENoYW5nZXMgdjMgLT4g
djQ6Cj4gCS0gVGkgazMgLT4gVEkgSzMgKFN1Z2dlc3RlZCBieSBBbmRyZWFzIERhbm5lbmJlcmcp
Cj4gCS0gZ2l0LnRpLm9yZyAtPiBnaXQudGkuY29tIChTdWdnZXN0ZWQgYnkgQW5kcmVhcyBEYW5u
ZW5iZXJnKQo+IAo+IENoYW5nZXMgdjIgLT4gdjM6Cj4gCS0gZmxleGliaWx0eSAtPiBmbGV4aWJp
bGl0eSAoU3VnZ2VzdGVkIGJ5IENoaXJhZyBTaGlsd2FudCkKPiAKPiBDaGFuZ2VzIHYxIC0+IHYy
Ogo+IAktIEZpeCB3aGl0ZXNwYWNlcy9pbmRlbnRhdGlvbiBpbiBDb25maWcuaW4gZmlsZSAoU3Vn
Z2VzdGVkIGJ5IEJyeWFuIEJyYXR0bG9mKQo+IAo+IC0tLQo+ICBib290L3RpLWszLWJvb3QtZmly
bXdhcmUvQ29uZmlnLmluICAgICAgICAgICAgfCAzMCArKysrKysrKysrKysrKysrKysrCj4gIC4u
Li90aS1rMy1ib290LWZpcm13YXJlLm1rICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9ib290L3RpLWszLWJvb3QtZmlybXdhcmUvQ29uZmlnLmluIGIvYm9vdC90aS1rMy1i
b290LWZpcm13YXJlL0NvbmZpZy5pbgo+IGluZGV4IGQ4MGJiNGJkYjMuLjU4MWVjMGMzYjkgMTAw
NjQ0Cj4gLS0tIGEvYm9vdC90aS1rMy1ib290LWZpcm13YXJlL0NvbmZpZy5pbgo+ICsrKyBiL2Jv
b3QvdGktazMtYm9vdC1maXJtd2FyZS9Db25maWcuaW4KPiBAQCAtNSwzICs1LDMzIEBAIGNvbmZp
ZyBCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkUKPiAgCSAgVGhpcyBwYWNrYWdlIGRvd25s
b2FkcyBhbmQgaW5zdGFsbHMgdGhlIFRJLXNwZWNpZmljIHRpLXN5c2Z3Cj4gIAkgIGFuZCB0aS1k
bSBmaXJtd2FyZSBuZWVkZWQgdG8gYm9vdCBUSSBLMyBwbGF0Zm9ybXMgKHdoaWNoCj4gIAkgIGlu
Y2x1ZGUgQU02MngsIEFNNjR4LCBBTTY1eCBhbmQgbW9yZSkuCj4gKwo+ICtpZiBCUjJfVEFSR0VU
X1RJX0szX0JPT1RfRklSTVdBUkUKPiArY2hvaWNlCj4gKwlwcm9tcHQgInRpLWszLWJvb3QtZmly
bXdhcmUgdmVyc2lvbiIKPiArCWRlZmF1bHQgQlIyX1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJF
X0xBVEVTVF9WRVJTSU9OCj4gKwloZWxwCj4gKwkgIFNlbGVjdCB0aGUgdmVyc2lvbiBvZiBUSSBL
MyBib290IGZpcm13YXJlIHlvdSB3YW50IHRvIHVzZS4KPiArCj4gK2NvbmZpZyBCUjJfVEFSR0VU
X1RJX0szX0JPT1RfRklSTVdBUkVfTEFURVNUX1ZFUlNJT04KPiArCWJvb2wgIjA5LjAyLjAwLjAw
OSIKPiArCj4gK2NvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkVfQ1VTVE9NX1ZF
UlNJT04KPiArCWJvb2wgIkN1c3RvbSB2ZXJzaW9uIgo+ICsJaGVscAo+ICsJICBUaGlzIG9wdGlv
biBhbGxvd3MgdG8gdXNlIGEgc3BlY2lmaWMgb2ZmaWNpYWwgdmVyc2lvbiBmcm9tCj4gKwkgIGdp
dC50aS5jb20uCj4gKwo+ICtlbmRjaG9pY2UKPiArCj4gK2NvbmZpZyBCUjJfVEFSR0VUX1RJX0sz
X0JPT1RfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT05fVkFMVUUKPiArCXN0cmluZyAiQ3VzdG9tIHRp
LWszLWJvb3QtZmlybXdhcmUgdmVyc2lvbiIKPiArCWRlcGVuZHMgb24gQlIyX1RBUkdFVF9USV9L
M19CT09UX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OCj4gKwo+ICtjb25maWcgQlIyX1RBUkdFVF9U
SV9LM19CT09UX0ZJUk1XQVJFX1ZFUlNJT04KPiArCXN0cmluZwo+ICsJZGVmYXVsdCAiMDkuMDIu
MDAuMDA5IiAgICAgaWYgQlIyX1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJFX0xBVEVTVF9WRVJT
SU9OCj4gKwlkZWZhdWx0IEJSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FSRV9DVVNUT01fVkVS
U0lPTl9WQUxVRSBcCj4gKwkJCQlpZiBCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkVfQ1VT
VE9NX1ZFUlNJT04KPiArCj4gK2VuZGlmCj4gZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMtYm9vdC1m
aXJtd2FyZS90aS1rMy1ib290LWZpcm13YXJlLm1rIGIvYm9vdC90aS1rMy1ib290LWZpcm13YXJl
L3RpLWszLWJvb3QtZmlybXdhcmUubWsKPiBpbmRleCA5MzMyNzMyYWQ0Li4zNTAzODFlYmJlIDEw
MDY0NAo+IC0tLSBhL2Jvb3QvdGktazMtYm9vdC1maXJtd2FyZS90aS1rMy1ib290LWZpcm13YXJl
Lm1rCj4gKysrIGIvYm9vdC90aS1rMy1ib290LWZpcm13YXJlL3RpLWszLWJvb3QtZmlybXdhcmUu
bWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAK
PiAtVElfSzNfQk9PVF9GSVJNV0FSRV9WRVJTSU9OID0gMDkuMDIuMDAuMDA5Cj4gK1RJX0szX0JP
T1RfRklSTVdBUkVfVkVSU0lPTiA9ICQoY2FsbCBxc3RyaXAsJChCUjJfVEFSR0VUX1RJX0szX0JP
T1RfRklSTVdBUkVfVkVSU0lPTikpCj4gIFRJX0szX0JPT1RfRklSTVdBUkVfU0lURSA9IGh0dHBz
Oi8vZ2l0LnRpLmNvbS9jZ2l0L3Byb2Nlc3Nvci1maXJtd2FyZS90aS1saW51eC1maXJtd2FyZS9z
bmFwc2hvdAo+ICBUSV9LM19CT09UX0ZJUk1XQVJFX1NPVVJDRSA9IHRpLWxpbnV4LWZpcm13YXJl
LSQoVElfSzNfQk9PVF9GSVJNV0FSRV9WRVJTSU9OKS50YXIueHoKPiAgVElfSzNfQk9PVF9GSVJN
V0FSRV9JTlNUQUxMX0lNQUdFUyA9IFlFUwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
