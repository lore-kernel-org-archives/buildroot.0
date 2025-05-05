Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7C3C3ABB0
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 07:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0021401C8;
	Mon,  5 May 2025 07:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gaGgJhYtphVl; Mon,  5 May 2025 07:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1EA440450
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1EA440450;
	Mon,  5 May 2025 07:57:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 160E516B
 for <buildroot@buildroot.org>; Mon,  5 May 2025 07:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05D16812DC
 for <buildroot@buildroot.org>; Mon,  5 May 2025 07:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NX50Plinmhno for <buildroot@buildroot.org>;
 Mon,  5 May 2025 07:57:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=salvador.joseluis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BCD79812A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCD79812A3
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCD79812A3
 for <buildroot@buildroot.org>; Mon,  5 May 2025 07:57:48 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39ee651e419so1976160f8f.3
 for <buildroot@buildroot.org>; Mon, 05 May 2025 00:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746431867; x=1747036667;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p9CU7Gszeq3tQkCN4ZVZSoVM0AJULZorYCj9vzbIAi0=;
 b=wS/A8tP695VWGhMAvpcLAK9oIbUzDcGMAxtAk4ORim7hwXj+4WAtKMkwoGmzW7ldSk
 4QkSr4RttHvFm3X1wMafsykOotTt84rmgzQY7vkdXxIrG+cCN/bKN3cJAa6VUpJuaU9+
 3+ujeGWrgHXwfVY8Uas3/85itVWhwHlBVsntj9uie+z5fCvSO4WyUSDP3TiCPo/v759R
 j2km4WfOk0TdJEvwKqy9CXtst7VDrXL/GufOlMOAU4id1zGVHPKOU3Rjg9A4T+BUBKz5
 PIA3yNb8Q+I+gPqAAZ45VoEBhH7nWbSQscV8nKsujkQNghjlmJhKQjsLcFCbt3N8YZlK
 savg==
X-Gm-Message-State: AOJu0YxSqn2TMiNeEFHDP0r/gDZe5EtJf0tP8OrDFF8QVMKjUlpWc+xa
 QJQ1rw9KPf3XbfpwuxgY9y2mpzHMqBP+6HsOZIIoOTt0oLjpx5rtjUZCOQ==
X-Gm-Gg: ASbGncuBomJqTbo4+GLgEZV1dfAblknzHBiL4jukNfOTgC++VObd1fzw1e/as+Lzyos
 ANO/LsBLpqQyYvkcR+1iIvvIjpo76hzZJ4i3EW0BUNL8T3MR61tlLFYFi6IxzatohIqvW3hg3Np
 lC431++4GV4OJGRydfdztqj04WZhDsWS+emsQH3zEyBb0OKXuHKfS93vvjzSk12oP42Y4mgmnxQ
 2x58lvKKg3PDM5Kn/EJjkzaHNoCTwVjslj/rm1zvWNLARDnRyNb5ReZoYY091QRZxNbhGc2YRij
 aHlByJ5ETs4efVuDzqD9Y7SvgZMKzf6tzO12Yd7lHuDPthQbHJZ/ssgLINgN6G5X1KA+3kyOOff
 mPvTinPUgeEdbf60=
X-Google-Smtp-Source: AGHT+IEtK1Del/xG4SSraSElxWJjgWOIEczY4/CwH5Fur2TsoCbeYYI4Yi25oyl2lLwIwHoF8Pq8mQ==
X-Received: by 2002:a05:6000:240b:b0:39c:1257:febb with SMTP id
 ffacd0b85a97d-3a099aefed3mr8986308f8f.59.1746431866618; 
 Mon, 05 May 2025 00:57:46 -0700 (PDT)
Received: from cuervo.intranet.jlsalvador.online ([207.188.149.64])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2ad762fsm171449135e9.5.2025.05.05.00.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 00:57:46 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>
Date: Mon,  5 May 2025 09:57:11 +0200
Message-ID: <20250505075712.851378-1-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746431867; x=1747036667; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p9CU7Gszeq3tQkCN4ZVZSoVM0AJULZorYCj9vzbIAi0=;
 b=jL3u0RDEr9YR8M8WV8A9t4ptqrsp4J4Fe22THoR6PQP1CqQCZcCTNC+bn8/3C7pUZR
 wLB954XL5+xGzLYc7ZLNmvau5Ms8VQvVsdKMP0MeVDOukfo8XnLa9ImDqgBPGXBHh/pK
 SL1m/wPoam8WwVfiky+qhT0DnIt84iImj02PNuEbkkYqj9IFyuVxMyKFFmVo4lFQeRg0
 +SWsXmkOLLdh35BW5s22DTbDMjDAPLwzE01mUx6glmb/mUwajeco/D7NHQQUIr/9BPfV
 35jMmV9ZONHh4DUsX65+cGZ+oBokt06iOWjRRVJh2lFf2iRKZl7HttQuCA3ajstGsPzC
 6T/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jL3u0RDE
Subject: [Buildroot] [PATCH v2 1/2] package/zfs: bump version to 2.3.2
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
ZWFzZXMvdGFnL3pmcy0yLjMuMgoKU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBS
dWZvIDxzYWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+Ci0tLQogcGFja2FnZS96ZnMvemZzLmhh
c2ggfCA0ICsrLS0KIHBhY2thZ2UvemZzL3pmcy5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS96
ZnMvemZzLmhhc2ggYi9wYWNrYWdlL3pmcy96ZnMuaGFzaAppbmRleCAzNjQwOTYzYmRiLi40YzYw
N2Q4NGE0IDEwMDY0NAotLS0gYS9wYWNrYWdlL3pmcy96ZnMuaGFzaAorKysgYi9wYWNrYWdlL3pm
cy96ZnMuaGFzaApAQCAtMSw1ICsxLDUgQEAKLSMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vb3Bl
bnpmcy96ZnMvcmVsZWFzZXMvZG93bmxvYWQvemZzLTIuMy4xL3pmcy0yLjMuMS5zaGEyNTYuYXNj
Ci1zaGEyNTYgIDA1MzIzMzc5OTM4NjkyMGJkYzYzNmUyMmQwZTE5YThjMmMzZTY0MmU4YmQ4NDdm
Zjg3ZTEwOGY4YmIxZjkwMDYgIHpmcy0yLjMuMS50YXIuZ3oKKyMgRnJvbSBodHRwczovL2dpdGh1
Yi5jb20vb3Blbnpmcy96ZnMvcmVsZWFzZXMvZG93bmxvYWQvemZzLTIuMy4yL3pmcy0yLjMuMi5z
aGEyNTYuYXNjCitzaGEyNTYgIDgwZGE2MjhhOTU0M2VjMzM1NWJmNDEwNjE3NDUwZTE2NzcwNjk0
OGNlYjI4NzU0MTQ1NWExYjhkODdiODc1OGEgIHpmcy0yLjMuMi50YXIuZ3oKIAogIyBIYXNoIGZv
ciBsaWNlbnNlIGZpbGVzOgogc2hhMjU2ICAxZmZiNzBjMzNjNGY3OWYwNGU5NDdmYWNjNWM3ODUx
ZjI4OTYwOTI1NmFhY2I0N2ZjMTE1ZjcwMDQyN2Q5NTIwICBMSUNFTlNFCmRpZmYgLS1naXQgYS9w
YWNrYWdlL3pmcy96ZnMubWsgYi9wYWNrYWdlL3pmcy96ZnMubWsKaW5kZXggYjJlZGViMTI2OC4u
YmRkN2IyYTNiMCAxMDA2NDQKLS0tIGEvcGFja2FnZS96ZnMvemZzLm1rCisrKyBiL3BhY2thZ2Uv
emZzL3pmcy5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAK
LVpGU19WRVJTSU9OID0gMi4zLjEKK1pGU19WRVJTSU9OID0gMi4zLjIKIFpGU19TSVRFID0gaHR0
cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rvd25sb2FkL3pmcy0kKFpGU19W
RVJTSU9OKQogWkZTX1NFTElOVVhfTU9EVUxFUyA9IHpmcwogWkZTX0xJQ0VOU0UgPSBDRERMCi0t
IAoyLjQ5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
