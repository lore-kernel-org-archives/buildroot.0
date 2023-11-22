Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1578DC61D85
	for <buildroot@archiver.kernel.org>; Wed, 22 Nov 2023 01:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 889FF401CD;
	Wed, 22 Nov 2023 01:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 889FF401CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eNhKC4MdtBZV; Wed, 22 Nov 2023 01:06:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBAA7401BC;
	Wed, 22 Nov 2023 01:06:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBAA7401BC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D74041BF3B0
 for <buildroot@lists.busybox.net>; Wed, 22 Nov 2023 01:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD5F6401BC
 for <buildroot@lists.busybox.net>; Wed, 22 Nov 2023 01:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD5F6401BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y6SjVNzxaMOG for <buildroot@lists.busybox.net>;
 Wed, 22 Nov 2023 01:06:24 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE4C9401B3
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 01:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE4C9401B3
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40907b82ab9so1652375e9.1
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 17:06:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700615181; x=1701219981;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pwukpLC+373wJbe9BVD7UCfdurZBiF9F7FGs6sC1Wfw=;
 b=cHqAzxkMam1QAKuG1OOkOd+TBmUuYTDXBAz9v7Pop9SPNcU1+205sA4HnoG31UEet7
 eABpbls1mx6DidbaOIyoI77LDKAaWXauToihzkLSGDGQQN5BJTjKHp/soic42nOiPfBN
 oNWTfKHoQI2IWF3ZKKbYaie++Vi/MkCAeFjqNYvad0BbbWXPX/AR0aIVtCsqsY5uFJ/4
 n0xQ+6U2nHKujPZdN6Jdcc1R8ThHSjziQHeXsuOWTc4Ia+0u+yM04K29K1s2hjjzzVag
 gxZYtDqFj699KJnXMYjtvMl2BQzOKVrKdDJy0c5i4YUuYIEPSLVU083pLtLGeicdz2Tl
 u+0w==
X-Gm-Message-State: AOJu0YwAmuBdPIdxr4FdaGPuj8oWNuFK7ptDRK8HYEwIY5h5vvUslxfF
 uOIY96v4UCVkENmb/PvnVwMutlDnUbBei59Pqlg=
X-Google-Smtp-Source: AGHT+IG0Xxxw1EMheQyAorIrglCW9j27KyMGGkpU78QOWE69bXVa0VSiQbyPwK4ul6KXOU2PMcE9/w==
X-Received: by 2002:a05:600c:3109:b0:401:c7ec:b930 with SMTP id
 g9-20020a05600c310900b00401c7ecb930mr3775758wmo.10.1700615180778; 
 Tue, 21 Nov 2023 17:06:20 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a05600c4f0800b004060f0a0fd5sm378472wmq.13.2023.11.21.17.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 17:06:20 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Wed, 22 Nov 2023 02:06:10 +0100
Message-ID: <20231122010610.2411374-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1700615181; x=1701219981; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pwukpLC+373wJbe9BVD7UCfdurZBiF9F7FGs6sC1Wfw=;
 b=CLtkEMBKgcV3TIzGM0p8VlRnJq09PzJdiLwWPyqi/cXtbj/tk00PZAifI+6OdAQ4e7
 ALzYcuB8XIctRU7CKbm3wpGB/FTiva3PnNejHzj0kfC59pxYOXMrILEXDY0EWV1r+1wH
 PpUbnmWQagQ+0qb4zC9rYsvb+DTr4AgovL1WU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=CLtkEMBK
Subject: [Buildroot] [PATCH 1/1] board/raspberrypi/readme.txt: add pi0w hint
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

U2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheUBydG9uZS5mcj4KLS0tCiBi
b2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0IHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dCBi
L2JvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQKaW5kZXggMjFhMTM2ZWI4My4uOTIwMmI1ZmYz
NyAxMDA2NDQKLS0tIGEvYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dAorKysgYi9ib2FyZC9y
YXNwYmVycnlwaS9yZWFkbWUudHh0CkBAIC0yOCw2ICsyOCwxMCBAQCBGb3IgbW9kZWwgWmVybyAo
bW9kZWwgQSsgaW4gc21hbGxlciBmb3JtIGZhY3Rvcik6CiAKICAgJCBtYWtlIHJhc3BiZXJyeXBp
MF9kZWZjb25maWcKIAorb3IgZm9yIG1vZGVsIFplcm8gVyAobW9kZWwgWmVybyB3aXRoIHdpcmVs
ZXNzIExBTiBhbmQgQmx1ZXRvb3RoKToKKworICAkIG1ha2UgcmFzcGJlcnJ5cGkwd19kZWZjb25m
aWcKKwogRm9yIG1vZGVsIFplcm8gMiBXIChtb2RlbCBCMyBpbiBzbWFsbGVyIGZvcm0gZmFjdG9y
KToKIAogICAkIG1ha2UgcmFzcGJlcnJ5cGl6ZXJvMndfZGVmY29uZmlnCi0tIAoyLjQyLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
