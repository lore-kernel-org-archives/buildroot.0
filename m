Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AE6C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 05:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BF2F81304;
	Tue, 16 Jul 2024 05:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wk1cUtwbUhO8; Tue, 16 Jul 2024 05:44:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E91181369
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E91181369;
	Tue, 16 Jul 2024 05:44:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 954DA1BF312
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 05:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9058E60805
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 05:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1_t3XBqu8xOl for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 05:44:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C4B1F60673
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4B1F60673
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4B1F60673
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 05:44:28 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4267345e746so34250475e9.0
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 22:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721108666; x=1721713466;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L78hq/J+9SGLNuP27+oGAh78qltyTrzu1rNhVJqu0zQ=;
 b=Udf1JbX6Ocj7UzZAZAYX5nHbVA0mEtt3PmNG80KrGcT6gaZsCVL4qVuRAifibqNJhf
 Ioqk8U7DmP7yMLmIgTMEVjI0klYP9PQ7egHKAmXrrHckEIwLmSapBfOQZvttw98ZqGn7
 aMqY6mazIslKdrk+u9mxIN1Lta/dqqHuCRdedk1C5nKKFnDbK/A4MW3BxXrQCsklOdLj
 Oxa/daYxaXyT53EYKYG9eVH33nnml8WzLombQHucYzScAMexsMB63z454I+MBSO31sWJ
 w+lDDKu/DE50OB/eWhsAKC4icAk+bzBODwWwtJGy1z39Akw0aASkZvkbv3zaNIlOOyLs
 OJvQ==
X-Gm-Message-State: AOJu0YycvzBi3gyTFxctQYIsv0p1ueu7Q44XwcQMEUwaZEYpGLVHB2pB
 0qldDp/MdUvPJKlA4Ykr03rnUbAajkmMlWrS3pKXUcwdvc+B5Qz5EqBGKB2e
X-Google-Smtp-Source: AGHT+IFW5OdrtEaDJXHI1+v/iWjxB34rHfODkQMdOqX1Y5bAvHMDvlxPG4rTUFGfHSQCS17igzP/oA==
X-Received: by 2002:a05:600c:1383:b0:426:6455:f124 with SMTP id
 5b1f17b1804b1-427ba4b6547mr6723845e9.0.1721108666497; 
 Mon, 15 Jul 2024 22:44:26 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e7749esm110658705e9.2.2024.07.15.22.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 22:44:25 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 07:43:56 +0200
Message-ID: <20240716054359.92966-6-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716054359.92966-1-gael.portay@rtone.fr>
References: <20240716054359.92966-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721108666; x=1721713466; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L78hq/J+9SGLNuP27+oGAh78qltyTrzu1rNhVJqu0zQ=;
 b=JinkWVlFHaQKDc1HW18XO9qRgXJuMowGkIGTQH9/HiiEU1BuwvGVMpZoOTd0U6N8Ax
 BBk8DbudyMPLVmg9uNv5cCfEvwvqtbB9xVbXGC52X5hGjPyXFoSoYw9XatChCIdiRmOV
 l6L+y8uVvdV6by4zA88Ri5C5MPy9Om2H3vGXi6pBbHB4Eey/H7QphfZwLZgsou4+xe0c
 Zg2NiLVHfOO1UKEln3BZtE4uwFbawHUWN7lk5k/9242huoEjFizCjm2YCVp+odJYY3Fx
 yxMseDs7ogDenzdjM1Xb0f6uDNvWKUa9JLq7pmqnSGXmOEnP7nnCM9eZtdatv3jw0gue
 fKbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JinkWVlF
Subject: [Buildroot] [PATCH 5/8] configs/raspberrypi4*: install Raspberry Pi
 400 device-tree blob
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
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBpbnN0YWxscyB0aGUgZGV2aWNlLXRyZWUgYmxvYiBmb3IgdGhlIFJhc3BiZXJyeSBQaSA0
MDAuCgpTaWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5QHJ0b25lLmZyPgot
LS0KIGJvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQgICAgICB8IDEgKwogY29uZmlncy9yYXNw
YmVycnlwaTRfNjRfZGVmY29uZmlnIHwgMiArLQogY29uZmlncy9yYXNwYmVycnlwaTRfZGVmY29u
ZmlnICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dCBiL2JvYXJk
L3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQKaW5kZXggNzhjNTUxNTc5YS4uNDg1YThkODgyNyAxMDA2
NDQKLS0tIGEvYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dAorKysgYi9ib2FyZC9yYXNwYmVy
cnlwaS9yZWFkbWUudHh0CkBAIC0xMDAsNiArMTAwLDcgQEAgQWZ0ZXIgYnVpbGRpbmcsIHlvdSBz
aG91bGQgb2J0YWluIHRoaXMgdHJlZToKICAgICArLS0gYmNtMjcxMC1ycGktMy1iLXBsdXMuZHRi
ICAgIFsxXQogICAgICstLSBiY20yNzEwLXJwaS1jbTMuZHRiICAgICAgICAgWzFdCiAgICAgKy0t
IGJjbTI3MTEtcnBpLTQtYi5kdGIgICAgICAgICBbMV0KKyAgICArLS0gYmNtMjcxMS1ycGktNDAw
LmR0YiAgICAgICAgIFsxXQogICAgICstLSBiY20yNzExLXJwaS1jbTQuZHRiICAgICAgICAgWzFd
CiAgICAgKy0tIGJjbTI3MTItcnBpLTUtYi5kdGIgICAgICAgICBbMV0KICAgICArLS0gYm9vdC52
ZmF0CmRpZmYgLS1naXQgYS9jb25maWdzL3Jhc3BiZXJyeXBpNF82NF9kZWZjb25maWcgYi9jb25m
aWdzL3Jhc3BiZXJyeXBpNF82NF9kZWZjb25maWcKaW5kZXggNWM2Njk4ZmIzNy4uN2FjMGFkNDlj
YyAxMDA2NDQKLS0tIGEvY29uZmlncy9yYXNwYmVycnlwaTRfNjRfZGVmY29uZmlnCisrKyBiL2Nv
bmZpZ3MvcmFzcGJlcnJ5cGk0XzY0X2RlZmNvbmZpZwpAQCAtMjAsNyArMjAsNyBAQCBCUjJfTElO
VVhfS0VSTkVMX0RFRkNPTkZJRz0iYmNtMjcxMSIKIAogIyBCdWlsZCB0aGUgRFRCIGZyb20gdGhl
IGtlcm5lbCBzb3VyY2VzCiBCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKLUJSMl9MSU5V
WF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJicm9hZGNvbS9iY20yNzExLXJwaS00LWIiCitCUjJf
TElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0iYnJvYWRjb20vYmNtMjcxMS1ycGktNC1iIGJy
b2FkY29tL2JjbTI3MTEtcnBpLTQwMCIKIAogQlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX09Q
RU5TU0w9eQogCmRpZmYgLS1naXQgYS9jb25maWdzL3Jhc3BiZXJyeXBpNF9kZWZjb25maWcgYi9j
b25maWdzL3Jhc3BiZXJyeXBpNF9kZWZjb25maWcKaW5kZXggYzE0Yjc3ZWFjZC4uMjQxZjc4ZjJj
MSAxMDA2NDQKLS0tIGEvY29uZmlncy9yYXNwYmVycnlwaTRfZGVmY29uZmlnCisrKyBiL2NvbmZp
Z3MvcmFzcGJlcnJ5cGk0X2RlZmNvbmZpZwpAQCAtMjAsNyArMjAsNyBAQCBCUjJfTElOVVhfS0VS
TkVMX0RFRkNPTkZJRz0iYmNtMjcxMSIKIAogIyBCdWlsZCB0aGUgRFRCIGZyb20gdGhlIGtlcm5l
bCBzb3VyY2VzCiBCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKLUJSMl9MSU5VWF9LRVJO
RUxfSU5UUkVFX0RUU19OQU1FPSJicm9hZGNvbS9iY20yNzExLXJwaS00LWIiCitCUjJfTElOVVhf
S0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0iYnJvYWRjb20vYmNtMjcxMS1ycGktNC1iIGJyb2FkY29t
L2JjbTI3MTEtcnBpLTQwMCIKIAogQlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX09QRU5TU0w9
eQogCi0tIAoyLjQ1LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
