Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48935C3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 19:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8B5C811C3;
	Sat, 20 Jul 2024 19:39:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fufW4fA_t7Jg; Sat, 20 Jul 2024 19:39:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11B70811CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11B70811CA;
	Sat, 20 Jul 2024 19:39:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B5291BF5F8
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 19:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85F0F811CA
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 19:39:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id evXBv2DeiX72 for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 19:39:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=gnijieb@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DAFE0811C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAFE0811C3
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DAFE0811C3
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 19:39:26 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3684407b2deso1375439f8f.1
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 12:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721504365; x=1722109165;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y2Xxczlf7rz5g3WvxKY8J62ffxBsOq04N9lhFVqiXuU=;
 b=akReXxajZ4KGd74UCbE9m2ImXg+cSBMgk3jWkWWsVy0HqGoJojZRXrzp4Pe4V5Q0LF
 8uOTKAZWD6SBfQ4tf21yIxGE5QGhg8/kYoorGjutBJkkyI7NLjvVzaCr43BXwCTqFEzA
 gIEKPR31k8LRFk98VZxlFOxDRUIbVtYDq83qha1cVW5gtW6F/O14DD/GHVfbqgkY1UuM
 p3X/RS28wTkq7YgozWHwkptBoOo4Z2eR/GVPca/XXrYk0fWt5wDOu9iSP2FFUUZkWwk3
 raUxBgieIoVvboj4H+ZMWnjh2J2Zi9ZU80BNkZCJqV90bOpiqiy2x0VOuqDyO6V6NIKD
 lORg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWu/oSAAJ4qWN6CmTjshwOHENOEJW/VMk9NOL8r4etm1I9yVQwhJOqWTfGqbq3TTvpfZGr57txB31rxx8XrlLh998go6j9Vw==
X-Gm-Message-State: AOJu0YyGFvE4fCuLmAMAjilvr2u0kISvKZ5x0OwgwBTLk0HU24kN5UMI
 50uYwO7iNy1Zygy4FwnShIlcl9kvhXNkIaDe3Rp9RN0R7GkqXKN4MHIQyr/NbQ459fAOkD+JU+m
 5ZnutsCqwTO1zulIk2CrX8j2wOQc=
X-Google-Smtp-Source: AGHT+IFvY/jAyqLDa4mBiJNhqovAVrye5vYQh9gVybQZLYVU8nzSaaexr6p7mchu+BZWpxLzrfU4+2U+q+DBMMjN3PA=
X-Received: by 2002:a05:6000:4029:b0:367:9d82:8370 with SMTP id
 ffacd0b85a97d-369bb0a165fmr2195964f8f.45.1721504364313; Sat, 20 Jul 2024
 12:39:24 -0700 (PDT)
MIME-Version: 1.0
References: <CA+h8R2rXC7pFxf4EtUM1ppGjLviduQki4UD1bzZb8_ZByj4JXA@mail.gmail.com>
 <8b4e27a50df0f4c4770eeb7f7edfed5f2c1f8483.camel@gmail.com>
 <87zfqxuxc7.fsf@dell.be.48ers.dk>
 <b335fcb8-5ea2-4ca9-9bf8-a5d62caab290@mind.be>
 <becc07c45d7f9b8fef18ef9c1a22a3f307524bae.camel@gmail.com>
 <87v81jvko4.fsf@dell.be.48ers.dk>
 <CANabuZer5AXD=y-6Qc0y6h5DHB4yNoYdQF5P1w2uRBvtn51d8Q@mail.gmail.com>
 <17002fb1-13c6-4d47-adfd-cbd4b0490673@mind.be>
In-Reply-To: <17002fb1-13c6-4d47-adfd-cbd4b0490673@mind.be>
Date: Sat, 20 Jul 2024 21:39:13 +0200
Message-ID: <CANabuZfTRZwbAyVZ5Ha27Ch5r+nTb6YjFgM2Pu1vC16wi1v4TA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1721504365; x=1722109165; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y2Xxczlf7rz5g3WvxKY8J62ffxBsOq04N9lhFVqiXuU=;
 b=XrtXULm593RkCH6tID2cooPLeDnx1HkrU71CEbsyjeF0f/L5xaPYlRZkBFfkhy/MuI
 qYwhdtTMb/Sg3EAHKpQ/UYzBJHaMu0Zi9m2Icto2sZBJMgHatJ3UQnUoAyPQvz4uAmiL
 DGm6rCkYpId+T9neIs3izIPeshNYLUWY22zluNzOp0/68MjBPtK6VrJLKq6R1oGXt0nL
 rcaC+wwUTGzgFB9T17s4J7+yvrECDBpQw1rUYAxpMK11OXvrdfYlBZrgqMWMTjl8J7F2
 xyvoYCBD9qeLOp58R+gb3RThRLocrMpmkPKhVUXpF288pR6hvEz4m2o0tNEg1Zh/ryYS
 al5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XrtXULm5
Subject: Re: [Buildroot] package/openssh: please backport bump to 9.8p1
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
From: Andreas Hilse via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Hilse <andreas.hilse@googlemail.com>
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpPbiBGcmksIEp1bCAxOSwgMjAyNCBhdCA1OjMy4oCvUE0gQXJub3V0IFZhbmRlY2FwcGVs
bGUgPGFybm91dEBtaW5kLmJlPiB3cm90ZToKPiAgIEkgd291bGQgc2F5LCBpbiB0aGF0IGNhc2Us
IGZpeCB5b3VyIHZ1bG5lcmFiaWxpdHkgc2Nhbm5lci4gV2UgaGF2ZSBkb3plbnMgb2YKPiBwYWNr
YWdlcyB3aGVyZSBDVkVzIGFyZSBwYXRjaGVkLiBTZWUgdGhlIElHTk9SRV9DVkVTIHZhcmlhYmxl
cyBpbiB2YXJpb3VzIHBhY2thZ2VzLgoKSSBrbm93IGFib3V0IHRoYXQsIGJ1dCB0aGUgcHJvYmxl
bSBsaWVzIG5vdCB3aXRoIG91ciB2dWxuZXJhYmlsaXR5CnNjYW5uZXIsIHRoYXQgYWxvbmUgd2Ug
Y2FuIGhhbmRsZS4KVGhlIHByb2JsZW0gaXMgdGhhdCBvdXIgY3VzdG9tZXJzIGNvbmR1Y3QgdGhl
aXIgb3duIHNjYW5zIG9yIGhpcmUgYQozcmQgcGFydHkgdG8gZG8gYmxhY2tib3ggdGVzdHMuIFdo
ZW4gdGhleSBzZWUgb3BlbnNzaCA5LjcgdGhleSB3aWxsCmNvbXBsYWluLgoKUmVnYXJkcywKQW5k
cmVhcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
