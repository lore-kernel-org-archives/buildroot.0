Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAD6CA0ECD
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 16:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90A0C61423;
	Mon, 11 Aug 2025 16:11:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 24yoUi7k-DxF; Mon, 11 Aug 2025 16:11:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B44CF61431
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B44CF61431;
	Mon, 11 Aug 2025 16:11:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F0A33154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D747A61431
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:11:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKIA_C0bO2PE for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 16:11:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2828A61423
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2828A61423
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2828A61423
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:11:23 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45a0dc77a15so4909275e9.2
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754928681; x=1755533481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iG+x5xKz+1nRqwqYLrhsMyRMf9X8lbOoSQcHIzXCuMo=;
 b=MF43IwmqhuK0v0+qU4LFYBIeZfTJhcSJcON/JzKtzHSlickUANY79GkGj61Vme4qVH
 BbFFcoTd+Qb0A29c6w19SU5ao3jysvlEaKpOrVdPzcYhYR3GrVyhq0818LBox/ceVffT
 ajMOvRM8f5cc6/QadenG2zWPCQuqGViEtHKWdZGKHti/DxDxN+ru6rBzhqFY7EnRQm9g
 YAel46KT6ZvH8JIshdtXCng8PR/RHIpjm1ZEd0NL2uSV889hZrQ0v++bg47tOf+xsz0r
 zht9JOUsY9R8iJ1VI8Gz65J/Z5OJJk+gzmXzz4IIkrKlz4rCFnl3wyiO5ySOODn3gqPi
 4Vzg==
X-Gm-Message-State: AOJu0Yy+/OX3XVtpoUdUHQvnMuQj0WkEJjh7mz6VVYzgiSQGCxBuqZYF
 Xr3eEoRSIiAXgfvkdpNil659mgW5NcQQUAfmr8UcINOblo7eBOa8fvlMDE5p2A==
X-Gm-Gg: ASbGnctSpBTwO0nGpUc3IOvcs57AALMRBCvJCwLORd6wAeAimmbZkrNaoHSc1/68cQ1
 O1atLA+b2aBIJ1d0DUMC6hg/tT1g0c7tp8n/R+snN2QBs0y4nlM2nPyoSwS1rwZ2LGfS9OSws0s
 bo+T3bgKyiKK+g5HXJYOKWfZp4M3CzoXKup1ThQQaKfG7imPt17YRHa6puFNgwN8m7m1cou1/bD
 8vbWC3RMj4xsniGHu5wLMZqjZKOKVRhxinjt1pdfv3GSl5uBLXep16FQX4kyGCRc1i5iQXuoXGm
 XlDbX4gfr+VaHA22KSKMte/ZiQtY561484MeqhPH4w8JYkUet9wE0IcBaJ0Z0ExVRP/lcXp6+LQ
 eMsAcXC+fzrrrJWk=
X-Google-Smtp-Source: AGHT+IGoX7y0QUyt2lmjQWoGErkOJWVJllqqqKSz94vaysIkK4WdRNpqW4dRWm7tnLNUEfnLEeBoNg==
X-Received: by 2002:a05:6000:178d:b0:3b7:8d2a:b33c with SMTP id
 ffacd0b85a97d-3b910fdb1a8mr233667f8f.18.1754928681112; 
 Mon, 11 Aug 2025 09:11:21 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:eb5b:f3f3:bf7b:bb92])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5868fd7sm279484855e9.18.2025.08.11.09.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 09:11:20 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vadim Kochan <vadim4j@gmail.com>, ju.o@free.fr,
 Maxime Leroy <maxime@leroys.fr>
Date: Mon, 11 Aug 2025 18:11:07 +0200
Message-ID: <20250811161107.7641-3-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811161107.7641-1-maxime@leroys.fr>
References: <20250811140030.1043469-1-maxime@leroys.fr>
 <20250811161107.7641-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754928681; x=1755533481; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iG+x5xKz+1nRqwqYLrhsMyRMf9X8lbOoSQcHIzXCuMo=;
 b=HMdQHsw2GXJ69MTZ75DdjPzaEhqVU2mDlzsT5A7os4/FBpm9CpXWpx+4QNfevRMXQp
 z6Gdw3GL/ctqEvWAfaDR9jQS7459d5nwLhJeGI4DJBwr72IESHUYVffFjFpoHJOJubqb
 Cnxsi60BhdMqevGeZ6r+2cTahsXGt6OOGSfFuM58FV+FM2usiUI/uNrKFXxlbCLSwNYr
 r8oqf60GixDF7bDVAGZ9D2YGUGJCzqrSurOxzUOXdugk8oCU1syeXZDVjLD/UlWzDfRF
 5o16992abxWiSfDXMz8g+7BMMGRSFEC10zj39dhyK/HTTE56Hc4ddNhkVGfskuOXIsaf
 W4dg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HMdQHsw2
Subject: [Buildroot] [PATCH v3 2/2] package/frr: make ECMP max configurable
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

VXBzdHJlYW0gRlJSIGFjY2VwdHMgLS1lbmFibGUtbXVsdGlwYXRoPU4gaW4gdGhlIHJhbmdlIDHi
gJM5OTkuIEJ1aWxkcm9vdApwcmV2aW91c2x5IGhhcmRjb2RlZCAyNTYuCgpBZGQgYSBjb25maWcg
aW50ZWdlciB0byBzZXQgdGhlIG1heGltdW0gRUNNUCBwYXRocyBhdCBidWlsZCB0aW1lLCBrZWVw
aW5nCjI1NiBhcyB0aGUgZGVmYXVsdC4gTG93ZXIgdmFsdWVzIGhlbHAgbWF0Y2ggaGFyZHdhcmUg
bGltaXRzIG9yIHJlZHVjZQptZW1vcnk7IGhpZ2hlciB2YWx1ZXMgYXJlIHVzZWZ1bCBmb3Igc29m
dHdhcmUgcm91dGluZyBvciBsYWIgdGVzdGluZy4KClNpZ25lZC1vZmYtYnk6IE1heGltZSBMZXJv
eSA8bWF4aW1lQGxlcm95cy5mcj4KLS0tCiBwYWNrYWdlL2Zyci9Db25maWcuaW4gfCA4ICsrKysr
KysrCiBwYWNrYWdlL2Zyci9mcnIubWsgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnJyL0NvbmZp
Zy5pbiBiL3BhY2thZ2UvZnJyL0NvbmZpZy5pbgppbmRleCBmZWIxYWVmMDVhLi42YzI2YjZkMmUx
IDEwMDY0NAotLS0gYS9wYWNrYWdlL2Zyci9Db25maWcuaW4KKysrIGIvcGFja2FnZS9mcnIvQ29u
ZmlnLmluCkBAIC0zMyw2ICszMywxNCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfRlJSX0JNUAogCWhl
bHAKIAkgIEJ1aWxkIEJHUCBNb25pdG9yaW5nIFByb3RvY29sIGRhZW1vbi4KIAorY29uZmlnIEJS
Ml9QQUNLQUdFX0ZSUl9NVUxUSVBBVEhfTUFYCisJaW50ICJtYXhpbXVtIEVDTVAgcGF0aHMiCisJ
ZGVmYXVsdCAyNTYKKwlyYW5nZSAxIDk5OQorCWhlbHAKKwkgIENvbXBpbGUgRlJSIHdpdGggc3Vw
cG9ydCBmb3IgdXAgdG8gdGhpcyBtYW55IGVxdWFsLWNvc3QKKwkgIG5leHQtaG9wcyAoRUNNUCku
CisKIGNvbmZpZyBCUjJfUEFDS0FHRV9GUlJfTkhSUEQKIAlib29sICJOSFJQRCBwcm90b2NvbCIK
IAlzZWxlY3QgQlIyX1BBQ0tBR0VfQ19BUkVTCmRpZmYgLS1naXQgYS9wYWNrYWdlL2Zyci9mcnIu
bWsgYi9wYWNrYWdlL2Zyci9mcnIubWsKaW5kZXggZmI3NDc3YTIxMS4uZTQxZWUzM2NhYSAxMDA2
NDQKLS0tIGEvcGFja2FnZS9mcnIvZnJyLm1rCisrKyBiL3BhY2thZ2UvZnJyL2Zyci5tawpAQCAt
NDAsNyArNDAsNyBAQCBGUlJfQ09ORl9PUFRTID0gLS13aXRoLWNsaXBweT0kKEhPU1RfRElSKS9i
aW4vY2xpcHB5IFwKIAktLXdpdGgtbW9kdWxlZGlyPS91c3IvbGliL2Zyci9tb2R1bGVzIFwKIAkt
LWVuYWJsZS1jb25maWdmaWxlLW1hc2s9MDY0MCBcCiAJLS1lbmFibGUtbG9nZmlsZS1tYXNrPTA2
NDAgXAotCS0tZW5hYmxlLW11bHRpcGF0aD0yNTYgXAorCS0tZW5hYmxlLW11bHRpcGF0aD0kKEJS
Ml9QQUNLQUdFX0ZSUl9NVUxUSVBBVEhfTUFYKSBcCiAJLS1kaXNhYmxlLW9zcGZjbGllbnQgXAog
CS0tZW5hYmxlLXVzZXI9ZnJyIFwKIAktLWVuYWJsZS1ncm91cD1mcnIgXAotLSAKMi40My4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
