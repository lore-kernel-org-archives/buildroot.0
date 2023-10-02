Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B55E784AD
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 12:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A335841EA0;
	Mon,  2 Oct 2023 12:49:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A335841EA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8c2Um1YSZkLv; Mon,  2 Oct 2023 12:49:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3515141E64;
	Mon,  2 Oct 2023 12:49:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3515141E64
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF5591BF589
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 12:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3EBC40120
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 12:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3EBC40120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HSJkKuz2uCPL for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 12:48:15 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC8904016F
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 12:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC8904016F
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-99bdeae1d0aso2332438466b.1
 for <buildroot@buildroot.org>; Mon, 02 Oct 2023 05:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696250892; x=1696855692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F2lLNETdj5DhQEbxg09TIzGAYvx6sG9g7WcvAKlaYOE=;
 b=bM4LZ4ER6+Cqs1FVCgRpqdiBIsV6JYjbEXEpR48fKekB9WllmPZcYv6k6R02rfpP+v
 Ri+V8qRNk/ilJxl+l1Ilgrc4d0MV7OQfs7ytgmhBFCD4rO3Aa9On1Qh3Nkj3uLXyx4FT
 3nlWLLMkbXK/OQAeS0IJ8DgyaCv6ZhUjNEx4jWMUTk8Vl68DQkrmzkcNnHMMZN/CeTRc
 /IZeLHSwEnFyFKftLKTmCkvModmKRg5PcfoM9nAE7t7UQ/mkAd5cSPHYgPfA+PgRVuEY
 iW52m0kwrv7Reh6OkGQP1WN3pMj8++t3sjNNfyZBZpvl3kdChXXX5MNSPSk/XXk6yclp
 im/Q==
X-Gm-Message-State: AOJu0YyXQAZzgCKYztwRUvMEzKspNgVOOjGgvXZs/hmwnISM+Rqf+aKZ
 6t3MONALm2dULtNHQx8PUqHu0OHuufDQR0Pd/eKLDw==
X-Google-Smtp-Source: AGHT+IHWkUiDl6K2k5sM12ICZC7KbrrBQUtrn7cnPRv5KnJ02/im0BKzbd0nBWcv9dXPgQFlp7XHiw==
X-Received: by 2002:a17:906:5185:b0:9ae:6da8:1819 with SMTP id
 y5-20020a170906518500b009ae6da81819mr11166797ejk.48.1696250892695; 
 Mon, 02 Oct 2023 05:48:12 -0700 (PDT)
Received: from localhost.localdomain ([79.132.253.132])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a17090635c300b0098951bb4dc3sm16688189ejb.184.2023.10.02.05.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 05:48:12 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  2 Oct 2023 14:47:28 +0200
Message-ID: <20231002124736.179251-7-thomas.perale@essensium.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231002124736.179251-1-thomas.perale@essensium.com>
References: <20231002124736.179251-1-thomas.perale@essensium.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1696250892; x=1696855692; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F2lLNETdj5DhQEbxg09TIzGAYvx6sG9g7WcvAKlaYOE=;
 b=D8PYbnzA1jgwiplmwi2J6vQJ+b11iycPId9MEe/xtJ2XyC10tZ4nNZV5YwcnUk6C94
 JVTaWHR7ZGjL/MEpQ55TN3HP9GcEvJn7/hjTkiWWG4sl5PzkTUMQQCYfwjxzkMcp9wLr
 ev3PFnrnppbyTDT3pm1Z6IkAD54OtXE+siw3A8HsOtrRQiNLgUp2XYHryHYJ5S/7Ov2X
 VR75gO0tCofp6usKoU2rTxYgvDrxqFFBXQHeHmWc2v95640HsvPV+MltdX/FQq10e00x
 ZdD5CE+v6k/9M8vVrKWZwh1xlrLkeeYCm7p+7e7wi7H+JKcQnDUhExlzvUl7avQ0LvsK
 bYUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=D8PYbnzA
Subject: [Buildroot] [PATCH 6/6] support/testing: add tests for Go providers
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Geoff Levand <geoff@infradead.org>, Fabio Estevam <festevam@gmail.com>,
 Anisse Astier <anisse@astier.eu>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Stewart <christian@aperture.us>,
 Romain Naour <romain.naour@gmail.com>, Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Perale <thomas.perale@mind.be>

Test the two providers of host-go to build a Go
package.

- TestGoBin tests host-go-bin
- TestGoSource tests host-go-src

The tests consist of building and installing a Go package in the root
file system of a ARM vexpress QEMU system.
The tests pass if the program can be ran correctly on the target.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_go.py | 41 ++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 support/testing/tests/package/test_go.py

diff --git a/support/testing/tests/package/test_go.py b/support/testing/tests/package/test_go.py
new file mode 100644
index 0000000000..9beb66d0d9
--- /dev/null
+++ b/support/testing/tests/package/test_go.py
@@ -0,0 +1,41 @@
+import os
+
+import infra.basetest
+
+
+class TestGoBase(infra.basetest.BRTest):
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+
+class TestGoBin(TestGoBase):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_PACKAGE_HOST_GO=y
+        BR2_PACKAGE_HOST_GO_SRC=y
+        BR2_PACKAGE_TINIFIER=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.assertRunOk("tinifier -h")
+
+
+class TestGoSource(TestGoBase):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_PACKAGE_HOST_GO=y
+        BR2_PACKAGE_HOST_GO_BIN=y
+        BR2_PACKAGE_TINIFIER=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.assertRunOk("tinifier -h")
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
