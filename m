Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D67C98302
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 21:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEB316064D;
	Tue, 22 Sep 2026 21:04:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZODa-vY8td7n; Tue, 22 Sep 2026 21:04:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BB08460801
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790111097;
	b=srvA03Jr4h2P6gbSyLLuYIBCfXzyEmO0PEdoTsGaCyD74ktna6cnve7fXQXiPFtUCPZr
	 7c32dNvvXPSDkjRlTUboPa5UMN2uTwci19HoQezBMMaNbyJXNrlTqRm9erigcfqf5dUjl
	 ICdBNNVL2zx5wZipjGjPSNnYyi5yNCOQmh8LDImBtrTtRqLZiN6XrW8D0wJkwxo7ZC3ET
	 4lgQf0wL3bOjTOSL8nC4d39D8Aq9UWB091RYOC3oXUMGv3pxR3xKDPrwqSCwd1XMSGUqV
	 zZm0KGmvt7J1WuMxbNubfQK/dEnLMEoBGDLxAGHHk7cvJ60h18YIU82wHPBp661nWJw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790111097;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:From:To:Cc:Date:In-Reply-To:References:
	 User-Agent:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=LL9OuHXOWpAZeGdRYH+o8C1uyFJQfPHFVuoAFhEZwhk=;
	b=DPA01R8K21BiKUvf5/YsnMho7xzUH6rzdD0zNptM32eLZuWWOkn/GKzGGrqUo1nmkaFB
	 91zRX6n0lXhcCYglRgGI995BNHPzIkRPjo2f8uWBdKer2chX7zrh3MiLcbz2V20jzroSo
	 saltCr7W/Wk9D2u0WQSK89jbWkLQC7Y69u+OrPuPjVnfy7QgHsh+2QBLOPRD3mW99/PH9
	 Neuc/3eSOxmQNXWoO16KztAi9a4b21SWnZFl880lB8Xa7d7I4/39rIBQiNOIXPZ9qjpjY
	 YCmE3GMcIuqdLIdgYURR4DLxBIhpYnMQZGuLVpzcZNhQhQ7FWszv6zkBcMba6MfPg9w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790111097;
	bh=LL9OuHXOWpAZeGdRYH+o8C1uyFJQfPHFVuoAFhEZwhk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bokIJ5U2G6ZXwQaGtu5ovDXPkC5QhyIgmTaD5iVznjssdWAbWYWMmOJgTLRWGSbIF
	 QTXUnqE6OO499sjb7La83Ddkgkgvsodn+PjIYjpkOkDWvliIgxLkW8oZqoyX0iHWLm
	 ev2OSx2PInEKTaKKuSJ2EV0TrI0gNQoRdF4P1qjlzeZKkxOpJkOWdM66gnxGtNCair
	 gBWEwEJ2ZvgYEq7vk0CnCBqGtzwIakQquQ7FlshIhltntTZrChb7oLMzFb96cRtUmj
	 ACSf/az+r35Uf8Gyt7/dQNWriOtKvqd4aWs+zCpUvi4bAe1tITymwaVDApOBUK036j
	 OtjRTokr9EB+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB08460801;
	Tue, 22 Sep 2026 21:04:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF28524E
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 21:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0B85407F9
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 21:04:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K4W5Fhf0vTgd for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 21:04:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 552C84073B
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790111094;
 b=L2K6Aoj8qtexzrE3/p0SFkTrULonX9fi41KFAyZT+n8NuWrHvkqYcV/tMimjfxITouAb
 GQ0wShsv73Rkgfcnz82fICWdc8JpsLDRYlnrXI8fpMywGPfJM57Hd7YaG48C5gW2qIl8t
 quA8X5ViZ+y4cLn09NFmMCXje6W44tJs+HLkkdo/OCBKDLUrUaqDywBndDzPlY2LZvqSA
 KJZBVCCTlK6MZrakyosNaQ8j8zioPLOt6XwfCughOSfJ+B73Y8nB3SLOnFMTUD9851Owk
 +YbWpzBpc0VC91Ryhge9PFeHXol463j06j+Pl3LDfRsPCuvkAPIE8HMc9YuGIbus32Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790111094;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
 From:To:Cc:Date:In-Reply-To:References:Content-Type:
 Content-Transfer-Encoding:User-Agent:MIME-Version;
 bh=3g18zRWZzCPy7YJ9SwKSsv15G7SBvQoRGRiU78nVfe4=;
 b=Fy4oWCvJwqwsPNFVomWUNvqJE6pLOfuj3K66ZowAg7rB6VOO6yvkv9uhkFj7LKIpo248
 sjj7T2UjcHhcTb9i+fPZg3jHJtLE42g5RK2FhWlUHyVs9Vz/ngqJRyu4M/isl9fhzwYdf
 QBQvWJy9/g3kRWjpnYrSQhCyjBVbgb40nrnNplx3CS9ra1pOyOQm/4ouFz4n8NFAo/WW7
 artTjYpvul1BUcAh2EOJ2WhCyw9FJTHyu5NY5xVylP9k22N3PhlcSyaHRJTkWR0f/Wwy4
 NWWyA6WP4DKEA1z5RGEGEeSsBlHlglxZCGJE8h6Z1huqzUxdsN77UPca3lUTmrw8QsQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="gvEr8vg/"; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=gvEr8vg/
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 552C84073B
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 21:04:53 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f633ecdeso292903f8f.2
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 14:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790111092; x=1790715892; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=3g18zRWZzCPy7YJ9SwKSsv15G7SBvQoRGRiU78nVfe4=;
 b=gvEr8vg/LHhmSpxxaCwPyy/qEHdIbxZ2mDspoEI2U7h8zVkNHHeMmmHH0M+KUsOqwS
 b6kiEjBYkQjlN9qo2kGbe9J0r8pHjTOBZIytBdtAsjxXYQIJjO3R71FYd82YYgK32hYj
 3ahj5MgJ4MsN8gSNS/pYx/bUYOKbD99UbpTLlTwGKQoavfvwaXVI0zDcUlOhNQA6Gxfr
 cqnZWYxcRS2jCVSdSbPAVc7MDOrHiDVwmnVJ4Upu5vMvIvAPlv213NHbtuIfyn8pysg8
 JpgYf7T0haB6WSqKeWSxOj76d3ZXV31ynewe0kzRWB6cvbOnp4VnukfGPOypWME8SVxC
 Hr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790111092; x=1790715892;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3g18zRWZzCPy7YJ9SwKSsv15G7SBvQoRGRiU78nVfe4=;
 b=h8xx5lESs8iiTsRzaKn+AiFHCRKQ1Vg/7ejSlsa5Uyv34/1DAPzzH4MpSZhJ73Seuu
 S20zquximivZNyLh4Vr7XJlBBehhxCHkxUMah/ePZTkk0/gZZvqjvGesYE7eRUB5vfO3
 Mam1Bm5D1rdaZe6ku7fFUymC5v7IHt8JWY5BgqiA9vfeCU93O0d1NvHeRcWQbTE0BqwV
 4JMAuuT+1IRwU5bWDH7GdxcCid+BEvbWHDi95kZnDjHMHK0i2c5BZJVT62f2wOLbn1Nx
 NRHFHhpQp14xyqXq02P8Qwol7BpNONJuCBwIL9+DtqqKGkxWZP9uU2sFSHe8yLH/cITd
 GICg==
X-Gm-Message-State: AFuF++l5rPHwDapOSlqxBACQ1h3LVTTmf62rU/TqLKaYOeystw8tCzbp
 VVS1nzdO0inqlPY8Jsm+Y9oQjp1RVgMcJCaAk1QqkCJf+Fxb4IWTr2jh87DDIg==
X-Gm-Gg: AYBFou14XsJJUw3OS7mCjt0ehQQ3EIJi5f5Bm9zsIyRYJnXrweF0LOQqd3Fqc1x7Pz+
 oclVQ4f6rW0+kkAd3xMXHjbdlEpX+HPAoh8rgG81MWMu/dCfTg1Kv54yZbOvBkFfE5vypMknbFe
 DvnJsBElnap62z1oVzZH/TTvdw2Xgnp2kebJPwzS+1tn6sSEYS0Y9nhPMd3yHaG3Q3d2ML5gNWO
 zVfJ7NaIT3VWM8I/U4Ld5e2WIG/LHpOfL1r1I2ddl20rCZxPv/9FfbLtSkKzusDrUE+zIyLFeOW
 YSTpsJfqJQD+fkmirMDYvIBbowIPIEvoBqZ2cJXmlrhizOob7TLPMVfTSPCBhqA2ZTOVq7uvoNK
 fMaQRxOR+c7dFzCUGaTzx9reT5dDzpiAz+6h3hQCGgAr+YWmbEbGTqGjPEBNEDMeNLhwS3mJ3N6
 8j2gZPZOEDywN9UzXh6YM3oPHAWc8MFRn5HtnqOIhZ8ILdxa/drMraD5B/UYUMCgYIIEEnbtaDv
 BtavWJOAb1q8pO+cJeotS3LE4TTqZ4nOpY1XcuTz8k/8D28YhXtoA==
X-Received: by 2002:a5d:5d08:0:b0:485:ac35:5c5d with SMTP id
 ffacd0b85a97d-4886705d7f2mr1236531f8f.15.1790111091651; 
 Tue, 22 Sep 2026 14:04:51 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net
 ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4886876c119sm1259090f8f.15.2026.09.22.14.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2026 14:04:49 -0700 (PDT)
Message-ID: <2672439250ad6f6545d3488c42a55ea6c7c6f182.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Date: Tue, 22 Sep 2026 23:04:48 +0200
In-Reply-To: <aqsKYN1FrDn93tGu@windsurf>
References: <20260830180717.96967-1-alexander.sverdlin@gmail.com>
 <aqsKYN1FrDn93tGu@windsurf>
User-Agent: Evolution 3.60.2 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/civetweb: fix underlinked shared
 library
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

SGkgVGhvbWFzLAoKT24gV2VkLCAyMDI2LTA5LTE2IGF0IDIzOjMzICswMjAwLCBUaG9tYXMgUGV0
YXp6b25pIHdyb3RlOgo+ID4gVGhlIGluc3RhbGwgc3RlcHMgcmUtbGluayBsaWJjaXZldHdlYi5z
byBidXQgZG8gbm90IHBhc3MgTElCUywgc28gdGhlIGxpbmsKPiA+IGZhbGxzIGJhY2sgdG8gdGhl
IHVwc3RyZWFtIE1ha2VmaWxlIGRlZmF1bHRzIGFuZCBsb3NlcyB0aGUgT3BlblNTTCBmbGFncwo+
ID4gYWRkZWQgYnkgdGhlIHBhY2thZ2UuIFRoZSBjb3JyZWN0bHkgbGlua2VkIGxpYnJhcnkgcHJv
ZHVjZWQgYnkgdGhlIGJ1aWxkCj4gPiBzdGVwIGlzIHRoZW4gb3ZlcndyaXR0ZW4gYnkgYW4gdW5k
ZXJsaW5rZWQgb25lLCBsZWF2aW5nIFNTTF9DVFhfZnJlZSwKPiA+IEVWUF9EaWdlc3QgYW5kIGZy
aWVuZHMgdW5kZWZpbmVkIGFuZCBicmVha2luZyBhbnkgcGFja2FnZSBsaW5raW5nIGFnYWluc3QK
PiA+IC1sY2l2ZXR3ZWIuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBTdmVyZGxp
biA8YWxleGFuZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4KPiAKPiBUaGFua3MgYSBsb3QgZm9yIHlv
dXIgcGF0Y2guIERvIHlvdSBoYXZlIGEgZGVmY29uZmlnIHRoYXQgcmVwcm9kdWNlcwo+IHRoZSBp
c3N1ZT8gVGhlIG9ubHkgaW4tdHJlZSB1c2VyIG9mIGNpdmV0d2ViIGlzIHJzeXNsb2csIHNvIEkg
YnVpbHQ6CgpJJ20gd29ya2luZyBvbiBhIG5ldyBwYWNrYWdlIHdoaWNoIGJ1aWxkcyBhbiBleGVj
dXRhYmxlIGFnYWluc3QgLWxjaXZldHdlYi4uLgoKPiBCUjJfYWFyY2g2ND15Cj4gQlIyX1RPT0xD
SEFJTl9FWFRFUk5BTD15Cj4gQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOPXkKPiBCUjJf
VE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU5fQUFSQ0g2NF9HTElCQ19TVEFCTEU9eQo+IEJSMl9Q
QUNLQUdFX09QRU5TU0w9eQo+IEJSMl9QQUNLQUdFX0NJVkVUV0VCPXkKPiBCUjJfUEFDS0FHRV9D
SVZFVFdFQl9MSUI9eQo+IEJSMl9QQUNLQUdFX1JTWVNMT0c9eQo+IAo+IHdoaWNoIGJ1aWxkcyBm
aW5lLiBIb3dldmVyLCBJIGFncmVlIHRoYXQgbGliY2l2ZXR3ZWIuc28uMS4xNi4wIHVzZXMKPiBT
U0wgc3ltYm9scyBidXQgaXMgbm90IGxpbmtlZCBhZ2FpbnN0IGxpYmNyeXB0by4KClRoZXJlIHNl
ZW0gdG8gYmUgdHdvIGluZGVwZW5kZW50IHJlYXNvbnMgd2h5IHJzeXNsb2cgY2FuIGJlIGJ1aWx0
IHN1Y2Nlc3NmdWxseToKCmNvbmZpZ3VyZS5hYzoyMTAxIHVzZXMgQUNfU0VBUkNIX0xJQlMobWdf
dmVyc2lvbiwgY2l2ZXR3ZWIpIHdpdGggbm8KYWN0aW9uLWlmLW5vdC1mb3VuZC4gVGhlIHRlc3Qg
bGluayBpcyBhbiBleGVjdXRhYmxlIGFuZCBkb2VzIGZhaWwgKHVuZGVmaW5lZApyZWZlcmVuY2Ug
dG8gU1NMX0NUWF9mcmVlLCDigKYpLCBidXQgdGhlIGZhaWx1cmUgaXMgc2lsZW50bHkgc3dhbGxv
d2VkOwpDSVZFVFdFQl9MSUJTPS1sY2l2ZXR3ZWIgaXMgaGFyZGNvZGVkIHJpZ2h0IGFmdGVyIHJl
Z2FyZGxlc3MuCgpjb250cmliL2ltaHR0cC9NYWtlZmlsZS5hbSBidWlsZHMgaW1odHRwLmxhIGFz
IGEgbGlidG9vbCAtbW9kdWxlLCBpLmUuIGEgc2hhcmVkCm9iamVjdC4gR05VIGxkIG9ubHkgZXJy
b3JzIG9uIHVuZGVmaW5lZCBzeW1ib2xzIHB1bGxlZCBpbiBmcm9tIHNoYXJlZCBsaWJyYXJpZXMK
d2hlbiBwcm9kdWNpbmcgYW4gZXhlY3V0YWJsZTsgZm9yIGEgc2hhcmVkIG9iamVjdCBpdCBhbGxv
d3MgdGhlbS4KClNvIG5vdGhpbmcgaW4tdHJlZSBldmVyIGxpbmtzIGFuIGV4ZWN1dGFibGUgYWdh
aW5zdCAtbGNpdmV0d2ViLCB3aGljaCBpcyB3aHkKdGhlIGJ1ZyBpcyBpbnZpc2libGUgaW4gdGhl
IGF1dG9idWlsZGVycy4gSXQgaXMgc3RpbGwgYSBsYXRlbnQgcnVudGltZSBidWc6CnJzeXNsb2dk
IGRsb3BlbidpbmcgaW1odHRwLnNvIG9ubHkgd29ya3MgYmVjYXVzZSByc3lzbG9nIGl0c2VsZiBk
cmFncwpsaWJzc2wvbGliY3J5cHRvIGludG8gdGhlIGdsb2JhbCBzY29wZS4KCj4gV2hhdCdzIG1v
c3RseSBtaXNzaW5nIGZyb20geW91ciBjb21taXQgaXMgYW4gaW5kaWNhdGlvbiBvZiB3aGF0Cj4g
aW50cm9kdWNlZCB0aGUgcHJvYmxlbS4gSXMgdGhpcyBhIHJlY2VudCBpc3N1ZT8gRG9lcyBpdCBl
eGlzdCBzaW5jZQo+IGNpdmV0d2ViIHdhcyBhZGRlZCBpbiBCdWlsZHJvb3Q/Cj4gCj4gT3IgcGVy
aGFwcyBzaW5jZSBMSUJTIHdhcyBzdGFydGVkIGJlaW5nIHVzZWQgaW4gY29tbWl0Cj4gM2NmNWIz
MDE5MTE4Y2RjOTgwNjY2ZDdhMWNjZmQyOWY2NThkMDI2MSA/CgpJdCBzZWVtcyB0byBiZSBkYjQ3
YmM5OTk3NmMyZDRmZmI1MDk2MjBhNzZjZmRkMzY5YjMwNTU5CigicGFja2FnZS9jaXZldHdlYjog
YnVtcCB2ZXJzaW9uIHRvIDEuMTEiKSwgd2hpY2ggaW50cm9kdWNlZApDSVZFVFdFQl9CVUlMRF9U
QVJHRVRTL0NJVkVUV0VCX0lOU1RBTExfVEFSR0VUUywgdGhlIHNsaWIvaW5zdGFsbC1zbGliIHRh
cmdldHMKYW5kIENJVkVUV0VCX0lOU1RBTExfU1RBR0lOR19DTURTIOKAlCBhbGwgd2l0aG91dCBM
SUJTLgoKPiA+IMKgcGFja2FnZS9jaXZldHdlYi9jaXZldHdlYi5tayB8IDQgKystLQo+ID4gwqAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9jaXZldHdlYi9jaXZldHdlYi5tayBiL3BhY2thZ2UvY2l2ZXR3
ZWIvY2l2ZXR3ZWIubWsKPiA+IGluZGV4IGFmMjIxZTkxMzMuLjRmZGQ5NGVjYzcgMTAwNjQ0Cj4g
PiAtLS0gYS9wYWNrYWdlL2NpdmV0d2ViL2NpdmV0d2ViLm1rCj4gPiArKysgYi9wYWNrYWdlL2Np
dmV0d2ViL2NpdmV0d2ViLm1rCj4gPiBAQCAtOTMsNyArOTMsNyBAQCBkZWZpbmUgQ0lWRVRXRUJf
SU5TVEFMTF9TVEFHSU5HX0NNRFMKPiA+IMKgCQlQUkVGSVg9IiQoU1RBR0lOR19ESVIpL3VzciIg
XAo+ID4gwqAJCSQoQ0lWRVRXRUJfSU5TVEFMTF9PUFRTKSBcCj4gPiDCoAkJJChDSVZFVFdFQl9D
T05GX09QVFMpIFwKPiA+IC0JCUNPUFQ9JyQoQ0lWRVRXRUJfQ09QVCknCj4gPiArCQlDT1BUPSck
KENJVkVUV0VCX0NPUFQpJyBMSUJTPSIkKENJVkVUV0VCX0xJQlMpIgo+IAo+IEFuZCBJIGFzc3Vt
ZSBmaXhpbmcgdGhlIGJ1aWxkIHN5c3RlbSBzbyB0aGF0IGl0IGRvZXNuJ3QgcmUtbGluayBhdAo+
IGluc3RhbGwgdGltZSBpcyBub3QgZG9hYmxlPyA6LSkKCkl0IHR1cm5zIHRvIGJlIGEgb25lbGlu
ZXIgaW4gdGhlaXIgTWFrZWZpbGUsIHNvIEknbGwgcHVyc3VlIGFuIHVwc3RyZWFtCmZpeCEgCgo+
IFNtYWxsIG5pdDogZm9yIG1lICJ1bmRlcmxpbmtlZCIgaXMgYSBiaXQgaGFyZCB0byB1bmRlcnN0
YW5kLiBQZXJoYXBzCj4gImZpeCBsaW5raW5nIGFnYWluc3QgZGVwZW5kYW50IHNoYXJlZCBsaWJy
YXJpZXMiIG9yIHNvbWV0aGluZyBsaWtlCj4gdGhhdD8KPiAKPiBUaGFua3MgYSBsb3QhCgpUaGFu
a3MgZm9yIHRoZSByZXZpZXchCgotLSAKQWxleGFuZGVyIFN2ZXJkbGluLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
