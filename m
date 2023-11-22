Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09FAC61D97
	for <buildroot@archiver.kernel.org>; Wed, 22 Nov 2023 01:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B82B40914;
	Wed, 22 Nov 2023 01:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B82B40914
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6dvecNTHpJs5; Wed, 22 Nov 2023 01:04:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60AAA408F9;
	Wed, 22 Nov 2023 01:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60AAA408F9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF1221BF3B0
 for <buildroot@lists.busybox.net>; Wed, 22 Nov 2023 01:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0A4660FEE
 for <buildroot@lists.busybox.net>; Wed, 22 Nov 2023 01:04:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0A4660FEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wzfoFXPY6v4y for <buildroot@lists.busybox.net>;
 Wed, 22 Nov 2023 01:04:22 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6987460F93
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 01:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6987460F93
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40891d38e3fso26992955e9.1
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 17:04:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700615060; x=1701219860;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qZckXsdQ7NLgm7d9VJyyo3u5/TQ5mXirsuO2s70pJDA=;
 b=LkUZyk9CcJQDsV5Ct0LD0+lDpOfqz/51V9OqHiaCZuwYnBmKlVXYabkyx70qBcdVvY
 vBRXBJ1E+r9c6v+3OxNZtncFaGkYFC6+AsQXsxpUPUNqLShDbhm04Nj+Ql27OYWZ+NZh
 ZnLoQLsJZINtj9d49qmSIUOlonPtdYpx5Zwlp9NeY1b/xBv1VgE2IYKNDip23aARKupE
 w3fsJyU1joHWYFYj/ZQlbfj6Sflc/OXVRrJLZXZhWUXz09xVpD587b5HMLHssnlncVFw
 MYSxKiYER4qIEezw69PVRfuD9XOvmDZo+fMm1HAqmtQpzu0pUQy7f8mGtqYvEjwGrj7R
 gC9Q==
X-Gm-Message-State: AOJu0YxYkw2Ry4X9O8XjkuP0wya+gbaBzyd5xjlE4+B31To8PQZpHyAG
 3xyKpd1TUYDNrMMeFzHHKmci+bIqWXGFUIAzR48=
X-Google-Smtp-Source: AGHT+IFCX0ywFe36WlbZF3Va37osjXbiradEHIbN4BY5Kde52Q8rGh8Rb9HZXaboz6aD+pUofP9c8A==
X-Received: by 2002:a05:600c:138c:b0:408:4cf7:4f91 with SMTP id
 u12-20020a05600c138c00b004084cf74f91mr618242wmf.16.1700615059754; 
 Tue, 21 Nov 2023 17:04:19 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a05600c354800b004068e09a70bsm375073wmq.31.2023.11.21.17.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 17:04:19 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Wed, 22 Nov 2023 02:04:08 +0100
Message-ID: <20231122010408.2410999-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1700615060; x=1701219860; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qZckXsdQ7NLgm7d9VJyyo3u5/TQ5mXirsuO2s70pJDA=;
 b=QZj+kiQikTVSog/0OnPdUvVgL6q+vJmKGBecFYzbgVECjD73VdEA8jZtP9JxFMcX1C
 AxMVzzVB9WTVC+GnO5f0UE7pMfapLZdTfDJHPR3z877ldPGEsYaqq1ob3xHWYvrpXKmU
 NRAH0iG9CsKoiT3KaifW2QctXwgffF7PvZCQc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=QZj+kiQi
Subject: [Buildroot] [PATCH 1/1] board/raspberrypi/readme.txt: fix typos
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
b2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0IHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYm9hcmQvcmFzcGJl
cnJ5cGkvcmVhZG1lLnR4dCBiL2JvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQKaW5kZXggYzgx
ZmQ4MDFhZS4uMjFhMTM2ZWI4MyAxMDA2NDQKLS0tIGEvYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1l
LnR4dAorKysgYi9ib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0CkBAIC0xNyw4ICsxNyw4IEBA
IEhvdyB0byBidWlsZCBpdAogQ29uZmlndXJlIEJ1aWxkcm9vdAogLS0tLS0tLS0tLS0tLS0tLS0t
LQoKLVRoZXJlIGFyZSB0d28gUmFzcGJlcnJ5UGkgZGVmY29uZmlnIGZpbGVzIGluIEJ1aWxkcm9v
dCwgb25lIGZvciBlYWNoCi1tYWpvciB2YXJpYW50LCB3aGljaCB5b3Ugc2hvdWxkIGJhc2UgeW91
ciB3b3JrIG9uOgorVGhlcmUgYXJlIHNldmVyYWwgUmFzcGJlcnJ5IFBpIGRlZmNvbmZpZyBmaWxl
cyBpbiBCdWlsZHJvb3QsIG9uZSBmb3IKK2VhY2ggbWFqb3IgdmFyaWFudCwgd2hpY2ggeW91IHNo
b3VsZCBiYXNlIHlvdXIgd29yayBvbjoKCiBGb3IgbW9kZWxzIEEsIEIsIEErIG9yIEIrOgoKQEAg
LTEzMyw3ICsxMzMsNyBAQCBIb3cgdG8gd3JpdGUgdG8gQ000IGVNTUMgbWVtb3J5CiA9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09CgogRm9yIENNNCBtb2R1bGVzIHdpdGhvdXQgZU1NQyBt
ZW1vcnkgc2VlIGFib3ZlIGZvciBib290aW5nIGZyb20gU0QgY2FyZCwKLWZvciBDTTQgbW9kdWVs
cyB3aXRoIGVNTUMgbWVtb3J5IHByb2NlZWQgYXMgZm9sbG93aW5nOgorZm9yIENNNCBtb2R1bGVz
IHdpdGggZU1NQyBtZW1vcnkgcHJvY2VlZCBhcyBmb2xsb3dpbmc6CgogLSBmaXQganVtcGVyIG9u
IElPIEJvYXJkIGhlYWRlciBKMiB0byBkaXNhYmxlIGVNTUMgYm9vdAogLSBjb25uZWN0IElPIEJv
YXJkIG1pY3JvIFVTQiBwb3J0IChKMTEgVVNCIHNsYXZlKSB0byB5b3VyIGhvc3QgbGludXggc3lz
dGVtCi0tCjIuNDIuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
