Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC796CA101F
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77C09614B8;
	Wed, 10 Sep 2025 21:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id STB5Sw6jDebf; Wed, 10 Sep 2025 21:59:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E68D614CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E68D614CE;
	Wed, 10 Sep 2025 21:59:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E19022BB3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C764A40103
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6PFUDN8XYEhQ for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:59:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2e; helo=mail-vs1-xe2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 03D194153F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03D194153F
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03D194153F
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:59:29 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-529f4770585so75809137.1
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 14:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757541568; x=1758146368;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yt0xObQC37UKlnbCk9BYqx/qJFgNnpFdOuegbrLQzP4=;
 b=bXWWACYVCnGHNgcMwmz0NSxyCYRIlSbyGJug61guXn7D+g9ppTuFAZvdywB0eXpMCD
 gA3QQGBhG8Zg/JYbrAcVbxEsJ3VDZEUtjSuYH3RRAPE76j0S76qPYoKDft9VlNX68AKc
 aZA6UykUemYlTIR34yppl42KtyGi/U+zkcfcuC6URoQffcOieSNj+jAV/Vj8BJk86HJf
 jKOzTVAYMVwd5rl1th3ZTp1ayAdQ2W8busZfoJ7hkrVoKQq3L37Eu2AMibnyTtOP3tG2
 vVED1BIkBZrZChNl+9/zLnryM0IQCOVixWS1UrA46kPrtA1+AU5NuXHK5VV58fgINk9P
 Vr8A==
X-Gm-Message-State: AOJu0YxOhSz7EndFbqpTCFuMPTzTKy3+qYqZw6GE48p/YvAcFDfZ1+oi
 UoQDzxNpuWH9t8EuKV9pyrpGUwZ4O+/j3w1QpRYmU0s0CIKWxdCy3nOmGbRWmv5LomAUFiDqrDu
 5H5GYa8360E/zeJKmj/UXi98OKbYuyKobUvMv
X-Gm-Gg: ASbGncuu9rq5GlS4BEcvIUtb7EW+WCebOCqqhjOFoawvB8ktXl1LiKwDL6SSzgHdC1j
 nJhEqv+5Ag7q2XxUplvKKzf0QJgs4p4DE2Di2OVRRKJSJPw79/QwpHfWF6ERnWxqLwhQmbQC4Of
 9LB+0HdVW3E1BbgvSP16LcukTH3OlQlWSu4PnUC6btW29cLVy4CFqVzkUUGGGXDIHTLOqfME3Ca
 PTNTz7W
X-Google-Smtp-Source: AGHT+IEO1v6suE2y13NfDD6Nqej4GXiCMNO6QIh4zZHipzIfN99mJEk46nmirxuq+BFMT5P4pyjyFbjZh7b8sQgw8fY=
X-Received: by 2002:a05:6102:4a98:b0:4fd:53e0:b522 with SMTP id
 ada2fe7eead31-53d21db63c7mr5480362137.19.1757541568555; Wed, 10 Sep 2025
 14:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250910183458.1288165-1-james.hilliard1@gmail.com>
 <CA+h8R2ozbY7zf0=x+gP=bgruLYOK7qW1Ex5Sa0x_h_gaqqHrwg@mail.gmail.com>
 <CADvTj4pVPa=j0BrhiJMoiYBmzq_uXbUtUw-xEqdNoWUCkam+VQ@mail.gmail.com>
 <CA+h8R2rhgRvEegJ4a7MZX+iKqqdswN6xRxds0rPu12eh50jvSQ@mail.gmail.com>
In-Reply-To: <CA+h8R2rhgRvEegJ4a7MZX+iKqqdswN6xRxds0rPu12eh50jvSQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 10 Sep 2025 15:59:17 -0600
X-Gm-Features: AS18NWBPiU5SH-8cdcV_3xevMVPOQE-Y3DoqFCY8nkhQQu-jyOTfXqRtA_eA3p0
Message-ID: <CADvTj4pzNug8M53i6c2bMcZgKc0_LXrQG22cJ4NA=OSv-qHKJA@mail.gmail.com>
To: Christian Stewart <christian@aperture.us>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757541568; x=1758146368; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yt0xObQC37UKlnbCk9BYqx/qJFgNnpFdOuegbrLQzP4=;
 b=T1tHvT1E4BCzy58pcnZjILlrgDC/R35pj1Q5FgzmxiiNjCEIdXrUzcPaT+bL46U68y
 GXaiUcw7nbUbGtkUm9+bawQJ90De2SrwiUi9qv/1jgk1yI7nPoc1mV1sCIGd4rXEa8rJ
 +FFySVypZgsZAZdZssnOCAdY0EyUpRV0Ew9e69o1mySjt+Fr4isi9b6wC8aVuiER1Jai
 /394j3AhdSoZ7xeVrg9vMPjRYaQnSFWZ81Glg6CpZ+uhn4OIyj1hwVIgzDwhLdLWCGKP
 oVTDR7rNb8TwWzxdq6nW4oqPfHkroToRE75E+ZTOWp/3s8yndfbTfitcUzsgQ1q4JWEZ
 3p8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=T1tHvT1E
Subject: Re: [Buildroot] [PATCH 1/2] package/go: bump to version 1.25.1
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

T24gV2VkLCBTZXAgMTAsIDIwMjUgYXQgMzo1M+KAr1BNIENocmlzdGlhbiBTdGV3YXJ0IDxjaHJp
c3RpYW5AYXBlcnR1cmUudXM+IHdyb3RlOgo+Cj4gSGkgSmFtZXMsCj4KPiBPbiBXZWQsIFNlcCAx
MCwgMjAyNSBhdCAyOjE34oCvUE0gSmFtZXMgSGlsbGlhcmQKPiA8amFtZXMuaGlsbGlhcmQxQGdt
YWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBTZXAgMTAsIDIwMjUgYXQgMjozM+KAr1BN
IENocmlzdGlhbiBTdGV3YXJ0IDxjaHJpc3RpYW5AYXBlcnR1cmUudXM+IHdyb3RlOgo+Cj4gPiBJ
IHRoaW5rIHlvdXJzIG1pZ2h0IGJlIG1pc3Npbmcgc29tZSBjb25maWcgY2hhbmdlcywgYW55dGhp
bmcgeW91IGRpZCBpbgo+ID4geW91cnMgdGhhdCBJIG1pc3NlZCBpbiBtaW5lPwo+Cj4gV2hhdCBj
b25maWcgY2hhbmdlcz8KCkxpa2UgdGhlIG9uZXMgdG8gcGFja2FnZS9nby9Db25maWcuaW4uaG9z
dC4KCj4KPiBJIHN0aWxsIHByZWZlciB0byBoYXZlIHRoaXMga2luZCBvZiBjb21taXQgc3RydWN0
dXJlIChhcyB3ZSBoYWQgaW4gdGhlIHBhc3QgdG9vKQo+Cj4gLSBhZGQgYm9vdHN0cmFwLXN0YWdl
NAo+IC0gYWRkIGdvMS4yNAo+IC0gYWRkIGdvMS4yNQo+Cj4ganVzdCBiZWNhdXNlIHRoaXMgd2F5
IGlmIHdlIG5lZWQgZ28xLjI0IGZvciBzb21lIHJlYXNvbiwgYSB1c2VyIGNhbgo+IHJldmVydCB0
aGUgZ28xLjI1IGNvbW1pdC4KClNlZW1zIGtpbmRhIHBvaW50bGVzcyBzaW5jZSB0aGVyZSBzaG91
bGRuJ3QgYmUgYW55IHJlYXNvbiB0byB1c2UgZ28xLjI0LApidXQgZG9lc24ndCByZWFsbHkgbWF0
dGVyIHRvIG1lLgoKPiBJZiBwb3NzaWJsZSBsZXQgbWUga25vdyB3aGF0IGNvbmZpZyBjaGFuZ2Vz
IHRoZXJlIHdlcmUuLi4gSSBjb3VsZAo+IHJlc3RydWN0dXJlIHlvdXIgY29tbWl0IHRoaXMgd2F5
IGZvciB5b3UgaWYgeW91IGxpa2UgYXMgd2VsbC4KCklmIHlvdSBzcXVhc2ggeW91ciAzIGNvbW1p
dHMgYW5kIGNvbXBhcmUgdGhhdCBhZ2FpbnN0IG15IHBhdGNoLCBpdApzaG91bGQgYmUgbW9yZSBv
YnZpb3VzIHdoYXQgYWxsIHRob3NlIGNoYW5nZXMgYXJlLgoKPgo+IENocmlzdGlhbgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
