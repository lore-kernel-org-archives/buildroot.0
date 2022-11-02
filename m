Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EBEC433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 20:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B52C81E8E;
	Wed,  2 Nov 2022 20:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B52C81E8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZYEztKYO3RzK; Wed,  2 Nov 2022 20:31:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C11D281E39;
	Wed,  2 Nov 2022 20:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C11D281E39
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E672F1BF476
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0F0C81E39
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0F0C81E39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l1Yjhw6sgeNN for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 20:31:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9F1B81E2E
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9F1B81E2E
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 20:31:14 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id 11so16071059iou.0
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 13:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bdkKC8H4ZRuXi9GLNqPsj0PEFcOfRxl2FTSIwz0TF0g=;
 b=GWH/+a3qWSgwfnKwIJNKoU3rhjbWnAF3+4m0rNwbmAM7IQ9NjH5trhIx9LhHZfR9tU
 z/4we2gc0jM6Be6Yp4wPyBlPB1Kt+Zc96nIKUSCFQ0SdSVm3FPm8M+Ng7bCbehliUAg6
 zZVVYSAUaiAEV9nxh7yqTttC10oVkMqDj+S/5J9vY/7bbgJC14TiC0vNVHn9+SlFX+s5
 WQyWinFYuMZdZu+yH7DWVKk26f7M5x5J5fppM+ZdqxYfvjvyAJ3w1REAIqID5Bdg6HMq
 t/MXoLXnQMMoZB1sFdyR7Ptfmsvme0J89gZn3gd5sy1RKOWj/YW/rElQjIxJFpeUHC3L
 MAIQ==
X-Gm-Message-State: ACrzQf2oTORXI2aGFVfrGVw2BVaLVgsAH7sDvTHP+K0wHSKg5y1n9CuC
 /LMjI8Kw9M2xq2Y6/F8IrsL27523qf9PSQ==
X-Google-Smtp-Source: AMsMyM7TsDWB49xiu8X5Qetqx/OwzhBnE3bCdhz0QJQyl+wU+HWsB7ZfreQ0GtI/tBZ8s4im8mjmJA==
X-Received: by 2002:a05:6602:2e96:b0:6d4:fbcc:b54c with SMTP id
 m22-20020a0566022e9600b006d4fbccb54cmr2206799iow.202.1667421073672; 
 Wed, 02 Nov 2022 13:31:13 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 e70-20020a02864c000000b003728cd8bc7csm5130946jai.38.2022.11.02.13.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 13:31:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 14:31:11 -0600
Message-Id: <20221102203111.3434687-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bdkKC8H4ZRuXi9GLNqPsj0PEFcOfRxl2FTSIwz0TF0g=;
 b=iQbR54FIwPEHibflhUdLPZxcCdDSO5URhL0cVRuL1aRT11OJgPJnG6TTo6AgGzlPyo
 vXgvhrPjUFOSA+CXAXC+98PyWMmCCvpGQDY7QunwX30Ss/B9QYYk/un9UxrV5uDjJsAM
 romjweg8ojoAVnZjZE7U3OT2fu9RABnxw6ECMWGt2imhLhdewbibej6cXmUTRX99Cl8I
 r27t2zUMvI4kyLndfly8pegT/vIu+ZFgdZuWgXHIY5Xs4pGkYdwIR0Z/jZPohzu5iF9M
 BpXkP4T0XRw/9E4mLVTyPfKcIiR6kA3xzGCcrONUB/ulz6xDyVXwqcB1vl1sLz3xvXqI
 wCIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iQbR54FI
Subject: [Buildroot] [PATCH 1/1] package/python-filelock: bump to version
 3.8.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index d7cc864668..e4dd67de07 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  f8458b5235a9e439fd512dc08947f6b2  filelock-3.3.0.tar.gz
-sha256  8c7eab13dc442dc249e95158bcc12dec724465919bdc9831fdbf0660f03d1785  filelock-3.3.0.tar.gz
+md5  9bd8d33d5d7dc95012981ccbfb2d2a0f  filelock-3.8.0.tar.gz
+sha256  55447caa666f2198c5b6b13a26d2084d26fa5b115c00d065664b2124680c4edc  filelock-3.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 00c32b2caa..8d5308ddca 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 3.3.0
+PYTHON_FILELOCK_VERSION = 3.8.0
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/fd/6e/665a6cb363bee26e40954ee812e4e733fd7cafd84c06e0c7c2357641abd6
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/95/55/b897882bffb8213456363e646bf9e9fa704ffda5a7d140edf935a9e02c7b
 PYTHON_FILELOCK_SETUP_TYPE = setuptools
 PYTHON_FILELOCK_LICENSE = Public Domain
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
