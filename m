Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05D6EF5868
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 08:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8470881124;
	Sun, 15 Feb 2026 08:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3bwv7pZTvwAa; Sun, 15 Feb 2026 08:20:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A142E81125
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771143638;
	bh=WJ2gG/cNdBPCNN4zD/ObRp5diTGLJcA6V4IN+0y+sAA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L+QRpvUHH6bgJkMvFidjOKOwUeikS5Z9h1l3V3MdfXTejvjeT3P5H8XIk5n72gWPR
	 9nc7qgt2XnLaJxuIx07KrJmDr5Cw5nDiniHNPeHETa2BmBvEm6mExKnLgj/TK5tXJ6
	 uGnVz/QJR+llXYuxp3UoOrGzSXbOHYMHp4b/3BJdc+Mn4YgL1HvXhdRsP6WXmKHPPS
	 Q8ZZgsVbeU7ombKZXRixgBGEiuQQZ7biY2aCxWgj4QGPR63uQem0RugAJ8+WiDozT8
	 4S8b5OBTj9aupgAUW8Zp4n6/BqZMyYrbzDzK0TFdGkiMEJ5vnqgAQk19Nvn/KGj5KJ
	 DT6KH50OBbWOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A142E81125;
	Sun, 15 Feb 2026 08:20:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4639C270
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 08:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4366D40A9B
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 08:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XqMPKMd_7E-C for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 08:20:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 40D6940A9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40D6940A9C
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40D6940A9C
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 08:20:33 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-43621bf67ceso1315037f8f.2
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 00:20:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771143631; x=1771748431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4q0kQCkhmPCCLpKfsdtZ6Qhn/dNhd8ZOuPQtEALM3hw=;
 b=nrE0Vs3KUUk0Uyznu3J9BTnGbaaqCfInEvAhKXPlKUGdS3PEAf7bhHtAAIDPuNtV5D
 OOQC8UAb9YKGYR5UQf8YFS33jK2FFbJl9YclIFPlJ9sr8NVW497bu7RSF8HlK/dyGh/7
 izUu6NIvfhiERxQ3OcTqKtLmyINEfqzM1DwhpSbcqyRU+1hv8FhxKArUVeqQyAINJElm
 ZcCY7qH72zYMqA6AmN6eMTvumRSn9Z3rHqfq6vx4Bd97yYXudpCC0p1sy8rUZ2AJuZF1
 /tEmpASaZgHVqWzH8rTzKQY+P0jUWyeUmn6fwkbXMuK6/DWR9WEAgDrFnXkhkLJoFe0k
 RTsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe9ag8GT3VSGDvddSF2MqAtiKf2EfmMpw+2M9d3ZWUV6h4MExIWnQwuHAmrE5IprxJUtUSF4Fw28g=@buildroot.org
X-Gm-Message-State: AOJu0Yxy6u8V5TQhUXLsFY3Vnfb+PGLA2JeJDf6Mxor9SDi/9wojzmlp
 RYaLy26LIlqRwwu3lHTIFeyu4ZFB17o7lK6tLradsj8Rx6DzsXEX5JRXPCIHg5Xga8I=
X-Gm-Gg: AZuq6aIZidUA/69ZnkRHpVJA+WXr3tHE3BRfHg5+xg9rB2krfL88CrdGz1d/pAir7/O
 fLQ3kGT0ypvPVosm5MuJhMp8pLGBaFrFgs4pCQEkiJLGoEXXdm7A/Yi4S1W25UG15Jp/ALvW97U
 9YkuBA59ckAMWGiuU9/DxE/gQ3rae+cvUQAtYxiM+slZ8Iw8jiGMODV0c3wggqdeDKoB3Jg1Xvu
 LgPj7EVd/BwyyZST7dkAP/wRXxZDhhCfOWwNObeBwj8fv1uB2yTa1VQNItlYOFz+bx4k3qM0O5v
 jEDwwB0Eurq0M+eBs26j3N0dr4lWWj4zCB38IGMVdXch8xqrbnRWh45/KZA1DOjMAQLlqzU1vFg
 GtSfGBc0n3k93UeHZPMqnk0PPLGJlgwHXXEb+PvVvKg29HND48HIn40DgZwqI7r24zUP3o817D1
 V/eNmBGxX0nJ3toh4=
X-Received: by 2002:a05:6000:2dc2:b0:436:42fb:154c with SMTP id
 ffacd0b85a97d-4379dba814emr7771036f8f.61.1771143631068; 
 Sun, 15 Feb 2026 00:20:31 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796acf5b9sm15196623f8f.34.2026.02.15.00.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 00:20:30 -0800 (PST)
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 "Marcus Hoffmann" <buildroot@bubu1.eu>, buildroot@buildroot.org,
 "Titouan Christophe" <titouan.christophe@mind.be>,
 "buildroot" <buildroot-bounces@buildroot.org>
Date: Sun, 15 Feb 2026 09:20:25 +0100
Message-ID: <20260215082029.5105-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <DGEUHT8BHE5X.2TU0LU49G6PSC@bootlin.com>
References: <DGEUHT8BHE5X.2TU0LU49G6PSC@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771143631; x=1771748431; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4q0kQCkhmPCCLpKfsdtZ6Qhn/dNhd8ZOuPQtEALM3hw=;
 b=JIs2qsWZ0je1faXuGz5AatE0t6IGw1Df61UuMatA7Oy0xhHCUVfFbJg8hqD3qwGlQJ
 0TA/ikqzUWykophEpkciJ9X6ZT29vSwoBjU8VqJZY5jR4d1z8ULQ96J8dEkpQHxkbFks
 6N8X8YT4FmMe1k1TjPuHMwHiYCp/5VNkyDSiIFYq5NpNBwKg0mCrHfGf4fTjzDYWI3Zn
 DuTuJesLNGBVi0YxGTULaMj8+yDqCiM0tLwC7HssMc5lBXCjzGGQx4ZASX/BEd0Tvtno
 LYfI9GE0R9QtsEPZ9CnazoatjX+PGYghbRTGqm+N8dkTaWkSG/DJNNKphVQfXjff/6AS
 0rxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JIs2qsWZ
Subject: Re: [Buildroot] [git commit] package/m4: bump version to 1.4.21
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxleGlzLCBNYXJjdXMsCgpUaGFua3MgZm9yIHRoZSBub3RpY2UsIHRoaXMgd2lsbCBiZSBw
YXJ0IG9mIG5leHQgd2VlayBzeW5jLgoKUEVSQUxFIFRob21hcwoKSW4gcmVwbHkgb2Y6Cj4gT24g
VGh1IEZlYiAxMiwgMjAyNiBhdCAxMDo1OCBBTSBDRVQsIE1hcmN1cyBIb2ZmbWFubiB2aWEgYnVp
bGRyb290IHdyb3RlOgo+IAo+IEhlbGxvLAo+IAo+ID4gSGkgVGl0b3VhbiwgVGhvbWFzLAo+ID4K
PiA+IE9uIDIvMTAvMjYgMTU6NTksIE1hcmN1cyBIb2ZmbWFubiB2aWEgYnVpbGRyb290IHdyb3Rl
Ogo+ID4+IGNvbW1pdDogaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290
Ly0vY29tbWl0Lzg3NWQ2YWVkYmM2Mzk0ODRlOTIwM2M1YmNkYTFhNTVlY2I3YWQ0YzkKPiA+PiBi
cmFuY2g6IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL3RyZWUv
bWFzdGVyCj4gPj4gCj4gPj4gaHR0cHM6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9tNC1h
bm5vdW5jZS8yMDI2LTAyL21zZzAwMDAwLmh0bWwKPiA+Cj4gPiBXZSBwcm9iYWJseSBuZWVkIHRo
aXMgaW4gdGhlIHN0YWJsZSBicmFuY2hlcyBiZWNhdXNlIGFzIG9mIHRvZGF5IAo+ID4gYXJjaGxp
bnV4IGlzIHNoaXBwaW5nIGdjYyAxNSBidWlsdCBhZ2FpbnN0IGdsaWJjIDIuNDMgYW5kIG00IGZh
aWxzIHRvIAo+ID4gY29tcGlsZSBiZWZvcmUgdmVyc2lvbiAxLjQuMjEKPiA+Cj4gPiAgPiBbLi4u
XQo+IAo+IEkgY2FuIGNvbmZpcm0gdGhhdCBJIGZhaWwgdG8gYnVpbGQgaG9zdC1tNCBvbiAyMDI1
LjAyLnggZHVlIHRvIG15IGhvc3QKPiBoYXZpbmcgZ2NjMTUgYW5kIGdsaWJjIDIuNDM6Cj4gCj4g
ICBDQyAgICAgICBsaWJtNF9hLWMzMnRvbG93ZXIubwo+ICAgSW4gZmlsZSBpbmNsdWRlZCBmcm9t
IC91c3IvaW5jbHVkZS9mZWF0dXJlcy5oOjU0MCwKPiAgICAgICAgICAgICAgICAgICAgZnJvbSAv
dXNyL2luY2x1ZGUvYml0cy9saWJjLWhlYWRlci1zdGFydC5oOjMzLAo+ICAgICAgICAgICAgICAg
ICAgICBmcm9tIC91c3IvaW5jbHVkZS9zdHJpbmcuaDoyNiwKPiAgICAgICAgICAgICAgICAgICAg
ZnJvbSAuL3N0cmluZy5oOjQxLAo+ICAgICAgICAgICAgICAgICAgICBmcm9tIGJhc2VuYW1lLWxn
cGwuYzoyNDoKPiAgIC4vc3RyaW5nLmg6Nzc3OjIwOiBlcnJvcjogZXhwZWN0ZWQgaWRlbnRpZmll
ciBvciAnKCcgYmVmb3JlICdfR2VuZXJpYycKPiAgICAgNzc3IHwgX0dMX0VYVEVSTl9DIHZvaWQg
Km1lbWNociAoY29uc3Qgdm9pZCAqX19zLCBpbnQgX19jLCBzaXplX3QgX19uKQo+ICAgICAgICAg
fCAgICAgICAgICAgICAgICAgICAgXn5+fn5+Cj4gICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gL3Vz
ci9pbmNsdWRlL2ZlYXR1cmVzLmg6NTQwLAo+ICAgICAgICAgICAgICAgICAgICBmcm9tIC91c3Iv
aW5jbHVkZS9lcnJuby5oOjI1LAo+ICAgICAgICAgICAgICAgICAgICBmcm9tIG9wZW5hdC1wcml2
Lmg6MjMsCj4gICAgICAgICAgICAgICAgICAgIGZyb20gb3BlbmF0LXByb2MuYzoyMjoKPiAgIC4v
c3RkbGliLmg6ODI3OjIwOiBlcnJvcjogZXhwZWN0ZWQgaWRlbnRpZmllciBvciAnKCcgYmVmb3Jl
ICdfR2VuZXJpYycKPiAgICAgODI3IHwgX0dMX0VYVEVSTl9DIHZvaWQgKmJzZWFyY2ggKGNvbnN0
IHZvaWQgKl9fa2V5LAo+ICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgXn5+fn5+fgo+ICAg
SW4gZmlsZSBpbmNsdWRlZCBmcm9tIC91c3IvaW5jbHVkZS9mZWF0dXJlcy5oOjU0MCwKPiAgICAg
ICAgICAgICAgICAgICAgZnJvbSAuL3djaGFyLmg6NjksCj4gICAgICAgICAgICAgICAgICAgIGZy
b20gYnRvd2MuYzoyMToKPiAgIC4vc3RyaW5nLmg6Nzc3OjIwOiBlcnJvcjogZXhwZWN0ZWQgaWRl
bnRpZmllciBvciAnKCcgYmVmb3JlICdfR2VuZXJpYycKPiAgICAgNzc3IHwgX0dMX0VYVEVSTl9D
IHZvaWQgKm1lbWNociAoY29uc3Qgdm9pZCAqX19zLCBpbnQgX19jLCBzaXplX3QgX19uKQo+ICAg
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgXn5+fn5+Cj4gICBJbiBmaWxlIGluY2x1ZGVkIGZy
b20gL3Vzci9pbmNsdWRlL2ZlYXR1cmVzLmg6NTQwLAo+ICAgICAgICAgICAgICAgICAgICBmcm9t
IC91c3IvaW5jbHVkZS91Y2hhci5oOjI2LAo+ICAgWy4uLl0KPiAKPiBDaGVycnktcGlja2luZyBN
YXJjdXMnIHBhdGNoIGZyb20gbWFzdGVyIGJyYW5jaCwgY29tbWl0IDg3NWQ2YWVkYmM2Mwo+ICgi
cGFja2FnZS9tNDogYnVtcCB2ZXJzaW9uIHRvIDEuNC4yMSIpLCBhbGxvd3MgdG8gY29ycmVjdGx5
IGJ1aWxkCj4gaG9zdC1tNCB3aXRoIGhvc3QgZ2xpYmMgMi40My4gVGhlIHBhdGNoIGFwcGxpZXMg
d2l0aG91dCBjb25mbGljdCBvbiB0b3AKPiBvZiAyMDI1LjAyLnguCj4gCj4gQWxleGlzCj4gCj4g
LS0gCj4gQWxleGlzIExvdGhvcsOpLCBCb290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5l
bCBlbmdpbmVlcmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KPiAKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
