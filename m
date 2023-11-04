Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C69BC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 13:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3B25821E0;
	Sat,  4 Nov 2023 13:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3B25821E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sfPs88JHXKDL; Sat,  4 Nov 2023 13:51:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B6AE8216F;
	Sat,  4 Nov 2023 13:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B6AE8216F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 286AF1BF30C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 13:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01D9582166
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 13:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01D9582166
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5BqTYkoGT0gi for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 13:51:09 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D89F8215F
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 13:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D89F8215F
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40906fc54fdso23302125e9.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 06:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699105867; x=1699710667;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/c3sEAYxJ0eZ98+kej6e93DXwWtGarkCNWE27PJnD/U=;
 b=ABRq/Z7PW59qPL4Ose/J2aDrRsQfn6UWGN9JXgNBco2TrtQf3P7dsmZQUNWgRQCm6C
 Fu9rAk60YIh6SjmQHL2lukeUBSdy9+s+tvkw+Gb8qAMQoHR4IZUGeIOdeolSoAJFrGg9
 o67q0TSeUht006sGG/OMGyuaxFcSJn6vzwiV5ddpdVtt0ehVqw10LpOAQgdlj7zxksFs
 3wgTfG6RHmgwfN9W/AGCYr9EzXjXEokd5XNUyPKIiFLBYS4H1mx6bmnr5JEptSRMbX7x
 GFOFNgBhjzacqcYvA13YGFbfbgodDehP00uakzf2tcYsaPgoEP8RK+Ke0ecG+ZvjIA5A
 Y1LA==
X-Gm-Message-State: AOJu0YzHILPa6n4HqyZDsBv8vSDQ5N7Q7HL4XvSE+vx68f9RHKdfHcqX
 msaeZenp6CHusxTw1FhoOLihhedPcX3Zw6QKvSM1rhpP3JyXNchzUM6VhA==
X-Google-Smtp-Source: AGHT+IHyOcjT/sR6rEm6D54awkSc+ZtWHEU1+HJUc23HMgOzD8cfiux4PsQYQj9lXv73uoFJGy1CcHfUgb3cckj8aTw=
X-Received: by 2002:a05:6000:1882:b0:32f:b1ab:ee82 with SMTP id
 a2-20020a056000188200b0032fb1abee82mr6202643wri.26.1699105867152; Sat, 04 Nov
 2023 06:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20231104072458.7369-1-javad321javad@gmail.com>
 <20231104072458.7369-7-javad321javad@gmail.com>
 <20231104144038.4860e3b8@windsurf>
In-Reply-To: <20231104144038.4860e3b8@windsurf>
From: Javad Rahimipetroudi <javad321javad@gmail.com>
Date: Sat, 4 Nov 2023 17:20:55 +0330
Message-ID: <CAL245at0utrd0RtwaO_K6nmn9VrKyo3nCj-3oU4btKWb6hbJ+Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699105867; x=1699710667; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/c3sEAYxJ0eZ98+kej6e93DXwWtGarkCNWE27PJnD/U=;
 b=ZhqJ8K5bbjaWggyo2RH887HN1UXfp9lgBkWs9NIvu3zdk0scE/YkbAubnSggcGeac/
 /PuZz9JNBtbnMfJZWX6ofRn6sFaCbd9SfEEQVuWCKVpwpEtm1TuhHsiF168LdTFFr9Fg
 Zwsepigy/36fr9gPqQ0eeqew0Tim+A/q8ZaXSJiS9i1O2aPiVXzBkEESrkiblu51wmwB
 yzzcsvEFSv8kz3pL/SskBv042tTa11hYEAAzLxM/8PjmXlX4bAn0hbXk7bgsSb+xj3Zw
 3Gnm6rmJrF1BpWQC8TMTjJiSeSdauBUt/oqvJNuR/Bh4azj8fcRXTq9j+bG7j6C8wZsI
 8/Ow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZhqJ8K5b
Subject: Re: [Buildroot] [PATCH 7/7] board/pine64/genimage.cfg: remove
 unnecessary partition for itb For minimal booting,
 uboot.itf is no longer required, so the correspondig partition deleted.
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLApUaGFua3MgZm90IHlvdXIgZmVlZGJhY2suCgpPbiBTYXQsIE5vdiA0LCAy
MDIzIGF0IDU6MTDigK9QTSBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3Rs
aW4uY29tPiB3cm90ZToKPgo+IEhlbGxvLAo+Cj4gQ29tbWl0IHRpdGxlIGlzIHRvbyBsb25nLiBZ
b3UgbmVlZCB0byBoYXZlIGEgc2hvcnQgdGl0bGUsIHRoZW4gYW4gZW1wdHkKPiBuZXcgbGluZSwg
dGhlbiBhIGxvbmdlciBjb21taXQgbG9nLCBwb3RlbnRpYWxseSBpbiBtdWx0aXBsZSBwYXJhZ3Jh
cGhzLAo+IHRoYXQgZXhwbGFpbnMgaW4gbW9yZSBkZXRhaWxzIHdoYXQgaXMgaGFwcGVuaW5nLgo+
Cj4gT24gU2F0LCAgNCBOb3YgMjAyMyAxMDo1NDo1OCArMDMzMAo+IEphdmFkIFJhaGltaXBldHJv
dWRpIDxqYXZhZDMyMWphdmFkQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+IFNpZ25lZC1vZmYtYnk6
IEphdmFkIFJhaGltaXBldHJvdWRpIDxqYXZhZDMyMWphdmFkQGdtYWlsLmNvbT4KPiA+IC0tLQo+
ID4gIGJvYXJkL3BpbmU2NC9waW5lNjQvZ2VuaW1hZ2UuY2ZnIHwgNyAtLS0tLS0tCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDcgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2JvYXJkL3Bp
bmU2NC9waW5lNjQvZ2VuaW1hZ2UuY2ZnIGIvYm9hcmQvcGluZTY0L3BpbmU2NC9nZW5pbWFnZS5j
ZmcKPiA+IGluZGV4IDM3ZWJlNWVhNmUuLjIzYjAyOTczZGQgMTAwNjQ0Cj4gPiAtLS0gYS9ib2Fy
ZC9waW5lNjQvcGluZTY0L2dlbmltYWdlLmNmZwo+ID4gKysrIGIvYm9hcmQvcGluZTY0L3BpbmU2
NC9nZW5pbWFnZS5jZmcKPiA+IEBAIC0yMCwxMyArMjAsNiBAQCBpbWFnZSBzZGNhcmQuaW1nIHsK
PiA+ICAgICAgICAgICAgICAgb2Zmc2V0ID0gOEsKPiA+ICAgICAgIH0KPiA+Cj4gPiAtICAgICBw
YXJ0aXRpb24gdS1ib290IHsKPiA+IC0gICAgICAgICAgICAgaW4tcGFydGl0aW9uLXRhYmxlID0g
Im5vIgo+ID4gLSAgICAgICAgICAgICBpbWFnZSA9ICJ1LWJvb3QuaXRiIgo+ID4gLSAgICAgICAg
ICAgICBvZmZzZXQgPSA0MEsKPiA+IC0gICAgICAgICAgICAgc2l6ZSA9IDFNICMgMU1CIC0gNDBL
Qgo+ID4gLSAgICAgfQo+Cj4gTm90IHN1cmUgd2hlcmUgdGhpcyBzaG91bGQgZ28uIFRvZ2V0aGVy
IHdpdGggdGhlIFUtQm9vdCB1cGRhdGUsCj4gcHJvYmFibHksIGFzIGl0J3MgZm9sbG93aW5nIHRo
ZSBVLUJvb3QgdXBkYXRlIHRoYXQgdGhlcmUncyBubyBsb25nZXIKPiBhbnkgdS1ib290Lml0Yj8g
QnV0IHRoZW4sIHdoZXJlIGlzIFUtQm9vdCBzdG9yZWQgbm93Pwo+Cj4gT3ZlcmFsbCwgeW91ciBw
YXRjaCBzZXJpZXMgaXMgbm90IGNvcnJlY3RseSBzcGxpdCBpbnRvIGxvZ2ljYWwgcGF0Y2hlcwo+
IHRoYXQgZWFjaCBkbyBvbmUgdGhpbmcsIGJ1dCBkbyBpdCBjb21wbGV0ZWx5LiBZb3VyIHNlcmll
cyBpcyBub3QKPiBiaXNlY3RhYmxlLCB3aGljaCBhbHNvIGlzbid0IGdvb2QuCj4KPiBDb3VsZCB5
b3UgcmV3b3JrIHlvdXIgcGF0Y2ggc2VyaWVzIGFjY29yZGluZyB0byB0aG9zZSBjb21tZW50cywg
YW5kCj4gc3VibWl0IGEgbmV3IHZlcnNpb24/ClN1cmUsIEkgd2lsbCByZXdvcmsgb24gdGhlIHBh
dGNoIHRvIG1lcmdlIHRoZSByZWxhdGVkIGNoYW5nZXMgaW4gYSBzaW5nbGUgcGF0Y2guCj4KPiBU
aGFua3MgYSBsb3QsCj4KVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrIG9uIG15IHBhdGNoIHNlcmll
cy4gSSBhY2tub3dsZWRnZSB5b3VyCmNvbW1lbnRzIGFuZCB3aWxsIHJld29yayB0aGUgc2VyaWVz
IHRvIGFkZHJlc3MgdGhlIGlzc3VlcyB5b3UndmUKcmFpc2VkLiBJIHdpbGwgc3BsaXQgdGhlIHBh
dGNoZXMgaW50byBsb2dpY2FsIGFuZCBjb21wbGV0ZSBvbmVzIGFuZAptYWtlIHN1cmUgdGhlIGNv
bW1pdCB0aXRsZSBpcyBzaG9ydCBhbmQgdGhlIGNvbW1pdCBsb2cgaXMgZGV0YWlsZWQuCgpJIHdp
bGwgc3VibWl0IGEgbmV3IHZlcnNpb24gb2YgdGhlIHBhdGNoIHNlcmllcyBvbmNlIEknbSBkb25l
IHdpdGggdGhlIGNoYW5nZXMuCgpUaGFua3MgYWdhaW4gZm9yIHlvdXIgZmVlZGJhY2suCgpCZXN0
IHJlZ2FyZHMsCkphdmFkCj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25l
ciBhbmQgQ0VPLCBCb290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmlu
ZyBhbmQgdHJhaW5pbmcKPiBodHRwczovL2Jvb3RsaW4uY29tSGkgVGhvbWFzLApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
