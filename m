Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68DBC36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 14:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E860606E0;
	Wed,  9 Apr 2025 14:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9WGRfAz03rpb; Wed,  9 Apr 2025 14:34:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBBA860ACC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBBA860ACC;
	Wed,  9 Apr 2025 14:34:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2847BD6
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 14:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15E20412C9
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 14:34:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DyL7UEtz_xXH for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 14:34:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1E76040D1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E76040D1A
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E76040D1A
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 14:34:37 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ac73723b2d5so1395693966b.3
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 07:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744209275; x=1744814075;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LqMpch6V9rCyJKT9aDVFS8nHdUa8trLMJgU5t+U0wWo=;
 b=YMgeTQP2Y98vrpNzPk/SmrlBf3zguEu2AkyhLrHw7295BywIlb7e/x5SdRGx7wgzQA
 c4bdw6imzdnbctNQie+jI64AH8kl6D5F+ppqvWBUu9YjEOFF2vTMbAZrYSDQBQQksFbP
 nsmaczWInp0qKqWt2A7WJBa1iGhK3VdFFWcJP+E1ak1sc9sxuu4Ze+S/3zMhCNrf8h51
 PERNWHNsIGfn321+KqAP8JeQT3GVzzd08mWdAM6J4zFGkRQyC8LGeIdGdWKR5l5jOoUZ
 DXmA8iGxrIGI0VJwpr+JOZx5VdDFSwLUuzdoMxVUJvwNZhhtLMMYnPtI+3J1ac3ZjBex
 16/g==
X-Gm-Message-State: AOJu0YyPCPxab8v2+8rBN+tFviJQPe+dkmNIwZFUZlfjEmeQrzPDYpvQ
 FA+D46EjKxOxYyqV5qutd4tyU+JjrAtbbu9OVwGw1k45aumtn4EViACTMJGTYqqdLOxX4xI6pCm
 4LoY=
X-Gm-Gg: ASbGncvy1dAQx6WF216lRQbjfky85EF01QE205wGDpih3OcNUHtIJxIHRCJ23FTP+jn
 EL3QpfkrlyTJ85N6ranMYt+pFUZIrkMmYw0wdBOYMKfmLfsetfjBFihY9tKVXlvjQuTfJN55AtN
 DZtdp5wZodjIGlo2CYXucYIMYMbrRfSoTsNx1p8FDXvrXuqxHc4xAshZADnwglhMVWmrpjnDcAf
 vvy25/V0R9UO7cy5HCiGQ+PoGNxULD+S9pa+Bli4+9uQgfSACeUvTsh2z+XxOdWJ4aDO6WVCXHg
 Zuotdtv93fuUUrdHoveRQab4TcbzyCEyYgA0Jx6myrK8xYMH1mUAmu7OE1vxKWczU37w
X-Google-Smtp-Source: AGHT+IHHYcczUhmatspBfZ3niKLm98L1nUYRNmSm+TsU0cATgoRLramARA90yXVutwEHxVwHToFVyQ==
X-Received: by 2002:a17:907:3f97:b0:ac2:b8ce:90d5 with SMTP id
 a640c23a62f3a-aca9b747109mr263345866b.44.1744209274977; 
 Wed, 09 Apr 2025 07:34:34 -0700 (PDT)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1cb41besm105007566b.118.2025.04.09.07.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 07:34:34 -0700 (PDT)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Wed,  9 Apr 2025 16:34:42 +0200
Message-ID: <20250409143443.528830-1-sairon@sairon.cz>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1744209275; x=1744814075; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LqMpch6V9rCyJKT9aDVFS8nHdUa8trLMJgU5t+U0wWo=;
 b=RjnHBc8f6qs/kACilXdb1s76GxEL/zlTxGFC4riqcAdp+06qWCD220VkgRsRiixDoT
 yIJugPqQrKfC2LKyEE7mHpX1rwbUNVtMvt1Zy/iNYOe9mA9xN/+cViz7UmnLrwhYg2qq
 iHPMQ9hga/vYYbb23NUzjtIDX4GYwSIYlGYlN3D8ayXAzyHmFc4H4N1fHTRK/fnVNte2
 J2FicjXdy67jJ7L8qH7pK+4VLE+F43J3p1VdBmzMVRg4ISG6M0Qb79HrkGfopEX5px+e
 U0HkZDn8x2bNncVOMjQznsxfDYMpltmdPko/VAtYwWeUJM7e2sMTlOCWP6To4EmooDaq
 0wDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sairon.cz header.i=@sairon.cz header.a=rsa-sha256
 header.s=google header.b=RjnHBc8f
Subject: [Buildroot] [PATCH] package/linux-firmware: add RTL8125D firmware
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
Cc: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>,
 Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGZpcm13YXJlIGZvciBSVEw4MTI1RCBhZGRlZCBpbiBbMV0uIFRoZSByODE2OSBkcml2ZXIg
Y3VycmVudGx5IHN1cHBvcnRzCnRoaXMgY2FyZCBzaW5jZSBMaW51eCA2LjEzLgoKWzFdIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5n
aXQvY29tbWl0Lz9pZD1mNzVkMWZiZTc4MDliYzVlZDEzNDIwNGI5MjBmZDllMmZjNWRiMWRmCgpT
aWduZWQtb2ZmLWJ5OiBKYW4gxIxlcm3DoWsgPHNhaXJvbkBzYWlyb24uY3o+Ci0tLQogcGFja2Fn
ZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5tayB8IDEgKwogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saW51eC1maXJtd2FyZS9saW51
eC1maXJtd2FyZS5tayBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUubWsK
aW5kZXggZTVlMWIzMmRmZC4uM2Q2YzJiNjI0YyAxMDA2NDQKLS0tIGEvcGFja2FnZS9saW51eC1m
aXJtd2FyZS9saW51eC1maXJtd2FyZS5taworKysgYi9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xp
bnV4LWZpcm13YXJlLm1rCkBAIC03MDEsNiArNzAxLDcgQEAgTElOVVhfRklSTVdBUkVfRklMRVMg
Kz0gXAogCXJ0bF9uaWMvcnRsODEwN2UtMi5mdyBcCiAJcnRsX25pYy9ydGw4MTI1YS0zLmZ3IFwK
IAlydGxfbmljL3J0bDgxMjViLTIuZncgXAorCXJ0bF9uaWMvcnRsODEyNWQtMS5mdyBcCiAJcnRs
X25pYy9ydGw4MTY4ZC0xLmZ3IFwKIAlydGxfbmljL3J0bDgxNjhkLTIuZncgXAogCXJ0bF9uaWMv
cnRsODE2OGUtMS5mdyBcCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
