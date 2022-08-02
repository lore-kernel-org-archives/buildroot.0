Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D12C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 17:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FAA040942;
	Tue,  2 Aug 2022 17:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FAA040942
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cq-LpnRCqRyY; Tue,  2 Aug 2022 17:31:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B6F640931;
	Tue,  2 Aug 2022 17:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B6F640931
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F8161BF5DD
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 17:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41D4681747
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 17:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41D4681747
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sjINpQDMfFHV for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 17:31:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7716481699
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7716481699
 for <buildroot@busybox.net>; Tue,  2 Aug 2022 17:31:47 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id l22so18763270wrz.7
 for <buildroot@busybox.net>; Tue, 02 Aug 2022 10:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UsIv7F8Sr9vEyfGHsX2fdHMH2vGxdlfjHnIqM5lsGJ8=;
 b=pluNBPB6XYk2LfEbwqi9z2+nydoBng6JNrKi9T/SjXC/KWF5PKpDhm3c8Fb1XiFVDP
 QmsFGKtznQ8FwODtapNC9ENy5chcCouMPCYmXWzrmaFLnXpb2TGypL6hZrfAMOx9nvxw
 K7SoA56//FxIPBBHlxG+3J8iSw7Ohp8dC+l8G3HA/ZqXCXNnwGax1tHGhxxv630m/xuD
 wz5JK3dRcxlNO4IwEU1aitXJSMEo6HhrW66WSVDoxpG/c82GTzADV/CVKdW9IGUL9IdJ
 1uIO36vStQSk5vVO9+dypbjRMP/qPQLHcEZ/frCR3/ZQUHjbS7WfG66OKIrDfNK5LkAR
 6POA==
X-Gm-Message-State: ACgBeo3XEwtHLLGHalVc1ac6wpBO+5/kX6BzQM4aHWBZ7dw+7oQO3awW
 1HlNFrVa9tvn2wrb3Hvd4N67U5ap2Z4uqA==
X-Google-Smtp-Source: AA6agR4czmavdKVb/bzh4d+KCMkWEy6iqJwhrpPbSSkttagG5x3ysQMUcMVH37F1+SYcjDKZuc/LRw==
X-Received: by 2002:adf:ea03:0:b0:21f:151e:780e with SMTP id
 q3-20020adfea03000000b0021f151e780emr12490053wrm.25.1659461505492; 
 Tue, 02 Aug 2022 10:31:45 -0700 (PDT)
Received: from pc-140.home ([2a01:cb1c:794:2300:d109:33e7:bc94:49e5])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a05600c154c00b003a31169a7f4sm26750156wmg.12.2022.08.02.10.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 10:31:44 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Tue,  2 Aug 2022 19:31:21 +0200
Message-Id: <20220802173121.14438-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UsIv7F8Sr9vEyfGHsX2fdHMH2vGxdlfjHnIqM5lsGJ8=;
 b=KWZEaWlhL9or5TpqDf+Fad7Xevei97UkVCYf6Nr6RL8ydrU7Hi7AzPOHJO1R9SfXJq
 wurbUHD0XJqHdMFU08fZdIV7uYQAjP0QpxAe8sBML5GpgvVRtbdCClIm/46ZDoTd3aX4
 U02lyRvCVwxmDHG4a8DmNcHASOH4YF5kOIsGUcSmKHbKbhn2gCgGHmcS6pomvJC9MZiX
 8zojNgTdvjvSVLHuV+Fa3n4VET3ZaiqUXUS0FsjYneq1anVcvj8cpETd9y5tJyeJbgv1
 MC14HuomVSJLym4QTzZpXmkPIpjs3UTYn55z/o3Kvz2eQsUlsrziHn+WxtGMi8DcG57I
 UT2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KWZEaWlh
Subject: [Buildroot] [PATCH 1/1] support/testing: test_python_scipy relax
 timeout value
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We might get a failure here on slow build machines,
as scipy is fairly long to import.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
Test did fail on my laptop for example
---
 support/testing/tests/package/test_python_scipy.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/package/test_python_scipy.py b/support/testing/tests/package/test_python_scipy.py
index fec4f4319f..007bc9ffa5 100644
--- a/support/testing/tests/package/test_python_scipy.py
+++ b/support/testing/tests/package/test_python_scipy.py
@@ -20,6 +20,7 @@ class TestPythonPy3SciPy(TestPythonPackageBase):
         # BR2_TARGET_ROOTFS_TAR is not set
         """
     sample_scripts = ["tests/package/sample_python_scipy.py"]
+    timeout = 30
 
     def login(self):
         ext2_file = os.path.join(self.builddir, "images", "rootfs.ext2")
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
