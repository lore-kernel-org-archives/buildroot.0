Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6AEC7115A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 00:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFA8D60BA5;
	Thu, 19 Jun 2025 00:59:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wlwaESm4UfyK; Thu, 19 Jun 2025 00:59:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 206D260B92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 206D260B92;
	Thu, 19 Jun 2025 00:59:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 37834E2
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 00:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3492840AE1
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 00:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogfG-ejOf5JL for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 00:59:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6C75C40B89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C75C40B89
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C75C40B89
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 00:59:34 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-b2fca9dc5f8so228881a12.1
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 17:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750294773; x=1750899573;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CLzEi7H5OGLkNfy7JbNLeurjcm1MdGt2U4Cr0DHWwnM=;
 b=gm55H4NR8EUPlmTsTtDWE8gE88Zwy9V+ikwTWeyh0xAlc2Be7cntMD/fjjH7VRQApf
 VIsejm9bqWBFuDsPpycejGIo1WtWa30WzXIrHzetV+vDMGa8lRMZnj5Yyssyet2ADIBA
 dE8B/7A/2rVuDHWqiWv+1D4BhS2Jk7zrICmfcc+4LjnCw37IbzMA3hySXGrAmr2FvVYz
 DIIjD7X1D8mvs+tYkxP/6ILFuaF+RzKMBBxcndOVaqs7W645jyNQ1UfmmMvM76tll4Bp
 2z3QRbVlsAkJuVpZ/G6cCtIRScPnuW+Ofx85OwrR6WAiBxYsBiDJyFUGdNNGWwzz7gR/
 i6Mw==
X-Gm-Message-State: AOJu0YwbFL6RpS2PnOhizfTho+fkwpbk+l8RvP7xhXVTyyb64CifOHoP
 JtdURthSHyOZNr5+rHv0okmakjCS5astzKPv1r5rBaqdWl0Ey/cBecmUFNqlwDYx
X-Gm-Gg: ASbGncvIy/E0S7LFj9mKrTli/AA9arBM8miEncpRg2vOiDmTZBrqPLqG9rAtV+XoXeV
 ONotQGrukiH33aspkf8qsn/Kt5ZlHbCpbTKw/9KMCgcmz8AdHEc5gdKMByiJ3sg2lWjX5q6Zw66
 9g6715nYLhvl1J3Vsk4s57nDWDBUSg/bSu70n7yZqmG1BrTjCu2y9cuDqy/qdrzspsTpU/DF0db
 Gquat2QfH0nCnfECq/ht3Jbhw8QfscLD0WKpcEAMejdjpcwGcN3x5YlUiKLtmjTwpZ5IFsn/2Y+
 j7JitVcvrbHjRPuQr0DLqEE4r7WXwWQA5UOsjf3NFMnWEWqALxMFbKpAGkFSTQ==
X-Google-Smtp-Source: AGHT+IHiypBhTpiDKMu6t2Oc7KIFdfMdLS2f51XjJs4eMkIzegVFLqRVyRjqNeFWGBYWhnxsfSbh1A==
X-Received: by 2002:a17:90b:52c7:b0:311:afd1:745b with SMTP id
 98e67ed59e1d1-313f1ca8002mr31354314a91.11.1750294773228; 
 Wed, 18 Jun 2025 17:59:33 -0700 (PDT)
Received: from wash.local ([50.46.184.91]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365deb87ddsm107884165ad.177.2025.06.18.17.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 17:59:32 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 18 Jun 2025 17:59:30 -0700
MIME-Version: 1.0
Message-Id: <20250618-virglrenderer-upstream-v1-1-57525ac8406e@gmail.com>
References: <20250618-virglrenderer-upstream-v1-0-57525ac8406e@gmail.com>
In-Reply-To: <20250618-virglrenderer-upstream-v1-0-57525ac8406e@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750294773; x=1750899573; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CLzEi7H5OGLkNfy7JbNLeurjcm1MdGt2U4Cr0DHWwnM=;
 b=Jr8w1kJDZAjDvDoZvUiiaLhzA/SUrKMi8KQZTiipjCH74gfkTT7euSBbE/dfSulOo6
 +Uha+yR25OjjiUr6utuuIPCrl4iAWjJS99uy22gun6leQF8A2QvGskhF1TKt0ALARgSK
 proZeR1lNyYScMxP+C/xaEstdRbkyPuy3X6vsTHI8U1q72/qlHYN1EOtJSePzJku5mR4
 978Hhl+XqlXLKNlynPKxWL+OXSXiYHiuu8PBrQ6kiREWkPeg2C+oz4F53G2H/EIS37pI
 0F95H0ov/R/jwd063N17eFzcVeG2EK4iOFoUBxwViz5n1FpvKWeZey0Ri0RMDk8U25UF
 v1Nw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Jr8w1kJD
Subject: [Buildroot] [PATCH 1/3] package/python-glslang: bump to version
 15.3.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Steve deRosier <derosier@cal-sierra.com>, Bernd Kuhls <bernd@kuhls.net>,
 James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2VlIGNoYW5nZWxvZyBodHRwczovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL2dsc2xhbmcvYmxv
Yi9tYWluL0NIQU5HRVMubWQKCkZpeGVzIGJ1aWxkIGlzc3VlOiBlcnJvcjog4oCYdWludDMyX3Ti
gJkgaGFzIG5vdCBiZWVuIGRlY2xhcmVkLCBlbmNvdW50ZXJlZApvbiBHQ0MgdjE1LCBjYXVzZWQg
YnkgY3N0ZGludCBub3QgYmVpbmcgaW1wbGljaXRseSBpbmNsdWRlZC4KCmh0dHBzOi8vYnVncy5n
ZW50b28ub3JnLzkzNzI2MQoKU2lnbmVkLW9mZi1ieTogSm9zZXBoIEtvZ3V0IDxqb3NlcGgua29n
dXRAZ21haWwuY29tPgotLS0KIHBhY2thZ2UvcHl0aG9uLWdsc2xhbmcvcHl0aG9uLWdsc2xhbmcu
aGFzaCB8IDIgKy0KIHBhY2thZ2UvcHl0aG9uLWdsc2xhbmcvcHl0aG9uLWdsc2xhbmcubWsgICB8
IDUgKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWdsc2xhbmcvcHl0aG9uLWdsc2xhbmcuaGFz
aCBiL3BhY2thZ2UvcHl0aG9uLWdsc2xhbmcvcHl0aG9uLWdsc2xhbmcuaGFzaAppbmRleCBkZjkx
Mjc5MzllZjlkNjJkYzNhNWVhZmNkNzAwMGM0ZWNhYzI2ODY2Li4wNGVjNTMxM2EwYzQ3YjRiYTcy
ZTRjYWM3M2E5OTYxNGVjNmUzMWRiIDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbi1nbHNsYW5n
L3B5dGhvbi1nbHNsYW5nLmhhc2gKKysrIGIvcGFja2FnZS9weXRob24tZ2xzbGFuZy9weXRob24t
Z2xzbGFuZy5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1
NiAgNTkyYzk4YWViMDNiM2U4MTU5N2RkYWY4MzYzM2M0ZTYzMDY4ZDE0YjE4YTc2NmZkMTEwMzNi
YWQ3MzEyNzE2MiAgcHl0aG9uLWdsc2xhbmctMTEuMTMuMC50YXIuZ3oKK3NoYTI1NiAgYzZjMjFm
ZTE4NzNjMzdlNjM5YTZhOWFjNzJkODU3YWI2M2E1YmU2ODkzYTU4OWYzNGUwOWE2Yzc1NzE3NDIw
MSAgcHl0aG9uLWdsc2xhbmctMTUuMy4wLnRhci5negogc2hhMjU2ICBhZGI3ODNlNzM0ZTkwNmQx
ZjQ2ZGI1ZGYyOTk5MWRiZGU4NGJkYjBjZWFiNTAyYWMyZmViYjQ0ZmUzYzJiNWY0ICBMSUNFTlNF
LnR4dApkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZ2xzbGFuZy9weXRob24tZ2xzbGFuZy5t
ayBiL3BhY2thZ2UvcHl0aG9uLWdsc2xhbmcvcHl0aG9uLWdsc2xhbmcubWsKaW5kZXggOTRmNDgw
ZTMwYTFiY2NjMzJmMGQwMmUxZjAwZWU0ODlhOTE5MDRjYi4uNTk0NGViZGIyYzE4YWM5NDhlNDI5
NWVhYjg4NmJiNDZjZTRkZmFlMyAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24tZ2xzbGFuZy9w
eXRob24tZ2xzbGFuZy5taworKysgYi9wYWNrYWdlL3B5dGhvbi1nbHNsYW5nL3B5dGhvbi1nbHNs
YW5nLm1rCkBAIC00LDEwICs0LDEzIEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1Q
WVRIT05fR0xTTEFOR19WRVJTSU9OID0gMTEuMTMuMAorUFlUSE9OX0dMU0xBTkdfVkVSU0lPTiA9
IDE1LjMuMAogUFlUSE9OX0dMU0xBTkdfU0lURSA9ICQoY2FsbCBnaXRodWIsS2hyb25vc0dyb3Vw
LGdsc2xhbmcsJChQWVRIT05fR0xTTEFOR19WRVJTSU9OKSkKIFBZVEhPTl9HTFNMQU5HX0xJQ0VO
U0UgPSBCU0QtMy1DbGF1c2UKIFBZVEhPTl9HTFNMQU5HX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNF
LnR4dAogUFlUSE9OX0dMU0xBTkdfREVQRU5ERU5DSUVTID0gaG9zdC1weXRob24zCitIT1NUX1BZ
VEhPTl9HTFNMQU5HX0RFUEVOREVOQ0lFUyArPSBob3N0LXNwaXJ2LXRvb2xzCisKK0hPU1RfUFlU
SE9OX0dMU0xBTkdfQ09ORl9PUFRTICs9IC1EQUxMT1dfRVhURVJOQUxfU1BJUlZfVE9PTFM9MQog
CiAkKGV2YWwgJChob3N0LWNtYWtlLXBhY2thZ2UpKQoKLS0gCjIuNTAuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
