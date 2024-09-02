Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF550CD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 19:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5558980EAD;
	Mon,  2 Sep 2024 19:57:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZluBlSs9eFi2; Mon,  2 Sep 2024 19:57:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6154D80EB3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6154D80EB3;
	Mon,  2 Sep 2024 19:57:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A47761BF20B
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 19:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92A46605E5
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 19:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 12aaGsMv_qgd for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 19:57:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7D0D3605AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D0D3605AF
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D0D3605AF
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 19:57:22 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42bbc8d9455so4855535e9.2
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 12:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725307040; x=1725911840;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LmQCUj83M+tR9BkkLnwkYJoDOGAeeWqKnLjHy4YtR4g=;
 b=kerXauCxHgxSvd+ROQC0sxVKT8ImWD/T033igqruwfCa/vRsVN4R64KyO3hSVvprfZ
 jyVN8b22A2g0UWhvysQE808mPERkR2SYaMjGmXo0DgbVY6BvC7OC7ivpK077cxwi4PUB
 XxKZfCZbmHPzazECoLuFXkbVclhfFLjzX67RwSRa4n6xymNjL+/30/eH5eOIerqp6XYW
 WDRpXbGGRVHNIoAA5QAnmsUnE+L1OQlbcdMt6y/ANA2Hnw4uBzKe+nm/GO26iIOyKsL1
 fbnk1bIASBt/nQsTY/wUyrMwa4DuMC22iVjeTy1Z6R01PkW5JEBzyXLhLf+i5LgHKl0Q
 UoTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcHmHQ4Bc9za6HD8wi/hEW1sonxM2tpKpPxOOLxZWCEIRwo0u77xHC+Pcvjf2i56a1cQ6ySyrqTes=@buildroot.org
X-Gm-Message-State: AOJu0Yw1A8i6IjkdfNO3KXP4Km2nGyYDdTrO6+pb/qfpq7QkImuzZWly
 25G5hPgtwe8vtXx/WOom5dA/ty7GK0PqIolHSrYLqD02V7fFZKW0OGGK0hU6b+0=
X-Google-Smtp-Source: AGHT+IGL8Vmzy2JxwpgBk7+fcQaWOJV7fIkz4OY94ItPdKcGxwdTeJhKH8z1VTFJQKaseRSb8Bd7qw==
X-Received: by 2002:a05:6000:1f81:b0:374:d258:90d6 with SMTP id
 ffacd0b85a97d-374d2589286mr649098f8f.0.1725307039883; 
 Mon, 02 Sep 2024 12:57:19 -0700 (PDT)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749efb37efsm12283619f8f.109.2024.09.02.12.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 12:57:19 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 02 Sep 2024 21:57:18 +0200
Message-Id: <D3W2AVQ9O5VG.7X7M72F0PVHA@gmail.com>
To: "Niklas Cassel" <Niklas.Cassel@wdc.com>, =?utf-8?q?Ga=C3=ABl_PORTAY?=
 <gael.portay@rtone.fr>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20240412140945.1626579-1-gael.portay@rtone.fr>
 <20240412140945.1626579-2-gael.portay@rtone.fr>
 <ZtG5EnLkVJ1EMCTl@ryzen.lan>
In-Reply-To: <ZtG5EnLkVJ1EMCTl@ryzen.lan>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725307040; x=1725911840; darn=buildroot.org;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LmQCUj83M+tR9BkkLnwkYJoDOGAeeWqKnLjHy4YtR4g=;
 b=ndypzXVfMLktxDiOaTV1aLTCJx9Hln2czN+AmHcPsxbmA8CYOKgU3XZtlpEFElBgN5
 nl7p9/gaxnw0IwjQDmt/mltEqa0NbHCkwkgOSMAsqqr7z1mOa1zf+I17d9bPtDdFi48M
 KpN96v6hMOHpOlDZIklk/d6hQpnR0dbkyQQgcjycTQZrHSop/mMqs3yFqZlZ4dr269lw
 BVpXncnnlMSk2uUdyExg1RJYkNl5BDe56FaGQUCKvaqHbLxk5U8B27F3c5kwmApa+uaq
 txBP/8tgo3jNeHwn5Iqlfsmm8c60e924sjXtFawwk6Kk1dVIUlc04Jl0HiFOe68y3+kq
 SKfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ndypzXVf
Subject: Re: [Buildroot] [RFC PATCH 1/2] linux: install in-tree device-tree
 blob overlays
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
Cc: Julien Grossholtz <julien.grossholtz@openest.io>,
 Michael Walle <michael@walle.cc>, Damien Le Moal <dlemoal@kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTmlrbGFzLAoKT24gRnJpIEF1ZyAzMCwgMjAyNCBhdCAyOjIwIFBNIENFU1QsIE5pa2xh
cyBDYXNzZWwgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiA+ICtjb25maWcgQlIyX0xJTlVYX0tFUk5F
TF9JTlRSRUVfRFRTX09WRVJMQVlfTkFNRVMKPiA+ICsJc3RyaW5nICJJbi10cmVlIERldmljZSBU
cmVlIFNvdXJjZSBPdmVybGF5IGZpbGUgbmFtZXMiCj4gPiArCWRlcGVuZHMgb24gQlIyX0xJTlVY
X0tFUk5FTF9EVEJfT1ZFUkxBWV9TVVBQT1JUCj4gPiArCWhlbHAKPiA+ICsJICBOYW1lIG9mIGlu
LXRyZWUgZGV2aWNlIHRyZWUgc291cmNlIGZpbGUsIHdpdGhvdXQKPiA+ICsJICB0aGUgdHJhaWxp
bmcgLW92ZXJsYXkuZHRzLiBZb3UgY2FuIHByb3ZpZGUgYSBsaXN0IG9mCj4gPiArCSAgZHRzIGZp
bGVzIHRvIGJ1aWxkLCBzZXBhcmF0ZWQgYnkgc3BhY2VzLgo+Cj4gSSBkbyBub3QgbGlrZSB0aGF0
IHlvdSBhc3N1bWUgdGhhdCB0aGUgRFQgb3ZlcmxheSBoYXMgYSAtb3ZlcmxheS5kdHMgc3VmZml4
LAo+IHRoYXQgc2VlbXMgdG8gYmUgc29tZXRoaW5nIHNwZWNpZmljIGZvciB0aGUgcmFzcGJlcnJ5
IHBpIGRvd25zdHJlYW0ga2VybmVsLgo+Cj4gTW9zdCBkZXZpY2UgdHJlZSBvdmVybGF5cyBpbiB0
aGUgdXBzdHJlYW0ga2VybmVsIHNpbXBseSBoYXZlIGEgLmR0c28gc3VmZml4Ogo+IGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4Lmdp
dC9jb21taXQvP2lkPTQwNjU4NTM0NzU2ZjgzNjllOTNiODRmYTc1YzIwYmRlNjUyOGNiODIKPgo+
IFNvIGl0IHdvdWxkIGJlIG5pY2UgaWYgeW91ciBwYXRjaCBzdXBwb3J0ZWQgdGhhdCBhcyB3ZWxs
Lgo+CgpUaGFuayB5b3UgdmVyeSBtdWNoIHRvIGxldCBtZSBrbm93IGFib3V0IHRoYXQhIEkgaGF2
ZSBtaXNzZWQgaXQKZW50aXJlbHkuCgpJIGJhc2VkIG15IHdvcmsgb24gbGludXggNS4xNSAocmFz
cGJlcnJ5cGkpLCB0aGF0IG1heSBleHBsYWluLgoKSG93ZXZlciwgSSBmaWd1cmVkIG91dCB0aGUg
b3V0LW9mLXRyZWUgYnVpbHQgaXMgYnJva2VuLCBmYWNlcGFsbS4KCkkgd2lsbCBwb3N0IGEgdjEg
d2l0aCB0aGUgZml4LgoKPiBBbHNvIHNlZSB0aGlzIG90aGVyIHByb3Bvc2FsIGZyb20gTWljaGFl
bCBXYWxsZToKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvMjAyNDAyMTMxNTQ4
NDcuOTE0MDY4LTEtbWljaGFlbEB3YWxsZS5jYy8KPgoKSSB3aWxsIGhhdmUgYSBsb29rIGF0IGl0
IGxhdGVyLCB0aGFua3MuCgo+IEtpbmQgcmVnYXJkcywKPiBOaWtsYXMKCktpbmQgUmVnYXJkcywK
R2HDq2wKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
