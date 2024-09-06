Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C42BE6FE35
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 17:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2292160646;
	Fri,  6 Sep 2024 17:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fC-xwIGD06eU; Fri,  6 Sep 2024 17:42:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34F6D6067C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34F6D6067C;
	Fri,  6 Sep 2024 17:42:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 35E1A1BF38A
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 17:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 217C781D19
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 17:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k8e1YiGf8--I for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 17:42:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 31D5C81BA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31D5C81BA9
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31D5C81BA9
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 17:42:31 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-82a274dd17eso98399739f.1
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 10:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725644551; x=1726249351;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tAVbTS0A57uEDbAO8LGWHv/Rd13QzMp59uBlGANtr+I=;
 b=PQ9vxskGhrWHSFIlsiFgQhZGhOBr+AwG0QY6owvq+8rriEoXtegeN5PldGlkbxTPRr
 dFlBQP2XbZd7zpjOAkbWVP59N1XUC/7BT3kzvqzpsybRCzNsgJCMDtW8DpFWIsnSz0zh
 NAiBOjAI3MAdGEHsIRZhfxI1FpS5TTMMdlxfx2oGAT/FQ4dPzp6okAmrOWy1dy1U+5cv
 3Bxmb1nahCxlVgyaCUoq0onF9dBA4PKDHjsTwzsybWSHinSS8NeYNhmBs15mD73sURiS
 hXk7VhJT7kAQ9L6Zptp7RiwuSNYWaZva7NvtN6hNdzYrSrpmoCM8xx1AWJKYAsaYnlKg
 Jo0g==
X-Gm-Message-State: AOJu0Yxnbg0mo6aLY7jhpbFP7RyJiQKhwv3/TVY1P1w5t4Xf8BBKgwOx
 578xTfNtjL+tAkfrWLp8BmMQxpNRrB6y6zHCHmXJ1nJWrGeyiG5ihF/K/A==
X-Google-Smtp-Source: AGHT+IGCWKFr/Ds0HYZiea2YDnswtKyv9JW161Ik3v5JSk5pH0FcFzlMBdczipir0myoSR2Mnm6boQ==
X-Received: by 2002:a05:6602:600a:b0:82a:1e96:bce5 with SMTP id
 ca18e2360f4ac-82a96212737mr416608339f.10.1725644550611; 
 Fri, 06 Sep 2024 10:42:30 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d08762099asm389762173.5.2024.09.06.10.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 10:42:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 11:42:28 -0600
Message-Id: <20240906174228.3103917-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725644551; x=1726249351; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tAVbTS0A57uEDbAO8LGWHv/Rd13QzMp59uBlGANtr+I=;
 b=cya2ZrS05cVziwCC9edtau5aFfU0UAV0ADuf0F8Myx874chK7FHHObjgYApz6cMNnV
 vhy8/MtdYY01S7AFPoUoDiNgfvw7T+59S9WMv7c18egWpzRHL3N5IELgWsRMglef7bQm
 IbrgLBkPh7/2izPyH80oNyu60DWwG3CJqqq949iINcgV8pZDdkckvUb/zMPr+trlD5nD
 QMYKEkELV1i7OqlX2sd060Hg161+0rSHUyMtkaxXTyr9Heig8jS5dlwEnWutzjpy93Dh
 TbM+SLj9aUJ1M1C5mABgXUsrc4Cls9vx+vnvZZ1ztk5vOq2pNI1V2PdlbV4SCmsNjMJS
 wHxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cya2ZrS0
Subject: [Buildroot] [PATCH 1/1] package/python-dbus-fast: bump to version
 2.12.1
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
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
 package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
index 08d2675443..b6fea9a4b9 100644
--- a/package/python-dbus-fast/python-dbus-fast.hash
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
-md5  791ce3b0c04099959161a18ae983bf25  dbus_fast-2.12.0.tar.gz
-sha256  849478e11d251fa4ebb99ce5bfee332cb6383c63ef0bc97bae23cef4e0badf9c  dbus_fast-2.12.0.tar.gz
+md5  32ff588b9ae1f26d652b6fdd07ec7066  dbus_fast-2.12.1.tar.gz
+sha256  e91a7d43efbd9e0bcef755a53526afba506a74a0d43e0818c1e9b4d6b1396945  dbus_fast-2.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index 1456ce5e4c..4703009cd9 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_FAST_VERSION = 2.12.0
+PYTHON_DBUS_FAST_VERSION = 2.12.1
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/f5/8c/220fcbe4337b842d730d5752f207fc8efd3a02405c71c329e61218e947b8
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/1d/5f/f0757ce529d353739970ebc4a2d9b083b2dcbe0f737fc98706e36f4a0f96
 PYTHON_DBUS_FAST_SETUP_TYPE = pep517
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
