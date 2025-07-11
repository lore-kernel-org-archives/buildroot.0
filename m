Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A69EC83F1D
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 369426149F;
	Fri, 11 Jul 2025 10:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id veG73UnUDwOG; Fri, 11 Jul 2025 10:44:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A75F61438
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A75F61438;
	Fri, 11 Jul 2025 10:44:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B1B20199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9849140251
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTS_Q2oXvxtn for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:44:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 93FB440094
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93FB440094
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93FB440094
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:49 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a503d9ef59so1555710f8f.3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230688; x=1752835488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J0ken8V1G8VPz6MxzW/w+ierZZ8lxnIALME8Crgb2HE=;
 b=F135DzWZYHhoU4fQsARilDLRa22XdVvix6ziSeX6/q9CGxdulozRwBpC/AyzowY17r
 3VRNt5bny6iYJuyWgvZrp1vgilehy3p5fovyfWhv9ffjYt4mdobV42SRjZVXD5TfQrE9
 q442mMx29QvD9Wi/2hE6VdwD72E7DvKvhzbxTrPQ/vNdLW+AZ5qCqwIvohj/Uqv+Llpk
 fZk2nCQpbmeWxyw6vvwoQKs4esJh+s00bw7gEV1mzs1f1SPCgD1ulkLZur3ap5euCdmD
 HIY93a0GIDrxie9q1ur9czaC/QL91EYocrjk3fiKELNgqR+G3oSgNrUJmIOmKVDDtV6r
 6Big==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkewqpuBJlZKEkkvFxAf2BaHr6gJMeKr44YxylTOnaT2OjS24pv5xHCjAvLsWGKKzv/o49rJEz6GU=@buildroot.org
X-Gm-Message-State: AOJu0YztHMan1FyMiYkiTqaDI0Hy3FXM4h0F7MWDd8zHxKIUjnZMCkb7
 SvicpyPUWKTBhcwxkHVrz3UtIGZ2GNkbEIZgh1s87mFzUwHBvheZPBwx7S2Vo7qfRjI=
X-Gm-Gg: ASbGncvcCzFeH06rz6MtERPnDDAyMlOjfqPlS+pLsmve6iK2G78J8XqPxbtBk5NKPc7
 479Q1VkBCDhqnWRCiex7miqUPhY60DIFyX+KWqpujAjyAZsa6rYWcXM8d5bQ/AhRRMoGGz6q8wc
 i81UCUe/DXrZYY8JMQa6yXQ0nYOpRi4/ORZaNsm0WieIms8ywPbeS2VJntPETFTc95AsgINSjrN
 CW5Q4a+hIkwEkZXejpZqYhGzPPQLUPDr0P6Mex119dRcDIwdVqldbOegaG8YcVBNLVY1BquqOtu
 bDWS6sd65PJTsIsPdNq4sfXlZXn/K7a8V+UJeo4lZC9x2yl85tKWD7bB2RypkMXXfib2Y0dSygT
 nAjvsJ1yPhCcDqw==
X-Google-Smtp-Source: AGHT+IFgmbZCIQB556tZmn5O3/iyIcSmWJRjHfmB52+Lyrg4ZdC+Ijr2ufhJ6UfHqJwGNe6m6ixqhw==
X-Received: by 2002:a05:6000:20c4:b0:3a6:f2d7:e22b with SMTP id
 ffacd0b85a97d-3b5f2dc0740mr1125030f8f.18.1752230687549; 
 Fri, 11 Jul 2025 03:44:47 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1647sm4094293f8f.1.2025.07.11.03.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:47 -0700 (PDT)
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Buildroot development <buildroot@buildroot.org>
Date: Fri, 11 Jul 2025 12:44:43 +0200
Message-ID: <20250711104446.823713-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <25376ee6-fd6a-4b7c-9aef-905b6f71b316@grenoble.cnrs.fr>
References: <25376ee6-fd6a-4b7c-9aef-905b6f71b316@grenoble.cnrs.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230688; x=1752835488; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J0ken8V1G8VPz6MxzW/w+ierZZ8lxnIALME8Crgb2HE=;
 b=DkO+rqncDXv5gbGrvCwLvWr9t3JoE1fQ0QKfdIucSsTTCusFwI9FJ7KmCUP+pnYQiH
 XoRBLMYSMUyfmbYIxAsKrlEYA+7HO+Vhy0+5Ccx16QeZj3s95sUmXVqyP/b4PetNSuP4
 Ib73hBCS6gkVrku+3hXZmeqMlOYtrzzfQcCHySLyRdPPnwwEgYp1aOXmffOBUTI1D6Kn
 EmALjGYNwp1GDRp6aAq1W13ZKX38z1u5I+8OPnOnRPuzLH6qYDKCsodOX3JOCvoAceZb
 +6nSWaY3HH0mpOlnsOTtI9L8cC4zXbY8SoT2mCQR5zrplVRxRgzJX1HZ1bWcCb/f3Ih5
 jyaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DkO+rqnc
Subject: Re: [Buildroot] [PATCH 1/1] boot/at91bootstrap3: fix build with
 host GCC 15
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

SW4gcmVwbHkgb2Y6Cj4gQnVpbGRpbmcgYXQ5MWJvb3RzdHJhcDMgd2l0aCBHQ0MxNSBmYWlscyB3
aXRoOgo+IAo+ICAgICBpbmNsdWRlL3R5cGVzLmg6MjM6MjM6IGVycm9yOiDigJhib29s4oCZIGNh
bm5vdCBiZSBkZWZpbmVkIHZpYSDigJh0eXBlZGVm4oCZCj4gICAgICAgIDIzIHwgdHlwZWRlZiB1
bnNpZ25lZCBjaGFyIGJvb2w7Cj4gICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgIF5+
fn4KPiAgICAgaW5jbHVkZS90eXBlcy5oOjIzOjIzOiBub3RlOiDigJhib29s4oCZIGlzIGEga2V5
d29yZCB3aXRoIOKAmC1zdGQ9YzIz4oCZIG9ud2FyZHMKPiAKPiBUaGlzIGlzIGR1ZSB0byBHQ0Mg
MTUgZGVmYXVsdGluZyB0byB0aGUgQzIzIGxhbmd1YWdlIGRpYWxlY3QuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogRWRnYXIgQm9uZXQgPGJvbmV0QGdyZW5vYmxlLmNucnMuZnI+CgpBcHBsaWVkIHRvIDIw
MjUuMDIueCAmIDIwMjUuMDUueC4gVGhhbmtzCgo+IC0tLQo+IAo+IFRlc3RlZCBvbiBhbiBBY21l
c3lzdGVtcyBBY3F1YSBib2FyZC4KPiAKPiBBbHNvIGJ1aWxkLXRlc3RlZCB3aXRoIGEgMsOXMsOX
MiB0ZXN0IG1hdHJpeDoKPiAgLSBHQ0MgdmVyc2lvbjogICAgICAgIDE0LCAxNQo+ICAtIHBhdGNo
IGluY2x1ZGVkOiAgICAgbm8sIHllcwo+ICAtIGJvb3Rsb2FkZXIgdmVyc2lvbjogdjMuMTAuMywg
djQuMC4wCj4gYXMgZXhwZWN0ZWQsIGFsbCB0ZXN0cyBwYXNzZWQgc2F2ZSBmb3IgdGhvc2Ugd2l0
aCBHQ0MgMTUgd2l0aG91dCB0aGUgcGF0Y2guCj4gCj4gIC4uLmNvbmRpdGlvbmFsbHktZGVmaW5l
LWJvb2wtZmFsc2UtYW5kLS5wYXRjaCB8IDQ3ICsrKysrKysrKysrKysrKysrKysKPiAgLi4uY29u
ZGl0aW9uYWxseS1kZWZpbmUtYm9vbC1mYWxzZS1hbmQtLnBhdGNoIHwgNDYgKysrKysrKysrKysr
KysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgOTMgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgYm9vdC9hdDkxYm9vdHN0cmFwMy92My4xMC4zLzAwMDEtaW5jbHVkZS10eXBlcy5o
LWNvbmRpdGlvbmFsbHktZGVmaW5lLWJvb2wtZmFsc2UtYW5kLS5wYXRjaAo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgYm9vdC9hdDkxYm9vdHN0cmFwMy92NC4wLjAvMDAwMS1pbmNsdWRlLXR5cGVzLmgt
Y29uZGl0aW9uYWxseS1kZWZpbmUtYm9vbC1mYWxzZS1hbmQtLnBhdGNoCj4gCj4gZGlmZiAtLWdp
dCBhL2Jvb3QvYXQ5MWJvb3RzdHJhcDMvdjMuMTAuMy8wMDAxLWluY2x1ZGUtdHlwZXMuaC1jb25k
aXRpb25hbGx5LWRlZmluZS1ib29sLWZhbHNlLWFuZC0ucGF0Y2ggYi9ib290L2F0OTFib290c3Ry
YXAzL3YzLjEwLjMvMDAwMS1pbmNsdWRlLXR5cGVzLmgtY29uZGl0aW9uYWxseS1kZWZpbmUtYm9v
bC1mYWxzZS1hbmQtLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAw
MDAwLi5kNGUzN2E4NmY2Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2Jvb3QvYXQ5MWJvb3RzdHJh
cDMvdjMuMTAuMy8wMDAxLWluY2x1ZGUtdHlwZXMuaC1jb25kaXRpb25hbGx5LWRlZmluZS1ib29s
LWZhbHNlLWFuZC0ucGF0Y2gKPiBAQCAtMCwwICsxLDQ3IEBACj4gK0Zyb20gOTA4YzY1Njc4ODY3
NTY1YTkzNGVhNWE5NjdiZmU3ZTIwNGQxY2NhZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiAr
RnJvbTogRWRnYXIgQm9uZXQgPGJvbmV0QGdyZW5vYmxlLmNucnMuZnI+Cj4gK0RhdGU6IFdlZCwg
MjUgSnVuIDIwMjUgMTE6MTM6NDMgKzAyMDAKPiArU3ViamVjdDogW1BBVENIXSBpbmNsdWRlL3R5
cGVzLmg6IGNvbmRpdGlvbmFsbHkgZGVmaW5lIGJvb2wsIGZhbHNlIGFuZCB0cnVlCj4gK01JTUUt
VmVyc2lvbjogMS4wCj4gK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAo+
ICtDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Cj4gKwo+ICtpbmNsdWRlL3R5cGVzLmgg
dHlwZWRlZnMg4oCYYm9vbOKAmSBhbmQgbWFjcm8tZGVmaW5lcyDigJhmYWxzZeKAmSBhbmQg4oCY
dHJ1ZeKAmS4KPiArSG93ZXZlciwgc2luY2UgQzIzLCB0aGVzZSBhcmUgcHJlZGVmaW5lIGtleXdv
cmRzLiBBcyBDMjMgaXMgdGhlIGRlZmF1bHQKPiArQyBkaWFsZWN0IGZvciBHQ0MgMTUsIGJ1aWxk
aW5nIHdpdGggdGhpcyBjb21waWxlciBmYWlscyB3aXRoOgo+ICsKPiArICAgIGluY2x1ZGUvdHlw
ZXMuaDoyMzoyMzogZXJyb3I6IOKAmGJvb2zigJkgY2Fubm90IGJlIGRlZmluZWQgdmlhIOKAmHR5
cGVkZWbigJkKPiArICAgICAgIDIzIHwgdHlwZWRlZiB1bnNpZ25lZCBjaGFyIGJvb2w7Cj4gKyAg
ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICBefn5+Cj4gKyAgICBpbmNsdWRlL3R5cGVz
Lmg6MjM6MjM6IG5vdGU6IOKAmGJvb2zigJkgaXMgYSBrZXl3b3JkIHdpdGgg4oCYLXN0ZD1jMjPi
gJkgb253YXJkcwo+ICsKPiArRml4IHRoaXMgYnVpbGQgZmFpbHVyZSBieSBvbmx5IGRlZmluaW5n
IOKAmGJvb2zigJksIOKAmGZhbHNl4oCZIGFuZCDigJh0cnVl4oCZIG9uIEMKPiArZGlhbGVjdHMg
b2xkZXIgdGhhbiBDMjMuCj4gKwo+ICtVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4
NHNhbS9hdDkxYm9vdHN0cmFwL3B1bGwvMTg4Cj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBFZGdhciBC
b25ldCA8Ym9uZXRAZ3Jlbm9ibGUuY25ycy5mcj4KPiArKGNoZXJyeSBwaWNrZWQgZnJvbSBjb21t
aXQgNGFhYjYwZTYzNGQ1ODhkZmZiZDMxNTRmZDBjZmNlNzgyNzJiNzUwYSkKPiArLS0tCj4gKyBp
bmNsdWRlL3R5cGVzLmggfCAzICsrKwo+ICsgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KQo+ICsKPiArZGlmZiAtLWdpdCBhL2luY2x1ZGUvdHlwZXMuaCBiL2luY2x1ZGUvdHlwZXMuaAo+
ICtpbmRleCAxMjQ2YTRkZi4uMmMxYTQxY2YgMTAwNjQ0Cj4gKy0tLSBhL2luY2x1ZGUvdHlwZXMu
aAo+ICsrKysgYi9pbmNsdWRlL3R5cGVzLmgKPiArQEAgLTQyLDggKzQyLDExIEBAIHR5cGVkZWYg
c2lnbmVkIGxvbmcgbG9uZyBzNjQ7Cj4gKyB0eXBlZGVmIHVuc2lnbmVkIGxvbmcgc2l6ZV90Owo+
ICsgdHlwZWRlZiBzaWduZWQgbG9uZyBzc2l6ZV90Owo+ICsgCj4gKysvKiBib29sLCBmYWxzZSBh
bmQgdHJ1ZSBhcmUgcHJlZGVmaW5lZCBzaW5jZSBDMjMuICovCj4gKysjaWYgX19TVERDX1ZFUlNJ
T05fXyA8IDIwMjMxMUwKPiArIHR5cGVkZWYgdW5zaWduZWQgY2hhciBib29sOwo+ICsgI2RlZmlu
ZSBmYWxzZQkwVQo+ICsgI2RlZmluZSB0cnVlCTFVCj4gKysjZW5kaWYKPiArIAo+ICsgI2VuZGlm
IC8qIFRZUEVTX0hfICovCj4gKy0tIAo+ICsyLjQzLjAKPiArCj4gZGlmZiAtLWdpdCBhL2Jvb3Qv
YXQ5MWJvb3RzdHJhcDMvdjQuMC4wLzAwMDEtaW5jbHVkZS10eXBlcy5oLWNvbmRpdGlvbmFsbHkt
ZGVmaW5lLWJvb2wtZmFsc2UtYW5kLS5wYXRjaCBiL2Jvb3QvYXQ5MWJvb3RzdHJhcDMvdjQuMC4w
LzAwMDEtaW5jbHVkZS10eXBlcy5oLWNvbmRpdGlvbmFsbHktZGVmaW5lLWJvb2wtZmFsc2UtYW5k
LS5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNzcyYTgw
ODY5MAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9ib290L2F0OTFib290c3RyYXAzL3Y0LjAuMC8w
MDAxLWluY2x1ZGUtdHlwZXMuaC1jb25kaXRpb25hbGx5LWRlZmluZS1ib29sLWZhbHNlLWFuZC0u
cGF0Y2gKPiBAQCAtMCwwICsxLDQ2IEBACj4gK0Zyb20gNGFhYjYwZTYzNGQ1ODhkZmZiZDMxNTRm
ZDBjZmNlNzgyNzJiNzUwYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogRWRnYXIg
Qm9uZXQgPGJvbmV0QGdyZW5vYmxlLmNucnMuZnI+Cj4gK0RhdGU6IFdlZCwgMjUgSnVuIDIwMjUg
MTE6MTM6NDMgKzAyMDAKPiArU3ViamVjdDogW1BBVENIXSBpbmNsdWRlL3R5cGVzLmg6IGNvbmRp
dGlvbmFsbHkgZGVmaW5lIGJvb2wsIGZhbHNlIGFuZCB0cnVlCj4gK01JTUUtVmVyc2lvbjogMS4w
Cj4gK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAo+ICtDb250ZW50LVRy
YW5zZmVyLUVuY29kaW5nOiA4Yml0Cj4gKwo+ICtpbmNsdWRlL3R5cGVzLmggdHlwZWRlZnMg4oCY
Ym9vbOKAmSBhbmQgbWFjcm8tZGVmaW5lcyDigJhmYWxzZeKAmSBhbmQg4oCYdHJ1ZeKAmS4KPiAr
SG93ZXZlciwgc2luY2UgQzIzLCB0aGVzZSBhcmUgcHJlZGVmaW5lIGtleXdvcmRzLiBBcyBDMjMg
aXMgdGhlIGRlZmF1bHQKPiArQyBkaWFsZWN0IGZvciBHQ0MgMTUsIGJ1aWxkaW5nIHdpdGggdGhp
cyBjb21waWxlciBmYWlscyB3aXRoOgo+ICsKPiArICAgIGluY2x1ZGUvdHlwZXMuaDoyMzoyMzog
ZXJyb3I6IOKAmGJvb2zigJkgY2Fubm90IGJlIGRlZmluZWQgdmlhIOKAmHR5cGVkZWbigJkKPiAr
ICAgICAgIDIzIHwgdHlwZWRlZiB1bnNpZ25lZCBjaGFyIGJvb2w7Cj4gKyAgICAgICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICBefn5+Cj4gKyAgICBpbmNsdWRlL3R5cGVzLmg6MjM6MjM6IG5v
dGU6IOKAmGJvb2zigJkgaXMgYSBrZXl3b3JkIHdpdGgg4oCYLXN0ZD1jMjPigJkgb253YXJkcwo+
ICsKPiArRml4IHRoaXMgYnVpbGQgZmFpbHVyZSBieSBvbmx5IGRlZmluaW5nIOKAmGJvb2zigJks
IOKAmGZhbHNl4oCZIGFuZCDigJh0cnVl4oCZIG9uIEMKPiArZGlhbGVjdHMgb2xkZXIgdGhhbiBD
MjMuCj4gKwo+ICtVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4NHNhbS9hdDkxYm9v
dHN0cmFwL3B1bGwvMTg4Cj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBFZGdhciBCb25ldCA8Ym9uZXRA
Z3Jlbm9ibGUuY25ycy5mcj4KPiArLS0tCj4gKyBpbmNsdWRlL3R5cGVzLmggfCAzICsrKwo+ICsg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ICsKPiArZGlmZiAtLWdpdCBhL2luY2x1
ZGUvdHlwZXMuaCBiL2luY2x1ZGUvdHlwZXMuaAo+ICtpbmRleCA5NTBiMWE0Ni4uMGFkOWFlNjEg
MTAwNjQ0Cj4gKy0tLSBhL2luY2x1ZGUvdHlwZXMuaAo+ICsrKysgYi9pbmNsdWRlL3R5cGVzLmgK
PiArQEAgLTIwLDggKzIwLDExIEBAIHR5cGVkZWYgc2lnbmVkIGxvbmcgbG9uZyBzNjQ7Cj4gKyB0
eXBlZGVmIHVuc2lnbmVkIGxvbmcgc2l6ZV90Owo+ICsgdHlwZWRlZiBzaWduZWQgbG9uZyBzc2l6
ZV90Owo+ICsgCj4gKysvKiBib29sLCBmYWxzZSBhbmQgdHJ1ZSBhcmUgcHJlZGVmaW5lZCBzaW5j
ZSBDMjMuICovCj4gKysjaWYgX19TVERDX1ZFUlNJT05fXyA8IDIwMjMxMUwKPiArIHR5cGVkZWYg
dW5zaWduZWQgY2hhciBib29sOwo+ICsgI2RlZmluZSBmYWxzZQkwVQo+ICsgI2RlZmluZSB0cnVl
CTFVCj4gKysjZW5kaWYKPiArIAo+ICsgI2VuZGlmIC8qIFRZUEVTX0hfICovCj4gKy0tIAo+ICsy
LjQzLjAKPiArCj4gLS0gCj4gMi4zNC4xCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
