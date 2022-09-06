Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BB8ECAAD5
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 16:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74C71829F2;
	Tue,  6 Sep 2022 16:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74C71829F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ggK4DxdA8EX; Tue,  6 Sep 2022 16:52:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDFFD82978;
	Tue,  6 Sep 2022 16:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDFFD82978
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EFA0C1BF2C5
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 16:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA42560AEA
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 16:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA42560AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TCOqmlibuHFF for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 16:52:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FB1C60760
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FB1C60760
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 16:52:19 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id t14so9085581wrx.8
 for <buildroot@buildroot.org>; Tue, 06 Sep 2022 09:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=m2VRqwS4VPEoaubBolEq44kj5zMB/jHQ18GLYR6IXjo=;
 b=vJUejbsy+XeBbnrFdyR6Dixjyl3TEUxXMHf3HCC56s3fthkOYqSoVWDaRgKA6hLDwF
 y0P2wjybayRSAqPhfkDG/UFtEhBwMQIsYeFt4UojPJFsOAHsSoNz0fzken1n80kbmMwD
 sk9dVTn4rm5d3+Z0synSDacrmJP/HegZops8Guaz3141rOh9roaizsMSDeGFKoevjIUQ
 lGwJK0pPVQ7Wg51uUFdRAKKAJtqJurD4e2GS0QGwsH8nl1/XZg7DZxLsi98BRLo7bpHt
 sTkle+9YtWs9TIfWwKClMqSvrBEFD1+mlD5eCn3zl6ixKmh4Rtw2k9hSq8SFsASahKmX
 H45g==
X-Gm-Message-State: ACgBeo2VMRgTnjJq/GmaEqtV+kDuBEh94w77JgDqw5OrvZa4H0EW17U4
 EDVw3gjHk44dIfT+q0iy0+oSMg==
X-Google-Smtp-Source: AA6agR419rb5L6yDJlyBEjxWPYvjWBObXePIQoOgKdJf5RCbiVdWihiPvdmX6uIdtknYIHu7FrRRxQ==
X-Received: by 2002:a5d:564e:0:b0:228:d609:7ac3 with SMTP id
 j14-20020a5d564e000000b00228d6097ac3mr3317003wrw.27.1662483137773; 
 Tue, 06 Sep 2022 09:52:17 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 f15-20020adfb60f000000b00226d1b81b45sm15589053wre.27.2022.09.06.09.52.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 09:52:17 -0700 (PDT)
Message-ID: <006559f6-5f37-4d6c-3d84-befdbf8f2865@smile.fr>
Date: Tue, 6 Sep 2022 18:52:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>
References: <20220829202159.407642-1-romain.naour@gmail.com>
 <20220906155010.GF1585594@scaer>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220906155010.GF1585594@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=m2VRqwS4VPEoaubBolEq44kj5zMB/jHQ18GLYR6IXjo=;
 b=hxR53/MjSfVpWjCqRWym45CJfZiWjwnKCiZK91Qg/3ER6wwd++cNDzmyjD3JI/etlV
 TmyB7P218zgBq/Hxh5u0N1GolI95Z2rRi4cTQrNWncV40AHnofcol0V57P9OoU+HweC7
 fsCTCahWf3E9ErvXLIRjvtRrYWYADp1CSvskrfA+b5NEXZBK0WWwG+7wGjalce6hKEI1
 6rnnjVB472j4bJhA7sUcHXI09U9O/efpCfrl17kHD4IDTZ4ts3NFWUAJpQJAtG6fGdWg
 b9jCSl0l+YLfyC/N/OXIcz2H3YuRaiZSartyNFuK3vxT7Kpzc9FSKHD15UOjBjVteRxK
 RKow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=hxR53/Mj
Subject: Re: [Buildroot] [for-master] package/gdb: include gdbarch.h in
 xtensa-linux-nat.c
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwgQWxsLAoKTGUgMDYvMDkvMjAyMiDDoCAxNzo1MCwgWWFubiBFLiBNT1JJTiBhIMOpY3Jp
dMKgOgo+IFJvbWFpbiwgQWxsLAo+IAo+IE9uIDIwMjItMDgtMjkgMjI6MjEgKzAyMDAsIFJvbWFp
biBOYW91ciBzcGFrZSB0aHVzbHk6Cj4+IEl0IHNlZW1zIHRoYXQgZ2RiIGRvZXNuJ3QgYnVpbGQg
Zm9yIHh0ZW5zYSBzaW5jZSBhIHdoaWxlLCBpbmRlZWQgY29tbWl0Cj4+IFsxXSBtZXJnZWQgaW4g
Z2RiIDkgaW50cm9kdWNlZCBhIGZldyBudW1iZXIgb2YgYnVpbGQgaXNzdWVzIG9uIHNldmVyYWwK
Pj4gYXJjaGl0ZWN0dXJlczoKPj4KPj4gW0ZpeCBnZGIgYnVpbGQgb24gbWFjT1NdCj4+IGh0dHBz
Oi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPWJpbnV0aWxzLWdkYi5naXQ7YT1jb21taXRkaWZmO2g9
YjFjODk2YjM2NWYyZGJjZDE0MTQ1YTg4ZDEwMzYyMzI0NGNmMGZiMAo+Pgo+PiBbZ2RiOiBGaXgg
Z2RiIGJ1aWxkIG9uIG1pcHM2NC1saW51eF0KPj4gaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9naXQv
P3A9YmludXRpbHMtZ2RiLmdpdDthPWNvbW1pdGRpZmY7aD0yMjA4ZWU5MTcwNTBiY2M5MDFjN2Zh
ZWZkZWUyNTdmZmJmOGVmMmFiCj4+Cj4+IFtnZGI6IEZpeCBuYXRpdmUgYnVpbGQgb24gTGludXgv
QWxwaGEuXQo+PiBodHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC8/cD1iaW51dGlscy1nZGIuZ2l0
O2E9Y29tbWl0ZGlmZjtoPTdhMjdiODVmNmQ5YjVlZWE5YmQxNDkzZjkwMzE1OGZiZWE0YjIyMzEK
Pj4KPj4gW0luY2x1ZGUgZ2RiYXJjaC5oIGluIG02OGstbGludXgtbmF0LmNdCj4+IGh0dHBzOi8v
c291cmNld2FyZS5vcmcvZ2l0Lz9wPWJpbnV0aWxzLWdkYi5naXQ7YT1jb21taXRkaWZmO2g9YTdj
ZGFhOTE0ZjRiOTM3NTQ0ZDhmMTAyNjc5YmI1MTI5YmIxZWYwOAo+Pgo+PiBbZ2RiOiBpbmNsdWRl
IGdkYmFyY2guaCBpbiBocHBhLWxpbnV4LW5hdC5jXQo+PiBodHRwczovL3NvdXJjZXdhcmUub3Jn
L2dpdC8/cD1iaW51dGlscy1nZGIuZ2l0O2E9Y29tbWl0ZGlmZjtoPWFkNzVlZmE2Mjg2NTY3MTY5
ODJmMjY3NDAwODk1MmJmZDJjMjY4YWYKPj4KPj4gTW9zdCBvZiB0aGVtIGhhcyBiZWVuIGZpeGVk
IGJlZm9yZSB0aGUgZ2RiIDkgcmVsZWFzZSBidXQgaXQgc2VlbXMKPj4gdGhhdCB4dGVuc2EgaXMg
dGhlIGxhc3Qgb25lIG9uIHRoaXMgbGlzdCBhbmQgc3RpbGwgdW5maXhlZCB3aXRoCj4+IGdkYiAx
MSAobm90IGV2ZW4gbm90aWNlZCBieSBCdWlsZHJvb3QgYXV0b2J1aWxkZXJzKS4KPj4KPj4gWzFd
IGh0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPWJpbnV0aWxzLWdkYi5naXQ7YT1jb21taXRk
aWZmO2g9MGQxMmU4NGNmYzliZDM2YjdiYmRhMDFhM2M4ZjgzZjY1YTgzMjM5OAo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Cj4+IENjOiBN
YXggRmlsaXBwb3YgPGpjbXZia2JjQGdtYWlsLmNvbT4KPiAKPiBBcHBsaWVkIHRvIG1hc3Rlciwg
dGhhbmtzLgo+IAo+PiAtLS0KPj4gZ2NjIDEyIGlzIGFsc28gYnJva2VuIGR1ZSB0byB0b28gb2xk
IHh0ZW5zYSBvdmVybGF5IGZvciBnZGI6Cj4+Cj4+IHh0ZW5zYSBvdmVybGF5cyBmb3JtIDIwMTYg
b3ZlcnJpZGUgZ2RiL3h0ZW5zYS1jb25maWcuYyBicmVha2luZwo+PiB0aGUgZ2RiIDEyIGJ1aWxk
IGR1ZSBhIHJlY2VudCBjaGFuZ2VzIGZyb20gY29tbWl0Ogo+PiBodHRwczovL3NvdXJjZXdhcmUu
b3JnL2dpdC8/cD1iaW51dGlscy1nZGIuZ2l0O2E9Y29tbWl0ZGlmZjtoPTM0NWJkMDdjY2UzMzU2
NWYxY2Q2NmFjYWJkYWYzODdjYTNhN2NjYjMKPiAKPiBTaG91bGQgd2UgbWFzayBvdXQgZ2RiLTEy
IGZvciB4dGVuc2EgaW4gbmV4dCwgdGhlbj8KCmdkYi0xMiBmb3IgeHRlbnNhIHNob3VsZCBidWls
ZCB3aGVuIG5vIG92ZXJsYXkgaXMgdXNlZC4KCkl0IHNob3VsZCBiZSBtYXNrZWQgd2l0aCB0aGUg
b3ZlcmxheSB3ZSBjdXJyZW50bHkgdXNlLi4uCkknbSBub3Qgc3VyZSB3aGF0IHdlIHJlYWxseSBj
YW4gZG8uLi4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBSZWdhcmRzLAo+IFlhbm4gRS4g
TU9SSU4uCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
