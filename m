Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565D2E7C4C3
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 14:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CFE26144A;
	Wed,  4 Oct 2023 14:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CFE26144A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9OJ3Eb828joZ; Wed,  4 Oct 2023 14:24:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2B0E61443;
	Wed,  4 Oct 2023 14:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2B0E61443
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C9B2F1BF47F
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 14:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0D9641ED7
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 14:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0D9641ED7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id COCFu52MVjn9 for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 14:23:26 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B69541F8E
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 14:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B69541F8E
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9b2cee40de8so223331266b.1
 for <buildroot@buildroot.org>; Wed, 04 Oct 2023 07:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696429404; x=1697034204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NF2xBLRf/FLO+8HJ3g6soUxo9K6Znshe+oJOWQ9g9Ck=;
 b=aq9Ko2J8/NPOc+I8qz20GpgrrBh4ALst/AZXbqfZg2eBwWi7Dgc2wlR2CECwxTLJrM
 AOGWngurTg3j62vU3KcjttPNGciNqUlz440HstKEbGVZ1B7mG+EVf8snvJLrtYo6ZtZj
 ZYSpnpyvnI+wmihBBVR2U6POEAGmoLR5K6HNaPuAoaDtMHSWwIlowwXI45KDXEgrpO/e
 Pa/Z3qXozq+WH4ndzA1IOCsfH124d0Kl4kdBGMjn4JXeCbQ6IA+oksz8eZ9Is+Q5R+h6
 apOvXEGUSRmKsv908n5ggtAW7mtdwijxp5wpUZruawMlmH22b/di4SBiYfK1r3unGE/i
 3dcw==
X-Gm-Message-State: AOJu0Yw2h/2Io16tkvQ2jXgozXfO6OqJrrRV6opJDmjUd6fD/c0TdiGM
 OxtM/jPM/4nybc/Q8lQj/e9iecvDoK/6M+3tmNoVCw==
X-Google-Smtp-Source: AGHT+IF/nE0W9zdF6P4G5sowgL9NTZyOjVoWTl4tivUPgulZgKEgbcCsksY+459E99GIi1pd8c1qCg==
X-Received: by 2002:a17:907:3e9f:b0:9ad:e62c:4517 with SMTP id
 hs31-20020a1709073e9f00b009ade62c4517mr4842490ejc.34.1696429404199; 
 Wed, 04 Oct 2023 07:23:24 -0700 (PDT)
Received: from localhost.localdomain ([79.132.253.132])
 by smtp.gmail.com with ESMTPSA id
 dv7-20020a170906b80700b009a5f7fb51dcsm2851805ejb.42.2023.10.04.07.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 07:23:23 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  4 Oct 2023 16:23:02 +0200
Message-ID: <20231004142303.203520-7-thomas.perale@essensium.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004142303.203520-1-thomas.perale@essensium.com>
References: <20231004142303.203520-1-thomas.perale@essensium.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1696429404; x=1697034204; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NF2xBLRf/FLO+8HJ3g6soUxo9K6Znshe+oJOWQ9g9Ck=;
 b=DADnrScy/J7xYXcZv8USTQSNoHUdCWSUXYj5rOqMaAfTz4iKCpNMV8hyfo4xz0MvLb
 042gs6kK5NdznzQ2SpAd1lDzLTZ2m8f1w62DIhHICegOb7IyBia7hSWv0M65J7zVNvWW
 lcqkGm41tYdPvjbaosydYveyEILTq7NfKZNM9megFDBfadJLiTrBM/Xhnl9N78h82dO2
 W2XVJFQQm5ij1wkvOGWwFy33TchOsnJcYjSmAcYwyOt2fKTguuoTL5IiJEEPPNu7M+yu
 V8FoP+DxZiEI2Y3zD2B1LRpeu/4SexwFLUmxiA7W2UzKh+6KcxYaVDO5a+xAryoTbMGn
 qR0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=DADnrScy
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
index 0000000000..305f8aeb3b
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
+        BR2_PACKAGE_HOST_GO_BIN=y
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
+        BR2_PACKAGE_HOST_GO_SRC=y
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
