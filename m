Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16376C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDD2280EBA;
	Thu,  7 Aug 2025 18:25:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c1GM3cwHzGIk; Thu,  7 Aug 2025 18:25:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 740A680E4A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 740A680E4A;
	Thu,  7 Aug 2025 18:24:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EAA0E10A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D181980DAC
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ieCQ-zM9FOvH for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD5BB80D9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD5BB80D9C
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD5BB80D9C
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:34 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3b78294a233so1051121f8f.3
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591073; x=1755195873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=078SicI5KLIINbxsP4D4gMAxAaE7LiaiEpaEDCPNV4E=;
 b=fx3ghKKTDAR59dLpyYKAvGoo6arEtU3Xr5u8ofWvgkYOs75fkB0AYs+mRQsIw22F7j
 vxTHgElZwoJKT/y/n9l0wlHwcWTAiTOxq+JQYC4xxh44Of0NtccfnennmuSPZN4EqOAC
 1BY/xb/4jYp6AmQEbmQ5Nr6yEei4dkQEkqeE5ZPFGjdmvJWrPlFZlUM7GhnNZv1COMwx
 X8hv4DtyO0Bt/oRJ16+POmS5x5tQnb9+ocaFpdRKQ3O3G+RrQ0HFup/drGkcpI5ffcDi
 K/iZbjjPBFezQOB142Pp7tlRQBJFZEVeLTmuNeMLhd7H9H0AxrrHXjC79MdG6ebJXH9B
 keKA==
X-Gm-Message-State: AOJu0YwD5mRU954WILzd/q5eQaS0CJAaUhAMEW9/mO4o2oLicy/+SI70
 GTXtBbDXrUnVdF4hk1woo37H917tQqYC2Sli43QM4HKoOIX2ZDPw2il3jXe0Nh92M81ix5zCeuQ
 pxvb3
X-Gm-Gg: ASbGncvKecN6wWHC4ZaYupGnWpnhJFkxi1hPJZUT1kPPmeE+v0f+q8x/DN9rnNOZP2e
 fUB7hV+zZPKoFH8ScAHhDe9ioKiPeutrix6aqFWl3e9g4oqbMCAbGZW6Ho9PuzZQqdUpUk2tcdK
 KdJMNLYBCrJkr6QYrJXBqYF9imSaFTgQRvsSAAr7NOpW6Hq9TCkwEmdEIL+axFt1kxzZDnl/VJ6
 7gkZFt/S17THKXsHDn/HFt9/7N79V2Ynj72VDE6jXdq99u4bTo2z/3AFBR9nbNEjdAW0gOvRcC8
 KhZsl3mXc5Xo2EyLsYJEv+A3jTReGdrbPM3mBjmSwj0XBdd9dubWHRvJlvEmMgnP5pOr4BHdvP6
 vpL2TxYo2NG7OxA==
X-Google-Smtp-Source: AGHT+IGiZzuYON62zXwTzn2jc+uSt16EGHcXeNcWJfdhRqvUQC49vTiEzcEmdT5+lb2vbiM2zBOBxA==
X-Received: by 2002:a05:6000:2f84:b0:3a4:f644:95f0 with SMTP id
 ffacd0b85a97d-3b900b7f4acmr179617f8f.54.1754591072824; 
 Thu, 07 Aug 2025 11:24:32 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8fc28a830sm3080486f8f.16.2025.08.07.11.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:32 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:30 +0200
Message-ID: <20250807182432.725558-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250726112630.778035-1-thomas.perale@mind.be>
References: <20250726112630.778035-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591073; x=1755195873; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=078SicI5KLIINbxsP4D4gMAxAaE7LiaiEpaEDCPNV4E=;
 b=dg1ZVKWBdEiGN9/Nlx8JLvNmsWrQj8d12NS1Opr+HJTmIlGOZr8qXksB6coiYnv85y
 DkDzK5Ub4ZmOSpmCT4c/lpNbLeV644kmxOQ/ejQBNnhue79HYyZ5/OYTA7hnc5cdntzb
 iQ9PGaiGh0GhxZQ8myRiX6TkWVV1XR2UsEiH/G1oWFP6HhRxL8mBAejBD00Lvx+R2lXk
 j27et4KyNT/12Sz0gQ8ORDVILLMcIS16sD2ub2WRwRvUsJm1Yc+6Whqch5vp4Xo0Q1aB
 C/PE1dzjGeOHPm8kWUEAa3ELlMob1UvZnKqBWyThoiTW0sD+w7JqO5ctpbfID+0Z3kHs
 e2JA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dg1ZVKWB
Subject: Re: [Buildroot] [PATCH] package/kvmtool: fix build failure w/ musl
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

SW4gcmVwbHkgb2Y6Cj4gU3RhcnRpbmcgR0NDMTQgJ2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0
aW9uJyBhcmUgdHJlYXRlZCBhcyBlcnJvcnMgYnkKPiBkZWZhdWx0LiBXaGVuIGJ1aWxkaW5nIGt2
bXRvb2wgd2l0aCBtdXNsIGxpYmMsIHRoZSBmb2xsb3dpbmcgZXJyb3IKPiBvY2N1cnMgZHVlIHRv
IG1pc3NpbmcgZGVjbGFyYXRpb24gb2YgJ2Jhc2VuYW1lJzoKPiAKPiBgYGAKPiB2ZmlvL2NvcmUu
Yzo1Mzc6MjI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhiYXNl
bmFtZeKAmSBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiAgIDUzNyB8ICAgICAg
ICAgZ3JvdXBfbmFtZSA9IGJhc2VuYW1lKGdyb3VwX3BhdGgpOwo+ICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgXn5+fn5+fn4KPiB2ZmlvL2NvcmUuYzo1Mzc6MjI6IHdhcm5pbmc6IG5lc3Rl
ZCBleHRlcm4gZGVjbGFyYXRpb24gb2Yg4oCYYmFzZW5hbWXigJkgWy1XbmVzdGVkLWV4dGVybnNd
Cj4gdmZpby9jb3JlLmM6NTM3OjIwOiBlcnJvcjogYXNzaWdubWVudCB0byDigJhjaGFyICrigJkg
ZnJvbSDigJhpbnTigJkgbWFrZXMgcG9pbnRlciBmcm9tIGludGVnZXIgd2l0aG91dCBhIGNhc3Qg
Wy1XaW50LWNvbnZlcnNpb25dCj4gICA1MzcgfCAgICAgICAgIGdyb3VwX25hbWUgPSBiYXNlbmFt
ZShncm91cF9wYXRoKTsKPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICBeCj4gYGBgCj4gCj4g
VGhpcyBlcnJvciBjYW4gYmUgcmVwcm9kdWNlZCB3aXRoOgo+IAo+IGBgYAo+IGNhdCA+LmNvbmZp
ZyA8PEVPRgo+IEJSMl9hYXJjaDY0PXkKPiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKPiBCUjJf
VE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU49eQo+IEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9P
VExJTl9BQVJDSDY0X01VU0xfQkxFRURJTkdfRURHRT15Cj4gQlIyX1BBQ0tBR0VfS1ZNVE9PTD15
Cj4gRU9GCj4gbWFrZSBvbGRkZWZjb25maWcKPiBtYWtlIGt2bXRvb2wKPiBgYGAKPiAKPiBUaGlz
IHBhdGNoIGFkZHMgdGhlIHVwc3RyZWFtIGNvbW1pdCB0aGF0IGZpeGVzIHRoaXMgaXNzdWUgYnkg
aW5jbHVkaW5nCj4gdGhlIGFwcHJvcHJpYXRlIGhlYWRlciwgZW5zdXJpbmcgY29tcGF0aWJpbGl0
eSB3aXRoIG11c2wgYW5kIEdDQzE0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXJhbGUg
PHRob21hcy5wZXJhbGVAbWluZC5iZT4KCkFwcGxpZWQgdG8gMjAyNS4wMi54ICYgMjAyNS4wNS54
LiBUaGFua3MKCj4gLS0tCj4gVGhpcyBwYXRjaCBpcyBhIGZvbGxvdyB1cCBvZiB0aGlzIHRocmVh
ZCBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvZTNlOTg2MDkyOTRkNzI0Njc4MGMyZTJhZjUy
MGQxYjdAZnJlZS5mci8KPiAKPiAgLi4ubHVkZS1saWJnZW4taC1mb3ItbXVzbC1jb21wYXRpYmls
aXR5LnBhdGNoIHwgNDggKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNDgg
aW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9rdm10b29sLzAwMDIt
dmZpby1pbmNsdWRlLWxpYmdlbi1oLWZvci1tdXNsLWNvbXBhdGliaWxpdHkucGF0Y2gKPiAKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9rdm10b29sLzAwMDItdmZpby1pbmNsdWRlLWxpYmdlbi1oLWZv
ci1tdXNsLWNvbXBhdGliaWxpdHkucGF0Y2ggYi9wYWNrYWdlL2t2bXRvb2wvMDAwMi12ZmlvLWlu
Y2x1ZGUtbGliZ2VuLWgtZm9yLW11c2wtY29tcGF0aWJpbGl0eS5wYXRjaAo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uZTc1ZWRlNmFmMQo+IC0tLSAvZGV2L251bGwK
PiArKysgYi9wYWNrYWdlL2t2bXRvb2wvMDAwMi12ZmlvLWluY2x1ZGUtbGliZ2VuLWgtZm9yLW11
c2wtY29tcGF0aWJpbGl0eS5wYXRjaAo+IEBAIC0wLDAgKzEsNDggQEAKPiArRnJvbSBiYTY4MzBl
ZWMwZjVhYjczNGIwOTM2NTdiMTZiNTU1ZTA0MzdiOTI3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQo+ICtGcm9tOiBUaG9tYXMgUGVyYWxlIDx0aG9tYXMucGVyYWxlQG1pbmQuYmU+Cj4gK0RhdGU6
IFN1biwgMjkgSnVuIDIwMjUgMjI6MjI6MjEgKzAyMDAKPiArU3ViamVjdDogdmZpbzogaW5jbHVk
ZSBsaWJnZW4uaCAoZm9yIG11c2wgY29tcGF0aWJpbGl0eSkKPiArTUlNRS1WZXJzaW9uOiAxLjAK
PiArQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04Cj4gK0NvbnRlbnQtVHJh
bnNmZXItRW5jb2Rpbmc6IDhiaXQKPiArCj4gK1N0YXJ0aW5nIEdDQzE0ICdpbXBsaWNpdC1mdW5j
dGlvbi1kZWNsYXJhdGlvbicgYXJlIHRyZWF0ZWQgYXMgZXJyb3JzIGJ5Cj4gK2RlZmF1bHQuIFdo
ZW4gYnVpbGRpbmcga3ZtdG9vbCB3aXRoIG11c2wgbGliYywgdGhlIGZvbGxvd2luZyBlcnJvcgo+
ICtvY2N1cnMgZHVlIHRvIG1pc3NpbmcgZGVjbGFyYXRpb24gb2YgJ2Jhc2VuYW1lJzoKPiArCj4g
K3ZmaW8vY29yZS5jOjUzNzoyMjogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0
aW9uIOKAmGJhc2VuYW1l4oCZIFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICsg
IDUzNyB8ICAgICAgICAgZ3JvdXBfbmFtZSA9IGJhc2VuYW1lKGdyb3VwX3BhdGgpOwo+ICsgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+Cj4gK3ZmaW8vY29yZS5jOjUzNzoyMjog
d2FybmluZzogbmVzdGVkIGV4dGVybiBkZWNsYXJhdGlvbiBvZiDigJhiYXNlbmFtZeKAmSBbLVdu
ZXN0ZWQtZXh0ZXJuc10KPiArdmZpby9jb3JlLmM6NTM3OjIwOiBlcnJvcjogYXNzaWdubWVudCB0
byDigJhjaGFyICrigJkgZnJvbSDigJhpbnTigJkgbWFrZXMgcG9pbnRlciBmcm9tIGludGVnZXIg
d2l0aG91dCBhIGNhc3QgWy1XaW50LWNvbnZlcnNpb25dCj4gKyAgNTM3IHwgICAgICAgICBncm91
cF9uYW1lID0gYmFzZW5hbWUoZ3JvdXBfcGF0aCk7Cj4gKyAgICAgIHwgICAgICAgICAgICAgICAg
ICAgIF4KPiArCj4gK1RoaXMgcGF0Y2ggZml4ZXMgdGhlIGlzc3VlIGJ5IGluY2x1ZGluZyB0aGUg
YXBwcm9wcmlhdGUgaGVhZGVyLCBlbnN1cmluZwo+ICtjb21wYXRpYmlsaXR5IHdpdGggbXVzbCBh
bmQgR0NDMTQuCj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGVyYWxlIDx0aG9tYXMucGVy
YWxlQG1pbmQuYmU+Cj4gK1Jldmlld2VkLWJ5OiBBbGV4YW5kcnUgRWxpc2VpIDxhbGV4YW5kcnUu
ZWxpc2VpQGFybS5jb20+Cj4gK0xpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA2
MjkyMDIyMjEuODkzMzYwLTEtdGhvbWFzLnBlcmFsZUBtaW5kLmJlCj4gK1NpZ25lZC1vZmYtYnk6
IFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+Cj4gK1Vwc3RyZWFtOiBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC93aWxsL2t2bXRvb2wuZ2l0L3BhdGNo
Lz9pZD1iYTY4MzBlZWMwZjVhYjczNGIwOTM2NTdiMTZiNTU1ZTA0MzdiOTI3Cj4gK1NpZ25lZC1v
ZmYtYnk6IFRob21hcyBQZXJhbGUgPHRob21hcy5wZXJhbGVAbWluZC5iZT4KPiArLS0tCj4gKyB2
ZmlvL2NvcmUuYyB8IDEgKwo+ICsgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gKwo+
ICtkaWZmIC0tZ2l0IGEvdmZpby9jb3JlLmMgYi92ZmlvL2NvcmUuYwo+ICtpbmRleCAzZmYyYzBi
MC4uOGY4ODQ4OTggMTAwNjQ0Cj4gKy0tLSBhL3ZmaW8vY29yZS5jCj4gKysrKyBiL3ZmaW8vY29y
ZS5jCj4gK0BAIC0zLDYgKzMsNyBAQAo+ICsgI2luY2x1ZGUgImt2bS9pb3BvcnQuaCIKPiArIAo+
ICsgI2luY2x1ZGUgPGxpbnV4L2xpc3QuaD4KPiArKyNpbmNsdWRlIDxsaWJnZW4uaD4KPiArIAo+
ICsgI2RlZmluZSBWRklPX0RFVl9ESVIJCSIvZGV2L3ZmaW8iCj4gKyAjZGVmaW5lIFZGSU9fREVW
X05PREUJCVZGSU9fREVWX0RJUiAiL3ZmaW8iCj4gKy0tIAo+ICtjZ2l0IDEuMi4zLWtvcmcKPiAr
Cj4gLS0gCj4gMi41MC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
