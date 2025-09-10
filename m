Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F23CA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 546F5614D4;
	Wed, 10 Sep 2025 21:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RkB5F9ef7daS; Wed, 10 Sep 2025 21:53:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5A246126C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5A246126C;
	Wed, 10 Sep 2025 21:53:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F22CE234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E449360662
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rnG0lchV2yzN for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:53:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EC3AE6126C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC3AE6126C
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC3AE6126C
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:53:30 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-56088927dcbso1209e87.3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 14:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757541208; x=1758146008;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qwE5QD9ROI1+wxLf05dr4Y+TvLDtCO2hb2XJWwSaeOs=;
 b=RIV43x8SphZb/K8cOrTu65fSAwSWkjz6nJHUFt1UOTOKcJp0V8owhggmOo6r0YUbZg
 HU9vn7/9WrxTzWeWGP3OOJyAPql5Npuzqck/EA0jEw6NknIdi5RRCm/nCq9FQrnb+nqr
 zr/kAG3kgFcrGMNoUE0u5ZLRgbZK0fQ6u+L8sRfv+ENGoPDsSBYqBbGBSGpot11VfRLV
 V9Vm8jl9VunS+Uq7mTtNJOc+PATIjAYet46Bo72waWoJ62xajFmv3Yy1d8L3SSmp62Ox
 Y2UZd2zP1PGw75hP+zyVwsflrGoRDc9C9OO8qz3px6mCThuItwoV5gcUjIuG7jI+TCuO
 19rg==
X-Gm-Message-State: AOJu0YyTGdGJZ2lKk9AQfKxmu+cdfEPTH6z3lXCdqwB0iRbB+r5F9w43
 eFfeQXpOTqjhZ30gaianks0BehHR4g8ika63gHlCsmYBNpLDnu3tbf3VVnXlW1QDOGfOvXJjuGN
 5C9gZBzpyRw==
X-Gm-Gg: ASbGncvkhhbH6gPs3EwXO9SM56w2Ur865m2HNK39RCVpdGRjGLJM2hmuXan9mnRG55A
 OkC+77QbtNy7PZqyDgpcC6UIXX2zKmuvuufjVqWa4bUAu5KpCnkM6RnfKpZZg6APWyVlU6NaeMq
 lXmN+TeWsSg1woz2zQNEe341eP6Y8xL7paHI+5/G8WKxYqhmpnHqk6njA+zaxfI6Qr5h0xYjMwj
 FKEg5Kw0b7aCdX97GRVdr9bKJOzNpR46YJoo5ADPU0Xk9wFRxOopN1JhpMWJqDvdgjy1tFHZl2a
 JdE0V/OCMf2ajShuqZE0TJQGf04L/v8zcOa/GUxqajGv1aLsMqtkjqWtwxPQSIFCQJW2qbhpASQ
 qoI91PtfNCx5BXqTRm+RxhweWrdLPlZ4Pd4Q8sTSggJCzSxF549zN4igPaXXggOTSPg==
X-Google-Smtp-Source: AGHT+IHQghLq6ksJBM31J/lon0Sh51XsRX1GcQB8LGFniV/E5R9sBWF+v0qOEDSqffWRrbBGNzYj+g==
X-Received: by 2002:a05:6512:3d08:b0:55f:6391:a34b with SMTP id
 2adb3069b0e04-56261219ca9mr5855526e87.36.1757541208351; 
 Wed, 10 Sep 2025 14:53:28 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e25f1b831sm16701e87.150.2025.09.10.14.53.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 14:53:27 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-336d3e4df3eso807491fa.0
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 14:53:27 -0700 (PDT)
X-Received: by 2002:a05:651c:b12:b0:336:dd88:69e0 with SMTP id
 38308e7fff4ca-33b57c39f8cmr53137841fa.29.1757541207419; Wed, 10 Sep 2025
 14:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250910183458.1288165-1-james.hilliard1@gmail.com>
 <CA+h8R2ozbY7zf0=x+gP=bgruLYOK7qW1Ex5Sa0x_h_gaqqHrwg@mail.gmail.com>
 <CADvTj4pVPa=j0BrhiJMoiYBmzq_uXbUtUw-xEqdNoWUCkam+VQ@mail.gmail.com>
In-Reply-To: <CADvTj4pVPa=j0BrhiJMoiYBmzq_uXbUtUw-xEqdNoWUCkam+VQ@mail.gmail.com>
Date: Wed, 10 Sep 2025 14:53:16 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rhgRvEegJ4a7MZX+iKqqdswN6xRxds0rPu12eh50jvSQ@mail.gmail.com>
X-Gm-Features: Ac12FXxekR6jOVW2ouvZaIqq4wUxzgiR43WYEV_yfOp6eu9YPH3VTEB6dDZZ9l8
Message-ID: <CA+h8R2rhgRvEegJ4a7MZX+iKqqdswN6xRxds0rPu12eh50jvSQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1757541208; x=1758146008; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qwE5QD9ROI1+wxLf05dr4Y+TvLDtCO2hb2XJWwSaeOs=;
 b=Uli+iK2wL6+b5QaQNrSIAW/9WQJa2wvwGu1El+RkEQRuRPZNMe4TobB0LDGIpzE/Fh
 MMMBtVmvp3wigLswOFDyTQjUtXKPmz8ky0Jp7qfSKLI9L0OmCLJRh2tvmI34MVJ4pa/i
 RS7Ha28KFeuLNV3bq0TmP8BoJE1Xi2TQhf0mSfTkDxXqUKDceqknSo9DXUu0qTTizDzP
 oPcTtHnwBWv9YWqu4yTxZ/qZMK5blxxy1NcDoo48fHFGnNV94dlqxuOaj3mWPB/631Gi
 APai5jeVGjZa9qolbOMSOeFvo1Ukls9W9iiagnH5WRQw77QxFBPqAVXRmomcVN6nBzx9
 5+cQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=Uli+iK2w
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsCgpPbiBXZWQsIFNlcCAxMCwgMjAyNSBhdCAyOjE34oCvUE0gSmFtZXMgSGlsbGlh
cmQKPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBTZXAgMTAs
IDIwMjUgYXQgMjozM+KAr1BNIENocmlzdGlhbiBTdGV3YXJ0IDxjaHJpc3RpYW5AYXBlcnR1cmUu
dXM+IHdyb3RlOgoKPiBJIHRoaW5rIHlvdXJzIG1pZ2h0IGJlIG1pc3Npbmcgc29tZSBjb25maWcg
Y2hhbmdlcywgYW55dGhpbmcgeW91IGRpZCBpbgo+IHlvdXJzIHRoYXQgSSBtaXNzZWQgaW4gbWlu
ZT8KCldoYXQgY29uZmlnIGNoYW5nZXM/CgpJIHN0aWxsIHByZWZlciB0byBoYXZlIHRoaXMga2lu
ZCBvZiBjb21taXQgc3RydWN0dXJlIChhcyB3ZSBoYWQgaW4gdGhlIHBhc3QgdG9vKQoKLSBhZGQg
Ym9vdHN0cmFwLXN0YWdlNAotIGFkZCBnbzEuMjQKLSBhZGQgZ28xLjI1CgpqdXN0IGJlY2F1c2Ug
dGhpcyB3YXkgaWYgd2UgbmVlZCBnbzEuMjQgZm9yIHNvbWUgcmVhc29uLCBhIHVzZXIgY2FuCnJl
dmVydCB0aGUgZ28xLjI1IGNvbW1pdC4KCklmIHBvc3NpYmxlIGxldCBtZSBrbm93IHdoYXQgY29u
ZmlnIGNoYW5nZXMgdGhlcmUgd2VyZS4uLiBJIGNvdWxkCnJlc3RydWN0dXJlIHlvdXIgY29tbWl0
IHRoaXMgd2F5IGZvciB5b3UgaWYgeW91IGxpa2UgYXMgd2VsbC4KCkNocmlzdGlhbgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
