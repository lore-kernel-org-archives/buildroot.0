Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720E8C3600C
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 07:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CEC040DF4;
	Thu,  3 Apr 2025 07:52:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r1lVLzXlczfM; Thu,  3 Apr 2025 07:52:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5921D40DF5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5921D40DF5;
	Thu,  3 Apr 2025 07:52:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FBD01F4
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 07:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E835400AB
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 07:52:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oA3mUzh5DFIB for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 07:52:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 245E040291
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 245E040291
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 245E040291
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 07:52:28 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-549b159c84cso724977e87.3
 for <buildroot@buildroot.org>; Thu, 03 Apr 2025 00:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743666747; x=1744271547;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zFxQUSamf0lv4AD8yo2fzwSLb8hV9oYSDuhszbQpdSw=;
 b=MbQzdqSMlu6sFd81xugy9p2Y4APBm9T2CcZz29e/WdlXDKNtIwAC56I8kWsSR3LM8T
 uaq1qDe/NqQ3aZ9+HeOFpnZzFGZJxvZ3KaQoWpj2cbxJ30Ydf1yqVf5P9BWO1GMXEK5i
 jo0QUEP+WcvqpI3ppu9pzCBZfLZWT0eJce9gZc+wXKV3MIevcBjdhZrUmAz9rXGA+eoM
 U4rPmxXAkLus2LLJWKE9DPdUIJOQEM09BYPnq1458CJdUD6RegHjNMXJViOsqnBJ7BDz
 3lfTKynvV0yT4FQnUjNlxxKCLKOSG57giT6kHEVugz37xldeqbh2sQNiZzeRLd+R4qF1
 ltLg==
X-Gm-Message-State: AOJu0YyEk2wwW96wZbo31bJRNVRdqsnArJmyS6ZULwB0NZ9duZzwsjET
 zYL+i0e2nDTH+Nm4dZRq0RTFmOQwmEDZBLQYYOQVwvfuyCVB+Pd4Cx/EwC7D9SFaBou5lig3P1T
 kj8T6se0AovR9HP54XB+N8jdv4F/6NQ==
X-Gm-Gg: ASbGnctRqWNfeA4qd4RX6cot6LkWr7CSrhkuN3AWiLx5uf1CEu7svTsJemhiFdlZVd6
 4NSRZ4JqmrhSZzntpDbZQxKYqvfAjMgvRP7srcD/uwXYEEuVTwJFKtLHWYrH2K4/EiRlswGsycr
 GfuwrJxyAueG+j2Z55G+gpJQQx//4=
X-Google-Smtp-Source: AGHT+IGViXZaKhgCgjsZp+cEcEqczUQnj2Em4O88YEWQOuXhqBKx217Gx1T3WtnG6DaDQY5YTHbTBXDUdLiUhOtLK5U=
X-Received: by 2002:a2e:914b:0:b0:30b:b9e4:13b0 with SMTP id
 38308e7fff4ca-30f022dbb61mr3460811fa.12.1743666746446; Thu, 03 Apr 2025
 00:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250326080506.3467586-1-yegorslists@googlemail.com>
 <20250403094430.08d9b2f1@windsurf>
In-Reply-To: <20250403094430.08d9b2f1@windsurf>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 3 Apr 2025 09:53:52 +0200
X-Gm-Features: ATxdqUE5O2Ln4CUg1pCWqPej3RE4ciwyu6fGBDmOphV3FbjOgVqTTx6ocnuHwSw
Message-ID: <CAGm1_ksE6xFtRustant2MyiSpa3moyv1L_HL0W17UNv6peZ2tQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1743666747; x=1744271547; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zFxQUSamf0lv4AD8yo2fzwSLb8hV9oYSDuhszbQpdSw=;
 b=cI3WZ4WpjbAvprLs4xppldtqL/u9EmeoqS0/8eo6e6EnxrFrEM3u6ou+sZ5IUCB1hg
 nUaDCgUOiDUXPfGcKwmNq6On+ov4ivJAyDwMlGcggs3WIjODS9ARJLMKxDEjXrfjWvJf
 y5iYUF5qFaqwxY8+WGSVTM33YoC2gTf1ZY0MKkBqu+Z+wDZhE/9RedEL3049lCioE73h
 PN2/zkuVXekjySgRmaPECFJIEpeIuWsNDXCWNcclEzBaK+LtdyjjCNNuiIpjJoUVkIaW
 Up77a0D93KufU2X0pQpoD3PTQ2WRxise2cjfcgtoJiPlG9W12euyrKQw47WZDzhordgM
 dqeg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cI3WZ4Wp
Subject: Re: [Buildroot] [PATCH] package/ncftp: bump to version 3.2.9
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

SGkgVGhvbWFzLAoKT24gVGh1LCBBcHIgMywgMjAyNSBhdCA5OjQ04oCvQU0gVGhvbWFzIFBldGF6
em9uaQo8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbyBZZWdv
ciwKPgo+IE9uIFdlZCwgMjYgTWFyIDIwMjUgMDk6MDU6MDYgKzAxMDAKPiB5ZWdvcnNsaXN0c0Bn
b29nbGVtYWlsLmNvbSB3cm90ZToKPgo+ID4gRnJvbTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xp
c3RzQGdvb2dsZW1haWwuY29tPgo+ID4KPiA+IFJlbW92ZSB1cHN0cmVhbWVkIHBhdGNoZXMuCj4g
Pgo+ID4gQXV0b3JlY29uZiBpcyBicm9rZW4uIEhlbmNlLCB1c2UgdGhlIGNvbmZpZ3VyZSBzY3Jp
cHQgZGlyZWN0bHkuCj4gPgo+ID4gRml4ZXM6Cj4gPiBodHRwczovL2F1dG9idWlsZC5idWlsZHJv
b3Qub3JnL3Jlc3VsdHMvNjBjM2RiZTAyYWYzNTRmZjk4MjAyNThmZmQwMGVlYzA4ODExNGQ2OS8K
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xl
bWFpbC5jb20+Cj4KPiBUaGlzIHNvbWVob3cgYnJlYWtzIHRoZSBidWlsZCwgYnV0IG5vdCB5b3Vy
IGZhdWx0OiBpdCBsb29rcyBsaWtlCj4gdXBzdHJlYW0gY2hhbmdlZCB0aGUgdGFyYmFsbC4gSW5k
ZWVkLCBvbiBzb3VyY2VzLmJ1aWxkcm9vdC5uZXQgd2Uga25vdwo+IGhhdmUgaW4gY2FjaGUgdGhl
IHRhcmJhbGwgdGhhdCBtYXRjaGVzIHRoZSBoYXNoIHlvdSBoYXZlIHN1Ym1pdHRlZCBpbgo+IHRo
aXMgcGF0Y2guIEJ1dCB0aGUgdGFyYmFsbCBhdmFpbGFibGUgb24gdGhlIG9mZmljaWFsIHdlYnNp
dGUgbm93IGhhcyBhCj4gZGlmZmVyZW50IGhhc2guCj4KPiBTZWUgdGhlIGJ1aWxkIGZhaWx1cmUg
YXQ6Cj4KPiAgIGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9kMTgvZDE4
MTkxZGJiMWZiOGQ3ZmU2NGVlNTQ3Y2E5Yjk3YzEzMzQzNGVhMi9idWlsZC1lbmQubG9nCj4KPiBD
b3VsZCB5b3UgaGF2ZSBhIGxvb2sgcGVyaGFwcz8KCkkgaGF2ZSBhbHNvIG5vdGljZWQgdGhpcyBj
aGFuZ2UgYW5kIGFscmVhZHkgcmVwb3J0ZWQgdG8gdGhlIG5jZnRwCm1haW50YWluZXIuIEhlIGhh
cyBqdXN0IGludHJvZHVjZWQgYSBzbWFsbCBjaGFuZ2Ugd2l0aG91dCBidW1waW5nIHRoZQp2ZXJz
aW9uLgoKVGhlcmUgaXMgYWxzbyBhbm90aGVyIGlzc3VlIHdpdGggdGhlIG5jZnRwYm9va21hcmtz
IGJpbmFyeSB0aGF0IHJlbGllcwpvbiBjdXJzZXMgaW5zdGVhZCBvZiBuY3Vyc2VzLiBJIGhhdmUg
YWxzbyByZXBvcnRlZCB0aGlzLiBMZXQncyB3YWl0CnRpbGwgTW9uL1R1ZSBhbmQgaWYgSSBkb24n
dCBnZXQgYW4gYW5zd2VyIGZyb20gaGltLCBJJ2xsIHNlbmQgYSBwYXRjaApmaXhpbmcgY2hlY2tz
dW0gYW5kIGRpc2FibGluZyBuY2Z0cGJvb2ttYXJrcyBiaW5hcnkuCgpCZXN0IHJlZ2FyZHMsClll
Z29yCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4g
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPiBodHRw
czovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
