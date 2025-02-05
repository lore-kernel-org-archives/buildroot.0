Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70A6C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 22:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8380C6108C;
	Wed,  5 Feb 2025 22:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Agx39e6d8E35; Wed,  5 Feb 2025 22:25:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A5E5610C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A5E5610C2;
	Wed,  5 Feb 2025 22:25:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A2E88E1
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 22:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8759A6108C
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 22:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2itzUkfueSfO for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 22:25:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2a; helo=mail-oa1-x2a.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8AF9460F82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AF9460F82
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8AF9460F82
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 22:25:17 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-2b1a9cbfc8dso64271fac.2
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 14:25:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738794316; x=1739399116;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0rxmwl3BVcozPFTJn0tv5CnGkuhzcKsdVunXlKgqNrE=;
 b=V5QI+R032sOzKyqLFDqg0Ekm/Wv+bwo6VLPMCZtoxLjUbOycW0Oulaj38zulcivhc1
 Kw9i5xlpPxBJLo3ddvkd7TjygcqMwDKE7UnS1FWvbQKES/NnghU3rNyuCsfsAGq7XODh
 oVooVKoIzb/fXbCssx2yOfO7+wcPyijhh3gQS+y13weSNUkUlT/SktobWanxiUgvcMYI
 1NxrIZFkdSBwK6+ArJ17pRW7kAR78baN6O6lc83XdZL/EArh7FRqySQd9QgOK2vvjjAd
 Q0DszR5JMEOcYISPWB4X/yP/uUxiunZ1O+Nzc+dvDa8ic4yvl0SXKGnRuDVTvNENeMne
 KvCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU5NgkdeNebJr0QaY+lGL8IMA8eCu9R+QVnp6H9GMrHirJYUjcNzzw4f9FVsujg4mDtE/S7xpsgKw=@buildroot.org
X-Gm-Message-State: AOJu0YzGsDXTts7mHU1Y05pL22zLVhut/CzxQqGuoo3j9j9rECQEMmPr
 eauzsfOYKw4+iM3WYUebKIJFBXHARMVZoczqhq6LPkqyCh3wkN1yoKLTiefP4OhuED269KaMCeL
 H
X-Gm-Gg: ASbGnctCu3NazELG8SleeoB2urF6L2CSh9LU2qMFKFpB0mSM9t2Tky4R2SGBRZVKSMx
 NSssPoMUDMK9rX/Hba0QlfN7WzaWzAFva+db9qMbN06F3cYRgE1qsToHow3y7l66dWAAxxPTxK1
 dYBCG+K1osBDPsQca/r2tYFCB5vLy+pMOKOrCgNyWhGjav6+9h9BmLaIqkM6AsWRPfTS8Vl0lAB
 r3GmDE6UxcHVRvt/1gS46QGtY2FC1gyRjLZ5yUuqv+Lj0EhOKjx+WderyNzym1yUGnb85T/1ykf
 sUKtBNWeJ9vg/v7H6xZoioE1wsH9wbB6DFlvbwsF9fziiKcS260ChNE=
X-Google-Smtp-Source: AGHT+IERuVn53L/jtt6UzcY5cl4YmehmN0q3uq4xcn4DOq1P46FmCd9Y7aVKB+soVBCVkzYdADItrA==
X-Received: by 2002:a05:6870:8194:b0:29e:2bbd:51cb with SMTP id
 586e51a60fabf-2b805136276mr3090213fac.24.1738794316464; 
 Wed, 05 Feb 2025 14:25:16 -0800 (PST)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com.
 [209.85.160.41]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2b35665087esm4919236fac.45.2025.02.05.14.25.16
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 14:25:16 -0800 (PST)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-2b61af4f893so73196fac.1
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 14:25:16 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU2NWMwXGBpH/6RQWRALhdLw3jmrzgVpvzenig8DElWX2X0ZlNrsv3C2wy2+5ofp0UHZXxgMfYBwdc=@buildroot.org
X-Received: by 2002:a05:6871:891:b0:29e:6920:4b5f with SMTP id
 586e51a60fabf-2b805136019mr3070025fac.31.1738794315742; Wed, 05 Feb 2025
 14:25:15 -0800 (PST)
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
 <664652f9-b64b-4e56-ab9e-a65f42b08b5e@mind.be>
In-Reply-To: <664652f9-b64b-4e56-ab9e-a65f42b08b5e@mind.be>
Date: Wed, 5 Feb 2025 14:25:04 -0800
X-Gmail-Original-Message-ID: <CA+h8R2roOAnYUtRNX-C9gODWkR7VysVGjrwJvzLUT-c8cmXC3g@mail.gmail.com>
X-Gm-Features: AWEUYZmDusfH6aROYEbJZC1mt_6_unCImQ9RsUb7vdmE4-5wwFOYC7OfxkliHYs
Message-ID: <CA+h8R2roOAnYUtRNX-C9gODWkR7VysVGjrwJvzLUT-c8cmXC3g@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Christian Stewart via buildroot <buildroot@buildroot.org>,
 Anisse Astier <anisse@astier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1738794316; x=1739399116; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0rxmwl3BVcozPFTJn0tv5CnGkuhzcKsdVunXlKgqNrE=;
 b=hpl2k1mdS9R0RbBe7ov+LyEs0nr+j+q/VNmVnQmXJOfkPZbt0v+RN0mmKAahYOlpkx
 zWsKto5yAQwCTNit31FaSYNoLqFj3FAojZlkVcMRJyCKGbE6Y2Zw5KA55mfZHboEGFQv
 Nb8QbaeR9VGcWpEsxBHNzh7ZBQqpa353xBa+GWCcjOIP/g5LLt9TdMrmAbtfGBTHUsiP
 Q9/0hldFmm3W7bf99hTul0XS5ZEHFSX0iPZ0VUuKOmiZu4sfGi1aueTyJxrlMwXk5+Wo
 GDM7TD0kxFRXpz406JDctXgTz3Lixh/b/BjA5ZLagmiLcDa3tt703ZarYPXd0qEn3P9/
 1e9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=hpl2k1md
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKT24gV2VkLCBGZWIgNSwgMjAyNSBhdCAxOjUz4oCvUE0gQXJub3V0IFZhbmRl
Y2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiB3cm90ZToKPiBPbiAwNS8wMi8yMDI1IDIyOjIyLCBD
aHJpc3RpYW4gU3Rld2FydCB3cm90ZToKPiBbc25pcF0KPiA+IFVwc2lkZXM6Cj4gPgo+ID4gLSBO
byBkZXBlbmRlbmN5IG9uIGEgdGhpcmQtcGFydHkgcHJveHkgc2VydmljZQo+ID4gLSBBYmlsaXR5
IHRvIGJ1aWxkIHdpdGggR09QUk9YWT1kaXJlY3QgZm9yIHRob3NlIHRoYXQgcmVxdWlyZSBpdAo+
ID4gKG90aGVyd2lzZSBCdWlsZHJvb3QgYnJlYWtzIGZvciB0aGVtIG9uIGRlZmF1bHQpCj4KPiAg
IERvIHdlIGFjdHVhbGx5IGhhdmUgZXhhbXBsZXMgb2YgcGFja2FnZXMgdGhhdCBicmVhayB3aXRo
IHRoZSBkZWZhdWx0IHByb3h5PwoKSSBzaG91bGQgaGF2ZSBiZWVuIG1vcmUgY2xlYXIgaGVyZS4g
SSBtZWFudCwgYXMgYSB1c2VyLCBpZiBJIHNldApHT1BST1hZPWRpcmVjdCBhbmQgcnVuIGEgQnVp
bGRyb290IGJ1aWxkLCB0aGUgYnVpbGQgd291bGQgZmFpbCAxMDAlIG9mCnRoZSB0aW1lIGlmIHdl
IG1lcmdlIHBhY2thZ2VzIHRoYXQgaGF2ZSBtaXNtYXRjaGVzIGJldHdlZW4gR2l0IGFuZApHT1BS
T1hZLgoKPiAgIEl0J3Mgbm90IGFjdHVhbGx5IHRoYXQgc2ltcGxlIHRob3VnaC4gSXQgc2hvdWxk
IHJhdGhlciBiZToKPgo+IC0gSWYgYW55IHVwc3RyZWFtIGRpc2FwcGVhcnMsIHRoZXkgd2lsbCBu
ZWVkIHRvIGZhbGwgYmFjayBvbiBzb3VyY2VzLmJ1aWxkcm9vdC5uZXQuCj4gLSBJZiBhbiB1cHN0
cmVhbSBpcyBhbHJlYWR5IGdvbmUgd2hlbiBhIHBhY2thZ2UgaXMgc3VibWl0dGVkLCB3ZSBuZWVk
IHRvIGRvCj4gcHJlLXZlbmRvcmluZyBwYXRjaGluZyB0byBmaXggaXQsIGFuZCB3ZSBkb24ndCBj
dXJyZW50bHkgaGF2ZSBpbmZyYXN0cnVjdHVyZSBmb3IKPiBwcmUtdmVuZG9yaW5nIHBhdGNoaW5n
LgoKT3IgZml4IHVwc3RyZWFtLgoKPiAtIFRoZXJlIGlzIGEgKHNtYWxsPykgY2hhbmNlIHRoYXQg
aXQncyBpbXBvc3NpYmxlIHRvIGZpbmQgYmFjayBhbiB1cHN0cmVhbSB0aGF0Cj4gY29ycmVzcG9u
ZHMgdG8gKGlzIGlkZW50aWNhbCB0bykgdGhlIG9yaWdpbmFsIHZlcnNpb24gdGhhdCBkaXNhcHBl
YXJlZC4KCldlIGNhbiBnZXQgdGhlIC50YXIuZ3ogZm9yIHRoZSBwYWNrYWdlIHZpYSBzZXR0aW5n
IEdPUFJPWFkgdG8gdGhlCmRlZmF1bHQgYW5kIHJ1bm5pbmcgIm1ha2UgcGtnLWV4dHJhY3QiIHRo
ZW4gbWlycm9yIHRoYXQuCgo+ICAgSSdtIHN0aWxsIG9uIHRoZSBmZW5jZSBvbiB3aGF0IHRoZSBi
ZXN0IGFwcHJvYWNoIGlzLi4uIFdoYXQgSSBkbyB0aGluayBiYXNlZAo+IG9uIHRoZSBkaXNjdXNz
aW9uIGlzIHRoYXQgd2Ugc2hvdWxkIHVzZSB0aGUgc2FtZSBHT1BST1hZIGZvciBldmVyeXRoaW5n
IC0gdGhlcmUKPiByZWFsbHkgc2hvdWxkIGJlIG5vIHJlYXNvbiB0byBkbyBpdCBkaWZmZXJlbnRs
eSBmb3IgZGlmZmVyZW50IHBhY2thZ2VzLgoKQWdyZWVkLgoKSSBkbyBhZ3JlZSB0aGF0IGhhdmlu
ZyBHT1BST1hZIGVuYWJsZSB0aGUgR29vZ2xlIHByb3h5IG9uIGRlZmF1bHQgaXMgYQpnb29kIHRo
aW5nLgoKSG93ZXZlciBJIHN0cm9uZ2x5IGJlbGlldmUgdGhhdCB3ZSBzaG91bGQgZW5mb3JjZSBH
T1BST1hZPWRpcmVjdCBhdApsZWFzdCB3b3JrcyB3aGVuIG1lcmdpbmcgdGhlIHBhY2thZ2UgaW5p
dGlhbGx5IG9yIHVwZGF0aW5nIHRvIGEgbmV3CnZlcnNpb24uCgo+ICAgUmlnaHQgbm93LCBJJ20g
YWN0dWFsbHkgbGVhbmluZyB0b3dhcmRzIHJlbW92aW5nIHRoZSBHT1BST1hZPWRpcmVjdCAtIGJ1
dCB0aGVuCj4gd2Ugc2hvdWxkIHN0aWxsIHNldCBpdCBleHBsaWNpdGx5LiBXZSBzaG91bGQgcHJv
YmFibHkgZXZlbiBhbGxvdyB0aGUgcHJveHkgdG8gYmUKPiBjb25maWd1cmVkLiBXZSBzaG91bGQg
ZGVmaW5pdGVseSBub3QgcmVseSBvbiB3aGF0ZXZlciB0aGUgdXNlciBzZXQgaW4gdGhlaXIKPiBl
bnZpcm9ubWVudC4KPgo+ICAgVGhlIHByb2JsZW0gd2l0aCBkb2luZyBpdCB0aGUgcmlnaHQgd2F5
IChpLmUuIGtlZXBpbmcgR09QUk9YWT1kaXJlY3QpIGlzIHRoYXQKPiBpdCBhZGRzIGEgbG90IG9m
IHdvcmsgZm9yIHVzOgo+IC0gd2hlbiBhZGRpbmcgYSBwYWNrYWdlIHRoYXQgaGFzIGEgYnJva2Vu
IGdvLm1vZCwgd2UgaGF2ZSB0byBmaXggaXQ7Cj4gLSB3ZSBjdXJyZW50bHkgY2FuJ3QgZXZlbiBm
aXggaXQgdW50aWwgdGhlIGZpeCBpcyBtZXJnZWQgdXBzdHJlYW0gYmVjYXVzZSB3ZQo+IGRvbid0
IGhhdmUgdGhlIHByZS12ZW5kb3JpbmcgcGF0Y2huZyBpbmZyYXN0cnVjdHVyZS4KClRoYXQncyB0
cnVlLCBhdCB0aGUgbW9tZW50IHdlIGhhdmUgdG8gd2FpdCBmb3IgdXBzdHJlYW0gdG8gZml4IGl0
LgoKPiAgIEEgbG90IHdpbGwgZGVwZW5kIG9uIGhvdyBvZnRlbiBhbmQgd2h5IHBhY2thZ2VzIGJy
ZWFrIHdpdGggdGhlIGRlZmF1bHQgR09QUk9YWS4KCldlIGhhdmUgc28gZmFyIHNlZW4gdGhhdCB3
aXRoICJuZXRiaXJkIiAodGhleSBhcmUgbWVyZ2luZyB0aGUgUFJzIHRvCmZpeCBpdCBjdXJyZW50
bHkpIGFuZCAidGFpbHNjYWxlIiAodGhleSBtZXJnZWQgYSBQUiB0byBmaXggaXQgcXVpdGUKcXVp
Y2tseSkuCgpBdCBtb3N0IHRoZXJlIHNob3VsZCBiZSBhIG1heWJlIDEgd2VlayBkZWxheSBmb3Ig
dXBzdHJlYW0gdG8gcmVzcG9uZC4KCm5ldGJpcmQgdG9vayBwYXJ0aWN1bGFybHkgbG9uZyBzaW5j
ZSB3ZSBoYXZlIG5vdCBsZXQgdGhlbSBrbm93IHdoeSB3ZQpuZWVkIHRoaXMgdG8gd29yay4KClRo
YW5rcywKQ2hyaXN0aWFuIFN0ZXdhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
