Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DACC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 23:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6BDB41742;
	Wed,  5 Feb 2025 23:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id McYT1qsT3Jd1; Wed,  5 Feb 2025 23:31:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A391E415F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A391E415F0;
	Wed,  5 Feb 2025 23:31:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 48BE9CF
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 23:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E0DF8208F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 23:31:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YdCQRzyJC9EZ for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 23:31:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::31; helo=mail-oa1-x31.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 225178202E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 225178202E
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 225178202E
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 23:31:28 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-29fcbf3d709so72557fac.2
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 15:31:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738798287; x=1739403087;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q7YRTkI2f0M+E+TBakgeqVFFVx3vlX/7gCWDW4MPpfA=;
 b=liSuFrUg72P83Gcr/uKgHx/LGirkPinM5L4FhrBej3utv4AJ15phgZjIsUXmiMei9D
 xS3wosMEPxAJ+FX31QoaC4OZhx8GQwfZ0Q6HjzjHWTI2FaKvwzQzHKz8viaU7gPH/6xa
 Skce1q4iduiacGQwnuA1mbmfxpdhnOlqUEDZSiQIItqusc1Idngbkj5lv/YHqoFgH33x
 iswpCVYU/LWcAfMTKoJi0VAjZSf3R+5y2gpe9sclKqY/cxvzBmOP9O7fpEQGgiTTOu0Y
 B2cdSyfhl59JNYY3/lNqT2jHDrzCHxia8y+i3f0T9xBXC08n+OVl9X0XnmROb5Vo2VMd
 2Zlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7ETtmxkaxsDDdi8UwL3Xt8vL7mjk3/Xpef3PFSQzlVnNxpHeIF9gCbmNaSpziJlcXVSrcPFP60B8=@buildroot.org
X-Gm-Message-State: AOJu0Yw8QeYqfLCMA3fMeUKYjBJ48+RIU6IMxgivWKtaD1imSbPFnKcP
 jfbl8D6gQTKUiiXAP40dDdpU2LAJsgN8xHGZlhp8W7SU6NmwcejG1kf/9cNnZsEZ8wJMgymz9qL
 Q6W8=
X-Gm-Gg: ASbGncsQAC6pNS57EF8tbzBTgINSUtkH+MwOSSHDRIjZHBDBxmUokZGh++MrvW+0nDQ
 Evckte8HNDIeitewSy1/p1+aSCxPK3khfv7Zvh8qpliSK6rtRzEwqErmUctx62hlSvi4Cx2Di7U
 ROezwcg/+YpEWBvfoOdIQMc6gfpLTdS0xLsCOZZKgCcYCj7o/4n6/ydjeNR5xbEUJ1F6Urd8ZMq
 qhSyG4YHSZwGgvPxJmC0GAsSf49Nc1clIlwajnCWKm2Tu3qpjRQWcF0G9y8tQQWYN4N8T5mRPxd
 s6cKGc+AuHrIEkkVyhKWHMx/aihZ9QtfPhhosHfAvcegWfoNHfLkxP4=
X-Google-Smtp-Source: AGHT+IHfE6AnbUKrEFQYduB0X/vArz425wqOxYaBYKwfIfcD5i1W96p35kVffdK8jw31lGFLXlUGrw==
X-Received: by 2002:a05:6870:9e97:b0:29e:2f3a:761a with SMTP id
 586e51a60fabf-2b804fa4028mr2390490fac.20.1738798286768; 
 Wed, 05 Feb 2025 15:31:26 -0800 (PST)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com.
 [209.85.161.47]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2b825ff4a1bsm34983fac.25.2025.02.05.15.31.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 15:31:26 -0800 (PST)
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-5f2d7868ef0so107385eaf.3
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 15:31:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWDct8nrx/GJKrITyqPH8Pvnz98RLvjt/7/b3buLbGGTnRx30hxefQxfOkW/4+p5z15iPzubfzq3/8=@buildroot.org
X-Received: by 2002:a05:6870:169e:b0:2b7:7abf:df6b with SMTP id
 586e51a60fabf-2b805126e35mr3499774fac.26.1738798285771; Wed, 05 Feb 2025
 15:31:25 -0800 (PST)
MIME-Version: 1.0
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
 <CA+h8R2oQGKFFH-vMX27WUO1uEAGyt4cz9MCwn9Cofwyujx1xDA@mail.gmail.com>
 <20240805223152.09ed915b@windsurf>
 <CADvTj4o_CnzCth+QqoxhVovBRinvYfbMf7r+SWnnY0tfVbKgbw@mail.gmail.com>
 <CA+h8R2obsR-CzMhWDpQ-A0oeEPaG-P=aCwF7BS4J-3eShmHJgg@mail.gmail.com>
 <20240806165050.234235b4@windsurf>
 <CADvTj4pOK8-2YXy0POUg1qOKa1MrjsxbnS-r1F7YMk_YXFmEAQ@mail.gmail.com>
 <CA+h8R2reErtSWPO1hGpX7tT5Xejb_SNqiuSCnXvJZKHwhzdcZg@mail.gmail.com>
 <CA+h8R2oJWZw_S08XXhjE--_So0UJohVLWSoj30PpR9z66x8U1A@mail.gmail.com>
 <CADvTj4r5ZAFkyqMctj4fV=vnkqDn2g+oG3g2PjTHJKSkVLQNVQ@mail.gmail.com>
 <edd5e025-798f-4e5b-9d31-baed883a65bf@mind.be>
 <CADvTj4rQsmOq_+AcZU8yQNfod_=kyKtO3HP+F4VZ_PMuYXmd6w@mail.gmail.com>
 <CA+h8R2oU_CHcTw6aCdyTXGH9F-eEd+nxwzjfcZPhb99ZJvHe0Q@mail.gmail.com>
 <CADvTj4onhc2rTzFa7F5bDFXSNQJ2CKuyU-TD-fwhpQUXNHZTcw@mail.gmail.com>
 <CA+h8R2ofCEUxWBVU5S9_vx5YtsE-Mjq95WL6DzTM5YF38A-izA@mail.gmail.com>
 <CADvTj4r1z1Y8cLZ45i1kJKgULiJMehBjR_OZ8oeWHw5jaj4+aA@mail.gmail.com>
 <CA+h8R2qWgHUg3qG6wn+Ox9pcn6y9NMWrbaQyYkdpgvv_FNweXw@mail.gmail.com>
 <CADvTj4pXO2rwJ8oCzzGNY+OxLuo3uJnDT2PAxbyquw0L6dhfiA@mail.gmail.com>
In-Reply-To: <CADvTj4pXO2rwJ8oCzzGNY+OxLuo3uJnDT2PAxbyquw0L6dhfiA@mail.gmail.com>
Date: Wed, 5 Feb 2025 15:31:14 -0800
X-Gmail-Original-Message-ID: <CA+h8R2q-oqPUYwbMot_kyP5e7iShw-onQ8HM19FDs989VTqh3g@mail.gmail.com>
X-Gm-Features: AWEUYZmLoUvZF_Kybxsg0DbbH3rWRcEOauSA5t0NUQDOjqMB-69LLCZCNlgGKPw
Message-ID: <CA+h8R2q-oqPUYwbMot_kyP5e7iShw-onQ8HM19FDs989VTqh3g@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1738798287; x=1739403087; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q7YRTkI2f0M+E+TBakgeqVFFVx3vlX/7gCWDW4MPpfA=;
 b=xsmDhEN9wUgjc1H7t7na4LEOfCex7911moHwAjc59VUZrrVkyErKW/Vd02KJM+WsI8
 sXHAjZWUKutR89Z07jn+89iXucXcqUJPDGLo1zobNDIIQdDAQfbnlaY/P1nNX6piq6ou
 zMVVi+T3XjwWedG8uT0giA0vuDB+WOeKi8RyWoTG0zm5hr6VBOEvaQR9Z8OM0uy8I79u
 6utXb6KqP73hAJWDAUHT2ifoATCTWvUvHqjENRCeB9vBg9g9aV1NtCaPh7rWjwmzWQm5
 HJI7wrHR+dLski9nXm5w7er586S9lFZ77dvCxsKRYJAUfqHYSYGNsLT8QEhPyMLFXAtG
 t8NQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=xsmDhEN9
Subject: Re: [Buildroot] [PATCH v4 1/2] package/pkg-golang.mk: allow
 packages to override download GOPROXY
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsCgpPbiBXZWQsIEZlYiA1LCAyMDI1IGF0IDI6NTbigK9QTSBKYW1lcyBIaWxsaWFy
ZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiBPbiBXZWQsIEZlYiA1LCAy
MDI1IGF0IDE6NTXigK9QTSBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNv
bT4gd3JvdGU6Cj4gPiA+ID4gPiBXZWxsIHRoYXQgYW5kIHRoZSBmYWN0IHRoYXQgR09QUk9YWT1k
aXJlY3Qgd2FzIGJyb2tlbiBpbiB0aGUgZmlyc3QgcGxhY2UKPiA+ID4gPiA+IGlzIGEgcHJldHR5
IHN0cm9uZyBpbmRpY2F0b3IgdXBzdHJlYW0gcHJvamVjdHMgZG9uJ3QgY2FyZSBhYm91dCBpdCBt
dWNoLgo+ID4gPiA+Cj4gPiA+ID4gVGhleSBoYXZlIHJlcGxpZWQgdG8geW91ciBQUiByZXF1ZXN0
aW5nIGFuIGFsdGVybmF0aXZlIHN0cmF0ZWd5IHRvCj4gPiA+ID4gZml4aW5nIHRoZSBpc3N1ZToK
PiA+ID4gPgo+ID4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9uZXRiaXJkaW8vbmV0YmlyZC9wdWxs
LzMyNDAjaXNzdWVjb21tZW50LTI2Mzc5NTY1MzcKPiA+ID4gPgo+ID4gPiA+IEhlcmUgYXJlIHRo
ZSBuZXcgUFJzIGltcGxlbWVudGluZyB3aGF0IHRoZXkgcmVxdWVzdGVkOgo+ID4gPiA+Cj4gPiA+
ID4gLSBodHRwczovL2dpdGh1Yi5jb20vbmV0YmlyZGlvL25ldGJpcmQvcHVsbC8zMjg3Cj4gPiA+
ID4gLSBodHRwczovL2dpdGh1Yi5jb20vbmV0YmlyZGlvL25ldGJpcmQvcHVsbC8zMjg4Cj4gPgo+
ID4gT25lIG9mIHRoZXNlIGlzIGFscmVhZHkgbWVyZ2VkLCBhbmQgdGhlIG90aGVyIGlzIGJlaW5n
IGxvb2tlZCBhdCByaWdodCBub3cuCj4gPgo+ID4gSXQgaXMgbm90IGFzIGhhcmQgYXMgeW91IG1h
a2UgaXQgc2VlbSB0byBmaXggdXBzdHJlYW0uCj4KPiBTdXJlLCBtYXliZSBmb3Igc29tZW9uZSB0
aGF0IHJlZ3VsYXJseSBkZXZlbG9wcyBnb2xhbmcgcHJvamVjdHMKPiBpdCBzaG91bGQgYmUgZWFz
eSwgYnV0IEkgZG9uJ3QgcmVhbGx5IHdyaXRlIGFueSBnbyBjb2RlLCBzbyBkZWJ1Z2dpbmcKPiBj
b25mdXNpbmcgR09QUk9YWT1kaXJlY3QgcmVsYXRlZCBicmVha2FnZSBpcyBub3QgYWx3YXlzIHRo
YXQgZWFzeS4KCk9rLiBXZSB3aWxsIHRydXN0IHRoYXQgdXBzdHJlYW0gcGFja2FnZXMgKERvY2tl
ciwgbmV0YmlyZCwgZXRjKSBoYXZlCnRoZSBjb3JyZWN0IGhhc2ggaW4gZ28uc3VtLCBhbmQgdXNl
IHRoYXQgYXMgdGhlIHNvdXJjZS1vZi10cnVzdCBoZXJlLgoKV2Ugc2hvdWxkIHNldCB0aGUgZGVm
YXVsdCBCUjJfR09QUk9YWSB0byBtYXRjaCAkKGdvIGVudiBHT1BST1hZKSwgYXMKQXJub3V0IG1l
bnRpb25lZC4KCkkgc3VibWl0dGVkIGEgdjQgb2YgeW91ciBwYXRjaCwgd2l0aCBzb21lIG1pbm9y
IG1vZGlmaWNhdGlvbnM6CgpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVp
bGRyb290L3BhdGNoLzIwMjUwMjA1MjMyODM3LjcwMzAzLTEtY2hyaXN0aWFuQGFwZXJ0dXJlLnVz
LwoKSSB3b3VsZCByZXF1ZXN0IHRoYXQgd2Ugc3RpbGwgYXQgbGVhc3QgdGVzdCB3aXRoIEJSMl9H
T1BST1hZPSJkaXJlY3QiCndoZW4gbWVyZ2luZyBwYWNrYWdlcy4KCldlIG1pZ2h0IHdhbnQgdG8g
bWFrZSBCUjJfR09QUk9YWT0iZGlyZWN0IiBiZSB0aGUgZGVmYXVsdCBpZgpCUjJfUFJJTUFSWV9T
SVRFX09OTFkgaXMgc2V0LgoKQmVzdCByZWdhcmRzLApDaHJpc3RpYW4gU3Rld2FydAoKPiBUaGUg
dXBzaWRlcyB5b3UgbWVudGlvbiBhcmVuJ3QgcHJhY3RpY2FsIHVwc2lkZXMgZm9yIGJ1aWxkcm9v
dCBob3dldmVyLAo+IHRoZXkgbWF5IGJlIHByYWN0aWNhbCBmb3IgYXVkaXRpbmcgcHJvamVjdCBk
ZXBlbmRlbmNpZXMsIGJ1dCB3ZSBkb24ndAo+IGRvIHRoYXQgaGVyZSBhcyBwYXJ0IG9mIGJ1aWxk
cm9vdCBwcm9qZWN0IGluIHByYWN0aWNlLCBoZW5jZSB0aGUKPiAibm8gcHJhY3RpY2FsIHJlYXNv
biIgYXMgbm8gdXBzaWRlcyBmb3IgYnVpbGRyb290IGV4aXN0IElNTy4KCk9LLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
