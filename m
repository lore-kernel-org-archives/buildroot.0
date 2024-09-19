Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF79CF3962
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 18:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59900401A6;
	Thu, 19 Sep 2024 18:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fr7Afnywm8b5; Thu, 19 Sep 2024 18:22:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EB4A401B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EB4A401B0;
	Thu, 19 Sep 2024 18:22:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 613401BF31C
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 18:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5015D61600
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 18:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FIEYTw4-AHRs for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 18:22:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 56446615FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56446615FC
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56446615FC
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 18:22:34 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-82ce603d8daso49040439f.0
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 11:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726770154; x=1727374954;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rGl044xrXhZhVL2ikicSS7FgmkQziLQEmqFr3cC6rxc=;
 b=gmGVaL1v37OAfGyAyluTAPy/2Oecu6/5q76bqcMG0z120TlYPL8vltUKUZzlnIrh4B
 Orqy6usSYc4XwPSHQtDGiswcsEnjdxkWoVopMAc71zaKn3FESUBLebQs4YRhKnxdGgnf
 nEDepczeRjzV7EgHYI0sOebNnhe+2HHcOv5HmRKDEl9VdxNY+3iYYCzdjgC5T9jfbr5D
 9OaqoA5YZfeEJn3RSrcviHao2PvNlF8Pa28ISEJ6i9qI90nwMuotE8k4KDYkVsp/eM7a
 ixQt92N/FGPVDsNPJ5ywC2ILOIWPLJbqLV5wn0oTuunurF3kfQIkUaKT3AUcLUXLiCW4
 09dw==
X-Gm-Message-State: AOJu0YzXw8f8TPMgpcU3BYjXodGVPiWF4o6z11DXZ6YPrKcHBXbOqYwM
 +jKCC4pSRvXebObreBNcBeD8yigu8iJOF2WlkF34RoJ3AuwABwdQCzuxCA==
X-Google-Smtp-Source: AGHT+IHr0H2s/09Cc6T3XeSY4Am7eW89pkbpJ92MRY76vquETf06syyt0XeJcf3863LZCNwHqp3bQA==
X-Received: by 2002:a05:6e02:1a67:b0:3a0:451b:ade3 with SMTP id
 e9e14a558f8ab-3a0c8c9e4e6mr5082085ab.10.1726770153735; 
 Thu, 19 Sep 2024 11:22:33 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e1b77bsm35343415ab.45.2024.09.19.11.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 11:22:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 12:22:31 -0600
Message-Id: <20240919182231.642031-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726770154; x=1727374954; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rGl044xrXhZhVL2ikicSS7FgmkQziLQEmqFr3cC6rxc=;
 b=PawrTjbGbKy4kaxk0nuJ++YCWAzEhh41/Fsl5zZwbHesYfmV5Uo0ifkDGu9xpgdD75
 2qKW9lGAyQs7lfCqyIM05t/UzU7vMlL4CQ9n08T6O/nJAnxEyx8MHdclm0GHvXIpXI7K
 X8j7QCIbeLEOjre4azfXyLKfaq5UVtsHwH1tGb3kej7MK7KcysVbcOo1YqCDHxM7Ka9F
 I+MWRX9VLoJ3p1P9MbBgUqYE/zGaAknZ3l7YVMLW+O0BtGdVExhT0Qq5nhl2LQ4e9hwu
 J++wAyNQDtGn9tCh30tF9MAeTLVA3UAYNVQnb83A4EvaD/ZaSZ9ZRxa7pm7/plEeAvWh
 Rhtw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PawrTjbG
Subject: [Buildroot] [PATCH 1/1] package/python-referencing: bump to version
 0.35.1
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
 package/python-referencing/python-referencing.hash | 4 ++--
 package/python-referencing/python-referencing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-referencing/python-referencing.hash b/package/python-referencing/python-referencing.hash
index 2880a47477..a19dd4a24b 100644
--- a/package/python-referencing/python-referencing.hash
+++ b/package/python-referencing/python-referencing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/referencing/json
-md5  d1a0a4ae03ebba4b86b22bfb825f150b  referencing-0.32.1.tar.gz
-sha256  3c57da0513e9563eb7e203ebe9bb3a1b509b042016433bd1e45a2853466c3dd3  referencing-0.32.1.tar.gz
+md5  4cd2bdcefd1f9a9db2d1ea31338b4ae3  referencing-0.35.1.tar.gz
+sha256  25b42124a6c8b632a425174f24087783efb348a6f1e0008e63cd4466fedf703c  referencing-0.35.1.tar.gz
 # Locally computed sha256 checksums
 sha256  42dcd63495f87b4eb7c7757afa379bb55a53f94afd7a5f657d9adf57236e515c  COPYING
diff --git a/package/python-referencing/python-referencing.mk b/package/python-referencing/python-referencing.mk
index 66d59ed809..5514c1b2aa 100644
--- a/package/python-referencing/python-referencing.mk
+++ b/package/python-referencing/python-referencing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REFERENCING_VERSION = 0.32.1
+PYTHON_REFERENCING_VERSION = 0.35.1
 PYTHON_REFERENCING_SOURCE = referencing-$(PYTHON_REFERENCING_VERSION).tar.gz
-PYTHON_REFERENCING_SITE = https://files.pythonhosted.org/packages/81/ce/910573eca7b1a1c6358b0dc0774ce1eeb81f4c98d4ee371f1c85f22040a1
+PYTHON_REFERENCING_SITE = https://files.pythonhosted.org/packages/99/5b/73ca1f8e72fff6fa52119dbd185f73a907b1989428917b24cff660129b6d
 PYTHON_REFERENCING_SETUP_TYPE = pep517
 PYTHON_REFERENCING_LICENSE = MIT
 PYTHON_REFERENCING_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
