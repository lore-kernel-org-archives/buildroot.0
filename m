Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDB6E7E367
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3600681D24;
	Fri,  3 Apr 2026 10:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rR6q3TPVvaZ2; Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 347F881DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212117;
	bh=aSYseyXUnw1Qs0cVDIN3iPz2lzqDoBRbQKi3FH31WE0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LiJMZ+ozjpur6ZeqEgKGxARU8gJPykV9Z6rmYi+Zbap3CPuNb7w0Hmabjvettxsgl
	 4u9oiYOgSSdsJ5VL/jeDV60HckRRILWDd720QzFbaKfub9tk1yNQHHT+lAmmHWSMGE
	 tDt1UTNHEeSsByOihTwc5LpHqX9eyPe1N88r7llFBBJ8NmH2IhFsv+B3xoz40bJNr7
	 n9kED9ap/SOyr9h2NuraUqLJEUNoRYPsj9hdzcPfY5+1qia2PFM41W1prMI/M8wtOH
	 xqoCglsz/Zc0xt59iQoUGM8rEpQCF453n+UCvAcI7nb/f2cfJLS1mb5zZ6bmQEPIZY
	 Kwgz0K76K1hmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 347F881DF8;
	Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B30742CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4BAE40E65
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8pN1aHK-x-s for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:28:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3484B40E60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3484B40E60
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3484B40E60
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:34 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-43cfce3a195so1081166f8f.2
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 03:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775212112; x=1775816912;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=97ulpAIdGPLj1PH0ZZBR3qzCm7KH9DHU2ryEtEg8hf0=;
 b=NBRi+Vx52HTEtWKd9d8sprQRKRXbNNcezu17fDvUFs/Hofje8x97HEcbzoZJC4vtFB
 4evahlwqDRxF8YqqioRMcczfb9kmAw1/VeJxwIm8dQS0GZt+TZ8fHEWXi71SH+AXahZf
 WTT69w9BcBgpXz5sihY3vDwc2HRvaDVo/WhFuwQyC+T+SjCvJ9XqtnHaMn6BN8hHbfNh
 G64dwcrSnUHZXOXFE088MjXM0BI0ryZJ01V0HOr8CRVbZ3LFuzqizYG6G/+Nkj3887S6
 WibtU/dr2fJsikarDDs6iDsiqh9af0AUYTaZB3qAf85ZI6sDF6r1UAz4b+fjRWXFyt+2
 soBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwbc9D21mFAUicUcyIZnEpCDzzMUpbFxEbr0KQAJqEQZ54Zsj2t1cf8lzHHIPo/lVLHbNwAP9YRoQ=@buildroot.org
X-Gm-Message-State: AOJu0Yx41u+4ZbBzxKHfaQYPVuYydLeiWXcTqYNg7CsOpPPYALkYQV4a
 nL6B0DYWDIjtfSJkLtR1s9pKtutIoM2OH2Ffqy1Nf7C35onml5eyYxBMp4uvXxyTfLHIsm1GGGR
 XilRyO7Y=
X-Gm-Gg: AeBDietAKM5odCqFiOq78mCwObGcAaELr7aY3IACZ04nukIGSH5woxlq3mkzogFQH2M
 0ZNfxEU0USUAzeE5vN4yJSTaDmPhR3hmso5PPLLV/NR84JPQPCq69dy528nJblFo5UXKCgbkLnx
 WdQ+ElcckMqdEJGMxoXrrDFcnzfPKaSfal6qYlQaSQVAhiMY+GwUevg1g//jr3ciGBHLUPUeQxY
 jQYlSd0LP0MZVOxAOdogdbxSRtt7WLQN3zTYNunApZHSLMf3Igmdg4L6hhXI3poHMWQhMkD5/zR
 Y7Fz9VcYpUViEYNIkyaCYxYWQbFDGjT2xAWWYhtsM1NMAvwfo+DH+P8oeUyMUVtLCbajVzKcoDm
 r69/MLhLJrpwfs263tXPyaCEqvDSg+upihEP+Zv3lF3NE/bo1gheCuY4n4g8rDSqhVlyr4vnthU
 KRDFK7cB8oSIiCfigz
X-Received: by 2002:a05:6000:400e:b0:43b:4981:1ba3 with SMTP id
 ffacd0b85a97d-43d2927f49emr4100150f8f.2.1775212112077; 
 Fri, 03 Apr 2026 03:28:32 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4e6224sm16034691f8f.25.2026.04.03.03.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 03:28:31 -0700 (PDT)
To: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Apr 2026 12:28:30 +0200
Message-ID: <20260403102831.210738-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324150239.21226-1-vincent.stehle@arm.com>
References: <20260324150239.21226-1-vincent.stehle@arm.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775212112; x=1775816912; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=97ulpAIdGPLj1PH0ZZBR3qzCm7KH9DHU2ryEtEg8hf0=;
 b=NawuKScquq7fAOqXyblWEHvt+zMPoq0JVTdRg4JAzwRLs5Rh1zdbxw9WzykSyltymq
 XaX+0NWMBSNTspOIWEMvWNrCUbjsT9uwJLlKqzqZ5uPboG/QJ4EBpciWkzDiHm6i6cwI
 vj/dMEjvgOypTB+Yc5Jmh6NrvvZUx9qwb2S/fbkM0EcGl/zRZowWY3LUVm/Snq7lTURA
 580TLhmXc5LgkIDaLdLDQ62Lwpgs3lOnbi19Rle2L6DRHjKmmjInCkj1u8EQJKi195N4
 xNNj8lq0atcMvmeasC7g2xey97WRzBHDj6VzU0l8pxe5sB+PAIdYcnX1V9qnCcVu7COU
 XNIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NawuKScq
Subject: Re: [Buildroot] [PATCH] boot/edk2: fix build with gcc 15
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gVGhlIGVkazIgcGFja2FnZSBmYWlscyB0byBidWlsZCB3aXRoIGdjYyAx
NSwgd2l0aCB0aGUgZm9sbG93aW5nIGVycm9yOgo+IAo+ICAgRWZpUm9tLmM6Nzg6MTc6IGVycm9y
OiBhc3NpZ25tZW50IGRpc2NhcmRzICdjb25zdCcgcXVhbGlmaWVyIGZyb20gcG9pbnRlciB0YXJn
ZXQgdHlwZSBbLVdlcnJvcj1kaXNjYXJkZWQtcXVhbGlmaWVyc10KPiAKPiBDaGVycnktcGljayBv
bmUgcGF0Y2ggZnJvbSBlZGsyLXN0YWJsZTIwMjYwMiB0byBmaXggdGhpcy4KPiAKPiBUaGlzIGNh
biBiZSB2ZXJpZmllZCB3aXRoIHRoZSB0ZXN0cy5ib290LnRlc3RfZWRrMiBweXRob24gdGVzdHMu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0u
Y29tPgo+IENjOiBEaWNrIE9sc3NvbiA8aGlAc2VuemlsbGEuaW8+CgpBcHBsaWVkIHRvIDIwMjYu
MDIueC4gVGhhbmtzCgo+IC0tLQo+ICAuLi5hc2VUb29scy1FZmlSb20tZml4LWNvbXBpbGVyLXdh
cm5pbmcucGF0Y2ggfCA0NiArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0
NiBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBib290L2VkazIvMDAwMS1CYXNl
VG9vbHMtRWZpUm9tLWZpeC1jb21waWxlci13YXJuaW5nLnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBh
L2Jvb3QvZWRrMi8wMDAxLUJhc2VUb29scy1FZmlSb20tZml4LWNvbXBpbGVyLXdhcm5pbmcucGF0
Y2ggYi9ib290L2VkazIvMDAwMS1CYXNlVG9vbHMtRWZpUm9tLWZpeC1jb21waWxlci13YXJuaW5n
LnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5jMWU2ODhj
ZmUwCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2Jvb3QvZWRrMi8wMDAxLUJhc2VUb29scy1FZmlS
b20tZml4LWNvbXBpbGVyLXdhcm5pbmcucGF0Y2gKPiBAQCAtMCwwICsxLDQ2IEBACj4gK0Zyb20g
OWFmMDZlZjNjYmIwNTJiMTQyZjk2NjBjMmMwMWU3YWViNDAxMzAwYyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKPiArRnJvbTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cj4gK0Rh
dGU6IE1vbiwgOCBEZWMgMjAyNSAxMDoyODo1MCArMDEwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIEJh
c2VUb29scy9FZmlSb206IGZpeCBjb21waWxlciB3YXJuaW5nCj4gK01JTUUtVmVyc2lvbjogMS4w
Cj4gK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAo+ICtDb250ZW50LVRy
YW5zZmVyLUVuY29kaW5nOiA4Yml0Cj4gKwo+ICtOZXcgd2FybmluZyBhZnRlciB1cGRhdGluZyBn
Y2M6Cj4gKwo+ICtFZmlSb20uYzogSW4gZnVuY3Rpb24g4oCYbWFpbuKAmToKPiArRWZpUm9tLmM6
Nzg6MTc6IGVycm9yOiBhc3NpZ25tZW50IGRpc2NhcmRzIOKAmGNvbnN04oCZIHF1YWxpZmllciBm
cm9tIHBvaW50ZXIgdGFyZ2V0IHR5cGUgWy1XZXJyb3I9ZGlzY2FyZGVkLXF1YWxpZmllcnNdCj4g
Kwo+ICtUaGUgYXNzaWduZWQgdmFsdWUgaXMgbm90IHVzZWQsIHNvIGZpeCB0aGUgd2FybmluZyBi
eSBqdXN0IHJlbW92aW5nIGl0Lgo+ICsKPiArU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8
a3JheGVsQHJlZGhhdC5jb20+Cj4gK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vdGlhbm9j
b3JlL2VkazIvY29tbWl0LzlhZjA2ZWYzY2JiMDUyYjE0MmY5NjYwYzJjMDFlN2FlYjQwMTMwMGMK
PiArU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29t
Pgo+ICstLS0KPiArIEJhc2VUb29scy9Tb3VyY2UvQy9FZmlSb20vRWZpUm9tLmMgfCAzICstLQo+
ICsgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+ICsKPiAr
ZGlmZiAtLWdpdCBhL0Jhc2VUb29scy9Tb3VyY2UvQy9FZmlSb20vRWZpUm9tLmMgYi9CYXNlVG9v
bHMvU291cmNlL0MvRWZpUm9tL0VmaVJvbS5jCj4gK2luZGV4IGZhN2JmMGU2MmUuLjZlOTAzYjM1
MDQgMTAwNjQ0Cj4gKy0tLSBhL0Jhc2VUb29scy9Tb3VyY2UvQy9FZmlSb20vRWZpUm9tLmMKPiAr
KysrIGIvQmFzZVRvb2xzL1NvdXJjZS9DL0VmaVJvbS9FZmlSb20uYwo+ICtAQCAtNDQsNyArNDQs
NiBAQCBSZXR1cm5zOgo+ICsgICBGSUxFX0xJU1QgKkZMaXN0Ow0KPiArICAgVUlOVDMyICAgIFRv
dGFsU2l6ZTsNCj4gKyAgIFVJTlQzMiAgICBTaXplOw0KPiArLSAgQ0hBUjggICAgICpQdHIwOw0K
PiArIA0KPiArICAgU2V0VXRpbGl0eU5hbWUoVVRJTElUWV9OQU1FKTsNCj4gKyANCj4gK0BAIC03
NSw3ICs3NCw3IEBAIFJldHVybnM6Cj4gKyAgIC8vDQo+ICsgICBpZiAobU9wdGlvbnMuRHVtcE9w
dGlvbiA9PSAxKSB7DQo+ICsgICAgIGlmIChtT3B0aW9ucy5GaWxlTGlzdCAhPSBOVUxMKSB7DQo+
ICstICAgICAgaWYgKChQdHIwID0gc3Ryc3RyICgoQ09OU1QgQ0hBUjggKikgbU9wdGlvbnMuRmls
ZUxpc3QtPkZpbGVOYW1lLCBERUZBVUxUX09VVFBVVF9FWFRFTlNJT04pKSAhPSBOVUxMKSB7DQo+
ICsrICAgICAgaWYgKHN0cnN0ciAoKENPTlNUIENIQVI4ICopIG1PcHRpb25zLkZpbGVMaXN0LT5G
aWxlTmFtZSwgREVGQVVMVF9PVVRQVVRfRVhURU5TSU9OKSAhPSBOVUxMKSB7DQo+ICsgICAgICAg
ICBEdW1wSW1hZ2UgKG1PcHRpb25zLkZpbGVMaXN0KTsNCj4gKyAgICAgICAgIGdvdG8gQmFpbE91
dDsNCj4gKyAgICAgICB9IGVsc2Ugew0KPiArLS0gCj4gKzIuNTMuMAo+ICsKPiAtLSAKPiAyLjUz
LjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
