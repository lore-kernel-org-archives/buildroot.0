Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 403D6C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 17:49:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7A28610C9
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 17:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7A28610C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A387340427;
	Tue, 12 Oct 2021 17:49:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X3JS9kG7KUAV; Tue, 12 Oct 2021 17:49:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA0E0403FB;
	Tue, 12 Oct 2021 17:49:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D240B1BF5AA
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 17:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C27A981BC6
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 17:48:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aFikJgBssJ7f for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 17:48:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F76281BC5
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 17:48:44 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id m14so188684pfc.9
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 10:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FtfUJAwk9LavrwRqHj5N5SJNixORuQnqFCCEb8OtkK4=;
 b=kzL3RUuOJJeLnUkbBY1qvynzSq8Q3NizzNjZ3SOmgiQEWl7E0d9z+pHq7ppwtDkn2B
 YHL0ubHmyNcKnBrJ/4VpxOtrHG5vOd0qAQyMl13vdzY3HIbFD12Xhr6uII4pg4xCA7IJ
 u9GOZJCWrDEEdKBPmv9G0JMPxX2f3cNpcv2TUfyBDo7m+S4MFioeF/Pyyb5Nz8bxlVFO
 oywF+2QCMI3taznulJgHGEzmzu5B+Etjq2XFET0NmL5/wfYvmuviOB130PJw0KZt5WlR
 pSZSndWL/sjOxekx2ThS4utMekuhJQt9netUbSqWM+PMiUz6x5iaQgaoLphi3ugKYFxT
 GR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FtfUJAwk9LavrwRqHj5N5SJNixORuQnqFCCEb8OtkK4=;
 b=FSMepMePBJgasaEFk2a2YdoGDyBhvIPE/YAQhBOZAeQ/J/39ZN/od6WuRawuXyoq7h
 dyhAwoWS/D2NOIcpk2m8o0fuF+g5eZYEqx+xUfn6Vwvd5znIg2r9KY43yaJFjMa337Qa
 TZ7A54yFcWcvm9XSIRSSRlCUedE8VzrdFcfFfBr6SMlIWqggbYuLU+NknbwwGS3oRznq
 Mq1CkXI2wKkweGnZUbDnA8ZsAFNY6q51BdEZwJr6gpSv6NjnIXr3yg1L6Jecgy8cONRO
 svrRaIkGPXp0OZxYbd4FVyziZziX4GuTGE1/9DoLbNgO8J1vvblHlAE+Z+qz73HXAnpY
 9fUQ==
X-Gm-Message-State: AOAM530znzuq4RG5kaM/MFQPLYeiUfCFDb6qLvO6U9XcNBH456ufJGXj
 GYenpwTlXYk065NUJNYol6hJ/cf+hHM=
X-Google-Smtp-Source: ABdhPJxegSLTA9SVQ4GDKMsvTMSf7IzHCiAPjbhRoGshnEby7UttV3mUaO1QTaa5+4H5gppu39ibPA==
X-Received: by 2002:a63:9d0d:: with SMTP id i13mr23606610pgd.117.1634060923530; 
 Tue, 12 Oct 2021 10:48:43 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id i125sm11679295pfc.36.2021.10.12.10.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 10:48:43 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 10:48:38 -0700
Message-Id: <20211012174838.1222576-4-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012174838.1222576-1-aduskett@gmail.com>
References: <20211012174838.1222576-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4]
 support/testing/tests/package/test_python_pyndiff: new test
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Adam Duskett <aduskett@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A simple test that runs nmap twice to create the files scanme-1.xml and
scanme2.xml, then runs pyndiff on both files.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 .../tests/package/test_python_pyndiff.py      | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 support/testing/tests/package/test_python_pyndiff.py

diff --git a/support/testing/tests/package/test_python_pyndiff.py b/support/testing/tests/package/test_python_pyndiff.py
new file mode 100644
index 0000000000..86d6c38f8f
--- /dev/null
+++ b/support/testing/tests/package/test_python_pyndiff.py
@@ -0,0 +1,29 @@
+import os
+import infra.basetest
+
+
+class TestPyNdiff(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_NMAP=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PYNDIFF=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        cmd = "nmap -F 127.0.0.1 -oX scanme-1.xml"
+        self.assertRunOk(cmd)
+
+        cmd = "nmap -F 127.0.0.1 -oX scanme-2.xml"
+        self.assertRunOk(cmd)
+
+        cmd = "pyndiff -f1 scanme-1.xml -f2 scanme-2.xml -t txt"
+        self.assertRunOk(cmd)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
