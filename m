Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31B7C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 10:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51EF760B6C;
	Sun,  5 Nov 2023 10:04:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51EF760B6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3JjdzmlHrES8; Sun,  5 Nov 2023 10:04:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D40560B89;
	Sun,  5 Nov 2023 10:04:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D40560B89
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 257D31BF868
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 10:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EED1C60B89
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 10:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EED1C60B89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SlUchwnwpYTL for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 10:04:01 +0000 (UTC)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC92560B6C
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 10:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC92560B6C
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3594c100735so8871635ab.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 02:04:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699178640; x=1699783440;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DoH8SDH9FoAGvVtYgKqdq0w67kIDS9rK3WAPMCRbCm4=;
 b=TLiB4jhA+lO+a0sRv0+3GC7FpApNyzcUB24s4ATQuBJiaC+dhJQb/bJ90qELUfQRUG
 sIoNlFe7t/dNa7uamtkoKYt94uhnjm6Py8FdGvqPKAM4eYVlAwdeY3zI94/mYv0FAktS
 SBawuu5+M9+KRLn5kmnbrtzYQbHBt8Ni9/UKhidtvE9SfNlp/uyxo1A6/bu/vTWt3XXT
 QkQ6ly99mNZdouGUUeajyMx9Mj4zlAu9rY9vBN2dS0K6C1nt+obgs3afvEbRsFooURJZ
 HVUDa+rOnnwX/sOnOrlg9nsyKRQLa69TX/MrPNtrRsaJ10kKM9JgRHbN+TV+l4iq3O/h
 LH9A==
X-Gm-Message-State: AOJu0YygokFYJc4QZxqSy3+dHPQnXtLWIpEg1yDlONSw38jaO6kKRvRu
 57ih1uOWmCQs6TKDegyUjc9nm5Ghr2gr7Q==
X-Google-Smtp-Source: AGHT+IFXQzlwC3ciPHVrqbYKube2fbhEHRyaurZ/FRZhdOxBQJwhSmwrbsZQsfKoAjNADWSTXdlqDw==
X-Received: by 2002:a05:6e02:1a61:b0:359:33dd:f470 with SMTP id
 w1-20020a056e021a6100b0035933ddf470mr7290232ilv.3.1699178640224; 
 Sun, 05 Nov 2023 02:04:00 -0800 (PST)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 p8-20020a92c108000000b0034fd4562accsm1781219ile.28.2023.11.05.02.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 02:03:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 03:03:58 -0700
Message-Id: <20231105100358.2959364-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699178640; x=1699783440; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DoH8SDH9FoAGvVtYgKqdq0w67kIDS9rK3WAPMCRbCm4=;
 b=NuEFoJVAaAfUQMFBKBk7kJinE1mKFQEzMihunp6VrU3sj058LGiYDa7OkjhZ7shwEc
 AvS5FRlpiYyB9PytKBerXG3INtspyZhKSUhEJMstRJ9Fv/kd7smpJRRTzqAPx2meQYdZ
 Z1egUwzvixq+ECqLl8EjM8zzfNJlQmlUoGWo9CHfivIQIUskfesyGB7Io7Sf4P5V6Dee
 gXwqbC2+MGa+bvTU1uO2JZ/RnHLvBFwyaKMb8N0DmTDRbtvvgbcdy1jMt4a4ZTTOuIpZ
 RchgIRJqJpy2aArMpBQsU26LOWG9ENFNsR4M5kgpyTI3hNZjoWVRDLZfa33Nkp/Jj+LM
 eTYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NuEFoJVA
Subject: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.3.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index 698b763a55..fcc6a25713 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  4f8ce543728abfd83885935452d2189f8847445ead501cd8609f74c8a2b1ae0e  maturin-1.1.0.tar.gz
+sha256  7e2fdc083ae253c0f68f6313a2ad2de423219f09e7fa65ef55189d42128e4cff  maturin-1.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index d321e7941c..170dee7649 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 1.1.0
+PYTHON_MATURIN_VERSION = 1.3.1
 PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/7b/78/2814bc0e46a96861aab337fd0404e7937acdb4ce187da239224ab4560d35
+PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/d6/a3/42ff26b2b3011ada67c73db32a9ccf9fa18d459cbef8ed6eefc3b283ee60
 PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
