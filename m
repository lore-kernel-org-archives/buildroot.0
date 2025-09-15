Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A342DCAC592
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 21:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B595409B2;
	Mon, 15 Sep 2025 21:58:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SuBlCKC8zQtX; Mon, 15 Sep 2025 21:58:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72C31409A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72C31409A5;
	Mon, 15 Sep 2025 21:58:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D7A7199
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 21:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 708D860B33
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 21:58:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mjj0s_5UBLmX for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 21:58:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9368060AC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9368060AC5
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9368060AC5
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 21:58:22 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-88758c2a133so433801039f.0
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 14:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757973501; x=1758578301;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eJqIGJbUcFj3XJS2B/QiUsvxQzUFlGZvPU7YZB4wB24=;
 b=qMJklG+Tm7AiqUuDxPGLR4QwfO+vAvBbh60zx1N7Otye1Zm3KQ6ssAEqkk9JjAahDM
 Y+W5ussH5ybg2K/7SxSDT847FPthVJvoRQE4Zm81EkI4Nl1NxWy/41bsH/1rDYEAukol
 2rvr3GB5/vpUB5Am60/8Q4cDMhUNttrWu7foYDavxu90Xt6uhA7Z4bcy9+M3JsSdnt6W
 qTp780pf0k9CLxa1IiiE3nDfTVIV6iGeF9bxwr23QLCte3V1U0cmwJnB7MJzNYulicEj
 ZrTuEK8KKICkRsJttbm/5mcrgMDwBH0asexNxAmBLck3uJ4m3wGF4bpJeIvQNA3pq6/C
 6xjQ==
X-Gm-Message-State: AOJu0YxShw1BD67xV4eB6xs1kQ6BUR9MOleEwqPsycxAk6BsKAkpSDhQ
 UQRBkR6yF9FGI2JUZN4A5LlhCgXEmYv5HOrcIbjvR7WegZPfS1rPHNSnj6H8MA==
X-Gm-Gg: ASbGncuuWwGi0MQ7jdzEQ25e7Eb54eNFzzyCmaLMeZ0xq+oxXDe9zuTYsYXmRpt7Zd3
 nBbER95gULRlaDGUcyk+K3uxEPzE/y8CPB/OLzPUoo6xjnzfXQWI8fLIgHjTOC0AQ03QR32UZRE
 mS0hIadSb1jcLMc8/TVjti8AjgLArNHRl98gOcgAH1JcoY+H/HOZ6zoRUjKF2kooEJnlgH/WD14
 Sqf+IJ/swJYVCEw54BbPc5Xrc+asBDi2K6noq4c6E1naFfWgwYRPL4/CzsbuF4oJPuNZnpVIPlp
 E+KGusPaSW83A9DPf4BUIvwDdEY3DC7qSRcSFtuHlQmxao3QgFY2gTYIME6OQgj6qgDrCdB9O59
 p3jg9JCPn74SpKIojqRchnPKCI1SzWECtb+IHx3R80SeF8GYaISKlYC7G/JHBTZLK6M1FLgWmap
 O6F18eaxgMjFA=
X-Google-Smtp-Source: AGHT+IHx9gvgbfbTA5uXkTkWzb9WaGk58fkZfXvmceEd4c6LpLSDAMafwd0ihqhtDCkRdvSJ/Io9zQ==
X-Received: by 2002:a05:6e02:214c:b0:40e:a0e1:2f61 with SMTP id
 e9e14a558f8ab-420a426887amr132781715ab.26.1757973501276; 
 Mon, 15 Sep 2025 14:58:21 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-41dfb7fbe5bsm62644175ab.47.2025.09.15.14.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 14:58:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 15:58:19 -0600
Message-ID: <20250915215819.1591746-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757973501; x=1758578301; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eJqIGJbUcFj3XJS2B/QiUsvxQzUFlGZvPU7YZB4wB24=;
 b=mrNNrpxZYwvMtJSyFk+GjtA3v/nd+DwL/7IwUrw+QzOyaNkGxRuUlGDS2dE0D6iO2d
 DsuLUTNPUlCJJG4qc1X4F1MFwp18eWUSqDYHbussVQehuNuelXmg7AcZnN3eQROKUQjd
 MtmRVODB/f0SDErobfrtcYf0eQ5qlXNUk3o1aYICSveMTUfYckyI03W34qDdOD5ohDZ+
 t0EYnLxUu4y+tpUqyFwhNWV6ECw8KcXhLqbmroWkzwoADmpn6Zu9y3/8cdvUy/CqxEHs
 xXH7hyzCdDkarArnzfFj4jyOdSeXbiXDInsTdJ+dM9h35/QB23dJdMuOCWao78yApCeY
 4YMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mrNNrpxZ
Subject: [Buildroot] [PATCH 1/1] package/python-anyio: bump to version 4.10.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-anyio/python-anyio.hash | 4 ++--
 package/python-anyio/python-anyio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-anyio/python-anyio.hash b/package/python-anyio/python-anyio.hash
index e1fdf474c2..297188db48 100644
--- a/package/python-anyio/python-anyio.hash
+++ b/package/python-anyio/python-anyio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/anyio/json
-md5  d0e4db5f5e4041d1bc9664042b454218  anyio-4.9.0.tar.gz
-sha256  673c0c244e15788651a4ff38710fea9675823028a6f08a5eda409e0c9840a028  anyio-4.9.0.tar.gz
+md5  cb471a6d2338e026d7ba9eed50cf8fff  anyio-4.10.0.tar.gz
+sha256  3f3fae35c96039744587aa5b8371e7e8e603c0702999535961dd336026973ba6  anyio-4.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  LICENSE
diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
index 3be3f2b78f..122900f3c7 100644
--- a/package/python-anyio/python-anyio.mk
+++ b/package/python-anyio/python-anyio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANYIO_VERSION = 4.9.0
+PYTHON_ANYIO_VERSION = 4.10.0
 PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
-PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/95/7d/4c1bd541d4dffa1b52bd83fb8527089e097a106fc90b467a7313b105f840
+PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/f1/b4/636b3b65173d3ce9a38ef5f0522789614e590dab6a8d505340a4efe4c567
 PYTHON_ANYIO_SETUP_TYPE = setuptools
 PYTHON_ANYIO_LICENSE = MIT
 PYTHON_ANYIO_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
