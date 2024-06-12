Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD4BC27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 11:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B04A580BFF;
	Wed, 12 Jun 2024 11:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rv-dhUgcoGov; Wed, 12 Jun 2024 11:09:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD95381EF6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD95381EF6;
	Wed, 12 Jun 2024 11:09:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F15AA1BF373
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 11:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF90060799
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 11:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id whQq4A0vF-r1 for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 11:09:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=jonhenrik@qbee.io; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F4CD60796
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F4CD60796
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F4CD60796
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 11:09:51 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52c9034860dso3437215e87.2
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 04:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718190589; x=1718795389;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QLfTeDRXtValcio7jw3QunR+rUvhHxpMwI2Yr+T+IYk=;
 b=GWuJ+ETuX+OMm85u4YcMxq0LBJwjNDefxQhIo4NKfWvznyxYGxEJgfJqi016hQflPG
 Is+8CLoe/zu332HtMjvstrwu5dayB//Lj6Jm0DF2+xjyY8T7FIVjqFUguY8UMS+MZjMV
 xJ6crDIlfnleMwTt9iYTpEgKgjbRXiBViqaxE9piBUkwV0G41afIE9legC/LEkyYVG0P
 v53TFkAI0fPyjQdf1TzSJgM7kBiWY7rXNsMsoAWY8hbZhnjNoHLs/UHLxwnIx3KFq/jT
 fXaalRq/D7ZZerceJhdJjAU2TQfvBeJr843ry64USaO9V8AHHRIx7hSo1S9gVZ+xnLq/
 Hfng==
X-Gm-Message-State: AOJu0YwpYhG6sQa4i19JLUprdB7EiQIN2VLczsOcoTntUSgithD4WOw2
 f7HYaUqJqljgdMpmNmcEYMSvUUq3UY66kvibjYoBjU6IHJhLaRVHOIIDnn+bxbBfNwnwwf6S4CB
 xLoU=
X-Google-Smtp-Source: AGHT+IEhvggqXFPqhPlD6cMOOTuqa4dY6Ta89wuIW0RTTFijNnJOWi6nLwRkt0EH9KdjIxIy+80phQ==
X-Received: by 2002:a05:6512:b12:b0:52c:9e5b:6aac with SMTP id
 2adb3069b0e04-52c9e5b6cd0mr777691e87.3.1718190588981; 
 Wed, 12 Jun 2024 04:09:48 -0700 (PDT)
Received: from nola.getinternet.no ([84.209.51.172])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52c9daaf31fsm111515e87.104.2024.06.12.04.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 04:09:48 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 12 Jun 2024 13:09:44 +0200
Message-Id: <20240612110944.458745-1-jonhenrik@qbee.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qbee.io; s=google; t=1718190589; x=1718795389; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QLfTeDRXtValcio7jw3QunR+rUvhHxpMwI2Yr+T+IYk=;
 b=CbOMjWkIUch1XGm/q1bCV5xTOpzZC5x6RZzAXE2fBz54q5RyMf/EBNhBmfbIdYMgwj
 0uy5VbMycSTsmMNc+QemunvSIKU7IWY/QDjfEMEWzXKqEbJZkay44cK44f21NJZJHQ42
 yTdprym7QGyEO3h5NH9b+VDtoYpuNi0O5DWDk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=qbee.io
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=qbee.io header.i=@qbee.io header.a=rsa-sha256
 header.s=google header.b=CbOMjWkI
Subject: [Buildroot] [PATCH 1/1] package/qbee-agent: bump version to 2024.23
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
From: =?utf-8?q?Jon_Henrik_Bj=C3=B8rnstad_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSm9uIEhlbnJpayBCasO4cm5zdGFkIDxqb25oZW5yaWtAcWJlZS5pbz4K
LS0tCiBwYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5oYXNoIHwgMiArLQogcGFja2FnZS9x
YmVlLWFnZW50L3FiZWUtYWdlbnQubWsgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9xYmVlLWFn
ZW50L3FiZWUtYWdlbnQuaGFzaCBiL3BhY2thZ2UvcWJlZS1hZ2VudC9xYmVlLWFnZW50Lmhhc2gK
aW5kZXggOGU5ZTcyMzBlYS4uOWJlNjQyZWY2ZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9xYmVlLWFn
ZW50L3FiZWUtYWdlbnQuaGFzaAorKysgYi9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5o
YXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgZDMyOWQ2
ZDFjODg1ZWM0ZDQxMGFiOGM1ZjkzMzIwYWI2MDNjZWY4NjAzMTFhNmIzOTJlZGQ1YjkwMzAzOWE4
MSAgcWJlZS1hZ2VudC0yMDI0LjA5LWdvMi50YXIuZ3oKK3NoYTI1NiAgMWY3NzQ0MjE4NmYyOWZh
N2EwYmRmMTM4MjMzNGNiMDVmNDhhZjNmMWI2MDZlNjJiMzE2ZjBhOTk2MThiNWE5ZiAgcWJlZS1h
Z2VudC0yMDI0LjIzLWdvMi50YXIuZ3oKIHNoYTI1NiAgMDJkMDdkOTZiZTk5ZWIwNDJiMDFiYTY1
MDA3OWE0NDBjZTI2YTc4YzVlMGUxZTgwNjBjMzNhOGM5ZTIwMDQwNCAgTElDRU5TRQpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQubWsgYi9wYWNrYWdlL3FiZWUtYWdl
bnQvcWJlZS1hZ2VudC5tawppbmRleCAzMDIxOWVlYmRjLi5hYmE5ZWRiODI0IDEwMDY0NAotLS0g
YS9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5taworKysgYi9wYWNrYWdlL3FiZWUtYWdl
bnQvcWJlZS1hZ2VudC5tawpAQCAtNSwxMiArNSwxMiBAQAogIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKIAogIyBrZWVwIFFCRUVfQUdFTlRfQ09NTUlUX0lEIGluIHN5bmMgd2hlbiB1cGRhdGluZwot
UUJFRV9BR0VOVF9WRVJTSU9OID0gMjAyNC4wOQorUUJFRV9BR0VOVF9WRVJTSU9OID0gMjAyNC4y
MwogUUJFRV9BR0VOVF9TSVRFID0gJChjYWxsIGdpdGh1YixxYmVlLWlvLHFiZWUtYWdlbnQsJChR
QkVFX0FHRU5UX1ZFUlNJT04pKQogUUJFRV9BR0VOVF9MSUNFTlNFID0gQXBhY2hlLTIuMAogUUJF
RV9BR0VOVF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQogCi1RQkVFX0FHRU5UX0NPTU1JVF9JRCA9
IGMzMGQ0M2I4ZTY0Y2ZlZjk2MGNlZTk0NzViNThhZTA4M2U0YWQyNDYKK1FCRUVfQUdFTlRfQ09N
TUlUX0lEID0gMzIxOWMxNzczMGVhYjRjODA1OTg0OTQ3MzJiNGJlZDRjNGMxOGI1MQogCiBRQkVF
X0FHRU5UX0dPTU9EID0gZ28ucWJlZS5pby9hZ2VudAogCi0tIAoyLjI1LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
