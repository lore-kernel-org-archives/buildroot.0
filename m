Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EC7C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 07:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 934EB60D51;
	Tue, 22 Apr 2025 07:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NYx7phpafjVd; Tue, 22 Apr 2025 07:33:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACF9F6079D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACF9F6079D;
	Tue, 22 Apr 2025 07:33:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BB5A1A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 014B46082F
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IgqmKvVP9Kyp for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 07:33:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.181;
 helo=mail-lj1-f181.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A8E146079D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8E146079D
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8E146079D
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:33:10 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-3105ef2a070so47869621fa.2
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 00:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745307188; x=1745911988;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uca6250bmPkyTXHBWfB/9909vG17OFgqbFpvuk/JX0s=;
 b=ZxJfTCVYnQsB4lm1v63k+eA9KX4T1cby4nVGNI9/aP0oUHDWuvkxdp6LXtOPHkFrJC
 QqsRuuoMQnDfgKmXlWfVa/T/WCMoziFpN2emPOFwgwnwkUNWlnkd4inGc+yszA3Ph1u8
 wtES4TQ2t1seuTMsuX3S+NuPZvn6MzJPPawgBpUwN54fFWQuMIvjcXGy2oiejeLPMGLi
 REbTysDRF1MKlWOfgNDhBWboqFaO3cJpyvXbLz+zQPGjRDz2lGMP8cKsvNzwtaPmyc/K
 x5Ssb+WTfC2LS58vpiqc1AwgdhPhRU4cpHNW30X/p+x4s8izQ0hgEhR4zbAb+lUOUdAZ
 ngog==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6jSp9WsVSdKtOr/ttnUhLGiGQX2mNR7eQ1JAul7zgbt1Jx7GPzbQFEm56tWLseOu6T39LqHG7OBc=@buildroot.org
X-Gm-Message-State: AOJu0YzlZODdl2GTA4SRYFoCigaVYtgSvEWdd+mCaazUweiH/qTUsKFT
 xs3XVj1Fa+uX+EuDa+kGw1jo546ZCfYGG377O/DoA6uWsBoLF9Jh0l+AAYZM
X-Gm-Gg: ASbGncur5qdb/NewvtFcpcPjgBo436ZY+sFNt+9zZpq9NBZfYhNLXZnuyNpqmrCd/kJ
 EucbqmPus2tfQrtEZwoWP0cHS+a+UO6TNDKV2Vq/sJNuCQiYOya0BTh1RXahpaUsFJ0Lh/jdWY5
 M3qT8YNWzcZYJU1d3+NNWCD141ynAx4l2r06POWI+wzI9tm6CcPVIg58MN9LYcZ5MP+bl8hshbm
 nTfism85tSBkMiM5hH+9iQxWN/LMCLRt2JxfFILYTVkHX7jCYWSyhE4R96RdUkbQXmW21ejVUNz
 NdylE4mYoy1P6gb/Ra7aNlbNHS0fsALXKvr3VkwQNvVYbr799Nx3I8yybbbFM4Dr0e08GaTl4QK
 /6w==
X-Google-Smtp-Source: AGHT+IG2JVvpvmlkD4Kcy0rUhCfBSZsDw8vPFqlCJ6ieQfbngXpSYtrSuQxGYB8IG19a6aUox/hHzA==
X-Received: by 2002:a05:651c:b08:b0:30b:ef0f:81f1 with SMTP id
 38308e7fff4ca-310905011b5mr38292491fa.20.1745307187329; 
 Tue, 22 Apr 2025 00:33:07 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-31090826cf5sm15353061fa.87.2025.04.22.00.33.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 00:33:07 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-54ac9b3ddf6so4476595e87.1
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 00:33:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXb4bW2Dp00Voey7/ei9sHZELPeUFUyMhZHDuv74hDOiAPLJGvhSGJVtpzHN7JtxHypnp5g26Sobe0=@buildroot.org
X-Received: by 2002:a05:6512:3d8f:b0:54c:348d:19b0 with SMTP id
 2adb3069b0e04-54d6e662198mr2994620e87.44.1745307186841; Tue, 22 Apr 2025
 00:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <Z-QAExADR8rp0Afq@waldemar-brodkorb.de>
 <20250402082625.599501-1-thomas@devoogdt.com>
 <Z-0auN0f7ln-1IJH@waldemar-brodkorb.de>
 <CACXRmJhEJ9RnLpiAjfp+mSZD-okUg8+-hY6zJ-i9Qt_zbNFYOg@mail.gmail.com>
 <Z-2IR5Zbzs7zwT5x@waldemar-brodkorb.de>
 <CACXRmJioVq7PUwBkCPNj0k-47hrJ_vtgVYtzp+_84ZgimDe9CA@mail.gmail.com>
 <20250421233159.792b17e7@windsurf>
In-Reply-To: <20250421233159.792b17e7@windsurf>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Tue, 22 Apr 2025 09:32:55 +0200
X-Gmail-Original-Message-ID: <CACXRmJh1modbu_ODmUs8_iqMUw1tRwr3h4LC8EERgCjTZrsz+A@mail.gmail.com>
X-Gm-Features: ATxdqUGhtuCrzF4Bp4RHsk-jvm3k0b0IdnBkNF1nEjlVZyEr6NB19TCDmb1IDTs
Message-ID: <CACXRmJh1modbu_ODmUs8_iqMUw1tRwr3h4LC8EERgCjTZrsz+A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v2] package/util-linux: bump to 2.41
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKClRoZSBmaXJzdCBpc3N1ZSwKKFJlcG9ydGVkIGhlcmUgaHR0cHM6Ly9naXRo
dWIuY29tL3V0aWwtbGludXgvdXRpbC1saW51eC9pc3N1ZXMvMzUwMSkKCmVycm9yOiBleHBlY3Rl
ZCBpZGVudGlmaWVyIGJlZm9yZSBudW1lcmljIGNvbnN0YW50CiAgIDM1IHwgICBNU19SRE9OTFkg
PSAxLCAgICAgICAgICAgICAgICAvKiBNb3VudCByZWFkLW9ubHkuICAqLwogICAgICB8ICAgXn5+
fn5+fn5+CgpoYXMgYmVlbiBmaXhlZCBieSBpbiB1Q2xpYmMgaW4gY29tbWl0Cmh0dHBzOi8vY2dp
dC51Y2xpYmMtbmcub3JnL2NnaS9jZ2l0L3VjbGliYy1uZy5naXQvY29tbWl0Lz9pZD05NmFmNmRi
M2E0MzBhMjJkNWU4YTQ1ZjZlNzI4NDM2Mjg2NmIzOTgwLgoKVGhlIHNlY29uZCBpc3N1ZSwKKFJl
cG9ydGVkIGhlcmUgaHR0cHM6Ly9naXRodWIuY29tL3V0aWwtbGludXgvdXRpbC1saW51eC9pc3N1
ZXMvMzUwMikKCnN5cy11dGlscy9sc25zLmM6NTgwOjE5OiBlcnJvcjog4oCYU0lPQ0dTS05T4oCZ
IHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbgp0aGlzIGZ1bmN0aW9uKQogIG5zZmQgPSBpb2N0bChz
aywgU0lPQ0dTS05TKTsKICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fgoKaGFzIGJlZW4gZml4
ZWQgaW4gY29tbWl0Cmh0dHBzOi8vZ2l0aHViLmNvbS91dGlsLWxpbnV4L3V0aWwtbGludXgvY29t
bWl0LzEwZWU2NmVkMWIwODU4NmJkZTQyNTgyZTM0MzU1NDE4ZWVmMzNlZjUuCgpJdCBpcyBvbmx5
IGFwcGxpY2FibGUgZm9yIExpbnV4IDwgNC4xMCwgYnV0IEkgd2lsbCB1cGRhdGUgdGhpcyBidW1w
CndpdGggYSBwYXRjaCBmb3IgdGhpcy4KCgpLciwKClRob21hcyBEZXZvb2dkdAoKT3AgbWEgMjEg
YXByIDIwMjUgb20gMjM6MzIgc2NocmVlZiBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMucGV0YXp6
b25pQGJvb3RsaW4uY29tPjoKPgo+IEhlbGxvLAo+Cj4gT24gV2VkLCAyIEFwciAyMDI1IDIyOjI3
OjM5ICswMjAwCj4gVGhvbWFzIERldm9vZ2R0IDx0aG9tYXNAZGV2b29nZHQuY29tPiB3cm90ZToK
Pgo+ID4gU28gdHdvIHRoaW5ncyB0byBmaXguCj4KPiBTbywgSSdtIGdvaW5nIHRvIG1hcmsgdGhp
cyBwYXRjaCBhcyBDaGFuZ2VzIFJlcXVlc3RlZC4gRG8geW91IGludGVuZCB0bwo+IHdvcmsgb24g
c29sdmluZyB0aG9zZSByZW1haW5pbmcgYnVpbGQgaXNzdWVzPwo+Cj4gVGhhbmtzIGEgbG90IQo+
Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290
bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcK
PiBodHRwczovL2Jvb3RsaW4uY29tCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
