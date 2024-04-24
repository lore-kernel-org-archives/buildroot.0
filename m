Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65241C4345F
	for <buildroot@archiver.kernel.org>; Wed, 24 Apr 2024 12:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11DE181447;
	Wed, 24 Apr 2024 12:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xj40keAqcUpy; Wed, 24 Apr 2024 12:42:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1290D8149C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1290D8149C;
	Wed, 24 Apr 2024 12:42:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E12B31BF580
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 12:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD41F4083A
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 12:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gUX9tgIbRvuZ for <buildroot@lists.busybox.net>;
 Wed, 24 Apr 2024 12:42:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 47DE640835
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47DE640835
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47DE640835
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 12:42:29 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d895e2c6efso102300971fa.0
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 05:42:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713962547; x=1714567347;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l3EnW1YMDl8FCY+BU/PibGVK05jp0eSsCfl1gKuABkI=;
 b=w6Jm6rb3B3D+7SA4Bj9aE+GxZt0GzqP1QXBqKiC+xx1gy4Op9F2okc/WlkCcQ8Ywlh
 EaIKTKMauLqN9eM+cjxcUQ4mNBd2BOgLmwK7il1TVJ1k+xMAeb9FCUY624NAV5xMU5GC
 FoTO5zZzvxhC6W52w40GIy3Sn4c6Fv9TqzsG8pDx7FNWlIORfPCyqQmdq52Ci1QiJNqi
 TJKsWKOLzaeBICS/OBU+/PcUPi8PhBPBgqe5IcL2oAX6bMqCjn1dMZrRAWyM8WWprF/K
 KiHvA6EthOtQPRc5mCAPdYIl1ZSSbKFNQzK7n7eWlSez6HR4zgajdBgE7VxodxYnT2vZ
 C/ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPy8G+z1DmAIpg7RmnwI0syOPXXdQNmK3gtBOKcGhHaIJuPSOCy/+THGC2FvM3Ky9zf6vfyICFs+Y/d7rJhdX95b9WvNwXBA==
X-Gm-Message-State: AOJu0YxDguLz7dOfz2JIgyh8MJoGDTU0Co6L43yUfz6oolSssA8dGSYC
 IA2f6d6g5KJivnQ/By8yR59vMh1pgKGnuPuPvJBGiZi34eUM6bwbSzu/jUUoPuw=
X-Google-Smtp-Source: AGHT+IHkJfY+HIjcXKIbvUO77puZGpJs5bwV+iikH5qSAHpJDE81BONzgICszGhy86Iy3mIUaEYohg==
X-Received: by 2002:a2e:b992:0:b0:2db:381a:bf6e with SMTP id
 p18-20020a2eb992000000b002db381abf6emr1335354ljp.16.1713962546752; 
 Wed, 24 Apr 2024 05:42:26 -0700 (PDT)
Received: from ?IPV6:2a04:cec0:1029:8401:c161:55f0:60f6:3bba?
 ([2a04:cec0:1029:8401:c161:55f0:60f6:3bba])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a05600c458f00b0041ac56fd580sm5268257wmo.31.2024.04.24.05.42.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 05:42:26 -0700 (PDT)
Message-ID: <8f3ed27d-e739-4c31-bf55-0e14d4d43db0@smile.fr>
Date: Wed, 24 Apr 2024 14:42:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>, Waldemar Brodkorb
 <wbx@openadk.org>, buildroot@buildroot.org
References: <ZgQcVayV4juxXnnZ@waldemar-brodkorb.de>
 <68394e48-3b02-4a67-871c-4d4719f28873@mind.be>
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <68394e48-3b02-4a67-871c-4d4719f28873@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1713962547; x=1714567347;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=l3EnW1YMDl8FCY+BU/PibGVK05jp0eSsCfl1gKuABkI=;
 b=YpqAe9kdvR1YpQsHoNioEYlegKm4W7AqtxcS/uwORf99dy3RFPQCvZVejQyv2TvEO+
 oJLuO1Z27MgxReVUN1wDIgeSqu+qh5d+fc3dkZdqWOw7gwEYYUVSwe0V4r1nzzGduEPE
 nchFKTWl92RlVOBjPpq0iRCic8bdemS38a7WVxsA4xSHk+TVWg4D7+ls5u8OvZWjuUSl
 9OcJ6BOa8O6kAWM6N2ZfXy9+eAw/oKO69kuSZzykirNVETA71DtiuFhEPNQ62rGOwv5d
 bD+JbmPHqHpn983fpsIPuP0aT7Q6JeAQ5XW+/bnKykMTy9AW4PlPlp4R95hlx+zNNYrr
 0Q5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=YpqAe9kd
Subject: Re: [Buildroot] [PATCH] package/uclibc: bump to 1.0.47
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gV2FsZGVtYXIsIEFsbCwKCkxlIDEwLzA0LzIwMjQgw6AgMjE6NDEsIEFybm91dCBWYW5k
ZWNhcHBlbGxlIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiAKPiAKPiBPbiAyNy8wMy8yMDI0
IDE0OjE3LCBXYWxkZW1hciBCcm9ka29yYiB3cm90ZToKPj4gRml4ZXMgcmlzY3YgcG9ydC4gTlBU
TC9UTFMgZml4ZWQuIEMrKyBhcHBsaWNhdGlvbnMgbm93IHdvcmtpbmcuCj4+IEFkZGVkIGV4cGxp
Y2l0X2J6ZXJvIGFuZCByZWFsbG9jYXJyYXkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFdhbGRlbWFy
IEJyb2Rrb3JiIDx3YnhAb3BlbmFkay5vcmc+CgpJdCBzZWVtcyB0aGUgbGFzdCB1Y2xpYmMgdmVy
c2lvbiBidW1wIHRyaWdnZXIgYW4gaXNzdWUgb24gcmlzY3Y2NCBub21tdQoKICAgIFsgICAgMC4y
NTY0MDNdIFJ1biAvc2Jpbi9pbml0IGFzIGluaXQgcHJvY2VzcwogICAgWyAgICAwLjI3ODM0OV0g
aW5pdFsxXTogdW5oYW5kbGVkIHNpZ25hbCAxMSBjb2RlIDB4MiBhdCAweDgwNjAwMTMwMDAwMDAw
MDAKICAgIFsgICAgMC4yNzg3MDddIENQVTogMCBQSUQ6IDEgQ29tbTogaW5pdCBOb3QgdGFpbnRl
ZCA2LjYuMTggIzEKICAgIFsgICAgMC4yNzg5MzddIEhhcmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRp
byxxZW11IChEVCkKLi4uCiAgICBbICAgIDAuMjgzNjMxXSBLZXJuZWwgcGFuaWMgLSBub3Qgc3lu
Y2luZzogQXR0ZW1wdGVkIHRvIGtpbGwgaW5pdCEKZXhpdGNvZGU9MHgwMDAwMDAwYgoKaHR0cHM6
Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy82NjU1MTE5OTYxCgpD
YW4geW91IGhhdmUgYSBsb29rID8KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiDCoEFwcGxp
ZWQgdG8gbWFzdGVyLCB0aGFua3MuCj4gCj4gwqBSZWdhcmRzLAo+IMKgQXJub3V0Cj4gCj4+IC0t
LQo+PiDCoCBwYWNrYWdlL3VjbGliYy91Y2xpYmMuaGFzaCB8IDQgKystLQo+PiDCoCBwYWNrYWdl
L3VjbGliYy91Y2xpYmMubWvCoMKgIHwgMiArLQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdWNs
aWJjL3VjbGliYy5oYXNoIGIvcGFja2FnZS91Y2xpYmMvdWNsaWJjLmhhc2gKPj4gaW5kZXggYWUx
ZjMxNzhkOS4uYTEwY2VhYjU0YyAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS91Y2xpYmMvdWNsaWJj
Lmhhc2gKPj4gKysrIGIvcGFja2FnZS91Y2xpYmMvdWNsaWJjLmhhc2gKPj4gQEAgLTEsNCArMSw0
IEBACj4+IC0jIEZyb20KPj4gaHR0cHM6Ly9kb3dubG9hZHMudWNsaWJjLW5nLm9yZy9yZWxlYXNl
cy8xLjAuNDQvdUNsaWJjLW5nLTEuMC40NS50YXIueHouc2hhMjU2Cj4+IC1zaGEyNTbCoCBjMmY0
YzZiNmUxOWQ3YzljMjI2OTkyYTM3NDZlZmQ3YWI5MzIwNDA0NjNjMTVlZTBiYzhmNDEzMmI1Nzc3
YWM0wqAKPj4gdUNsaWJjLW5nLTEuMC40NS50YXIueHoKPj4gKyMgRnJvbQo+PiBodHRwczovL2Rv
d25sb2Fkcy51Y2xpYmMtbmcub3JnL3JlbGVhc2VzLzEuMC40Ny91Q2xpYmMtbmctMS4wLjQ3LnRh
ci54ei5zaGEyNTYKPj4gK3NoYTI1NsKgIDI5YTRkNjg0YTA2ZGEzNDRlZTNlZTA5YWNjMmNhNzY0
OWQ1OTJhZTNmZjg0OGY2OTgxNDVjNDZkZWYwNWVmY2LCoAo+PiB1Q2xpYmMtbmctMS4wLjQ3LnRh
ci54ego+PiDCoCAjIExvY2FsbHkgY2FsY3VsYXRlZAo+PiDCoCBzaGEyNTbCoCA2MDk1ZTlmZmE3
NzdkZDIyODM5Zjc4MDFhYTg0NWIzMWM5ZWQwN2YzZDZiZjhhMjZkYzVkMmRlYzhjY2MwZWYzwqAK
Pj4gQ09QWUlORy5MSUIKPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdWNsaWJjL3VjbGliYy5tayBi
L3BhY2thZ2UvdWNsaWJjL3VjbGliYy5tawo+PiBpbmRleCA4ODYyMzg0MGJmLi5hN2IxODEzM2Zm
IDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL3VjbGliYy91Y2xpYmMubWsKPj4gKysrIGIvcGFja2Fn
ZS91Y2xpYmMvdWNsaWJjLm1rCj4+IEBAIC00LDcgKzQsNyBAQAo+PiDCoCAjCj4+IMKgCj4+ICMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4+IMKgIC1VQ0xJQkNfVkVSU0lPTiA9IDEuMC40NQo+PiAr
VUNMSUJDX1ZFUlNJT04gPSAxLjAuNDcKPj4gwqAgVUNMSUJDX1NPVVJDRSA9IHVDbGliYy1uZy0k
KFVDTElCQ19WRVJTSU9OKS50YXIueHoKPj4gwqAgVUNMSUJDX1NJVEUgPSBodHRwczovL2Rvd25s
b2Fkcy51Y2xpYmMtbmcub3JnL3JlbGVhc2VzLyQoVUNMSUJDX1ZFUlNJT04pCj4+IMKgIFVDTElC
Q19MSUNFTlNFID0gTEdQTC0yLjErCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
