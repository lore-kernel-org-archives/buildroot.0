Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5F4CA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 11:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BA9061247;
	Wed, 10 Sep 2025 11:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mX2OjwVX70K9; Wed, 10 Sep 2025 11:19:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DE52611ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DE52611ED;
	Wed, 10 Sep 2025 11:19:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D8D010E
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A653B60BBB
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5jgLptu0y_3 for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 11:19:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B04BE60B69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B04BE60B69
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B04BE60B69
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:19:50 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-55f7c0fb972so7300022e87.3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 04:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757503188; x=1758107988;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tSyIPgQdB3tySAtu0vKeuS3LN8lmHcUEB3PotrWpAQQ=;
 b=PYXh9ohSSSw3idcO2oPwfc8wrxcab0Hl+VEUZ5qBX8Y2D/5ODI8CZd868/v9VsNoSb
 Kf6B0r1ZJM6f+eTSi4tYNj8KTf0H+lbldOw6s+jFBQeaYZWvLq97lhrGpk3A5mL6ZuSG
 Rja9TvAOzFCNtT6QCKLuoCoW0mWfSw+ojd2DfFCx2253JQaXFlyYEE6Yr9MBsLDOdHlE
 wX92Wc35wgfynah4irjR3FuVN3Nx1nTSE7sbCyi0Dld5I95H7Oj3k6OEN3L+N1mTt+pC
 Q4fYge46UuSFtgonYJppbZS98giQNOmdpU29zm8UexQbh4E4Ov/vr0yLNAwKo+FgLgLe
 fwpA==
X-Gm-Message-State: AOJu0YyCekkwFSb24JcqKuQnl7VZibRg7ks8/swYsIclsFNTQQDSQop6
 egKyXrJ75yOAZZOFwCxt7uclMTxJ+9bGJJKuLU1p/gc77TDkjt8oGWXduOKheFsgZo0=
X-Gm-Gg: ASbGnct9bwKmSBywBZshvOXRA2sU8PRAPxg1rLdjXkoNeiUnF9HSkrcAixEm9F54PEH
 HImj3jmhQzYbTWoXzA5twZgfhgXrF5FF63V6Nwo+kiy4JwAn6ZDt8kc6/T6QBo6Qx6DpvnY0z6Z
 Ruy8JxszkTj1BLB+0AG0VCvBwXEJIaciaCCJKyl0oJgOYR6iFM5c2zvHXEM3ZB0riooj+0W80bh
 aQgK7xprFBJglf0K963w0EMF3K38Yu8E/w+hvvmsVn3s+S7JRWo1QKrlncWkD6InCSv47SG8CeC
 IaAd6ceOb5QzQ/cXuqkCXt+eHBxkcqYSh21MUPPlgYHrj3ERayFxdrHIJmG55QyfbyksID6Lo+K
 +EyvjNA8R4c1A3b6OAfktGcr7/6Qw3IIar6KDVkFk6rsFoVPOJYSOIfm0m6wazDzYvo8UwzeiyY
 V2Xy2tPw0zJA==
X-Google-Smtp-Source: AGHT+IEfss1TwftJHoJ3ASRt7eUegll9U5FdGh0a6lTl0eZyng9c9vJm7stjFv+gaaq048vMg3/mFQ==
X-Received: by 2002:a05:6512:1150:b0:553:ab9a:c94 with SMTP id
 2adb3069b0e04-56261314101mr4532599e87.6.1757503188031; 
 Wed, 10 Sep 2025 04:19:48 -0700 (PDT)
Received: from [10.5.90.80]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5681795da6bsm1180472e87.94.2025.09.10.04.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 04:19:47 -0700 (PDT)
Message-ID: <69b87840-6431-412e-9f27-a8acb3112a7e@smile.fr>
Date: Wed, 10 Sep 2025 13:19:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Stewart <christian@aperture.us>, yann.morin@orange.com
Cc: Buildroot Mailing List <buildroot@buildroot.org>
References: <cover.1751377540.git.yann.morin@orange.com>
 <d23125d705a0c24ca91071624d507392ecfe7b0d.1751377540.git.yann.morin@orange.com>
 <a8b668d1-24da-4b18-8235-e98a29732884@smile.fr> <aL/bdHOwN/ENpcOl@yd-6wlzhs3>
 <CA+h8R2rxQ6Na-hG=BLZrNvL=Wu5bwur_8YeC3wNdFkjrKfsP4Q@mail.gmail.com>
Content-Language: fr, en-US
In-Reply-To: <CA+h8R2rxQ6Na-hG=BLZrNvL=Wu5bwur_8YeC3wNdFkjrKfsP4Q@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1757503188; x=1758107988; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tSyIPgQdB3tySAtu0vKeuS3LN8lmHcUEB3PotrWpAQQ=;
 b=mWH2bCN23zr6I1joAgatUJkAPYmEQHkOpY45hITu5QM7L3agbcR9wWCnAbz7N0hn9Z
 2oDrqQsJEZwN/sbxEp89DB/3iCox6uSPDEV8j3/xKPi+nz0LN1+ZKneY3cuhwvC8E/fm
 QiJ96muaMDU09RXX9ixC/n/ZOKMsLuhR7fpdQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=mWH2bCN2
Subject: Re: [Buildroot] [PATCH 1/4 v2] package/pkg-golang: simplify
 installing multiple binaries
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwgQ2hyaXN0aWFuLCBBbGwsCgpMZSAwOS8wOS8yMDI1IMOgIDE5OjU2LCBDaHJp
c3RpYW4gU3Rld2FydCBhIMOpY3JpdMKgOgo+IEhpIFlhbm4sCj4gCj4gT24gVHVlLCBTZXAgOSwg
MjAyNSwgMTI6NDfigK9BTSA8eWFubi5tb3JpbkBvcmFuZ2UuY29tCj4gPG1haWx0bzp5YW5uLm1v
cmluQG9yYW5nZS5jb20+PiB3cm90ZToKPiAKPiAgICAgUm9tYWluLCBBbGwsCj4gCj4gICAgIE9u
IDIwMjUtMDctMDUgMjI6NTEgKzAyMDAsIFJvbWFpbiBOYW91ciBzcGFrZSB0aHVzbHk6Cj4gICAg
ID4gTGUgMDEvMDcvMjAyNSDDoCAxNTo0NSwgeWFubi5tb3JpbkBvcmFuZ2UuY29tCj4gICAgIDxt
YWlsdG86eWFubi5tb3JpbkBvcmFuZ2UuY29tPiBhIMOpY3JpdMKgOgo+ICAgICA+ID4gRnJvbTog
Illhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluQG9yYW5nZS5jb20gPG1haWx0bzp5YW5uLm1vcmlu
QG9yYW5nZS5jb20+Pgo+ICAgICA+ID4gQ3VycmVudGx5LCB3aGVuIGEgZ29sYW5nIHBhY2thZ2Ug
ZGVmaW5lcyBtdWx0aXBsZSBfQlVJTERfVEFSR0VUUywgaXQgaGFzCj4gICAgID4gPiB0byBiYXNp
Y2FsbHkgcmVwZWF0IHRoZSBzYW1lIGxpc3QgaW4gaXRzIF9JTlNUQUxMX0JJTlMuCj4gICAgIFst
LVNOSVAtLV0KPiAgICAgPiA+IFdlIG5vdyBjb25zaWRlciB0aGF0IF9JTlNUQUxMX0JJTlMgaXMg
YW4gaW50ZXJuYWwgaW1wbGVtZW50YXRpb24gZGV0YWlscwo+ICAgICA+ID4gdGhhdCBzaG91bGQg
bm8gbG9uZ2VyIGJlIGV4cG9zZWQgdG8gdGhlIHVzZXJzLCBzbyB3ZSBkcm9wIGl0IGZyb20gdGhl
Cj4gICAgID4gPiBkb2N1bWVudGF0aW9uOyB3ZSByZXBocmFzZSB0aGUgY29ycmVzcG9uZGluZyBw
YXJ0IGZvciBfQlVJTERfVEFSR0VUUy4KPiAgICAgPiA+Cj4gICAgID4gPiBTaWduZWQtb2ZmLWJ5
OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluQG9yYW5nZS5jb20KPiAgICAgPG1haWx0bzp5YW5u
Lm1vcmluQG9yYW5nZS5jb20+Pgo+ICAgICA+ID4gQ2M6IENocmlzdGlhbiBTdGV3YXJ0IDxjaHJp
c3RpYW5AYXBlcnR1cmUudXMgPG1haWx0bzpjaHJpc3RpYW5AYXBlcnR1cmUudXM+Pgo+ICAgICA+
IFJldmlld2VkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcgo+ICAgICA8
bWFpbHRvOnJvbWFpbi5uYW91ckBzbWlsZS5mcj4+Cj4gICAgID4gU2luY2UgaXQncyBhYm91dCBh
IHBhY2thZ2UgaW5mcmFzdHVjdHVyZSBjaGFuZ2UsIEkgcHJlZmVyIHdhaXQgZm9yIGEKPiAgICAg
c2Vjb25kIHJldmlldy4KPiAKPiAgICAgV2hhdCBhYm91dCB0aGUgc3RhdHVzIG9mIHRoaXMgc2Vy
aWVzPyBDaHJpc3RpYW4gaGFzIHByb3ZpZGVkIGhpcwo+ICAgICBSZXZpZXdlZC1ieSBhIHdoaWxl
IGJhY2suLi4KPiAKPiAKPiBJdCBzdGlsbCBsb29rcyBnb29kIHRvIG1lIQoKVGhhbmtzIGZvciB0
aGUgcmVtaW5kZXIhCk5vdyB0aGUgMjAyNS4wOCBpcyByZWxlYXNlIChhbmQgbmV4dCBtZXJnZWQg
aW4gbWFzdGVyKSwgd2UgY2FuIGdvIGFoZWFkLgoKQnR3LCBJIHJlcGxhY2VkIDIwMjUuMDggYnkg
MjAyNS4xMSBpbiB0aGUgbGFzdCBjb21taXQuCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoK
QmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IEJlc3QgcmVnYXJkcywKPiBDaHJpc3RpYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
