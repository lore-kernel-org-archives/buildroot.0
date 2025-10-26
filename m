Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83739CCF9E5
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 13:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50F5640C95;
	Sun, 26 Oct 2025 13:12:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wINuuLdi84rX; Sun, 26 Oct 2025 13:12:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBBD840AE9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBBD840AE9;
	Sun, 26 Oct 2025 13:12:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B09C715F
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 13:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD57360899
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 13:12:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-KCvtS1YoKp for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 13:12:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A8E7160896
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8E7160896
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8E7160896
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 13:12:45 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b3d196b7eeeso797931066b.0
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 06:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761484363; x=1762089163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XE3521wTC1t0OYfrtwOy+yYHzm/XeMd5TsLBxxtkw+M=;
 b=UyzVRIaDAIQocBa2NPZ3lscv8FGl6UmFOMqgeoXKdLzdzWjgpe6NqRFX76+ooeBrBP
 t/nCx8lv7/r3yqNfEr6aY7bzGnxq5kCODxuTONvN/s3m69TT5jDdmk/UXos2R4ANs+GJ
 2fYHUIhduJ5tOWTDyilCTS3sQw2bunIKc+faEeQOKNnQDqQcZp29bbFg/e1YylE5e5Lw
 KImRmAe1YWNdWXXetqeANDGuyL0mXisBIDCPVyX2uxsI/DnP3iRnahV9SrOTVd7SijUD
 7apQ3ZnB+sIirmlzuewzf3uzrdyJWLHaDl4OxCxa//YCjxk1hfVKsP+6aEUMnvpT63ep
 xSkg==
X-Gm-Message-State: AOJu0YzsiRdsZC0bAnk7L1T97R6dC6MTCC72sJIFeyLhAZAXGH07ZYNk
 mUu1P5Gl1NrSmkDOOK08SgZJgMdG9LCjWtv25/duVHk3H5E0VTBMlihKX0/Q
X-Gm-Gg: ASbGncuWp6Z85gAyrdpHnfvSDlxmFAsCPMhKm000B5fh/OfRW1xIfNqBvAcJhaqCoqN
 Oha+HA2fZ92NMEwl1NMViu2UltEYHrDQfbxKbix2gi03ElFHcUXB54SiMUbC+RqpIGU9G+AJKvD
 2eAERlBu2E+fyjRDS32KCRH1ZEI95omu6AkirKheulOYdUYOuD34pxYjnoh7c3mCwjPSHwUD0CQ
 FbvLgPfyzlTmIgkxgTnFT6qVcezRVgl++h9Rs3Ii09c28BXbvO4qMSQ7uBlCQZiNGqtOUp0d138
 k4pC6OmSWTfxfqbxikUnpobvaJmlGNc2cTb3g0TFMYPSnPOkznCiKrtBHFbulgRhydk0uacISuU
 Qt2hnbb90QbqSJiSvKlroItIoxQqk0BZtDQL1ylhm/aIP+UbSb87+//L3r0F2gxHa/vfTg+hm6P
 wjHTjU1L6u/qKvnLI=
X-Google-Smtp-Source: AGHT+IHurhi6RcFQGcSs+lKMvWPyTc2A3TLbksZ2gsL07LqB8em2PhHr1uVR8bLnzA+gszPqXrtsZQ==
X-Received: by 2002:a17:907:c06:b0:b3c:bd91:28a4 with SMTP id
 a640c23a62f3a-b6473045139mr4054935266b.28.1761484363139; 
 Sun, 26 Oct 2025 06:12:43 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6da1e2226fsm67902266b.20.2025.10.26.06.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Oct 2025 06:12:42 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: elmehdi.younes@smile.fr,
	Alexander Shirokov <shirokovalexs@gmail.com>
Date: Sun, 26 Oct 2025 14:09:51 +0100
Message-ID: <20251026131233.183426-3-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251026131233.183426-1-shirokovalexs@gmail.com>
References: <20250812192941.3477597-2-shirokovalexs@gmail.com>
 <20251026131233.183426-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761484363; x=1762089163; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XE3521wTC1t0OYfrtwOy+yYHzm/XeMd5TsLBxxtkw+M=;
 b=dLujLmACdWDZ+YVflGJSqKGoQJmIhYWw+AloIEeitX5PU8MTTRzk+jtKYz46/jScFK
 DOmyJgSsSN3k3a/D6Zh+eFwQ886cdeDc49QLy76+ygDvO15gyaVzrqhuCGmv6sjEQ6Bc
 QtS42o+/joi849fpwXM5DDAngMpMrpY9/Pm4m7whrT0M7WUCJaL32IcaIH/0jyy0zrgV
 1HrEFCwt1JAMmEc9XiDzcYWjDxCJDjFTFyjIqqOTL/aZMS65yfqArUtFRibaN0sZO6YJ
 z1ZGsGddgkA4LGwUgoHIyyzUW/RwVjLVjQCTzKowEx6sPXtDdGbJTvlDq1QefdQNn1Ms
 NgCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dLujLmAC
Subject: [Buildroot] [v7, 2/2] package/uutils-coreutils: new tests
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a small set of tests for uutils-coreutils to ensure that the binary
is present and executable.

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 support/testing/tests/package/test_rust.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
index 763125ca20..ec263df6b5 100644
--- a/support/testing/tests/package/test_rust.py
+++ b/support/testing/tests/package/test_rust.py
@@ -28,11 +28,14 @@ class TestRustBin(TestRustBase):
         # BR2_TARGET_ROOTFS_TAR is not set
         BR2_PACKAGE_HOST_RUSTC=y
         BR2_PACKAGE_RIPGREP=y
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_UUTILS_COREUTILS=y
         """
 
     def test_run(self):
         self.login()
         self.assertRunOk("rg Buildroot /etc/issue")
+        self.assertRunOk("coreutils --help")
 
 
 class TestRust(TestRustBase):
@@ -50,11 +53,14 @@ class TestRust(TestRustBase):
         BR2_PACKAGE_HOST_RUSTC=y
         BR2_PACKAGE_HOST_RUST=y
         BR2_PACKAGE_RIPGREP=y
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_UUTILS_COREUTILS=y
         """
 
     def test_run(self):
         self.login()
         self.assertRunOk("rg Buildroot /etc/issue")
+        self.assertRunOk("coreutils --help")
 
 
 class TestRustVendoring(infra.basetest.BRConfigTest):
@@ -71,6 +77,8 @@ class TestRustVendoring(infra.basetest.BRConfigTest):
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
         BR2_BACKUP_SITE=""
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_UUTILS_COREUTILS=y
         """
 
     def setUp(self):
@@ -96,3 +104,4 @@ class TestRustVendoring(infra.basetest.BRConfigTest):
     def test_run(self):
         self.check_download("ripgrep")
         self.check_download("python-cryptography")
+        self.check_download("uutils-coreutils")
-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
