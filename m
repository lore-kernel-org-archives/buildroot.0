Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C9DC48BC4
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 17:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72F3B4081E;
	Sat, 17 Feb 2024 17:08:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5DrHMoPLLMXx; Sat, 17 Feb 2024 17:08:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 784A240827
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 784A240827;
	Sat, 17 Feb 2024 17:08:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 05B341BF5A8
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 17:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0019A83B22
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 17:08:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n3FCSvpGvXBs for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 17:08:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B8C1A83022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8C1A83022
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8C1A83022
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 17:08:44 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4125e5c0e09so2607445e9.1
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 09:08:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708189722; x=1708794522;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ep80zJGtKhImXBXJvDcmt+gWdo3dezDrkvTFRPgfJEQ=;
 b=J39G/94xPKwnvSp/EY32zvjN+vZCZNR+FQlD4pRim2Sjj84mk5NP32MXGI+1hvOOfT
 FvlzOwejeZyZkx0Md+QZU6p/kMmKYx6E7PMoayIxKjWmlOgxyDQtfYrpcg/y9MlAqmnX
 nYy8cCOdIlnK8E52rX8JvkONwoCcuiYENflaskvpxumMJWdxZe9lAdbJvmUcfcrOxXFW
 ALxxRUAXHsR3d+Xi65iK97KT++91LPTBEeQyA0D2NKqztp9gQh90k2YTNezQvbYDYuYc
 o7KZOf530izEoW8bbnxLKoK9tS2Z0Z271sRsTTiIS1Qb6WsfoWtPm4FopYFkX1vfUj5D
 Pi1w==
X-Gm-Message-State: AOJu0Yw0JBMmFBeyhqNjDBfDcz3TltDT99U7CyYjfwRUTQl/xvEtVIZb
 32MsvgFQKBB8lwN6G24AKyTpaIyuWtyWyilrBC+6MCD3UKfAAU5Pq+btbMaA
X-Google-Smtp-Source: AGHT+IEhq3X2x3jAdej0Gu/SLX097OYw3uZxVZbelnXACcsOgRTXzyvWdVEtcuKj1Dmf3B2ZznigZw==
X-Received: by 2002:a05:600c:19c8:b0:412:529c:356f with SMTP id
 u8-20020a05600c19c800b00412529c356fmr3426299wmq.28.1708189722086; 
 Sat, 17 Feb 2024 09:08:42 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 bd23-20020a05600c1f1700b004125efcef39sm1222533wmb.15.2024.02.17.09.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 09:08:41 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 18:08:40 +0100
Message-ID: <20240217170840.3623044-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708189722; x=1708794522; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=Ep80zJGtKhImXBXJvDcmt+gWdo3dezDrkvTFRPgfJEQ=;
 b=lBkJgqwDESFVbenZC6QShmAFDp8arP8A7RZBB0WwJQJrUZXzjZD5Yk0eb1iC5O7N1h
 Ade8Pf0OZqYSQi1UXPPKT15bOQ11DeGEOG3uvbiXucmrReqyl7LQbVZ9D+t/FKehssuO
 ZBTXd6uSXPZo+q6ZUqE/uSq0DQnYYDuHHYBpqZlquxLmWSRESvkwgx2hos9bpc1B7saf
 fgl2LOaDjUr4cmoVaNAa1EF95luCMKbGPTW+zMP7KfOT9eADDhfKzKtAaXeFJBpa44wt
 NMDFDadgovoKEuUPD6nNIJ8HoXCbVC4NoqPTcFV3qn3FT8FLfGLic6j7yTrYkzOuHiWP
 DqiQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lBkJgqwD
Subject: [Buildroot] [PATCH] package/sudo: fix build with uClibc
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dUNsaWJjIGxhY2tzIHByb2Nlc3Nfdm1fcmVhZHYoKSwgYW5kIHN1ZG8gZmFpbHMgdG8gYnVpbGQ6
CgogICAgLi9leGVjX3B0cmFjZS5jOiBJbiBmdW5jdGlvbiDigJhwdHJhY2Vfd3JpdGVfdmVj4oCZ
OgogICAgLi9leGVjX3B0cmFjZS5jOjg5NTo5OiBlcnJvcjog4oCYbndyaXR0ZW7igJkgdW5kZWNs
YXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4g4oCYcHdyaXRl
4oCZPwogICAgICA4OTUgfCAgICAgICAgIG53cml0dGVuID0gcHRyYWNlX3dyaXRlX3N0cmluZyhw
aWQsIHN0cnRhYiwgdmVjW2ldKTsKICAgICAgICAgIHwgICAgICAgICBefn5+fn5+fgogICAgICAg
ICAgfCAgICAgICAgIHB3cml0ZQoKVGhlIGZpeCBpcyBwcmV0dHkgdHJpdmlhbCwgYW5kIGhhcyBi
ZWVuIHN1Ym1pdHRlZCB1cHN0cmVhbS4KClNpZ25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlh
bm4ubW9yaW4uMTk5OEBmcmVlLmZyPgotLS0KIC4uLmUtZml4LWJ1aWxkLXdpdGhvdXQtcHJlY2Vz
c192bV9yZWFkdi5wYXRjaCB8IDQxICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA0MSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zdWRvLzAwMDEt
c3JjLWV4ZWNfcHRyYWNlLWZpeC1idWlsZC13aXRob3V0LXByZWNlc3Nfdm1fcmVhZHYucGF0Y2gK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL3N1ZG8vMDAwMS1zcmMtZXhlY19wdHJhY2UtZml4LWJ1aWxk
LXdpdGhvdXQtcHJlY2Vzc192bV9yZWFkdi5wYXRjaCBiL3BhY2thZ2Uvc3Vkby8wMDAxLXNyYy1l
eGVjX3B0cmFjZS1maXgtYnVpbGQtd2l0aG91dC1wcmVjZXNzX3ZtX3JlYWR2LnBhdGNoCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmIxYjE4ZDYxMGMKLS0tIC9kZXYvbnVs
bAorKysgYi9wYWNrYWdlL3N1ZG8vMDAwMS1zcmMtZXhlY19wdHJhY2UtZml4LWJ1aWxkLXdpdGhv
dXQtcHJlY2Vzc192bV9yZWFkdi5wYXRjaApAQCAtMCwwICsxLDQxIEBACitGcm9tIDNlNzY1YjZj
NTk3NTA3Nzc1OGU3YjBhMmE5NTVkYzdmN2IyYjk0ZTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tOiAiWWFubiBFLiBNT1JJTiIgPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgorRGF0ZTog
U2F0LCAxNyBGZWIgMjAyNCAxNzo1Mjo0NSArMDEwMAorU3ViamVjdDogW1BBVENIXSBzcmMvZXhl
Y19wdHJhY2U6IGZpeCBidWlsZCB3aXRob3V0IHByZWNlc3Nfdm1fcmVhZHYoKQorCitDb21taXQg
MzJmNGI5OGY2YjRhIChzdWRvIGZyb250ZW5kOiBzaWxlbmNlIG1vc3QgLVdjb252ZXJzaW9uIHdh
cm5pbmdzLikKK2Jyb2tlIHRoZSBidWlsZCBvbiBDIGxpYnJhcmllcyB0aGF0IG1pc3MgcHJvY2Vz
c192bV9yZWFkdigpLCBsaWtlCit1Q2xpYmMtbmcuCisKK0luZGVlZCwgdGhlIHNzaXplX3Qgbndy
aXR0ZW4gaXMgZGVjbGFyZWQgZ3VhcmRlZCBieSBIQVZFX1BST0NFU1NfVk1fUkVBRFYsCitidXQg
aXMgdGhlbiByZS1hc3NpZ25lZCBhbmQgdXNlZCBhIGZldyBsaW5lcyBiZWxvdywgb3V0c2lkZSBh
bnkgZ3VhcmQuCisKK0ZpeCB0aGF0IGJ5IGFsd2F5cyBkZWNsYXJpbmcgdGhlIG9iamVjdCwgYXMg
aXQgaXMgYWx3YXlzIG5lZWRlZC4KKworU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8eWFu
bi5tb3Jpbi4xOTk4QGZyZWUuZnI+CitVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL3N1ZG8t
cHJvamVjdC9zdWRvL3B1bGwvMzU5CistLS0KKyBzcmMvZXhlY19wdHJhY2UuYyB8IDMgKystCisg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQorCitkaWZmIC0t
Z2l0IGEvc3JjL2V4ZWNfcHRyYWNlLmMgYi9zcmMvZXhlY19wdHJhY2UuYworaW5kZXggOWRkMzZj
Mjc1Li4zZDQ0YjgyZTIgMTAwNjQ0CistLS0gYS9zcmMvZXhlY19wdHJhY2UuYworKysrIGIvc3Jj
L2V4ZWNfcHRyYWNlLmMKK0BAIC04NzgsMTEgKzg3OCwxMiBAQCBwdHJhY2Vfd3JpdGVfdmVjKHBp
ZF90IHBpZCwgc3RydWN0IHN1ZG9fcHRyYWNlX3JlZ3MgKnJlZ3MsIGNoYXIgKip2ZWMsCisgICAg
IHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBzdHJ0YWIpCisgeworICAgICBjb25z
dCB1bnNpZ25lZCBsb25nIHN0cnRhYjAgPSBzdHJ0YWI7CisrICAgIHNzaXplX3QgbndyaXR0ZW47
CisgICAgIHNpemVfdCBpOworICAgICBkZWJ1Z19kZWNsKHB0cmFjZV93cml0ZV92ZWMsIFNVRE9f
REVCVUdfRVhFQyk7CisKKyAjaWZkZWYgSEFWRV9QUk9DRVNTX1ZNX1JFQURWCistICAgIHNzaXpl
X3QgbndyaXR0ZW4gPSBwdHJhY2Vfd3JpdGV2X3ZlYyhwaWQsIHJlZ3MsIHZlYywgYWRkciwgc3Ry
dGFiKTsKKysgICAgbndyaXR0ZW4gPSBwdHJhY2Vfd3JpdGV2X3ZlYyhwaWQsIHJlZ3MsIHZlYywg
YWRkciwgc3RydGFiKTsKKyAgICAgaWYgKG53cml0dGVuICE9IC0xIHx8IGVycm5vICE9IEVOT1NZ
UykKKyAJZGVidWdfcmV0dXJuX3NzaXplX3QobndyaXR0ZW4pOworICNlbmRpZiAvKiBIQVZFX1BS
T0NFU1NfVk1fUkVBRFYgKi8KKy0tCisyLjQzLjAKKwotLSAKMi40My4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
