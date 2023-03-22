Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3425EC6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 02:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6303410E3;
	Wed, 22 Mar 2023 02:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6303410E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bm54VcssbLJn; Wed, 22 Mar 2023 02:05:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7163410E7;
	Wed, 22 Mar 2023 02:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7163410E7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D70521BF228
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 02:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1B67410E7
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 02:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1B67410E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ytrBPW5p3MKl for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 02:05:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB041410E3
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB041410E3
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 02:05:35 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id w4so9213545ilv.0
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 19:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679450734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kDqfsUR75HGr6jLWylyNmz8HGAsCnYi2aGTm8qrCjFE=;
 b=Shs06aAc0IJaVd0yrSFPaFRaUdOYooURNlpGfgqusjRWnSfqrdm5Vpa0gO5onCi6gw
 OwWXiLfCU4iFoyzIFAaHY2hGTe48BjkzEf5PiwbjEgkxHQqjnZDjaqb3PoUNbv7Itapo
 EWObBb8YljjDuSezeH/akebBqu/MImG58ETaUEc3Ohw2p65G0VH6bqid9rqANezPOa85
 th6czxfwFJEzE6FiPK3EdsceMIdDUxu0pUWG64kBD/h0cDO+8b2ZE3E+RWthrKDpKzxh
 5cUA8VSJ5ewonmxpHon5pom4AAkVZOnTH+UxvvjNtSiOk4tM8dUjqUxfAH1hjYfjQfkT
 OKjg==
X-Gm-Message-State: AO0yUKXYs6xxdKmA2/CO5NhDVBYcyg8M72eWw1aIOh6fJ2NTI8cnndW0
 jxVviS+1BW2ot9WqXumjlgn8GVVwONiSqQ==
X-Google-Smtp-Source: AK7set+GnnOjvFSMVhZS06OZBMWnATXsZYDkFvyDMT1HZApged/0m8kYJ1xNwX70tIFHt+OM14/dnQ==
X-Received: by 2002:a92:2c0c:0:b0:325:b60b:e309 with SMTP id
 t12-20020a922c0c000000b00325b60be309mr2180823ile.4.1679450734614; 
 Tue, 21 Mar 2023 19:05:34 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 n24-20020a02a918000000b004050d92f6d4sm4576985jam.50.2023.03.21.19.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 19:05:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Mar 2023 20:05:32 -0600
Message-Id: <20230322020532.126682-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679450734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kDqfsUR75HGr6jLWylyNmz8HGAsCnYi2aGTm8qrCjFE=;
 b=FORSoimdadNT0RHgwh3h/0xoAyXCNRP9T61RV1uAM21cv1AxkWxZpX5C6KOetz+PSF
 SqT631X69lUqDahO7BG+ZioZgBu78NxT8Rgi9XaAVyfePh69AONCHkR1gO3MRLTOvZkX
 noYFmedBgXGjFXAUyAgewiKplEjMATmmHNlEzHg+1j+/L5s/Vh83tkuPQLDfo74WD4Wa
 UuJg/3bur5mgfICEtkP6qxUHvtdYju7LzHSRT9JgD4nfNarGu/eY3e688w19AZ0H+qrK
 LPpkLZ9PRQIvhGsCfOErRCQbcPpZG5hQHwrSD9LCITVI5XtaJXymEtKh4big/nRJGWqG
 3flw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FORSoimd
Subject: [Buildroot] [PATCH 1/1] package/python-bsdiff4: bump to version
 1.2.3
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
 package/python-bsdiff4/python-bsdiff4.hash | 4 ++--
 package/python-bsdiff4/python-bsdiff4.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bsdiff4/python-bsdiff4.hash b/package/python-bsdiff4/python-bsdiff4.hash
index bb84bb09a5..f053922ac0 100644
--- a/package/python-bsdiff4/python-bsdiff4.hash
+++ b/package/python-bsdiff4/python-bsdiff4.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bsdiff4/json
-md5  fc5ea1adfe629a7c7ac6f4bb1a0dca93  bsdiff4-1.2.2.tar.gz
-sha256  1880ac3f52a6c46ae6bcc6db117e4fb35f9b0ccd5af75fd4fee6907d00d6983c  bsdiff4-1.2.2.tar.gz
+md5  67cf87c5d66fe389949a314849f68863  bsdiff4-1.2.3.tar.gz
+sha256  1b95ce93b9f306846f6c91c9d0e3eb6590a4c85ac2bbe72b5f60d9db82ad2a1c  bsdiff4-1.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  c6c921c90383f1c43beb53c49a652d28309a410a7c394c729fd8870271451cf0  LICENSE
diff --git a/package/python-bsdiff4/python-bsdiff4.mk b/package/python-bsdiff4/python-bsdiff4.mk
index 7a50e3379a..05fe1bef25 100644
--- a/package/python-bsdiff4/python-bsdiff4.mk
+++ b/package/python-bsdiff4/python-bsdiff4.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BSDIFF4_VERSION = 1.2.2
+PYTHON_BSDIFF4_VERSION = 1.2.3
 PYTHON_BSDIFF4_SOURCE = bsdiff4-$(PYTHON_BSDIFF4_VERSION).tar.gz
-PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/34/e2/e28dd282974f919a6b9adb3b7e64bb1fa4390046706c3e58a60b94aeb497
+PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/a8/0e/a677b62d35e3a9d074eafb5b16b569d5d6870a6ead02e8c830e4d4e73db7
 PYTHON_BSDIFF4_LICENSE = BSD-2-Clause, BSD-Protection (core.c)
 PYTHON_BSDIFF4_LICENSE_FILES = LICENSE
 PYTHON_BSDIFF4_CPE_ID_VENDOR = pypi
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
