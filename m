Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DA1C4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 15:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1660D405E0;
	Mon, 17 Oct 2022 15:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1660D405E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vGhJgTBrV2jr; Mon, 17 Oct 2022 15:18:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DE2C404EB;
	Mon, 17 Oct 2022 15:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DE2C404EB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D8B41BF2A5
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 15:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67A484176A
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 15:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67A484176A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3BQ47Eb2bVKU for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 15:17:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F22C41799
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F22C41799
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 15:17:46 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id b12so16542641edd.6
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 08:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GCwMzezK3jr5tfDuvMzU4KAu1BlwMGxF4mtJq8ZB+RU=;
 b=UaYB7tZObOU+aRFRvrqg8MmSFasxahxHmSJAn1gFy9/ill/Rd2jaTiclsGqBakDtZd
 ObE3opzwRKsu6jhYH5Y29Mi46zhWB6DxsS0OOVxWi9+Bkd3eHJ2h3DK5PGuRwFaDxpVt
 YCTmhA9SCM9pjFA4esoZkEITYQjfqHKi2TQmRjXY18/oK7iuvc+g6Dlk1e4JoLB7OpWI
 ivcXY9nEcenkRdQA2nl0iSY5xgHuog/qJ4RCWTBT5RDYOtZ9076Okarjv01XRKai1dbb
 jvMM5il1tBI5yNYWM5Gy5vM1xB9EDUnfpLQ9twq1kPTtrUNOXzGfuOoT7dbtlOaiB/B2
 EYoQ==
X-Gm-Message-State: ACrzQf2OKjhtcOOOUGR83GPp4LiEbxtHfo0WrlpEXfVETmDZp1huPMyv
 yWti2MvlAMzsxVhzxg3q8gLV86K5seuK2V4Y
X-Google-Smtp-Source: AMsMyM7aVu7D05vsPesUsGRwMa2R8JqlBU1Ot+6be379sPmWRLJSEQ1a5uwRtFJkYs1yKVGFBpNDiQ==
X-Received: by 2002:a05:6402:b12:b0:45d:4f99:6156 with SMTP id
 bm18-20020a0564020b1200b0045d4f996156mr10807321edb.219.1666019863993; 
 Mon, 17 Oct 2022 08:17:43 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2788:1a4:785::9])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a50d48b000000b00458947539desm7471904edi.78.2022.10.17.08.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 08:17:42 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Mon, 17 Oct 2022 17:17:26 +0200
Message-Id: <20221017151726.44005-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20221017151726.44005-1-thomas.perale@mind.be>
References: <20221017151726.44005-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GCwMzezK3jr5tfDuvMzU4KAu1BlwMGxF4mtJq8ZB+RU=;
 b=esw4e3WyRSWJR/e1MA8xGEYPDM09rLRXdR/0wu4jNMzC7naSA3pfbGEf8WS23/mDQC
 ssOEiSTWfsNwNgcnNOWitmkSi+fT7DaLUKW+Rig5qeBiI8cRp001qJqalUBhyxb7w6e1
 +VHVaXeQY8b8SxxG3ZTUQLEgXwhlv4WzSxc4eWL0bR5tY2+XnrMBOEBjcZrOywAyeKhp
 TSv17GQAWNLAmzn0ke4lAMjQsoZ0YVipsb8+4TWf/ymrnSn8NVXQw9+yV37MHtGszjvw
 pYpOPnq4+EOwWetTOCyuhLwRVYWjvC6bLueZ4VqU31bHFw/ya+w+eThJsMQSeevG9ghQ
 o+HA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=esw4e3Wy
Subject: [Buildroot] [PATCH 4/4] support/testing: add tests for Go
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
Cc: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Test the support of both the pre-built Go compiler and the Go compiler
built from source.

The test consists of compiling and installing in the root file
system of a ARM vexpress QEMU system. The tests pass if the program can
be ran correctly on the target.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_go.py | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 support/testing/tests/package/test_go.py

diff --git a/support/testing/tests/package/test_go.py b/support/testing/tests/package/test_go.py
new file mode 100644
index 0000000000..746aa28fc4
--- /dev/null
+++ b/support/testing/tests/package/test_go.py
@@ -0,0 +1,40 @@
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
+        BR2_PACKAGE_HOST_GOC=y
+        BR2_PACKAGE_TINIFIER=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.assertRunOk("tinifier -h")
+
+
+class TestGo(TestGoBase):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_PACKAGE_HOST_GOC=y
+        BR2_PACKAGE_HOST_GO=y
+        BR2_PACKAGE_TINIFIER=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.assertRunOk("tinifier -h")
-- 
2.37.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
