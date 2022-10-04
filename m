Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29177C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 01:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C478E40B26;
	Tue,  4 Oct 2022 01:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C478E40B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5QNRMoHLbXat; Tue,  4 Oct 2022 01:24:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 692F64025F;
	Tue,  4 Oct 2022 01:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 692F64025F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C0C701BF372
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 01:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8CA8831AC
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 01:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8CA8831AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t9kpVojl31Uq for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 01:24:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70F0483123
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70F0483123
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 01:24:43 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id e18so8003864wmq.3
 for <buildroot@buildroot.org>; Mon, 03 Oct 2022 18:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=43B3/ZauD3m0v+wyATI/6/aQo+TJd+DhMMXJv2uWc8k=;
 b=e14wHenYzL3woOINIshZMHBdNCoEB0S0LFzyhWk6b4RAXTu2gEKEzxpnQcGa9Knzuo
 y+2VNauYT4KR62bP1Ecm/GKllXjlgGf4W7x6NoKQ9RQ+uIY0CJsVUvfZHOlbY7HAYcsR
 wYxR8irklUYyBiJIRUPHsl9Ajhu1MYBy3l5GSE8Zn0CkpnuYmv4Og4/ZS2m8jC1Ge0ZU
 MBLZzxpBdJ1IcLUdSuoXk2BMaixUSNTQ42viuvFZ/CaHOTR6SvH97cFgs13TDeemOeDV
 u1Cy0IHwXiQWQZrNNQqgdYqLr3cWqAz6hjk2IlmN+tk7EfzTtvUEJ4x7pOAQBhYEh0Gj
 pZVQ==
X-Gm-Message-State: ACrzQf1vsJvDLzzGhVJCG47XR3lxKHRmfhpmy5Z8t7MsI1ZUrLLs+L27
 p1em8IhesaKyrWTZqloTMfd3hIzX7MdsUQ==
X-Google-Smtp-Source: AMsMyM7CjHW7ltuLc96rU5+yn/z/Jd84cST6rMcTl0M0ibWaILWBC1VyE8VcHdsKs8OC1r/48FhPBA==
X-Received: by 2002:a05:600c:221a:b0:3b4:75b8:3f7f with SMTP id
 z26-20020a05600c221a00b003b475b83f7fmr8239086wml.175.1664846681594; 
 Mon, 03 Oct 2022 18:24:41 -0700 (PDT)
Received: from localhost ([207.188.148.24]) by smtp.gmail.com with ESMTPSA id
 bv7-20020a0560001f0700b0022cdbc76b1bsm10561406wrb.82.2022.10.03.18.24.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 18:24:41 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 03:24:34 +0200
Message-Id: <20221004012434.1302887-1-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=43B3/ZauD3m0v+wyATI/6/aQo+TJd+DhMMXJv2uWc8k=;
 b=pMlDe87c55TbXcJ3ZJdV0OKqiLbLcu69vdgGf1chOUmnXmvh9Y8W1CIfStGoavX3I7
 pZGKN1yQJwWKc6e21Wyf9OqXiiKK/8xLA/AQiPyOqVmZts5QZm3z59yxBBgIkxcZHm5G
 Vz/hGsjJ1bqIOSTpVUf+ArWs7XA35RtyJy1kKIu2BU1Wle/ccXVoQl4TTNcr7hMvJeFP
 aMw/3R0y4mzVM1gi1sVNhcakTh2xHa/xBQL0mOtpkHcX6NZstGYHe3rgkt5QHBXS43o8
 0oOrWsqWl70nnUyGFaSTajN34lSMhpCiH3N8EFYa68Bn1fAI8NuMv4EVfJFMH3amD7Rt
 FGhQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pMlDe87c
Subject: [Buildroot] [PATCH 1/2] package/zfs: bump version to 2.1.6
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
Cc: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVp
c0BnbWFpbC5jb20+Ci0tLQogcGFja2FnZS96ZnMvemZzLmhhc2ggfCA0ICsrLS0KIHBhY2thZ2Uv
emZzL3pmcy5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS96ZnMvemZzLmhhc2ggYi9wYWNrYWdl
L3pmcy96ZnMuaGFzaAppbmRleCA0MTFhZjk3NGM2Li5iNzNmYzNiNzAzIDEwMDY0NAotLS0gYS9w
YWNrYWdlL3pmcy96ZnMuaGFzaAorKysgYi9wYWNrYWdlL3pmcy96ZnMuaGFzaApAQCAtMSw1ICsx
LDUgQEAKLSMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvcmVsZWFzZXMvZG93
bmxvYWQvemZzLTIuMS40L3pmcy0yLjEuNC5zaGEyNTYuYXNjCi1zaGEyNTYgIDNiNTJjMGQ0OTNm
ODA2ZjYzOGRjYTg3ZGRlODA5ZjUzODYxY2QzMThjMWViYjBlNjBkYWVhYTA2MWNmMWFjZjYgIHpm
cy0yLjEuNC50YXIuZ3oKKyMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvcmVs
ZWFzZXMvZG93bmxvYWQvemZzLTIuMS42L3pmcy0yLjEuNi5zaGEyNTYuYXNjCitzaGEyNTYgIDE1
MzM5MDE0ZjhkMjEzMTM0OGViOTM3YmY4ODkzODQ5ODA2YjZkMjY0NWVhNjA3YTE4YzdmMTE3NzQ5
ZGJkN2EgIHpmcy0yLjEuNi50YXIuZ3oKIHNoYTI1NiAgOTZhMjczNTNmZTcxN2ZmMmM4Yjk1ZGVi
OGIwMDljNGViNzUwMzAzYzY0MDBlMmQ4YTI1ODJhYjFlYzEyYjI1YSAgYmMzZjEyYmZhYzE1MmEw
YzI4OTUxY2VjOTIzNDBiYTE0ZjljY2VlOS5wYXRjaAogCiAjIEhhc2ggZm9yIGxpY2Vuc2UgZmls
ZXM6CmRpZmYgLS1naXQgYS9wYWNrYWdlL3pmcy96ZnMubWsgYi9wYWNrYWdlL3pmcy96ZnMubWsK
aW5kZXggOTAwYTcyZjk5Ny4uZjdlNjczYzIzZiAxMDA2NDQKLS0tIGEvcGFja2FnZS96ZnMvemZz
Lm1rCisrKyBiL3BhY2thZ2UvemZzL3pmcy5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCiAKLVpGU19WRVJTSU9OID0gMi4xLjQKK1pGU19WRVJTSU9OID0gMi4x
LjYKIFpGU19TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rv
d25sb2FkL3pmcy0kKFpGU19WRVJTSU9OKQogWkZTX1BBVENIID0gaHR0cHM6Ly9naXRodWIuY29t
L29wZW56ZnMvemZzL2NvbW1pdC9iYzNmMTJiZmFjMTUyYTBjMjg5NTFjZWM5MjM0MGJhMTRmOWNj
ZWU5LnBhdGNoCiBaRlNfTElDRU5TRSA9IENEREwKLS0gCjIuMzcuMwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
