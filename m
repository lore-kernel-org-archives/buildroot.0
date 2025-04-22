Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C583C369D8
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 14:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08AD740BC4;
	Tue, 22 Apr 2025 14:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OCzGAxJsXVdX; Tue, 22 Apr 2025 14:20:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4003840BEE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4003840BEE;
	Tue, 22 Apr 2025 14:20:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 145B31C0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 14:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73EAD4053D
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 14:20:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e51QNZitnFK1 for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 14:20:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=mickael.tansorier@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9666D400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9666D400B8
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9666D400B8
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 14:20:00 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso44796665e9.2
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:20:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745331599; x=1745936399;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dEz7t5mjnaRLOfk+c66h8ozXyzDv4AtsfQNZvMpmVpU=;
 b=rf9MdOIryo3n5SRPNGVE+RCBjEi1+4HkpZDxck8g/r0U05VRY1YtCR99krjmtn8IN4
 Fp2m2DmhgDSLWV5EvuCOk87EBcS+6Oork0lbc/YoaIGvd1U/4UwrIM44T0uEsK1+DZB3
 bfLrsC3A6X2jEatyC85GSHJgDcUDEICHqJkvrIBoV+0e4J9c+cd27HM4/GzjIj+f2LFR
 vr8Wz/sRllAMmDYLThD5/dZsVGUI6v9B2oWy4fnDXTmx4lDPZq814iPFe2l40H1IxWQA
 K0RiLG3G2ZxJ0llIt09GUXQAyc74HpfZiiR4YudlxRWqNKKRT/7zF9uU4yOQYkekxUZA
 ImYg==
X-Gm-Message-State: AOJu0Ywu1QpbYviEIPh/naXx+iEKSl7JgYSRsO1Ulpfm/SqW2sv/anKi
 dvjhw1N5AWtC0kikvkGSVznV53kz9d1lSlvsJXbWU8mtrls42Vca/hs4cBcYglTiRBXNKGHa3pX
 N
X-Gm-Gg: ASbGncv9wQi7f+gckYvxC8S8JsVH5NNSkRX6Bk9372E8BpWNK1CmHEX8kNCBkaCdPwT
 08Gva62tAfF5vQldD/IWl9nMx8wIEoeppNMEKxHDm1i+EI57llLon+gIy4FPkgmdnzExUMt8CmT
 Mgazl1h/3Ta582OF0/cs6REI1ugyFvoqEZZ7TMCersnBaG90Bwr6nZGkbV/Ia95YQZWJjJCzbA3
 ArBpOR0pIVHvSBAeZFi1IRFt2f2faxHNAl2/s77p0EOe22ODRTWlZBgMqMV2x8klAsBjgLu74lj
 Sj28wXVUi8i6UB9l9Yc8CeHRAGE05/wUQI/sy2qoxbO9+tRQN5O8UgFV9FSlvbatYItbB9Z5W/5
 tHDI6wx5HQrWnOWy/d5N/8uiTXzuf2zWHFRLzMVS9
X-Google-Smtp-Source: AGHT+IEuFzU4UlbruYDH3NkiNU3wCaK7PPpA/8xVK3zN4TaEGaXN5bOIejixt3VcraP53PM7MGabcA==
X-Received: by 2002:a05:600c:3c85:b0:43c:f81d:34 with SMTP id
 5b1f17b1804b1-4406ab976cdmr125258225e9.9.1745331598570; 
 Tue, 22 Apr 2025 07:19:58 -0700 (PDT)
Received: from baku.localdomain
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5a9df6sm180714555e9.1.2025.04.22.07.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 07:19:58 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 16:19:43 +0200
Message-ID: <20250422141943.51161-5-mickael.tansorier@smile.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422141943.51161-1-mickael.tansorier@smile.fr>
References: <20250422141943.51161-1-mickael.tansorier@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1745331599; x=1745936399; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dEz7t5mjnaRLOfk+c66h8ozXyzDv4AtsfQNZvMpmVpU=;
 b=my0HLBGEQD2C4+4ZNHcIqxgGJZ1VapKHQ3L0KtQKKSXzDxJ16Bx9wyjCRZnFn+DFIQ
 04gfBZyCRT4K6YmTGrb18X/G6WbvIpmQUUfXUVPz/ZWqYJ7xFeUD72H3GQQbhS451gfi
 Yr5uHUqgtphOpldSGew5ih38rK1OAAStVXBrE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=my0HLBGE
Subject: [Buildroot] [PATCH 5/5] package/mineclonia: bump to version 0.113.0
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
From: =?utf-8?q?Micka=C3=ABl_Tansorier_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Micka=C3=ABl=20Tansorier?= <mickael.tansorier@smile.fr>
Cc: Romain Naour <romain.naour@gmail.com>, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Micka=C3=ABl=20Tansorier?= <mickael.tansorier@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VXBkYXRlIG1pbmVjbG9uaWEgdmVyc2lvbi4KClNlZToKaHR0cHM6Ly9naXRodWIuY29tL1Rlc3Nl
cmFjdDREL21pbmVjbG9uaWEvcmVsZWFzZXMvdGFnLzAuMTEzLjAKClNpZ25lZC1vZmYtYnk6IE1p
Y2thw6tsIFRhbnNvcmllciA8bWlja2FlbC50YW5zb3JpZXJAc21pbGUuZnI+Ci0tLQogcGFja2Fn
ZS9taW5lY2xvbmlhL21pbmVjbG9uaWEuaGFzaCB8IDIgKy0KIHBhY2thZ2UvbWluZWNsb25pYS9t
aW5lY2xvbmlhLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL21pbmVjbG9uaWEvbWluZWNsb25p
YS5oYXNoIGIvcGFja2FnZS9taW5lY2xvbmlhL21pbmVjbG9uaWEuaGFzaAppbmRleCBhZWEzODA3
ZTczLi5jNTc3ODlkMTc1IDEwMDY0NAotLS0gYS9wYWNrYWdlL21pbmVjbG9uaWEvbWluZWNsb25p
YS5oYXNoCisrKyBiL3BhY2thZ2UvbWluZWNsb25pYS9taW5lY2xvbmlhLmhhc2gKQEAgLTEsNSAr
MSw1IEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICBiMDlkMWFmOTRjMzU3NmZjODlh
MTJjMjNlYTJjZDZlODRkMTE0ZmIwNGEzODlmMTc0NmYxMzk5NzIxY2QzYWU0ICAwLjExMS4xLnRh
ci5negorc2hhMjU2ICA0N2RjNTdhNTQ4N2FlMTlkNjVmNjQ3MWE4NTYzOGUwNzM1NjRkNTIwOWM4
ZGJkODQ2ODc4OTEwNTlkMGUwNWE5ICAwLjExMy4wLnRhci5negogCiBzaGEyNTYgIDFiMzc4MmNj
YWQ3Yjg2MTQxMDBjZGEzMGQzZmFmNDJmYzM5ZjJlOTc5MzI5MDhjNTQzMDA1MDUzYjY1NGNhNjgg
IExJQ0VOU0UudHh0CiBzaGEyNTYgIDViNjY4NDEwNzA4MjQ5MDBlZWZhOWQzM2Q3YzM4ODdmMmRm
YzQzMzQ3MTdiNDYwYWE3YzhiOGFlMjNkYWY3ZDQgIG1vZHMvRU5USVRJRVMvbWNsX2NoYXJnZXMv
dGV4dHVyZV9saWNlbnNlLnR4dApkaWZmIC0tZ2l0IGEvcGFja2FnZS9taW5lY2xvbmlhL21pbmVj
bG9uaWEubWsgYi9wYWNrYWdlL21pbmVjbG9uaWEvbWluZWNsb25pYS5tawppbmRleCBlYjY5ZWVh
YWI5Li42NmU4MmEzMGY2IDEwMDY0NAotLS0gYS9wYWNrYWdlL21pbmVjbG9uaWEvbWluZWNsb25p
YS5taworKysgYi9wYWNrYWdlL21pbmVjbG9uaWEvbWluZWNsb25pYS5tawpAQCAtNCw3ICs0LDcg
QEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLU1JTkVDTE9OSUFfVkVSU0lPTiA9IDAu
MTExLjEKK01JTkVDTE9OSUFfVkVSU0lPTiA9IDAuMTEzLjAKIE1JTkVDTE9OSUFfU09VUkNFID0g
JChNSU5FQ0xPTklBX1ZFUlNJT04pLnRhci5negogTUlORUNMT05JQV9TSVRFID0gaHR0cHM6Ly9j
b2RlYmVyZy5vcmcvbWluZWNsb25pYS9taW5lY2xvbmlhL2FyY2hpdmUKIE1JTkVDTE9OSUFfTElD
RU5TRSA9IEdQTHYzLCBNSVQgKG1vZHMpCi0tIAoyLjQ5LjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
