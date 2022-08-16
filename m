Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A40FC25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 14:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F64B408C9;
	Tue, 16 Aug 2022 14:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F64B408C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m0u_e9uhJbi6; Tue, 16 Aug 2022 14:41:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C6EC403F9;
	Tue, 16 Aug 2022 14:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C6EC403F9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B87921BF4D6
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 14:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93CAC82B97
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 14:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93CAC82B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4eUODcuUFnIg for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 14:40:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F36B829BB
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F36B829BB
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 14:40:42 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id bs25so12911438wrb.2
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 07:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=eX5jxRbroLPgY2p6M7bGAaSEwzlEEtBSBLnb6jODfgA=;
 b=mD32VgPzhqGaLkCOG8xoQEebulEkClksA8Ot1NUtcF4H67cMw9/HiVpDaCEgXPUiBK
 6PZzW4eUzjP0yqu1V0vIW7UmikM0y+koaxTIpPiAzVSnVWtx4Ef948GDN1wGxD8LiT6P
 0PNnQAI+1f/gNJVOjHPPb10Qqh4W3BdFjiVbVM2GgsBJLYPPBM8oBUFU1/F+dmgY0Czy
 Tfqi+hht7DvwGGGNBkbT1ByGwkmB/zgPbzfkrBo2iy4FImTMPbwn4CORKvg5DIBOWbxQ
 MOyTiEmEzXU1fNl4Q7O1Cb6mKjUur2aV6ZsMA0d7Kp0UQVbmzBTWDOFxM8tPne0eVsNe
 pxNQ==
X-Gm-Message-State: ACgBeo2/caupbUCiCV2ogq820vtFfIa8XKMgfB0GcybyNE2vA//02Ugr
 XCqXA/p6x2FOISCGiFn3uplLJdGhgdU=
X-Google-Smtp-Source: AA6agR7FNDnng+auIfCbOhAETjq6OD8RPlzIp96jXhV0k8B/gybb6LR3tAHgzCEF/ykHd1DQF49EEw==
X-Received: by 2002:adf:db06:0:b0:220:7a57:6665 with SMTP id
 s6-20020adfdb06000000b002207a576665mr12149383wri.55.1660660841691; 
 Tue, 16 Aug 2022 07:40:41 -0700 (PDT)
Received: from pc-140.home ([2a01:cb1c:794:2300:d109:33e7:bc94:49e5])
 by smtp.gmail.com with ESMTPSA id
 j36-20020a05600c1c2400b003a4c6e67f01sm13844300wms.6.2022.08.16.07.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 07:40:41 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Tue, 16 Aug 2022 16:39:43 +0200
Message-Id: <20220816143943.16142-7-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220816143943.16142-1-guillaume.bressaix@gmail.com>
References: <20220816143943.16142-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=eX5jxRbroLPgY2p6M7bGAaSEwzlEEtBSBLnb6jODfgA=;
 b=MiAczL988E8033PH9fPUyX10lx2EMftmYDUnZLSmT3qouAmIqbDJb58XczedmN6nR5
 4xOqyqpDewN36YlAZTrQ6+ODbzwIKEWh/cGzqz275m1oYvK9IMQC5QD6SDcPI4buzitj
 d8bnkr17N6/nhdnIGFcBfiOVh0GhzOk3RFRtISQyeezbB3CUm2234RJRgIIIXGwPRYA+
 N/9+vq89+aLuGaK14zlJPxdprbo9fA1Xp3LY5F2vV5MfdwlIcI03vwL2a0phfty072nw
 hgmfShJ+/pjWSfYbknXaW4/hOxJu1XV9jtZ33+O1zCoM2cqQQ1MPjH/FGrNe1bFyczvU
 iOrA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MiAczL98
Subject: [Buildroot] [PATCH v1 7/7] support/testing: add python-scikitlearn
 test
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
Execute this test with
./support/testing/run-tests -d dl -o test-results -k tests.package.test_python_scikitlearn.TestPythonPy3ScikitLearn
---
 .../package/sample_python_scikitlearn.py      |  4 +++
 .../tests/package/test_python_scikitlearn.py  | 31 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_scikitlearn.py
 create mode 100644 support/testing/tests/package/test_python_scikitlearn.py

diff --git a/support/testing/tests/package/sample_python_scikitlearn.py b/support/testing/tests/package/sample_python_scikitlearn.py
new file mode 100644
index 0000000000..af9eef87ef
--- /dev/null
+++ b/support/testing/tests/package/sample_python_scikitlearn.py
@@ -0,0 +1,4 @@
+from sklearn import datasets
+
+iris = datasets.load_iris()
+digits = datasets.load_digits()
diff --git a/support/testing/tests/package/test_python_scikitlearn.py b/support/testing/tests/package/test_python_scikitlearn.py
new file mode 100644
index 0000000000..d729961306
--- /dev/null
+++ b/support/testing/tests/package/test_python_scikitlearn.py
@@ -0,0 +1,31 @@
+import os
+
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3ScikitLearn(TestPythonPackageBase):
+    __test__ = True
+    # We can't use the base configuration, as we need a glibc
+    # toolchain for scipy
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_SCIKITLEARN=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    sample_scripts = ["tests/package/sample_python_scikitlearn.py"]
+    timeout = 30
+
+    def login(self):
+        ext2_file = os.path.join(self.builddir, "images", "rootfs.ext2")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-drive", "file=%s,if=scsi,format=raw" % ext2_file],
+                           kernel_cmdline=["rootwait", "root=/dev/sda"])
+        self.emulator.login()
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
