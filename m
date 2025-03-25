Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED43C36005
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 22:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCC8B40916;
	Tue, 25 Mar 2025 22:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FoPgcEPz6kdb; Tue, 25 Mar 2025 22:17:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3A1640923
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3A1640923;
	Tue, 25 Mar 2025 22:17:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 47790E4
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 22:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DD3261AB7
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 22:17:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EGnw776mU2FX for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 22:17:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3D02C60607
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D02C60607
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D02C60607
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 22:17:51 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5495c1e1b63so7379811e87.0
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 15:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742941069; x=1743545869;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MU45p4CvZthjVBM1gLr6kZ9kGsfVQ0R75zySTnWjkQw=;
 b=uR+exsvgPpV5q1P9VJftkeL0d1DN/WR4fwgKYMIVKX+Q9BceFxNYM2h/5R86PNlun2
 VupOE2ZSQaVBmJUFb6KqDfWJsyIdYet4M7Ba0z0BYBrUlaGG0Joqri+6psRmKapsNxxW
 puvG1yijejCBB6UZYQEh7KenFCITqYeprWtQyEFwpDTYZ5U/JWeL72n8UX5klR0AOQMr
 1fPXCMAA0VJ054rprVNpORoeJHjPqHJhovx0jRRjMpnwgpk2XSrtywymegYR74uoi/Fz
 A5KGAan1r0tZKrWVs2Fby9F1n406TEntHYUPbKQOxziSP4IDmtfr6JOIWwYSOdMpx5sL
 wobQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNoUFHsq/lKEJg+z2PWMAqpZptVTW2vbQ/RTn9/ww3CaBMgXM+pzpWmbvvSeWbk4UWegB9VFv0c/I=@buildroot.org
X-Gm-Message-State: AOJu0YxZAf0aqAvr7kH0BLQ+y+9dxOnIDDc9YBwLouXt6ZYoTJfjB3CP
 N1Re2k+MTkwVaTshnv5fwkw62yniVzvMsPLbT0toSfkpqrOaDEMLRltl6s5ufyWPYXPjrZE/FfG
 j7S20J/4ybvx7G/qiKdgbYbKg5F0=
X-Gm-Gg: ASbGncuUC8dp60sCoRkyZZ/xSomhSyeQpjvGovMgtv/z0tKjV6JJvz6b6i2Ros20p6p
 dfVTeUD6yrDaW0iME3bnmaaYuaEe2ahS0xMRkfFFxpMmHDFQEFqfcMtlAHS9dRd2Zc7JFt+qu6K
 vZPm7FAtB/caiEXLgN8lDwItdsMsCmRYhoGgEMdur59eQ0oNAexLn3hFEqVR3g
X-Google-Smtp-Source: AGHT+IG32WrYXfWh7y/maqII5mxxtDULgjs7XtxLc7QD46OKf+ngr1fpUPUjPM2S2xUWcXhjeiN7AhZqrZtoMrqu7lc=
X-Received: by 2002:a05:6512:2303:b0:545:62c:4b13 with SMTP id
 2adb3069b0e04-54ad6501d46mr5013988e87.40.1742941068614; Tue, 25 Mar 2025
 15:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250303144047.268530-1-yegorslists@googlemail.com>
 <8734ftnbcm.fsf@dell.be.48ers.dk> <94733e7fe0d1237a36b4d3308190318b@free.fr>
In-Reply-To: <94733e7fe0d1237a36b4d3308190318b@free.fr>
Date: Tue, 25 Mar 2025 23:17:35 +0100
X-Gm-Features: AQ5f1JpUTB6YjBoxBgpU2kbYtESEdeust9JikMd4NKvzEtrE2vkGkFtNX5_DFoI
Message-ID: <CAGm1_ku13QMh=Lq-Dro3WE6e_nNJq1HXJ66Cp8E-Fo0o-fphWA@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1742941069; x=1743545869; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MU45p4CvZthjVBM1gLr6kZ9kGsfVQ0R75zySTnWjkQw=;
 b=Mqrwcptb0gqo4LdSsSxWxFoiOEQw92NLLpgwk+NuVA02xXZKAmNzZFRAZdK7bPCP+9
 7nlmCrz6nuuyt612ra27Mlg7RdOidBo+XbhbONgRkCRB8lYPuvih9TwpnwoVl/hmiXKN
 1DOO1kDoD7D0SdkTDXVZFRpLL38lsDFv+UCsWzZvNpl+VuXwUD14UrmEmQyE1dU6YP/7
 pNUaq0uxZgNwGYXfvw5txLIP0ePeBR0HjVjwIOosPo22zevdOXKCAmC2nz2waWHnXVQq
 eFw1ZJ4DEvD54N2/WW9F4p4KmZz4YyPhdJK09bfEBR2HCIzEZNZ6QmBysDQ9IXvAPkEs
 Jjvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Mqrwcptb
Subject: Re: [Buildroot] [PATCH] package/ncftp: fix
 incompatible-pointer-types error
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLAoKT24gVHVlLCBNYXIgMjUsIDIwMjUgYXQgMTE6MDHigK9QTSBKdWxpZW4gT2xp
dmFpbiA8anUub0BmcmVlLmZyPiB3cm90ZToKPgo+IEhpIFBldGVyLCBZZWdvciwKPgo+IE9uIDAz
LzAzLzIwMjUgMjA6NDksIFBldGVyIEtvcnNnYWFyZCB3cm90ZToKPiA+Pj4+Pj4gInllZ29yc2xp
c3RzIiA9PSB5ZWdvcnNsaXN0cyAgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPiB3cml0ZXM6
Cj4gPgo+ID4gID4gRnJvbTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwu
Y29tPgo+ID4gID4gVXNlIG9ubHkgc3RhdCwgZnN0YXQsIGFuZCBsc3RhdCBzdHJ1Y3R1cmVzIGZv
ciB0aGUgY29ycmVzcG9uZGVudAo+ID4gY2FsbHMKPiA+ICA+IGFuZCBsZXQgdGhlIEMgbGlicmFy
eSBtYWNyb3MgdG8gcGljayB0aGUgcmlnaHQgc3RydWN0dXJlIGFuZCBjYWxsCj4gPiAgPiBkZXBl
bmRpbmcgb24gdGhlIHN1cHBvcnRlZCBmaWxlIHNpemUuCj4gPgo+ID4gRG8gd2UgaGF2ZSBhbnkg
YXV0b2J1aWxkZXIgZXJyb3JzIGZyb20gdGhpcz8KPiA+Cj4gPiAgPiBTaWduZWQtb2ZmLWJ5OiBZ
ZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cj4gPiAgPiAtLS0KPiA+
ICA+ICBwYWNrYWdlL25jZnRwLzAwMDMtZml4LXN0YXQucGF0Y2ggfCAyNyArKysrKysrKysrKysr
KysrKysrKysrKysrKysKPiA+ICA+ICAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQo+
ID4gID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL25jZnRwLzAwMDMtZml4LXN0YXQucGF0
Y2gKPiA+Cj4gPiAgPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9uY2Z0cC8wMDAzLWZpeC1zdGF0LnBh
dGNoCj4gPiBiL3BhY2thZ2UvbmNmdHAvMDAwMy1maXgtc3RhdC5wYXRjaAo+ID4gID4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiA+ICA+IGluZGV4IDAwMDAwMDAwMDAuLjg1ODFjZjU0NmIKPiA+ICA+
IC0tLSAvZGV2L251bGwKPiA+ICA+ICsrKyBiL3BhY2thZ2UvbmNmdHAvMDAwMy1maXgtc3RhdC5w
YXRjaAo+ID4gID4gQEAgLTAsMCArMSwyNyBAQAo+ID4gID4gK1VzZSBzdGF0LCBmc3RhdCwgYW5k
IGxzdGF0IHN0cnVjdHVyZXMgYW5kIGxldCB0aGUgQyBsaWJyYXJ5IGhhbmRsZQo+ID4gdGhlCj4g
PiAgPiArcmVsYXRlZCBzdHJ1Y3R1cmVzIGFuZCBzeXN0ZW0gY2FsbHMuCj4gPiAgPiArCj4gPiAg
PiArVXBzdHJlYW06IE4vQSwgdW5yZXNwb25zaXZlIGNvbnRhY3QgZW1haWwgYWRkcmVzcy4KPiA+
Cj4gPiBJZiB1cHN0cmVhbSBpcyBkZWFkLCBwZXJoYXBzIHdlIHNob3VsZCBpbnN0ZWFkIGRyb3Ag
dGhlIG5jZnRwIHBhY2thZ2UKPiA+IGdpdmVuIGhvdyBsaXR0bGUgRlRQIGlzIHVzZWQgbm93YWRh
eXM/Cj4KPiBJdCBzZWVtcyB0aGVyZSB3YXMgYSBuZXcgdXBzdHJlYW0gcmVsZWFzZSwgYWZ0ZXIg
YWxsLiBTZWU6Cj4gaHR0cHM6Ly93d3cubmNmdHAuY29tL25jZnRwL2RvYy9jaGFuZ2Vsb2cuaHRt
bAo+Cj4gWWVnb3IsIGNvdWxkIHlvdSBoYXZlIGEgbG9vayBpZiB0aGlzIG5ldyByZWxlYXNlIGZp
eGVzCj4gdGhlIHNhbWUgaXNzdWUuIEFuZCBpZiBzbywgY291bGQgeW91IHNlbmQgYSBuZXcgcGF0
Y2gKPiB0aGF0IGp1c3QgYnVtcCB0byB0aGlzIG5ldyB2ZXJzaW9uLCBwbGVhc2U/CgpJIGFtIG9u
IGl0LiBUaGUgaXNzdWUgd2l0aCBsYXJnZSBmaWxlIHN1cHBvcnQgaXMgZml4ZWQgbm93LiBCdXQK
YXV0b3JlY29uZiBpcyBub3cgYnJva2VuLiBUaG91Z2gsIGNyb3NzLWNvbXBpbGF0aW9uIGZvciBB
Uk0gaXMgd29ya2luZwp3aXRoIHRoZSBjb25maWd1cmUgc2NyacO8dCBhbG9uZS4KClJlZ2FyZHMs
ClllZ29yCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
