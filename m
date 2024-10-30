Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0692ED3A667
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 09:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EBF280BD6;
	Wed, 30 Oct 2024 09:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W5k3lKaVc6uE; Wed, 30 Oct 2024 09:06:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36F1080B99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36F1080B99;
	Wed, 30 Oct 2024 09:06:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC9095E4F
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 09:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6B2040274
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 09:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6gVzep6ECOZR for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 09:06:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8831E40268
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8831E40268
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8831E40268
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 09:06:54 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-e29687f4cc6so6611381276.2
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 02:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730279213; x=1730884013;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pKtKpzhQ4EZV9NgY1FzGB+DvDkIASs1evJ1KoTuZw0c=;
 b=bhl4vIILvZJqMQJPcovb3R31OZUG/oqADfsYH8JjfySKJTfS+kEee6XldY/tvXTRLa
 Y1AeMU/XPg36xUvzdlI/FMQ5pZC5RTy30DznzR4u85N0aG9YCIymyP/0yLX8kXZU0am+
 RIr4WCWt2weGXVr2hgFahGujVhUAJbwz2XMJY1/c6BMkfzIudlSPiwzt7F30da2iUT5B
 y1a8TBuQVbyK6KtoBMeP8Du8PKTZqFY5m0ZFw+CNPi14Ic0xcl+t7y6AoAyECXVEirUo
 9JJc1B6QO1I2szAAUCm2xqshAcgKUqSIi4EYw15Cz/ya5Rmiad6pbe6Q6847JzdUtODG
 Ktuw==
X-Gm-Message-State: AOJu0Yz8LGSbdyXHiZpoJiv9Pl2zHqtMYALng1DIBsD9OhTfzi2qYmQm
 QACOkhHXEzgX6mFDxHn78f5V7u/Ee+qlebDBtkpM/Y6UT9OHd55xpTWdvu2Y+azc2dREgsbWmEc
 +T526Rc9e3MEz5YvL+k60ndOh7gglQJfskx4ZhRQ/CJ2HGi5xEzo=
X-Google-Smtp-Source: AGHT+IGtfdn3WzAZ/s8Zqj/4rMR19eUS39K9JAEOdh3o15/mOObbBcr1kwHFsP1g0fTEKt25a5Ettfw6HKWMChzSXj4=
X-Received: by 2002:a05:6902:1682:b0:e30:cee4:3c67 with SMTP id
 3f1490d57ef6-e30cee43d40mr2162734276.43.1730279213198; Wed, 30 Oct 2024
 02:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20241004215451.1198861-1-dario.binacchi@amarulasolutions.com>
 <20241004215451.1198861-2-dario.binacchi@amarulasolutions.com>
 <20241024223133.1069cd60@windsurf>
In-Reply-To: <20241024223133.1069cd60@windsurf>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 30 Oct 2024 10:06:42 +0100
Message-ID: <CABGWkvoeja1ZA_iha5TeOK0vfQ5JiqKWHjk5pEn+=Ky2Ku7oTw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com, 
 Colin Percival <cperciva@freebsd.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1730279213; x=1730884013;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pKtKpzhQ4EZV9NgY1FzGB+DvDkIASs1evJ1KoTuZw0c=;
 b=apbzZuHUXqP0IThCYuWnfMVixAPIq5nyxHhvBlnPUVU8lszGUI1bkwaoyB0pzhNmGt
 9nO0h+4P+iqzdM+8/99XDd6f6QgZA8ubc2+jhLOrVIVO3sWLsPHh5p7jnyoZJmOeUsq2
 /l4BuhtnjKFke+Vev+WGm0R5z7IemW/pKah6k=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=apbzZuHU
Subject: Re: [Buildroot] [PATCH 2/3] package/bsdiff: switch upstream
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKT24gVGh1LCBPY3QgMjQsIDIwMjQgYXQgMTA6MzHigK9QTSBUaG9tYXMg
UGV0YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhlbGxv
IERhcmlvLAo+Cj4gT24gRnJpLCAgNCBPY3QgMjAyNCAyMzo1NDo0NSArMDIwMAo+IERhcmlvIEJp
bmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiA+
IEkgYXNrZWQgQ29saW4gUGVyY2l2YWwsIHRoZSBjcmVhdG9yIG9mIGJzZGlmZiwgYWJvdXQgdGhl
IGZhaWx1cmUgdG8KPgo+IFdlIHRyeSB0byBhdm9pZCBmaXJzdCBwZXJzb24gc2luZ3VsYXIgc2Vu
dGVuY2VzIGluIGNvbW1pdCBsb2dzLiBFaXRoZXIKPiB3ZSB1c2UgIndlIiwgb3Igd2UgdHVybiB0
aGUgc2VudGVuY2VzIGFyb3VuZC4KPgo+ID4gZG93bmxvYWQgYnNkaWZmLTQuMy50YXIuZ3ogZnJv
bSAgaHR0cHM6Ly93d3cuZGFlbW9ub2xvZ3kubmV0L2JzZGlmZiwKPiA+IGFuZCBoZSBraW5kbHkg
cmVwbGllZCB0aGF0IGhlIGludGVudGlvbmFsbHkgZGlzYWJsZWQgdGhlIHBhY2thZ2UKPiA+IGRv
d25sb2FkIGJlY2F1c2UgInRoYXQgY29kZSBoYXMgc29tZSBzZWN1cml0eSBidWdzIGFuZCBJIGRp
ZG4ndCBoYXZlCj4gPiB0aW1lIHRvIHJvbGwgYSBuZXcgdGFyYmFsbCB3aXRoIHRoZW0gZml4ZWQu
IEdyYWIgdGhlIGJzZGlmZiBjb2RlIGZyb20KPiA+IEZyZWVCU0Qgb3IgQ2hyb21pdW0sIEknbSBw
cmV0dHkgc3VyZSB0aGV5IGhhdmUgYWxsIHRoZSBmaXhlcy4iCj4gPgo+ID4gSSBjaG9zZSB0aGUg
Q2hyb21pdW0gdmVyc2lvbiBiZWNhdXNlIHRoZSBGcmVlQlNEIG9uZSB3YXMgbGVzcyBzdWl0YWJs
ZQo+ID4gZm9yIGludGVncmF0aW9uIGludG8gQnVpbGRyb290LCBnaXZlbiB0aGF0IHRoZXJlIGlz
IG5vIGdpdCByZXBvc2l0b3J5Cj4gPiBmb3IgdGhlIHByb2plY3QgaXRzZWxmLCBidXQgcmF0aGVy
IGZvciBhbGwgRnJlZUJTRCBzb3VyY2VzICg0LjcgR0IpLgo+Cj4gaHR0cHM6Ly9jaHJvbWl1bS5n
b29nbGVzb3VyY2UuY29tL2Nocm9taXVtb3MvdGhpcmRfcGFydHkvYnNkaWZmIHNob3dzOgo+Cj4g
ICAoTU9WRUQpIGh0dHBzOi8vYW5kcm9pZC5nb29nbGVzb3VyY2UuY29tL3BsYXRmb3JtL2V4dGVy
bmFsL2JzZGlmZi8gZm9yayBvZiBic2RpZmY7IGh0dHA6Ly93d3cuZGFlbW9ub2xvZ3kubmV0L2Jz
ZGlmZi8KPgo+IERvZXMgdGhhdCBtZWFuIHdlIHNob3VsZCB1c2UKPiBodHRwczovL2FuZHJvaWQu
Z29vZ2xlc291cmNlLmNvbS9wbGF0Zm9ybS9leHRlcm5hbC9ic2RpZmYvIGluc3RlYWQ/Cj4KPiBU
aGF0IGJlaW5nIHNhaWQsIGV2ZW4gdGhlIHJlcG8gYXQKPiBodHRwczovL2Nocm9taXVtLmdvb2ds
ZXNvdXJjZS5jb20vY2hyb21pdW1vcy90aGlyZF9wYXJ0eS9ic2RpZmYgaGFkIGl0cwo+IGxhc3Qg
Y29tbWl0IDEwIHllYXJzIGFnbywgc28gdGhpcyByZWFsbHkgbG9va3MgbGlrZSB1bm1haW50YWlu
ZWQKPiBzb2Z0d2FyZS4KClRoZSBGcmVlQlNEIHZlcnNpb24gKGkuZS4sIGh0dHBzOi8vZ2l0aHVi
LmNvbS9mcmVlYnNkL2ZyZWVic2Qtc3JjLmdpdCkKaGFzIG1vcmUgcmVjZW50CmNvbW1pdHMgZm9y
IGJzZGlmZiBhbmQgYnNwYXRjaCwgYnV0IGl04oCZcyBhIGNvbnRhaW5lciByZXBvc2l0b3J5IGZv
cgptYW55IG90aGVyIHByb2plY3RzICg0LjdHQikKYW5kIG5vdCBzcGVjaWZpYyB0byBic2RpZmYu
IEkgZG8gbm90IGtub3cgaWYgaXTigJlzIHBvc3NpYmxlIHRvIGV4dHJhY3QKanVzdCB0aGF0IHBy
b2plY3QuIEFueSBpZGVhcz8KT3RoZXJ3aXNlLCB3b3VsZCBpdCBiZSBiZXR0ZXIgdG8gcmVtb3Zl
IHRoZSBwYWNrYWdlIGZyb20gYnVpbGRyb290PwoKVGhhbmtzIGFuZCByZWdhcmRzLApEYXJpbwoK
Pgo+IFNob3VsZG4ndCB3ZSBpbnN0ZWFkIGp1c3QgcmVtb3ZlIGl0IGZyb20gQnVpbGRyb290PwoK
Cj4KPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJv
b3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmlu
Zwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KCgoKLS0KCkRhcmlvIEJpbmFjY2hpCgpTZW5pb3IgRW1i
ZWRkZWQgTGludXggRGV2ZWxvcGVyCgpkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNv
bQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKCkFtYXJ1bGEgU29sdXRpb25z
IFNSTAoKVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5ldG8sIElUCgpULiAr
MzkgMDQyIDI0MyA1MzEwCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20KCnd3dy5hbWFydWxhc29s
dXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
