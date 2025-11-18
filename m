Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F5DCEE355
	for <buildroot@archiver.kernel.org>; Tue, 18 Nov 2025 20:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98CD861AEC;
	Tue, 18 Nov 2025 20:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0eLgCGIS_cAx; Tue, 18 Nov 2025 20:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C15EC61AED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C15EC61AED;
	Tue, 18 Nov 2025 20:48:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A7D2160
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 20:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 703A061AED
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 20:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YiIDoU4dvEp9 for <buildroot@buildroot.org>;
 Tue, 18 Nov 2025 20:48:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=salvador.joseluis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8C83661AEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C83661AEC
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C83661AEC
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 20:48:13 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so37595685e9.3
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 12:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763498891; x=1764103691;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DOlv6fZSEuRLMfJx98R65w1yXa36WOH65PkLjn377Yc=;
 b=crVOietu7hvvMSfT8oaood/igyn3RbzjDjidYD0toaixuWqidNiUt3sszE0CJzkHXH
 5REQc2QjEvlvkOcON0hbKLzEmCxqIFbZK0VEuVxskT67C/w28RNy8/ivHz2eukRyhwEg
 3/VqiYARRPUsmf6T0cL9Ud2tsBPBLV7AXSBI36QhAw93aKer+1AOMK+zl0kEZX1gUDtR
 n1DjL3cwcciLEsAc5TSSZEfyIhjEi5wrFEOtEZzgDWaAO08Yziop8wUHZ+IOkAd5rY07
 JDMFKLb8wogkWv80hBMzQ0qKtY1n9TUYhD56azj2xjGoFW1WCYFyYHUhSwvAM9VpX+TN
 /o7A==
X-Gm-Message-State: AOJu0Yym+qBqQdpPj8CsX462PfJ6rq0Uzg55mOpfApEbIYte/vhJQprp
 YJq/WgYwovvAReHJytOSEah49Ovd+SvFKsUfxgbpUgtkKkG/dkBSV/0aD4J3EA==
X-Gm-Gg: ASbGncsKC5JaQP7RwsXa1NLY8SOmGflocRe8jpnuEUS10Fg16NcEJVlxVn+6FpDAbLP
 Bjvo4+74HsYCFrRrex46hJvI7eAF729GS289RVkjbKaZOJnEwHTSwAfHt+WQ8hmWzPTIt34SMkX
 +dNg72eE3Qsy3GWG8HqWlA5YJx0Vl2ryOdUErjeA2o23IpdoT+D/n/MLuMz/dtnetKnsZ4xLn8r
 /OZ9NBYo/Q93S2pY7rpxjcXCvt4sezS1WHLFFqRbVIboT4UG9Kg/5XUPTmzPa3UqV5VeXOGQUqC
 7oNykRkbMZlWqL38WceLcCRcR2DXqnyVH+ut5uSdbgm3LUqhO5xyRtgRmhY4Z4rwqkxTq1gxFM5
 Fvv+5IftlFFq2IOqd9DCGW/kmDdx+dw5fCeOzmvWyT1EDjg96kMMG27lXRrLb1zB5W6NGanGU7N
 rb9Y4UmRBuJ+lXnlYV7yi+L3R988yBg6wp/3vRsMMMYkU5hxMTS24XbO4zyBqezk/bvW8KqN0PF
 P8/LT3JR5YadK82KhiXx8I2OII=
X-Google-Smtp-Source: AGHT+IFeb3Hj246tZ0kBB7mBlGd1fo0oixHc9lLOHyInvoHS/Rfoji9k85GlssfaMh7RcuE97Ij8Lg==
X-Received: by 2002:a05:600c:1d19:b0:477:582e:7a81 with SMTP id
 5b1f17b1804b1-4778fe50bb3mr140103875e9.4.1763498891269; 
 Tue, 18 Nov 2025 12:48:11 -0800 (PST)
Received: from cuervo.intranet.jlsalvador.online
 (144.85-87-138.dynamic.clientes.euskaltel.es. [85.87.138.144])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477b10260adsm8942905e9.7.2025.11.18.12.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:48:10 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
Date: Tue, 18 Nov 2025 21:47:26 +0100
Message-ID: <20251118204725.1186221-2-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763498891; x=1764103691; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DOlv6fZSEuRLMfJx98R65w1yXa36WOH65PkLjn377Yc=;
 b=ZrP1jjWl6YGqCAToEK0xv60LxiKYWwpxoE54Bd64ghB08k6zBLJORJLVAbFyGOYC6N
 HWr+S7axQ+BbqCrv4gCaGgQIw098RCT0Lv4FzZQF7e8ESdlicKp37GNqqFKKkB7bggXj
 zhxZtd9IYsGl4jMCPHDKLEsBYs4nZvNU47Ldcr4KTEC8csEQmvfYmkoB8CHqcePxjIvi
 VFI6uNgSwK42G8KHQ/D7L1iqqldLQp88sj/eCUVUg14/q5l7tFWToMSXbP+YZDcP+za2
 JpYXk5GPd2Lk7f+5szdON49vs1XKROjynyrjPaJ4qpFRVqQXeL3qCevCNY+plSAivFBc
 1nVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZrP1jjWl
Subject: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.3.5
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

Rm9yIHJlbGVhc2Ugbm90ZSwgc2VlOgpodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvcmVs
ZWFzZXMvdGFnL3pmcy0yLjMuNQoKU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBS
dWZvIDxzYWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+Ci0tLQogcGFja2FnZS96ZnMvemZzLmhh
c2ggfCA0ICsrLS0KIHBhY2thZ2UvemZzL3pmcy5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS96
ZnMvemZzLmhhc2ggYi9wYWNrYWdlL3pmcy96ZnMuaGFzaAppbmRleCAwZjMwOTE1NWFlLi42ZWJj
ZmI3YTNkIDEwMDY0NAotLS0gYS9wYWNrYWdlL3pmcy96ZnMuaGFzaAorKysgYi9wYWNrYWdlL3pm
cy96ZnMuaGFzaApAQCAtMSw1ICsxLDUgQEAKLSMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vb3Bl
bnpmcy96ZnMvcmVsZWFzZXMvZG93bmxvYWQvemZzLTIuMy40L3pmcy0yLjMuNC5zaGEyNTYuYXNj
Ci1zaGEyNTYgIDllYzM5N2NmMzYwMTMzMTYxYTExODAwMzVmM2U3ZDY5NjIxODZlZDJiMzQ1Nzk1
M2EyOGQ0NWFhODgzZmE0OTUgIHpmcy0yLjMuNC50YXIuZ3oKKyMgRnJvbSBodHRwczovL2dpdGh1
Yi5jb20vb3Blbnpmcy96ZnMvcmVsZWFzZXMvZG93bmxvYWQvemZzLTIuMy41L3pmcy0yLjMuNS5z
aGEyNTYuYXNjCitzaGEyNTYgIDMyNmFlMGNiYThhNjE1YWZhNDJjNjg5MTY0MGU3NmFjYzRiZDIz
MGY2ZDZkZGVjMTIwYzExZTMwYjEzOTIwNjcgIHpmcy0yLjMuNS50YXIuZ3oKIAogIyBIYXNoIGZv
ciBsaWNlbnNlIGZpbGVzOgogc2hhMjU2ICAxZmZiNzBjMzNjNGY3OWYwNGU5NDdmYWNjNWM3ODUx
ZjI4OTYwOTI1NmFhY2I0N2ZjMTE1ZjcwMDQyN2Q5NTIwICBMSUNFTlNFCmRpZmYgLS1naXQgYS9w
YWNrYWdlL3pmcy96ZnMubWsgYi9wYWNrYWdlL3pmcy96ZnMubWsKaW5kZXggYTQ4Zjg5OTIyYi4u
NzEyZjJhZmI1NCAxMDA2NDQKLS0tIGEvcGFja2FnZS96ZnMvemZzLm1rCisrKyBiL3BhY2thZ2Uv
emZzL3pmcy5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAK
LVpGU19WRVJTSU9OID0gMi4zLjQKK1pGU19WRVJTSU9OID0gMi4zLjUKIFpGU19TSVRFID0gaHR0
cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rvd25sb2FkL3pmcy0kKFpGU19W
RVJTSU9OKQogWkZTX1NFTElOVVhfTU9EVUxFUyA9IHpmcwogWkZTX0xJQ0VOU0UgPSBDRERMCi0t
IAoyLjUyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
