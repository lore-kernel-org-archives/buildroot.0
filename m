Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50D4CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 09:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90D3F80FA6;
	Wed,  3 Apr 2024 09:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h4Fm3fpUJhqj; Wed,  3 Apr 2024 09:17:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7964F812AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7964F812AF;
	Wed,  3 Apr 2024 09:17:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9978F1BF271
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 09:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 938C5416BB
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 09:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x-XtsIRu-ACj for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 09:17:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C8E4B41689
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8E4B41689
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8E4B41689
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 09:17:13 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33edbc5932bso4396601f8f.3
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 02:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712135832; x=1712740632;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l7jbtDLdDmfjiKVRSLsccQP6vhqoBnf0SdXfz86eMsU=;
 b=efbWop1wSkaVxb0IKMXOExp0chobfqeJw4a7JLzDR0UgYVXPmh7BFS3efvQNxXhER0
 E6JVfbNPH/XfvsxjdFXWRc9cv9pqDPDrnC5/+VD7L7i5zidNr7b4WeitgG3syxNHRiQq
 DlpLGGIdcReVLU5OsuwFyKY5Juk67kRPjdGFp7xHi96aZpUSxpaWeYU1uJjEMl/bk8rD
 e6VsWpWWZP52O+I+uWpl4J3jJcH6DFKhGUFinQu2Hlk/ItuQzjUpK8QphQ0CrQhdPz7B
 KmLhlG99dU33w6pQS66xxJVFRgeJD+WpRFxGPswc85rv4jtR51Ezckibc2JlqBonn2x6
 gkbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ05w/0LH6mOl2+lbovGao41L3OKMvd611UeAIJvdg06b8jvYynbfSgVlmXmsQz0kFWx1LOsvLMsadKkZlqkO9Rhqi2axucA==
X-Gm-Message-State: AOJu0YzSPOi0wDVsIpKuhbtNLeB2TN5/coBG24OXx5G9W7dKdOEw4o/9
 YjEmM52O3xKkmn5H3h7O7Vaewu/hrKbtHFiTkcA9WFAY5owXvymuye5TZXIY2/k=
X-Google-Smtp-Source: AGHT+IHLldcAwJupgE5ZjTT+fD/1Wla6req+A5dHPYH5V8Lnv0OWhWQVg5wmwT6g2UW+Vuzb/re0OQ==
X-Received: by 2002:a5d:6083:0:b0:343:64ca:6cf1 with SMTP id
 w3-20020a5d6083000000b0034364ca6cf1mr1448825wrt.61.1712135831713; 
 Wed, 03 Apr 2024 02:17:11 -0700 (PDT)
Received: from ?IPV6:2a04:cec0:1034:c083:97c8:fbff:84a2:888b?
 ([2a04:cec0:1034:c083:97c8:fbff:84a2:888b])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a0560001ac900b0033e41e1ad93sm16717837wry.57.2024.04.03.02.17.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 02:17:11 -0700 (PDT)
Message-ID: <37a25304-2bd9-4125-8031-da3857708294@smile.fr>
Date: Wed, 3 Apr 2024 11:17:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712135832; x=1712740632;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l7jbtDLdDmfjiKVRSLsccQP6vhqoBnf0SdXfz86eMsU=;
 b=NBZ1sHRoY77PuYwa/1Jp6nxl+4WkjO70ovnatBhwz4oAirG3La1SbwH2cq4L0FEyUw
 pruY6ZnGeseAOGPq94xbUjDf+MrYS/4dAa0RtJVmdNvzTxvIn27+yx27B8mbZeJFQXCE
 15HWcf+XkAbsL6hjcuHvnoLTHe+sQ8IeJBd5WANSK+0M6xLX8SIWrWV8GAasDGaXNuk/
 cwTl1scdQ0A/pGknpjSiCg4iULUssQ47eBXqCXGv2Z5/Fty417O5uuyIe1x5q71xtDAz
 cuOB3MtIya6cMP68nSkqjxHeeNAfawQcUHhFfJ48MKxGf7Wajw4blOh05r7SJS/J1zHH
 VH2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=NBZ1sHRo
Subject: Re: [Buildroot] [PATCH v10 00/12] Add support for AM62x-SK HS-FS
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "Yann E . Morin" <yann.morin.1998@free.fr>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sIEFsbCwKCkxlIDMwLzAzLzIwMjQgw6AgMTc6MDIsIERhcmlvIEJpbmFjY2hp
IGEgw6ljcml0wqA6Cj4gVGhlIFNLLUFNNjJCLVAxIGlzIHRoZSBuZXdlc3QgdmVyc2lvbiBvZiBT
Sy1BTTYyIHdoaWNoIGluY2x1ZGVzCj4gaGlnaC1zZWN1cml0eSBmaWVsZC1zZWN1cmFibGUgKEhT
LUZTKSBzaWxpY29uIHRvIG9wdGlvbmFsbHkgY3VzdG9taXplIGtleXMKPiBhbmQgZW5jcnlwdGlv
biBmb3Igc2VjdXJpdHkgYXBwbGljYXRpb25zLgo+IFRoaXMgcmVxdWlyZXMgZW5hYmxpbmcgdGhl
IEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NFQ1RZUEVfSFNfRlMgb3B0aW9uLAo+IHdoaWNo
LCBob3dldmVyLCB3YXMgYnVnZ3kuIFRoaXMgc2VyaWVzIGZpeGVzIHRoZSBlcnJvcnMgYW5kIGJ1
bXBzIHRoZSBMaW51eAo+IGtlcm5lbCBhbmQgVS1Cb290IHJlcXVpcmVkIGZvciBzdWNoIGEgbmV3
IGRldmljZS4KPiAKPiBGdXJ0aGVybW9yZSwgdGhpcyB2ZXJzaW9uIGNvbXBsZXRlIHRoZSBzZXJp
ZXMgYnkgdXBkYXRpbmcgdGhlCj4gdGlfYW02NHhfc2tfZGVmY29uZmlnIGFzIHJlcXVlc3RlZCBi
eSBSb21haW4gTmFvdXI6Cj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1
aWxkcm9vdC9wYXRjaC8yMDI0MDIyNDIwNTY1NC4xNTQ2NzQ0LTE3LWRhcmlvLmJpbmFjY2hpQGFt
YXJ1bGFzb2x1dGlvbnMuY29tLwo+IEkgaGF2ZSBzdWNjZXNzZnVsbHkgZXhlY3V0ZWQgY29tcGls
YXRpb24gdGVzdHMgZm9yIGFsbCBwb3NzaWJsZSBjb21iaW5hdGlvbnMgb2YgcGxhdGZvcm0gYW5k
IHNlY3VyaXR5IHR5cGU6Cj4gYW02MnggLT4gR1AsIEhTLCBIUy1GUwo+IGFtNjR4IC0+IEdQLCBI
UywgSFMtRlMKPiAKPiBUaGUgQU02MnggSFMtRlMgY29uZmlndXJhdGlvbiBoYXMgYWxzbyBiZWVu
IHRlc3RlZCBvbiB0aGUgU0stQU02MkItUDEgYm9hcmQuCj4gCj4gVmVyc2lvbiA5IGhhcyBtZXJn
ZWQgdGhlIGZpcnN0IDEwIHBhdGNoZXMgaW50byB0aGUgbWFpbmxpbmUuIFRoaXMgdmVyc2lvbgo+
IHRoZXJlZm9yZSBjb250YWlucyB0aGUgcmVtYWluaW5nIHBhdGNoZXMgdG8gd2hpY2ggdGhlIHBh
dGNoIHN1Z2dlc3RlZCBieQo+IFlhbm4gRS4gTW9yaW4gaGFzIGJlZW4gYWRkZWQgKCJib290L3Rp
LWszLXI1LWxvYWRlcjogZHJvcCBoYXNoIGZvciB2ZXJzaW9uCj4gMjAyMi4xMCIgWzFdKSwgYW5k
IGhhcyByZW1vdmVkIHRoZSBwYXRjaCAiYm9vdC90aS1rMy1pbWFnZS1nZW46IHJlbW92ZQo+IHBh
Y2thZ2UiLCB3aGljaCBpcyBub3Qgc3RyaWN0bHkgcmVxdWlyZWQgYnkgdGhlIHNlcmllcyBhbmQg
ZG9lcyBub3QgY2F1c2UKPiByZWdyZXNzaW9ucy4KClRoYW5rcyBmb3IgdGhpcyBuZXcgaXRlcmF0
aW9uIChhbmQgdGhhbmtzIHRvIGFsbCB0ZXN0ZXIpLgoKSSB3b3VsZCBsaWtlIHRvIHJld29yayB0
aGlzIHNlcmllcyB0byBpbXByb3ZlIGFuZCBjb21wbGV0ZSB0aGUgVEkgSzMgU29DIHN1cHBvcnQK
cG9zdCBhIFYxMS4KCldlIGFyZSBjb25maWRlbnQgdGhhdCB0aGUgQlNQICh0aS1rMy1ib290LWZp
cm13YXJlLCB1LWJvb3QgMjAyNC4wMSB3aXRoIGJpbm1hbgphbmQga2VybmVsIDYuMS4xOCkgaXMg
d29ya2luZyB3ZWxsIG9uIEFNNjIsIEFNNjQgYW5kIGV2ZW4gajcyMWUgKHdpdGggYW5vdGhlcgpz
ZXJpZXMgb24gdG9wKS4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IAo+IFsxXSBodHRwczovL3Bh
dGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjQwMzA0MTUzMjUz
LjczMjcwOC02LWRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tCj4gCj4gRGFyaW8g
QmluYWNjaGkgKDEyKToKPiAgIGJvb3QvdGktazMtcjUtbG9hZGVyOiBkcm9wIGhhc2ggZm9yIHZl
cnNpb24gMjAyMi4xMAo+ICAgYm9vdC90aS1rMy1yNS1sb2FkZXI6IHNldCBiaW5tYW4gZW52aXJv
bm1lbnQKPiAgIGJvb3QvdWJvb3Q6IGFkZCBCUjJfVEFSR0VUX1VCT09UX1VTRV9CSU5NQU4gb3B0
aW9uCj4gICBwYWNrYWdlL3RpLWszOiBtb3ZlIFRJX0szX3tTRUNUWVBFLFNPQ30gb3V0IG9mIHRo
ZSBpbWFnZS1nZW4gc2NvcGUKPiAgIHBhY2thZ2UvdGktazM6IGRpc2FibGUgSFMtRlMgZm9yIEFN
NjUgU09DCj4gICBib290L3RpLWszL3RpLWszLXI1LWxvYWRlcjogaW5zdGFsbCB0aWJvb3QzLmJp
bgo+ICAgY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWc6IGJ1bXAgVS1Cb290IHZlcnNpb24g
dG8gMjAyNC4wMQo+ICAgY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWc6IGJ1bXAgTGludXgg
dmVyc2lvbiB0byA2LjYuMTgKPiAgIGJvYXJkL3RpL2FtNjJ4LXNrOiBnZW5lcmFsaXplIHBvc3Qt
YnVpbGQuc2gKPiAgIGJvYXJkL3RpL2FtNjJ4LXNrOiBtb3ZlIHBvc3Qte2J1aWxkLGltYWdlfS5z
aCB0byBib2FyZC90aS9jb21tb24vYW02eHgKPiAgIGNvbmZpZ3MvdGlfYW02NHhfc2tfZGVmY29u
ZmlnOiBidW1wIFUtQm9vdCB2ZXJzaW9uIHRvIDIwMjQuMDEKPiAgIGNvbmZpZ3MvdGlfYW02NHhf
c2tfZGVmY29uZmlnOiBidW1wIExpbnV4IHZlcnNpb24gdG8gNi42LjE4Cj4gCj4gIGJvYXJkL3Rp
L2FtNjJ4LXNrL2dlbmltYWdlLmNmZyAgICAgICAgICAgIHwgIDcgKystCj4gIGJvYXJkL3RpL2Ft
NjR4LXNrL2dlbmltYWdlLmNmZyAgICAgICAgICAgIHwgIDcgKystCj4gIGJvYXJkL3RpL2NvbW1v
bi9hbTZ4eC9wb3N0LWJ1aWxkLnNoICAgICAgIHwgNTggKysrKysrKysrKysrKysrKysrKysrCj4g
IGJvYXJkL3RpL2NvbW1vbi9hbTZ4eC9wb3N0LWltYWdlLnNoICAgICAgIHwgMTEgKysrKwo+ICBi
b290L3RpLWszLWltYWdlLWdlbi9Db25maWcuaW4gICAgICAgICAgICB8IDYxICsrLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4gIGJvb3QvdGktazMtaW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdlbi5tayAg
IHwgIDQgKy0KPiAgYm9vdC90aS1rMy1yNS1sb2FkZXIvQ29uZmlnLmluICAgICAgICAgICAgfCAg
MSArCj4gIGJvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5oYXNoIHwgIDEgLQo+
ICBib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsgICB8IDEyICsrKystCj4g
IGJvb3QvdWJvb3QvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgIHwgMjMgKysrKystLS0t
Cj4gIGJvb3QvdWJvb3QvdWJvb3QubWsgICAgICAgICAgICAgICAgICAgICAgIHwgMTIgKysrKy0K
PiAgY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcgICAgICAgICAgICAgfCAyMCArKysrLS0t
LQo+ICBjb25maWdzL3RpX2FtNjR4X3NrX2RlZmNvbmZpZyAgICAgICAgICAgICB8IDIwICsrKyst
LS0tCj4gIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+
ICBwYWNrYWdlL3RpLWszL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICB8IDYxICsrKysrKysr
KysrKysrKysrKysrKysrCj4gIHBhY2thZ2UvdGktazMvdGktazMubWsgICAgICAgICAgICAgICAg
ICAgIHwgIDcgKysrCj4gIDE2IGZpbGVzIGNoYW5nZWQsIDIxMyBpbnNlcnRpb25zKCspLCA5MyBk
ZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNzU1IGJvYXJkL3RpL2NvbW1vbi9hbTZ4eC9w
b3N0LWJ1aWxkLnNoCj4gIGNyZWF0ZSBtb2RlIDEwMDc1NSBib2FyZC90aS9jb21tb24vYW02eHgv
cG9zdC1pbWFnZS5zaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS90aS1rMy9Db25maWcu
aW4KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdGktazMvdGktazMubWsKPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
