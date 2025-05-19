Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E942DC3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 18:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8125440CE2;
	Mon, 19 May 2025 18:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XepnLfDfF61V; Mon, 19 May 2025 18:19:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B04DB40CBD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B04DB40CBD;
	Mon, 19 May 2025 18:19:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3153FE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 18:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22B8A60A8F
 for <buildroot@buildroot.org>; Mon, 19 May 2025 18:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j5_ZvKETSGVp for <buildroot@buildroot.org>;
 Mon, 19 May 2025 18:19:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D4FFC6085B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4FFC6085B
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4FFC6085B
 for <buildroot@buildroot.org>; Mon, 19 May 2025 18:19:53 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-54b166fa41bso7245617e87.0
 for <buildroot@buildroot.org>; Mon, 19 May 2025 11:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747678791; x=1748283591;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8rotQUsqzSFEQHF9F/tzZ5E7+em60aneO/ho1LRtyFU=;
 b=TxBmeGaCnwYCDgn7vd6Kt2nc0LNOjMbHOnQklLf2kFRBxUBXDeqccFrWbTmUv4Btm6
 Z4ldDaBQ/YBH5DV7nGpnNaxoj2d45nPw1WHmHawBjXzXl5DGygSDsNSeK1gwOWajsHro
 sXewfI6iOTmh2AxS4eYoTH7iJnFtmo5Z4kVuNUAmk7HTC44vCIsV1w1DmK8eJqEF09h8
 ++vipwhU2nUGMFr5vAlrEbfZynrUcrdvoYFQlcXCmxip5S6j0vo0pzLI29PCdWkePZ/D
 qV1uUO4N3g5UFSef0lqEo1QAoR4VDklwmSxRdcwUfKDNgtft7500Q6xcKvHVXN2W0P5E
 2u1w==
X-Gm-Message-State: AOJu0YwvOWwLMMpqEFWy8g6g+D8b4lWGof6qZAOpE/CYY+hj4pOovWjm
 tLCcvJumY/iyod/tBiNQM7eneFHuJCBXJXoL16qG9hposgFQSp/FXlxg
X-Gm-Gg: ASbGncv49qT8LkF+K+hgmmfQALjnZOT8j3/B2XP0x1pPV3Hv/vMreIKj5ih1dhvgTDH
 i/H/Q5Qg8xb6SarxVim0/pN3NN+R6N9Fcp9VWOzhcQ45+DtjNgIOHnKFPxbDfnuaajVSDqAW4fF
 qiyS/lc6qDV0hhS7cciCnA1uOqfC5E/2Lcsx/KWUcojlQ4UBykJL+yUA4UQ+pLXDeDWcg2EL1cH
 geI+U5oabyt2WsIL3BwYXlcC9gF+szCEOPQqbOwEQLysJUPkRxRg3w88z2AmSk80RUGybmWG4xv
 oirs9XpH4O/iz6ZP2f/JKgs7bPWvgmBtapGQjoQQ9OgSoq9ewgcjvm4O2aP6lpZogs1yG0K7bEh
 uwTQQ
X-Google-Smtp-Source: AGHT+IEZKECEeABkuG4JuOM58HnDlKI6IKR07mNymI/OOYPO+8sN/igzAj6nLt7bbP4vqFqQSj4jCA==
X-Received: by 2002:a05:6512:428b:b0:550:df52:30f7 with SMTP id
 2adb3069b0e04-550e71952a7mr3687920e87.12.1747678791125; 
 Mon, 19 May 2025 11:19:51 -0700 (PDT)
Received: from tollan (b106.broadband9.quicknet.se. [194.132.233.106])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e701833esm1977539e87.147.2025.05.19.11.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 11:19:49 -0700 (PDT)
From: Mattias =?utf-8?Q?Walstr=C3=B6m?= <lazzer@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Heiko Thiery <heiko.thiery@gmail.com>, Jan
 =?utf-8?Q?Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
In-Reply-To: <20250517113330.1306723e@windsurf>
References: <20250512173506.3179898-1-lazzer@gmail.com>
 <20250512173506.3179898-2-lazzer@gmail.com>
 <20250517113330.1306723e@windsurf>
Date: Mon, 19 May 2025 20:19:47 +0200
Message-ID: <871psk31ks.fsf@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747678791; x=1748283591; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8rotQUsqzSFEQHF9F/tzZ5E7+em60aneO/ho1LRtyFU=;
 b=JCrUt4rvzYxlrK6coUOmhLA2BwRmB3zzaP/RYJub1p+j8TuxVp3vGAqHET9LoKzL6g
 VR9UKd/cAAhi09e1rnVdm8mvv8FvyAUgkwJ9WS2TlT/UYCY7/bIRBgTLR25emPYz+7BB
 /c3ATNQRe5LVPbgyRdu9waPZLzbfjVrA/0NlHsAUG7ewX/Wkc4urWYtPGDd4Vonr+dKw
 SQFOiyQzMuhrJCKCjgbI+ehN+YNPOfas2ifwZRtby/KrCq6iEa3HFBszAElsNWwdKrsw
 VmRv7zb/ueOt4Xgetbdw6N353OX6bYPtxbtY7/xokTRPEx2qywtaCEfwtDOsg/HgUg8g
 1BLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JCrUt4rv
Subject: Re: [Buildroot] [PATCH v3 1/6] package/sysrepo: bump to version
 3.6.11
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

VGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4g
d3JpdGVzOgoKSGkgVGhvbWFzLAoKPiBIZWxsbyBNYXR0aWFzLAo+Cj4gT24gTW9uLCAxMiBNYXkg
MjAyNSAxOTozNTowMSArMDIwMAo+IE1hdHRpYXMgV2Fsc3Ryw7ZtIDxsYXp6ZXJAZ21haWwuY29t
PiB3cm90ZToKPgo+PiBDaGFuZ2Vsb2c6Cj4+ICBzZXZlcmFsIG1vZGVyYXRlIG9wdGltaXphdGlv
bnMgKEBpcmZhbkhhc2xhbmRlZCkKPj4gIHNlc3Npb24gcHVzaCBvcGVyIGRhdGEgY2FjaGUKPj4g
IGxvdHMgb2YgbWlub3IgYnVnZml4ZXMgYW5kIGltcHJvdmVtZW50cwo+Pgo+PiBEZXBlbmRzIG9u
IGxpYnlhbmcgdjMuMTIuMiBodHRwczovL2dpdGh1Yi5jb20vQ0VTTkVUL2xpYnlhbmcvcmVsZWFz
ZXMvdGFnL3YzLjEyLjIKPj4KPj4gU2lnbmVkLW9mZi1ieTogTWF0dGlhcyBXYWxzdHLDtm0gPGxh
enplckBnbWFpbC5jb20+Cj4KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ggc2VyaWVzLiBJIGhhdmUg
YXBwbGllZCBpdCBhbGwsIGNvdXBsZSBvZiBjb21tZW50czoKPgo+IC0gSSBzcXVhc2hlZCB5b3Vy
IHBhdGNoZXMgNC82IGFuZCA1LzYgaW50byB0aGUgbGlibmV0Y29uZjIgdXBkYXRlLAo+ICAgYmVj
YXVzZSBpdCdzIHJlYWxseSBwYXJ0IG9mIHRoZSBzYW1lIGNoYW5nZQpPawo+Cj4gLSBJIG1lc3Nl
ZCB1cDogSSBkaWQgbm90IHJlYWxpemUgeW91ciBoYWQgUEFUQ0ggNi82LCBhbmQgSSBmYWNlZCBh
Cj4gICBuZXRvcGVlcjIgYnVpbGQgZmFpbHVyZSwgc28gSSBidW1wZWQgaXQsIGFuZCBpdCdzIHJp
Z2h0IGFmdGVyIHB1c2hpbmcKPiAgIHRoYXQgSSByZWFsaXplZCB5b3VyIHNlcmllcyBkaWQgY29u
dGFpbiB0aGUgYnVtcAo+Ck5wLiBJdCBlbmRlZCB1cCBpbiB0aGUgY29ycmVjdCB2ZXJzaW9uLCB0
aGF0IGlzIHRoZSBpbXBvcnRhbnQgcGFydC4KCj4gLSBuZXRvcGVlcjIgZG9lc24ndCBidWlsZCB3
aGVuIG1iZWR0bHMgaXMgZW5hYmxlZCBhcyBhIGNyeXB0byBiYWNrZW5kLgo+ICAgVW5mb3J0dW5h
dGVseSwgdGhlcmUncyBubyB3YXkgdG8gdGVsbCBsaWJuZXRjb25mMiB0byBOT1QgdXNlIG1iZWR0
bHMKPiAgIHdoZW4gbm90IGF2YWlsYWJsZS4gQ2FuIHlvdSBsb29rIGludG8gdGhpcywgcmVwcm9k
dWNlIHRoZSBpc3N1ZSAoanVzdAo+ICAgYnVpbGQgd2l0aCBtYmVkdGxzIGVuYWJsZWQpIGFuZCB3
b3JrIHdpdGggdXBzdHJlYW0gdG8gZml4IHRoZSBpc3N1ZT8KPgpJIHdpbGwgc2VlIHdoYXQgaSBj
YW4gZG8uCgpCUgogTWF0dGlhcwo+IFRoYW5rcyBhIGxvdCEKPgo+IFRob21hcwo+IC0tCj4gVGhv
bWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4
IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNv
bQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVp
bGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
