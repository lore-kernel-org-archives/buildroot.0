Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD796C47258
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 16:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64FB041FD8;
	Wed, 17 Jan 2024 16:49:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64FB041FD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tAiAD9AF_0QG; Wed, 17 Jan 2024 16:48:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA90541FBE;
	Wed, 17 Jan 2024 16:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA90541FBE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF6581BF289
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 16:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4EA841FBE
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 16:48:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4EA841FBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vKEdGaUjNEMb for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 16:48:55 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E60E41F7B
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 16:48:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E60E41F7B
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33678156e27so9697480f8f.1
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 08:48:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705510134; x=1706114934;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rPo1lzBf79W9IYm2n7wqrkvSbVRgQDLRFfKRQVUxyJg=;
 b=NlMWasUn+kQbiCD1XcFrvYVF7+QvgZMX0+eA+bVS/zDEbjeKqENr5Ya8BgqGIJN3MG
 UIqi4Xfe65gBF5aLbO5kxLvGxD+xsAm2gbOrVfO/gWg3Mep/zriv6GWQMJUmhZiMYqDK
 R07D6sFKVBTHSsfFClwNuKo1KxmRny2LTfpkmYCs6uDvM2bgIQrvuC2F+fMzjQPi2P33
 bS/CatLUMY6g1fZJsA2Ots+CLEqvkhlSOUX+d5Qqj24H8UdeoFsPzGfnwcl2aG2SdALu
 WDmaVHPS36M6zqPGIJ9YGHJ3hLeCY8/HDXPif2KRL/pBwkeyyUbjfaTcqa8swVREIGHn
 1Low==
X-Gm-Message-State: AOJu0YxwSGC6dAAJuxgOB3iIj8E3ONa+JResfAh59aHd22RH7ThXETLn
 lCmeNyw3iYJOy8yZNgv022VJiGR6c+n1vQMO0i8ZPFUZ8h4=
X-Google-Smtp-Source: AGHT+IEbjLSwadI3b4CJky8vj8j7c0roPZV0q72o7qhzDqLdJ/3zOvNEoHwylkUXWTZSm9DbRCuAJg==
X-Received: by 2002:adf:ea82:0:b0:337:bcec:d468 with SMTP id
 s2-20020adfea82000000b00337bcecd468mr1784404wrm.36.1705510133688; 
 Wed, 17 Jan 2024 08:48:53 -0800 (PST)
Received: from P-NTS-Evian.. ([80.215.186.76])
 by smtp.gmail.com with ESMTPSA id
 q13-20020adf9dcd000000b00337c00d55ebsm2056176wre.80.2024.01.17.08.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 08:48:53 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 17 Jan 2024 17:48:51 +0100
Message-ID: <20240117164851.384033-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1705510134; x=1706114934;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rPo1lzBf79W9IYm2n7wqrkvSbVRgQDLRFfKRQVUxyJg=;
 b=vJrWJbuJfHTlISXf8FF12qlIUa/P2q3fkMNfQHzdBYpWiAtQ9OPcBjE+Myv/WXulyR
 21TeTt42MnEOOROFTzv7QTTR100ob/Os8TUwRJ8jKwIrCGAXQRXiqsgn4yMTq5WtdxDy
 O476fcCiGtykG4y3C2Sn9LLfP2v0s6Fxq58Ua6Pmx8kiVKv0fNhWl3r2M4Kjucysjbn8
 IGhfdpfK0YacXUMg6cV8PWI2io5QH+uV8468HtXETuhZUzdtfM1+lMqQeibIyTjV3TAB
 +9Si2tJ+L1fTCJRXLIshGxUUgg9dk3mpXrHM6wgvpliU/SUWekeemucCjJIOEiAm67b9
 0ypg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=vJrWJbuJ
Subject: [Buildroot] [PATCH] support/testing: TestPythonPy3SciPy: increase
 rootfs size to 250M
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The rootfs generated TestPythonPy3SciPy by doesn't fit anymore in 120M.

Increase the rootfs size to 250M and checking the amount of space
available on the file system.

  Filesystem                Size      Used Available Use% Mounted on
  /dev/root               232.3M    134.5M     85.3M  61% /

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/5880448601

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_python_scipy.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_scipy.py b/support/testing/tests/package/test_python_scipy.py
index 06297763c3..fb51f25d79 100644
--- a/support/testing/tests/package/test_python_scipy.py
+++ b/support/testing/tests/package/test_python_scipy.py
@@ -10,7 +10,7 @@ class TestPythonPy3SciPy(TestPythonPackageBase):
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_SCIPY=y
         BR2_TARGET_ROOTFS_EXT2=y
-        BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+        BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
         # BR2_TARGET_ROOTFS_TAR is not set
         """
     sample_scripts = ["tests/package/sample_python_scipy.py"]
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
