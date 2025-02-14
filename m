Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CBFC021A6
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 11:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FD5240D6C;
	Fri, 14 Feb 2025 11:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7JHSHAM0PWBc; Fri, 14 Feb 2025 11:10:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B34641554
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B34641554;
	Fri, 14 Feb 2025 11:10:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F6111E3
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 704626FB96
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FwuEvqcjvMS9 for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 11:10:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 84B4E6F80C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84B4E6F80C
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 84B4E6F80C
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:10:50 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5ded6c31344so1863202a12.1
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 03:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739531448; x=1740136248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SpMSoXBucVOuJorKaag1cNydgsdA9wFKVkb5CLj3g+I=;
 b=hRflCp4h2Sn+HmmZlTBxmh9T3nC4XYTvQ+Beop0hkg85SCQ+myiMFP1jDvnhN/+b5z
 53nOWZOOq0Kx6N800S8twkDWh7vEuc0HIP4jlXzY3xNTDdMtWKaanCfV7Q6NlxDmwiUh
 FXI/05rOUwGWSlaWy2TELOyja4QGmCHjDXmGVYUaMwqDjIw5ywHWGA2vqvy8q0A7bnmu
 8iPtE0YTJDYSeMraGq/9no5BUpiBNtbymwwC7LjBYZoylW3LL+ImT251i6VqdvCbfJG1
 10k44FSiHyFvVNtTNKY3IxFe10voIrhmvdOSvZB02Vi0PybfksJFaZoibUBgVsDYLkCG
 yXjQ==
X-Gm-Message-State: AOJu0YxTjr4ujvrxLhOVrWrEK6/WTHW8U6ds8GhOKGpOE0/jOFTOOz8l
 ARNNjVvAFz9zcY6I5OBpcvPGw++KZCyuf6YArN0aBvM4SLXvqasrc6S+UxBy1v0xw6UihezAj9G
 KAzo=
X-Gm-Gg: ASbGncucgw8BGQdn7fSxC7cybX7cgjyN5JvwYUIvTmRxWyELQ7L6c+VbXnYcOJRvW8U
 gdVV38Y2Zh5qpGJNSEFpQZOrvyc/IPReNx/0dks2v22yoFhqirwGV+CvAv1oab6hbN6rmUj1cH/
 r2Msv3Nx7PD3nQFI2fzpIk+beCrhjV/C5GFPB9ZxUnJhPFEzJb7rg5fEW4evtaWF9Kyr/JDoqIA
 vi3AEeEK7LgTio4CT9oSzG4NBtfUSgQBxIL869Gn6AESDyTck3uHkbuOAF6rBT0/FbTbOOAhDSy
 obq5CeZiqacqzkWWXg==
X-Google-Smtp-Source: AGHT+IFMb1sAkuDZa8CqKQ1/403e1bI6ejh4+MiyQTzUjLWF1toqgDS6dbTlVoYQc/s930QHeR7P/Q==
X-Received: by 2002:a05:6402:538b:b0:5dc:6e27:e6e8 with SMTP id
 4fb4d7f45d1cf-5dec9e99952mr16799620a12.24.1739531448066; 
 Fri, 14 Feb 2025 03:10:48 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba533bdd04sm317437466b.164.2025.02.14.03.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 03:10:46 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5871E619C2;
 Fri, 14 Feb 2025 11:10:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Fri, 14 Feb 2025 11:10:40 +0000
Message-Id: <20250214111044.4096837-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250214111044.4096837-1-alex.bennee@linaro.org>
References: <20250214111044.4096837-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739531448; x=1740136248; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SpMSoXBucVOuJorKaag1cNydgsdA9wFKVkb5CLj3g+I=;
 b=zDG4c+A5rMQm+Hk2M0eR0gTO/w/F1b2ECg2QkEDkE1mgg9lljjuvCCK7XMo+4veyVF
 f2oPxXZDt34eJ+z+vpTgbfWFObR4YEMfnM7CRauil7PiKMsJWRV4n89sSNCUBF22CjPR
 CNfGXvOdq68G5/XpHRIKlK2LT9OAzoPgV/zPIdqflU+i2s4+E3BxrB1XzZVGo1RHUW6R
 hw4+++MTWUv/6Q8k5R5BNXQ3QN2xmyEEHkmhQ6HliKin9RKfGw18Z853GFyiQgnmwBQl
 x/adDCZBRlyVSHrDb/AmlRQG8rjDnf/uAjss8CySmuMnRXsSlyBLeQ5WiVsEzBGgo37B
 dDcQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=zDG4c+A5
Subject: [Buildroot] [PATCH v3 4/7] package/vulkan-[headers|loader|tools]:
 bump to 1.4.307 release
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

VXBkYXRlIHRvIHRoZSBjdXJyZW50IHJlbGVhc2UuIFdlIG5vdyBuZWVkIHRoZSByZWNlbnRseSBh
ZGRlZAp2dWxrYW4tc2RrIHRvIGhhdmUgYWNjZXNzIHRvIHRoZSB2b2xrIGxvYWRlci4KClNpZ25l
ZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KLS0tCiBwYWNr
YWdlL3Z1bGthbi1oZWFkZXJzL3Z1bGthbi1oZWFkZXJzLmhhc2ggfCAyICstCiBwYWNrYWdlL3Z1
bGthbi1oZWFkZXJzL3Z1bGthbi1oZWFkZXJzLm1rICAgfCAyICstCiBwYWNrYWdlL3Z1bGthbi1s
b2FkZXIvdnVsa2FuLWxvYWRlci5oYXNoICAgfCAyICstCiBwYWNrYWdlL3Z1bGthbi10b29scy92
dWxrYW4tdG9vbHMuaGFzaCAgICAgfCAyICstCiBwYWNrYWdlL3Z1bGthbi10b29scy92dWxrYW4t
dG9vbHMubWsgICAgICAgfCAzICsrLQogNSBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS92dWxrYW4taGVhZGVycy92dWxr
YW4taGVhZGVycy5oYXNoIGIvcGFja2FnZS92dWxrYW4taGVhZGVycy92dWxrYW4taGVhZGVycy5o
YXNoCmluZGV4IGIzOGJmY2ZmNDcuLmMzOGZiMmM0MDIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvdnVs
a2FuLWhlYWRlcnMvdnVsa2FuLWhlYWRlcnMuaGFzaAorKysgYi9wYWNrYWdlL3Z1bGthbi1oZWFk
ZXJzL3Z1bGthbi1oZWFkZXJzLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY2FsY3Vs
YXRlZAotc2hhMjU2ICAzMTdlNDY3YTVmYjJlYWE2YTE4Yjk4NGVjNzBmZGJmYWNjZDkzNTk1YTNl
NmY0YmNjZWNhN2QzZmFiMjgwNTA1ICB2dWxrYW4taGVhZGVycy0xLjMuMjYyLnRhci5negorc2hh
MjU2ICA2ZTg0NDViYzEyYzFlMjcwMmMyN2Y0ZjAyZDFhMDU3ZmI4M2Y0MGNjNTZjNmE4ZTQ1ODMx
NDFkNGVhYWQ5MGQ0ICB2dWxrYW4taGVhZGVycy0xLjQuMzA3LnRhci5negogc2hhMjU2ICBhYzI0
ZTVlYTkyMGU0MzE4ZTRkMDJjNDA4NmFlNTFmNTNjZmIwM2ZlZWQwNmMxOGRmMTAxOWU3YWRhMWVj
N2JjICBMSUNFTlNFLm1kCmRpZmYgLS1naXQgYS9wYWNrYWdlL3Z1bGthbi1oZWFkZXJzL3Z1bGth
bi1oZWFkZXJzLm1rIGIvcGFja2FnZS92dWxrYW4taGVhZGVycy92dWxrYW4taGVhZGVycy5tawpp
bmRleCAyMGIyNDgzNjRkLi5iODg5ZGU2OTBlIDEwMDY0NAotLS0gYS9wYWNrYWdlL3Z1bGthbi1o
ZWFkZXJzL3Z1bGthbi1oZWFkZXJzLm1rCisrKyBiL3BhY2thZ2UvdnVsa2FuLWhlYWRlcnMvdnVs
a2FuLWhlYWRlcnMubWsKQEAgLTYsNyArNiw3IEBACiAKICMgTm90ZTogY2hhbmdpbmcgdGhpcyB2
ZXJzaW9uIHdpbGwgYWxzbyBhZmZlY3QgdnVsa2FuLWxvYWRlciBhbmQKICMgdnVsa2FuLXRvb2xz
LCBzbyBwbGVhc2UgdXBkYXRlIHRob3NlIHBhY2thZ2VzIGFzIHdlbGwuCi1WVUxLQU5fSEVBREVS
U19WRVJTSU9OID0gMS4zLjI2MgorVlVMS0FOX0hFQURFUlNfVkVSU0lPTiA9IDEuNC4zMDcKIFZV
TEtBTl9IRUFERVJTX1NJVEUgPSAkKGNhbGwgZ2l0aHViLEtocm9ub3NHcm91cCxWdWxrYW4tSGVh
ZGVycyx2JChWVUxLQU5fSEVBREVSU19WRVJTSU9OKSkKIFZVTEtBTl9IRUFERVJTX0xJQ0VOU0Ug
PSBBcGFjaGUtMi4wLCBNSVQKIFZVTEtBTl9IRUFERVJTX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNF
Lm1kCmRpZmYgLS1naXQgYS9wYWNrYWdlL3Z1bGthbi1sb2FkZXIvdnVsa2FuLWxvYWRlci5oYXNo
IGIvcGFja2FnZS92dWxrYW4tbG9hZGVyL3Z1bGthbi1sb2FkZXIuaGFzaAppbmRleCBlMDllY2Rh
OGE5Li43MjI3MWI3NDUwIDEwMDY0NAotLS0gYS9wYWNrYWdlL3Z1bGthbi1sb2FkZXIvdnVsa2Fu
LWxvYWRlci5oYXNoCisrKyBiL3BhY2thZ2UvdnVsa2FuLWxvYWRlci92dWxrYW4tbG9hZGVyLmhh
c2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICAzYmJhYTVl
ZTY0MDU4YTg5OTQ5ZWI3NzdkZTY2Y2U5NGJmZTMxNDE4OTI1MTQxNzJjZmM5NDUxYzc1NjgwMmQ1
ICB2dWxrYW4tbG9hZGVyLTEuMy4yNjIudGFyLmd6CitzaGEyNTYgIDY2MWY3YjdkMTUzNjUzODQy
MDc3MTM3MmRkODA1MGYyZDIyNGZjZjNhMDIzZjMxZDY2ZWE3NmQ4YWY3YjkxMWUgIHZ1bGthbi1s
b2FkZXItMS40LjMwNy50YXIuZ3oKIHNoYTI1NiAgNDNjMGEzN2U2YTBmYTdmZjNjODQzYjNlYzVh
NGZhYzg0YjcxMjU1OGRkYWMxMDNmYmQ0YzE2NDk2NjJhOWVjZSAgTElDRU5TRS50eHQKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvdnVsa2FuLXRvb2xzL3Z1bGthbi10b29scy5oYXNoIGIvcGFja2FnZS92
dWxrYW4tdG9vbHMvdnVsa2FuLXRvb2xzLmhhc2gKaW5kZXggMjRjMDY5Nzc4NC4uNGM5YmY1OWUw
OCAxMDA2NDQKLS0tIGEvcGFja2FnZS92dWxrYW4tdG9vbHMvdnVsa2FuLXRvb2xzLmhhc2gKKysr
IGIvcGFja2FnZS92dWxrYW4tdG9vbHMvdnVsa2FuLXRvb2xzLmhhc2gKQEAgLTEsMyArMSwzIEBA
CiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICA4Yzc3ZDAyNjk0ZDA1MTZhZTJiYTNmMzcx
ODc0NTY0N2U4N2U3ODhlZjkzZmFhYmIyZTM2NzRmZjMyNjA4MDEwICB2dWxrYW4tdG9vbHMtMS4z
LjI2Mi50YXIuZ3oKK3NoYTI1NiAgNGYwYmFlYWYwNzhjMmE5ZDI5OGI4N2Q2ZDZlZjg1YzNmYWYw
OGYwZjk1YjhhN2Q3ZDdmZjI0M2M2ZGUyNzA3YyAgdnVsa2FuLXRvb2xzLTEuNC4zMDcudGFyLmd6
CiBzaGEyNTYgIGNmYzc3NDliOTZmNjNiZDMxYzNjNDJiNWM0NzFiZjc1NjgxNDA1M2U4NDdjMTBm
M2ViMDAzNDE3YmM1MjNkMzAgIExJQ0VOU0UudHh0CmRpZmYgLS1naXQgYS9wYWNrYWdlL3Z1bGth
bi10b29scy92dWxrYW4tdG9vbHMubWsgYi9wYWNrYWdlL3Z1bGthbi10b29scy92dWxrYW4tdG9v
bHMubWsKaW5kZXggOWY1YmY0NmI3OS4uOWRlZWRhNjA4NiAxMDA2NDQKLS0tIGEvcGFja2FnZS92
dWxrYW4tdG9vbHMvdnVsa2FuLXRvb2xzLm1rCisrKyBiL3BhY2thZ2UvdnVsa2FuLXRvb2xzL3Z1
bGthbi10b29scy5tawpAQCAtMTEsNyArMTEsOCBAQCBWVUxLQU5fVE9PTFNfTElDRU5TRV9GSUxF
UyA9IExJQ0VOU0UudHh0CiAKIFZVTEtBTl9UT09MU19ERVBFTkRFTkNJRVMgPSBcCiAJdnVsa2Fu
LWhlYWRlcnMgXAotCXZ1bGthbi1sb2FkZXIKKwl2dWxrYW4tbG9hZGVyIFwKKwl2dWxrYW4tc2Rr
CiAKIFZVTEtBTl9UT09MU19DT05GX09QVFMgKz0gXAogCS1EQlVJTERfQ1VCRT1PRkYgXAotLSAK
Mi4zOS41CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
