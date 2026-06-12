Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED00BCD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 22:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E07BC613E3;
	Fri, 12 Jun 2026 22:10:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eFJIGscjphtl; Fri, 12 Jun 2026 22:10:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52DF0613E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781302245;
	bh=yo915Ec9CKcG2QQLI8uNjTMq0CFb0+o+PGqxd+uRUyA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H6IEb4hMea39/Q3oUX0h1kRWgafeRgTktErMdnpWncndrNkCPf3W4IEOC6EkBO8p9
	 SFOOTfF5Pu8laU2ZIuYCHTV/dXuGzlexzeow/yEz+JBECj+PuoCHFLDqMwTcsgdaRI
	 DRCH0xHjx94Ga+u5o6gA8Fv+1v/HbkAGBpHtKdqK5cXu54Q8nUR0V8S1Oiu8sywWpc
	 EdCY7/MZBACLBDePQvFpJ3QUyWVan4rm/Qkjy/PQAJk56TdTdlNy74A8VVUxXnzqTe
	 h3HwcTwsdaJ7HpJ6pSOK16iCyoHrNCIvLJNhzuQLtqWEfX6jEABJlr3A6kSgJzl3cy
	 50dtoYRYfKVrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52DF0613E4;
	Fri, 12 Jun 2026 22:10:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13C02F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 22:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3ECC82B1B
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 22:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KZAZ1Gp-Pi2N for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 22:10:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=salvador.joseluis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E478782AC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E478782AC6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E478782AC6
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 22:10:42 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-45fd464d51fso819273f8f.3
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 15:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781302241; x=1781907041;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QPj3h+NkF9Hw9cKdWwML0J2s93q0yBFiTHu1XKgoPCE=;
 b=nkoan2bu/fOf9kCZBJ1MLOdzyGFgza3gf/1wlKSluw7Tfda6VBqWTtstWo2IqckaGA
 lRTqxn8aSlkkdpUJFiKWMFWzlXw0A8DrTpcKArcLX6NS3fWrxQ0fs54+a7ZhGw3F1jrl
 zwPXoP46nEtE07+QCbXE4YY8fDEbOBkvcmCrAI5LSj2JQCmIFvUpzu7Wm1JDCERUCYFr
 Mvgk7p6qMLJql6SJf9jM7wD1ppxv6HHhG3D2u4NL4svWR6ds597x1NuEV1YXLM3DC9Yk
 tO9P01mpyg3R/q1u6CtJGMeh4KixWmeD6VYuu0kUbXIjhmu1+oQROdS9kbARw4bMY5/h
 JUzw==
X-Gm-Message-State: AOJu0Yyd+FuDgsNrPt5cQGwAKKoxOIu3Y9oqwPRL0bJC/fNYt4ytZHvT
 bXnDQkrhHt7fGNOce6/thg/2pZpuppOPz4/i4NBVINzgi76LjeAguZnr/PNSCA==
X-Gm-Gg: Acq92OE+npnW4Qes2fqQuhIYuJe9o5xVY1nDfHw8mNUG6T+6Qug/CtitKxagUp2tbQm
 vsUqi8cNicn7TKe2nEJwN1+fvE0nzDAHt2ISja29K/7TNvWWZ1d7+b6VffSywyzQ/Y5ZXUv6JNd
 Z6rvR21QDDkkpFLCOnrITk8G+SYM65DB77gF9830ZXSD2XdfdSCxWN8MXKWgN6zR7YyeLjdwCc/
 zqFkTqsKyF4EAWFZvelQTMD7mUcov7aaHZNPXTOPAQF4gmR4t9ZNyBNFhYpry7OE2Wtngkhev7e
 wXd6/e5wkEojo9Rx0T73e9I0dO0YTwJ+FyMCVZ4cUGWLIW0ki8ujR8u00OEilHYR8BNqEHSxQsh
 9Bk1x+s4PUZ0k9h+rzfMd+kobb2NyGU3tu4y7GZIXClLz1gERW1gR1x8JeWHXKv1HhsQlwU5cmK
 RUG97GRpTxtxRH6JG7JQ4z+OkHR/NLf1m+2b/mmj9nHPq/a7T4+K1Fv1En3HP8OmR9aIzZsuyzy
 IZ0EOFtOJPlNABXv5UNNKdaJ4Qp7RKa2WTsf/s=
X-Received: by 2002:a05:6000:2409:b0:460:631b:cc0b with SMTP id
 ffacd0b85a97d-46074a80033mr1170820f8f.1.1781302240522; 
 Fri, 12 Jun 2026 15:10:40 -0700 (PDT)
Received: from cuervo.intranet.jlsalvador.online
 (152.85-87-140.dynamic.clientes.euskaltel.es. [85.87.140.152])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26f309sm9506229f8f.14.2026.06.12.15.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 15:10:39 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
Date: Sat, 13 Jun 2026 00:10:17 +0200
Message-ID: <20260612221016.1072569-2-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781302241; x=1781907041; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QPj3h+NkF9Hw9cKdWwML0J2s93q0yBFiTHu1XKgoPCE=;
 b=LNcgFVN8dln794s4H3LU4MEDeT97DYwEzcTGgmTL6uO3jDEByQbKd/EXQMMW3zh9MJ
 EZ30nr8rJZuVhciIrsTQlc4iKVfAmLVrhci/Ux47jEgNzbrQBmKuzv1ulDu1A3EwPEal
 t4HsmesSXvAZ0k2oeU+Z/K8osa+qsyO3raH8sX0MgMdYJ+W98oVfPlKt4o3toTK4cuo+
 5RvUS0LhSRWTCWj3rc4ZwEvwI3gA+mc7mtIX9y+bxabxk45VjONgBo8M6AkaiJiGPtkp
 CaM0HxRGoTdXRYJy5p3hKhLbVBgxcptjFbEl+/LjAbfS+gwIE06VQs6mOoLNzf1fXHnO
 mbWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=LNcgFVN8
Subject: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.4.3
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
ZWFzZXMvdGFnL3pmcy0yLjQuMwoKU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBS
dWZvIDxzYWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+Ci0tLQogcGFja2FnZS96ZnMvemZzLmhh
c2ggfCA0ICsrLS0KIHBhY2thZ2UvemZzL3pmcy5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS96
ZnMvemZzLmhhc2ggYi9wYWNrYWdlL3pmcy96ZnMuaGFzaAppbmRleCA1MDdkZTQ4NGMxLi5hYThh
ZjhiOGMzIDEwMDY0NAotLS0gYS9wYWNrYWdlL3pmcy96ZnMuaGFzaAorKysgYi9wYWNrYWdlL3pm
cy96ZnMuaGFzaApAQCAtMSw1ICsxLDUgQEAKLSMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vb3Bl
bnpmcy96ZnMvcmVsZWFzZXMvZG93bmxvYWQvemZzLTIuNC4yL3pmcy0yLjQuMi5zaGEyNTYuYXNj
Ci1zaGEyNTYgIDdlMjYwZDBlNmFmMjk1YmVhNGM1ZTI0MWNhYzBhMWFlZjA3YjU4ZDhkZDgwMzVm
Nzg5OGFkZTNiMWJiZWM3OGYgIHpmcy0yLjQuMi50YXIuZ3oKKyMgRnJvbSBodHRwczovL2dpdGh1
Yi5jb20vb3Blbnpmcy96ZnMvcmVsZWFzZXMvZG93bmxvYWQvemZzLTIuNC4zL3pmcy0yLjQuMy5z
aGEyNTYuYXNjCitzaGEyNTYgIDFmMDhmMmQxNTRmNTE4OWI1ZjEzODI4NDhhMzI2NjdiM2QzNDA2
NjE0NWI0NzRjNDljZDNkNDFhNWZiYTU5YTcgIHpmcy0yLjQuMy50YXIuZ3oKIAogIyBIYXNoIGZv
ciBsaWNlbnNlIGZpbGVzOgogc2hhMjU2ICAxZmZiNzBjMzNjNGY3OWYwNGU5NDdmYWNjNWM3ODUx
ZjI4OTYwOTI1NmFhY2I0N2ZjMTE1ZjcwMDQyN2Q5NTIwICBMSUNFTlNFCmRpZmYgLS1naXQgYS9w
YWNrYWdlL3pmcy96ZnMubWsgYi9wYWNrYWdlL3pmcy96ZnMubWsKaW5kZXggMDQwYTY4NjlkOC4u
MmNkZTY4MzA3ZCAxMDA2NDQKLS0tIGEvcGFja2FnZS96ZnMvemZzLm1rCisrKyBiL3BhY2thZ2Uv
emZzL3pmcy5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAK
LVpGU19WRVJTSU9OID0gMi40LjIKK1pGU19WRVJTSU9OID0gMi40LjMKIFpGU19TSVRFID0gaHR0
cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rvd25sb2FkL3pmcy0kKFpGU19W
RVJTSU9OKQogWkZTX1NFTElOVVhfTU9EVUxFUyA9IHpmcwogWkZTX0xJQ0VOU0UgPSBDRERMCi0t
IAoyLjU0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
