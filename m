Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA1DC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 17:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 882D3810BE;
	Sun, 18 May 2025 17:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lAdxyc3vcgDl; Sun, 18 May 2025 17:53:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD57A810DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD57A810DA;
	Sun, 18 May 2025 17:53:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BBCFD1BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1E576064D
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:53:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w-uSIanWQ5sS for <buildroot@buildroot.org>;
 Sun, 18 May 2025 17:53:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e35; helo=mail-vs1-xe35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BE48960617
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE48960617
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE48960617
 for <buildroot@uclibc.org>; Sun, 18 May 2025 17:53:05 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id
 ada2fe7eead31-4e1441fe519so1470870137.0
 for <buildroot@uclibc.org>; Sun, 18 May 2025 10:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747590784; x=1748195584;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oNtBjv8c2+iY2n6EFb1ExlNQ7ukaxsu2SeMMAHc4H0o=;
 b=HkO4PKrV/OS2hhYH2qmVNyBwRl2e2H5OCbB/S5admPqXebT+Ib1YpEcVH6YRG2i0jE
 6dOi9to2cx9X0GSdq57nXdGSLAJa1dFMgzKB3DCopXIFbfzu9dRPtm7CwH6Vs9dh08aM
 kLjdS/bizA3VE/gJzYeux7/299XwDNQAf7/C5hR8IOBIUZq4Rayz3Xu2UBsHv/zGJQPA
 3AHQKNxjlssuUVZ4AJUPOYL0pUV8KWKizGxSH1UVxQp98jAjGkNokQf89gS+7Jw0LWBp
 Cgw7SS1bI72wLAnsiTtguuYjb4u55K8WunvKFdfq5XGsngvEKFcb2j+0oVVuNlTHUyr1
 bYnA==
X-Gm-Message-State: AOJu0YwYiUvhoY3uQKjQtR1EY82VTz0xTADWwdNOTMhx6iBLfNfhRNv5
 Gfg9gZIs7GCrLPyGsiOoy5HPT6s6MO+x6g0+6EWyuwkOlYQXpH2BRpLe1lZ1NH1ZGLFyq2b7jZt
 a2paIY60NO2OXiPpqGowuiUJd9/QSJjBcHTv9Sts=
X-Gm-Gg: ASbGncuXmq4pXAuDmsqFz6Xea5qbep/pxO/wOFCpTd6IvBE3f6ZDodtxr5MigvssfxP
 QlXlaKnNYY6MG/bh1mgRxMEvV2f5Trsan4NKmLUPzJfG3s9AhST32K61SFIbkzSDbC8Pd/gV6X5
 bCLj4kGi7Yw4/D/4ay2QkDLSY6ECFy7smn9g==
X-Google-Smtp-Source: AGHT+IEXQJupc55253TbprNX9Wl6d/+BHcGHQjaSyDK25D6MEiH/ANTPvPcElG8BXJF2xJxP+7iwkyaIpJbAvfuWdMs=
X-Received: by 2002:a05:6102:ccb:b0:4df:9281:5ec3 with SMTP id
 ada2fe7eead31-4dfc1147f95mr9604293137.2.1747590784228; Sun, 18 May 2025
 10:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250517221131.4172735-1-james.hilliard1__8633.93173074059$1747519921$gmane$org@gmail.com>
 <pan$a8ca8$fe06074d$53116892$ab6998ba@ID-313208.user.individual.net>
In-Reply-To: <pan$a8ca8$fe06074d$53116892$ab6998ba@ID-313208.user.individual.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 18 May 2025 11:52:45 -0600
X-Gm-Features: AX0GCFulaN6tzJ0aiP-YIFr6sqb4HNDafmCdjSpl12Y0QM8MLUaVDZOZT5rbYMY
Message-ID: <CADvTj4rZmqvv_3gsiqP2v5ka290pNP4kx52e81F3c7+=XdO6Pg@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@uclibc.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747590784; x=1748195584; darn=uclibc.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oNtBjv8c2+iY2n6EFb1ExlNQ7ukaxsu2SeMMAHc4H0o=;
 b=TX0jWU4yYdLPdQRPto32U6K7GnQ3ptZkDC63Mc/id9o8wOd79PAwaiX/chpnfJomSK
 mwRGVilTjFrcQtKpfI+3Uxj0HEBj2M1rykqQmAlp/XpPb4lr1/8mJeOEjcBBzhGTtMCk
 022BOlvMzCKa0RISn99TuLTIBhsWjNwbBUQkFPvY0eg6kXBC9ygpK6UXuHO03aRcgM58
 L+7AWUkGbjmijQtskylavGhvqWO0Pg1BpSwA7B/ft3XPFnl4JQSmb/LysuVYJaI+BlkC
 LOZbGIo2UVvGnxFqjyJHSBImMvPHDxztdif5P87S1bb0n0jxFZPMGanki0eKX9RtodiI
 Pljw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TX0jWU4y
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: fix build with
 gcc 15
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

T24gU3VuLCBNYXkgMTgsIDIwMjUgYXQgMjoxOOKAr0FNIEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhs
cy5uZXQ+IHdyb3RlOgo+Cj4gQW0gU2F0LCAxNyBNYXkgMjAyNSAxNjoxMTozMSAtMDYwMCBzY2hy
aWViIEphbWVzIEhpbGxpYXJkOgo+Cj4gPiBUaGUgbGx2bSBwcm9qZWN0IG5vIGxvbmdlciBtYWlu
dGFpbnMgdGhlIGxsdm0gMTUgYnJhbmNoLgo+Cj4gSGkgSmFtZXMsCj4KPiBpbnN0ZWFkIG9mIHBh
dGNoaW5nIGxsdm0gMTUgSSBwcm9wb3NlIHRvIGZvY3VzIG9uIGEgdmVyc2lvbiBidW1wIGFuZCBn
ZXQKPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L2xpc3Qv
P3Nlcmllcz00NTcyMzkgcmVhZHkKPiB0byBiZSBjb21taXR0ZWQuIFRoaXMgcGF0Y2ggc2VyaWVz
IGZpeGVkIHRoZSBnY2MgMTUgYnVpbGQgb2YgbGx2bSAmIGNvLgo+IGhlcmUuCgpZZWFoLCB0aGF0
IHdvdWxkIGJlIGlkZWFsLCBJIGZpZ3VyZWQgSSB3b3VsZCBzZW5kIGEgaG90Zml4IGZvciBsbHZt
IDE1IHNpbmNlCml0IHdhcyBwcmV0dHkgdHJpdmlhbCB0byBmaXggdGhlIGdjYyAxNSBidWlsZCBp
c3N1ZSBpZiBnZXR0aW5nIHRoYXQgbWVyZ2VkIHdhcwpnb2luZyB0byB0YWtlIGEgd2hpbGUuCgo+
Cj4gTWVzYTNkJ3MgY3VycmVudCB2ZXJzaW9uIDI1LjEuMCByZXF1aXJlcyBsbHZtID49IDE4IGZv
ciBhbGwgQU1EIGRyaXZlcnMsCj4gdGhlIG91dGRhdGVkIGxsdm0gdmVyc2lvbiBpbiBidWlsZHJv
b3QgdGhlcmVmb3JlIGJsb2NrcyB0aGUgbWVzYTNkIGJ1bXAKPiBhdG06IGh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9jb21taXQvCj4gODIwNDdmYTgyZjFiYmJiZDRm
MWE5YjA1YzAzNGY3OWEwMGQ4NWUzMQo+Cj4gUmVnYXJkcywgQmVybmQKPgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
