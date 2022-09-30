Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC3DC433F5
	for <buildroot@archiver.kernel.org>; Fri, 30 Sep 2022 01:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D0864115D;
	Fri, 30 Sep 2022 01:29:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D0864115D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MlyM5JD9k70F; Fri, 30 Sep 2022 01:29:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14944401D2;
	Fri, 30 Sep 2022 01:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14944401D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C866C1BF38A
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 01:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9867861203
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 01:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9867861203
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PZgbbqNWRqgE for <buildroot@lists.busybox.net>;
 Fri, 30 Sep 2022 01:29:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A65EF611F7
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A65EF611F7
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 01:29:12 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id h28so2011432qka.0
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 18:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=fRSdv3D8fDRYRej7gl2w9czMhZc+piZMuduFe1vOP2Y=;
 b=FDxfvJ99AmUGrpuwiFm4uVtxzzDZTyasE3BXS2WFyneZZYUm0gRy1aq/NiAgGjiKBu
 Jm5nzf+1UVtTPTG/gc1JFLvXTVgOjoPsBCg6EoqXAA84SvygO/SSe3/akDz+RBBwmclj
 wyyhcaGd0aYGwCdZPWxKMOWEzgP6rVgwhm6mH1yi1jeoQkAdKnLAARYAIa8F6yt4Dq9/
 Pe4uBf8eRGQ7EhVmXrpORzpMATSZqalSEACjN2oYA4IYZ5RJRGXtGJnAAHrDnkjeB98x
 j5KbCarBC8t99HokTLy9HSDuTZxaCO97MH10A3IA/i/d1JQUBNPYoqBQrR9NOnEY/15I
 uT7g==
X-Gm-Message-State: ACrzQf0buuxcYv+HDVUsw1AuCOHCriFbxa6F2rFbGS3KKYVKhz/uxXq4
 FHyFohgXElIKZrCiZ0lbISqs+5Ytki6pFCzi
X-Google-Smtp-Source: AMsMyM5GBT222TCXmYxhhErJOr2Cukx2pgBZu5A5ASGL8mL9J6bkiiuTFYBxYm6TOTVqqyY8+K4dbA==
X-Received: by 2002:a05:620a:4496:b0:6ce:a264:3104 with SMTP id
 x22-20020a05620a449600b006cea2643104mr4435320qkp.408.1664501351487; 
 Thu, 29 Sep 2022 18:29:11 -0700 (PDT)
Received: from [10.4.10.38]
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188]) by smtp.gmail.com with ESMTPSA id
 x17-20020a05620a259100b006ce5ba64e30sm987861qko.136.2022.09.29.18.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 18:29:11 -0700 (PDT)
Message-ID: <bad9e17c-e8d1-28ae-c4cc-e024ae173bbb@gmail.com>
Date: Thu, 29 Sep 2022 21:29:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
To: Giulio Benetti <giulio.benetti@benettiengineering.com>, jautry@tekvox.com
References: <022201d8d3a2$d0b8e310$722aa930$@tekvox.com>
 <8FF758D8-90C7-4B78-A84D-3FB48A8B15E1@benettiengineering.com>
Content-Language: en-US
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <8FF758D8-90C7-4B78-A84D-3FB48A8B15E1@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=fRSdv3D8fDRYRej7gl2w9czMhZc+piZMuduFe1vOP2Y=;
 b=n2YWuJwIHcmicPKPALk6jKSVsPQvrHVr7i+aMP0mjiBLSFUixAKluMsTsksYC1zWa7
 I/u0Yy9tgLLBG6/FOTjRho7eH63Z2W/D3TxYjTtJCKdSQ10u739H8gwqxPGCYspLBBDr
 0zhhwQg72pjpb23mRhM3Bi1VTQ3fC/DBJ01Ib0aryCXJ9GNi6hiqOFZZz99OCxC/JCgp
 thM+NMaf15GL6Uzm0G4WHJ1kZRoPPzHG9xvDS4OaIBsiMZYdkgTK8rOitblXobdw87S0
 o712r3mWGbi3BOtkLQuXN1r2Pv4N0su15LaCcep7K4vlcyN7N0sYeoUSGBkda7FHb1Kk
 KUoA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=n2YWuJwI
Subject: Re: [Buildroot] i.MXRT10xx support
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiA5LzI4LzIyIDIyOjQ4LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiBIZWxsbyBKYXV0cnko
aG9wZSB0aGUgbmFtZSBpcyBjb3JyZWN0KSwKPiAKPj4gSWwgZ2lvcm5vIDI5IHNldCAyMDIyLCBh
bGxlIG9yZSAwMzoyOSwgamF1dHJ5QHRla3ZveC5jb20gaGEgc2NyaXR0bzoKPj4KPj4g77u/Cj4+
IEkgbm90ZWQgb24gYSBzaXRlIHV0aWxpemluZyBidWlsZHJvb3QgdGhhdCB0aGVyZSB3YXMgaS5N
WFJUMTB4eCBzdXBwb3J0LgpXaGF0IHNpdGU/CkVtY3JhZnQgaGFzIGEgcGFpZCBmb3IgQlNQIG90
aGVyIHRoYW4gdGhhdCBJIGhhdmVuJ3Qgc2VlbiB0aGlzIG90aGVyIAp0aGFuIHRoZSBtYWlsaW5n
IGxpc3QuLi4KCiAgSW4gZG93bmxvYWRpbmcgYnVpbGRyb290LCBJIGRpZCBub3Qgbm90aWNlIHRo
ZSBNWFJUMTA2MCBFVksgYm9hcmQgCmluY2x1ZGVkIGluIGFueSBvZiB0aGUgZGVmY29uZmlncy4g
IEkgd2FzIGp1c3QgY3VyaW91cyBpZiB0aGlzIGRvZXMgZXhpc3Q/Cj4gCj4gdGhhdCBpcyBzdGls
bCBub3QgdXBzdHJlYW1lZCBhbmQgd2XigJlyZSB3YWl0aW5nIGZvciB0aGlyZCBpdGVyYXRpb24g
b2YgcGF0Y2ggdGhhdCBhZGRzIHN1cHBvcnQgZm9yIGlteHJ0MTA1MCBmcm9tIEplc3NlLiBUaGUg
cmVwb3NpdG9yeSBzaG91bGQgYmUgSmVzc2XigJlzIG9uZSBvciBtaW5lLgo+IAo+IFRoaXMgaXMg
dGhlIG9sZCB2ZXJzaW9uIHRoYXQgc2hvdWxkIHdvcmsgZm9yIGlteHJ0MTA1MCBidXQgYWxzbyBm
b3IgaW14cnQxMDYwKEFGQUlLIHJlZ2lzdGVycyBhcmUgdGhlIHNhbWUgZm9yIG1vc3Qgc3R1ZmYp
Ogo+IGh0dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8y
MDIyMDczMDA2MTIxOS4zMDYxODY0LTEtTXIuQm9zc21hbjA3NUBnbWFpbC5jb20vCj4gCj4gU28g
eW91IGNhbiBkb3dubG9hZCBhbmQgYXBwbHkgdGhhdCBwYXRjaCBhbmQgdGVzdCB0aGUgcmVzdWx0
aW5nIGltYWdlIG9uIHRoZSBib2FyZC4KPiBJdCB3b3VsZCBiZSBnb29kIGhhdmluZyBzb21lb25l
IHRvIHRlc3QgaXQgYXBhcnQgSmVzc2UgYW5kIG1lLgpZZXMgcGxlYXNlIHRlc3QKClRoYW5rcywK
SmVzc2UgVGF1YmUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
