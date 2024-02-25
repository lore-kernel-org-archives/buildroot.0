Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73922C54798
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 16:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BD526075D;
	Sun, 25 Feb 2024 16:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xjIjKpOOa0dY; Sun, 25 Feb 2024 16:58:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 335E160765
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 335E160765;
	Sun, 25 Feb 2024 16:58:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 28E471BF36A
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 16:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 229B040112
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 16:58:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K9Jlcs6-gTka for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 16:58:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D68A1400CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D68A1400CB
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D68A1400CB
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 16:58:14 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d2770e44d0so21556591fa.2
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 08:58:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708880292; x=1709485092;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kEhgE9V4ObTdNbJMJBuTi1ngtNBgGGA6s0lQKQY4MdM=;
 b=KJ02kBKZkoHO6atFPx4XRkOEKv+4MIKy7Pto2/zYlLRhtLUHQOCc1F/zxdUtHie863
 Vru+o2r2A/XY3rldad3khvF9rqAKA8CcIwTZmt7RIHkGCvwVRa/riMk4923/wTdtM/ad
 0n/2+su5kVaezA+o8wuCNNV0dr7xUFC/Eou6axLj3gQu83lszC3ALKfYyUO0Eh4GLwkr
 wQH0B2vbs1yGx2nPx53Lp1nPUEF9B4gj7K6Ue2QsAq08+42vATqDo2zKRWgm0pxGABcB
 i4keMo7rCAJt/Vm5tOfE4wbDq2H+MDoux2Jo+PAd6hrFZnOSvyh/slzSOsnjL7+F/x88
 AAlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7M89IUglqwO9FAU39TgD2PdhEm5Pm1vAFEyJL2GkaP3LFyzRc3Cb3a0oFqry36F+q5U9AfTRQqXX0PCWz9J7zdsOVo5R+4g==
X-Gm-Message-State: AOJu0YyBJdnjRKgrrml6epJlUnY0MQej5rkkrGDnjxEyvHjdpq5dFCb6
 OV17D48XoEansw36fZmCUA0A4woaREXZnlRfkZ1usY5eY6LZ/uhBnCOwdO+tclswltG8dooGnj2
 W
X-Google-Smtp-Source: AGHT+IHEwwUpUCVSQ4pA8UczPQvOi4n+0DAtoGhqd9hq/x1650/DmG6OPPQXRNd//S4t4f5xt1NBHg==
X-Received: by 2002:a05:6512:310f:b0:512:f71b:c4d0 with SMTP id
 n15-20020a056512310f00b00512f71bc4d0mr1280950lfb.48.1708880292406; 
 Sun, 25 Feb 2024 08:58:12 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a195511000000b00511a8269473sm563093lfe.82.2024.02.25.08.58.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Feb 2024 08:58:12 -0800 (PST)
Message-ID: <6de87cae-230d-4a3e-b854-0e327f651f0a@smile.fr>
Date: Sun, 25 Feb 2024 17:58:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andreas Dannenberg <dannenberg@ti.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <90dd167b-bceb-4e42-86c3-255caf825f41@smile.fr>
 <CAOf5uwka5w7DEAOox1pAfZ=mkpostmNATBJ_Ny1xuyYesXUwoQ@mail.gmail.com>
 <bf687add-2677-45fe-8eb1-cf04bd95bf57@smile.fr>
 <20240220004100.3yzqapeplx6olarz@dasso>
 <0b6dbe1f-2591-4290-b620-880d63eee7d0@smile.fr>
 <20240220200414.2bsvqvaeltqhsulc@dasso>
 <1a7ab8e6-bd43-4191-ad95-12e40f3a5c51@smile.fr>
 <20240223193136.sod3vx4t3pkqfcqd@dasso>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240223193136.sod3vx4t3pkqfcqd@dasso>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708880292; x=1709485092;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kEhgE9V4ObTdNbJMJBuTi1ngtNBgGGA6s0lQKQY4MdM=;
 b=hV7ctU07h6K6WgXWcXePvi38w4gk53cYXF6atmgawyNWocigpsOARaEUsSCcP8kAgt
 C2h2ql/rpLTU0muoziDb7Gl+JnB0IO2SWKwu3lzRuygctcMvoYEoObdjcbPvqxq9/FVN
 2j9qmqvsYhx/2ymnXxiZQUHB72/AfwibRXvILBIVS5XzdoehpYnaShkXpDFV8Xcqh4tl
 heBEzj7E3YU5weZPCJs63zZHmV00QgNMiC4p/C0Cov+l/OfgM46+fpYqMr+SLSSDPFNy
 yaJFScTlfdbh5q/Or0QfSFCBUVRP/GSDC50MOqch7ukQwaQk0otUhxy+Q6Sr2cQQqxBK
 95yA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=hV7ctU07
Subject: Re: [Buildroot] [PATCH v4 00/20] Add support for AM62x-SK HS-FS
 devices
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQW5kcmVhcywKCkxlIDIzLzAyLzIwMjQgw6AgMjA6MzEsIEFuZHJlYXMgRGFubmVuYmVyZyBh
IMOpY3JpdMKgOgo+IEhpIFJvbWFpbiwKPiAKPiBPbiBUdWUsIEZlYiAyMCwgMjAyNCBhdCAxMDoz
Njo1MVBNICswMTAwLCBSb21haW4gTmFvdXIgd3JvdGU6Cj4gCj4gPHNuaXA+Cj4gCj4+Pj4gQWJv
dXQgZXhpc3RpbmcgYm9vdCBmbG93LCBJIGZvdW5kIHR3byByZWNlbnQgY29tbWl0IGluIHUtYm9v
dCB0aGF0IHN0YXRlIHRoYXQKPj4+PiB0aGUgIlNwbGl0IGJpbmFyeSIgKHRoYXQgcmVxdWlyZXMg
c3lzZncuaXRiKSBpcyBhbHJlYWR5IGEgbGVnYWN5IGJvb3QgZmxvdzoKPj4+Cj4+PiBJdCdzIGNh
bGxlZCAibGVnYWN5IGJvb3QgZmxvdyIgYmVjYXVzZSBpdCB3YXMgdGhlIGJvb3QgZmxvdyB1c2Vk
IG9uIHRoZQo+Pj4gZmlyc3QgSzMgZGV2aWNlcyB0aGF0IHdlcmUgcmVsZWFzZWQgKEFNNjV4LCBK
NzIxRSkuIFRoaXMgYm9vdCBmbG93IHdhcwo+Pj4gbm90IHVzZWQgb24gZm9sbG93LW9uIGRldmlj
ZXMuIFRoZSBjaGFyYWN0ZXJpc3RpY3Mgb2YgdGhpcyBib290IGZsb3cgaXMKPj4+IHRoYXQgdGhl
IGluaXRpYWwgRlcgaW1hZ2UgdGhhdCBnZXRzIGxvYWRlZCAodGlib290My5iaW4pIGRvZXNuJ3Qg
Y29udGFpbgo+Pj4gYW55IGRldmljZSBmaXJtd2FyZXMsIGJ1dCBvbmx5IGEgYm9vdGxvYWRlciAo
c3VjaCBhcyBVLUJvb3QgU1BMKS4gVGhlbgo+Pj4gdGhpcyBib290IGxvYWRlciB3aWxsIGxvYWQg
dGhlIFN5c3RlbSBGaXJtd2FyZSBmaXJtd2FyZSArIGNvbmZpZyBkYXRhCj4+PiBibG9iIChzeXNm
dy5pdGIpIGludG8gdGhlIGRlZGljYXRlZCBjb3JlIChjYWxsZWQgIkRNU0MiID0gRGV2aWNlIE1h
bmFnZXIKPj4+IGFuZCBTZWN1cml0eSBDb250cm9sbGVyKS4gQW5kIHRoZW4gYWRkaWl0b25hbCBi
b290IHN0YWdlcyB3aWxsIGJlCj4+PiBsb2FkZWQuIFRoZXNlIGRldmljZXMgcmVxdWlyZSB0aGlz
IGJvb3QgZmxvdywgYW5kIHdpdGggdGhpcyBpdCBpcwo+Pj4gcmVxdWlyZWQgdG8gYmUgc3VwcG9y
dGVkIGJ5IFUtQm9vdCAoYW5kIGFueSBMaW51eCBkaXN0cmlidXRpb24gb3IgYnVpbGQKPj4+IHN5
c3RlbXMgdGhhdCBidWlsZCBvbiB0aGF0KS4KPj4+Cj4+PiBUSSBpcyBzdGlsbCBtYWtpbmcvc2Vs
bGluZyB0aG9zZSAibGVnYWN5IGJvb3QgZmxvdyIgZGV2aWNlcywgYW5kIHdpbGwKPj4+IGNvbnRp
bnVlIHRvIGRvIHNvIGZvciBhIHZlcnkgbG9uZyB0aW1lLiBPbmUgcHJvbWltZW50IGNvbW11bml0
eQo+Pj4gaW5jYXJuYXRpb24gdGhhdCB5b3UgYXJlIHByb2JhYmx5IGF3YXJlIG9mIGlzIHRoZSBC
ZWFnbGVCb25lIEFJLTY0Lgo+Pgo+PiBUaGFuayB5b3UgZm9yIHRoZSBkZXRhaWxlZCBleHBsYW5h
dGlvbiEKPj4KPj4gSSBwcmV2aW91bHkgd29ya2VkIG9uIGEgQU01N3h4IFNvQyB0aGF0IGlzIG5v
d2FkYXkgbGVnYWN5IFNvQywgdGhlIGxhdGVzdAo+PiB0aS1rZXJuZWwgNi4xIGRvZXNuJ3Qgc3Vw
cG9ydCBzb21lIG9mIHRoZSBkcml2ZXIgdGhhdCB3aGVyZSBhdmFpbGFibGUgaW4KPj4gdGkta2Vy
bmVsIDUuMTAgKHBydWV0aCAxMDBNLCBSUE1zZyBTb2NrZXRzIG92ZXIgdmlydGlvLXJwbXNnIHRy
YW5zcG9ydCAodXNlIGZvcgo+PiBBUk0tRFNQIElQQzMueCksIFRJLVJUT1MgKHRoZSBjc2wtY29t
bW9uIHBhY2thZ2Ugd2FzIGFsc28gcmVtb3ZlZCBmcm9tIG1ldGEtdGkpKS4KPj4KPj4gQWxzbyB0
aGUgVEkgU0RLIG9uIHRoaXMgcGxhdGVmb3JtIGRvZXNuJ3Qgc2VlbXMgdmVyeSBhY3RpdmUgWzFd
Lgo+IAo+IHNpbmNlIHlvdSBicm91Z2h0IHRoaXMgdXAgSSB3YW50ZWQgdG8gYWRkIHNvbWUgYWRk
aXRpb25hbCBjb250ZXh0IGhlcmUuCj4gT2xkZXIgZGV2aWNlcyBsaWtlIEFNNTd4eCAoQU0zMzV4
IGFuZCBBTTQzN3ggZmFsbCBpbnRvIHRoZSBzYW1lIGJ1Y2tldCkKPiB3aWxsIGdldCB3aGF0IHdl
IGNhbGwgIkxUUyByZWZyZXNoIFNES3MiIGV2ZXJ5IHllYXIsIHJhdGhlciB0aGFuCj4gbXVsdGlw
bGUgZHJvcHMgcGVyIHllYXIgYXMgd2UgZG8gZm9yIHRoZSBtb3JlIHJlY2VudCBkZXZpY2VzLiBB
cyBmb3IKPiBBTTU3eHggc3BlY2lmaWNhbGx5IHRoYXQgcmVmcmVzaCBpcyBjdXJyZW50bHkgdGFy
Z2V0ZWQgZm9yIGUvbyBNYXJjaAo+IDIwMjQgYW5kIHdpbGwgYmUga25vd24gYXMgIlNESyA5LjIi
LiBUaGVyZSBzaG91bGRuJ3QgYmUgYW55IGZlYXR1cmUKPiByZWdyZXNzaW9ucywgYW5kIHRoZSBv
bmx5ICJuZXciIHRoaW5nIChpbiBhZGRpdGlvbiB0byBhbiBhbGwtcmVmcmVzaGVkCj4gU1cgYmFz
ZWxpbmUgd2l0aCA2LjEga2VybmVsIGFuZCAyMDIzLjA0IFUtQm9vdCkgd2lsbCBiZSBzb21lIFky
SzM4IGlzc3VlCj4gZml4IG9uIExpbnV4LiBUSSB3aWxsIGJlIG1ha2luZyBhbmQgc2VsbGluZyB0
aG9zZSBkZXZpY2VzIGZvciBhIHZlcnkKPiBsb25nIHRpbWUgdG8gY29tZSwgYW5kIHRoZSBhbm51
YWwgcmVmcmVzaCBpcyBzZWVuIGFzIGEgZ29vZCBjb21wcm9taXNlCj4gYmV0d2VlbiBrZWVwaW5n
IHRoaW5ncyByZWZyZXNoZWQgcGVyaW9kaWNhbGx5IGFuZCB1cCB0byBkYXRlIHdoaWxlCj4gbGlt
aXRpbmcgdGhlIGFtb3VudCBvZiByZXBlYXQgd29yay9lZmZvcnQuCgpPaywgdGhhbmtzIGZvciB0
aGUgaW5mb3JtYXRpb24uCkknbSBsb29raW5nIGZvcndhcmQgdGhpcyBuZXcgU0RLIHJlbGVhc2Uu
CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gLS0KPiBBbmRyZWFzIERhbm5lbmJlcmcKPiBU
ZXhhcyBJbnN0cnVtZW50cyBJbmMKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
