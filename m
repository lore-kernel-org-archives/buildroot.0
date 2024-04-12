Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB795C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 22:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88E0440350;
	Fri, 12 Apr 2024 22:25:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gg4vOjXgzWXQ; Fri, 12 Apr 2024 22:25:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 822AE405DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 822AE405DD;
	Fri, 12 Apr 2024 22:25:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 599791BF306
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 22:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5439560878
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 22:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dyax2AJLQ4ZS for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 22:25:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 549CC60717
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 549CC60717
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 549CC60717
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 22:25:30 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7DEA0B0037C;
 Sat, 13 Apr 2024 00:25:25 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Apr 2024 00:24:59 +0200
Message-ID: <20240412222459.1630158-2-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412222459.1630158-1-ju.o@free.fr>
References: <20240412222459.1630158-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712960728;
 bh=A+g75r6A5FwtWVef2a15yGgOF175r8m2Wx0+bB3Cd8Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lY3RLK9s6Ft/z2uzWWjppsaypFB/SzBunT/kpzPdmzouquKHBzQ2OnBntMGxc8g9h
 Rz2kSK+P6ZglKK2F7XjZO3LnrYZynetp4FBykobtzuo7jwwEjdK+x/+Rp0fJBh+pIo
 BFs5bAnUfHqcqnKNj7v9bPCfvVi3pNzqevuTigIKvdKw/wgwauhlnInsyekUh+MQvt
 naletsKOZhNTFxFrOQ4JduF6e0jb7tx9F3Swlh/sInMwKKZlBGXufPZgVMSXgs0ANK
 H3W8kk0OzPvKnZshT1aberN3MJJIao4pY55E6+vDxj4LPCRANnrQka0A44LePp+2S/
 t+1PSK4BLG9Mw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lY3RLK9s
Subject: [Buildroot] [PATCH 2/2] support/testing: lvm2: remove kernel config
 fragment
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The lvm2 package now enables the required Kernel configuration. The
Kernel config fragment included in this test is no longer needed.

This commit removes it.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                            |  1 -
 support/testing/tests/package/test_lvm2.py            | 11 ++++-------
 .../tests/package/test_lvm2/linux-lvm2.fragment       |  2 --
 3 files changed, 4 insertions(+), 10 deletions(-)
 delete mode 100644 support/testing/tests/package/test_lvm2/linux-lvm2.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index 399b2931ff3..836fa9149a0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1818,7 +1818,6 @@ F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_lrzip.py
 F:	support/testing/tests/package/test_ltrace.py
 F:	support/testing/tests/package/test_lvm2.py
-F:	support/testing/tests/package/test_lvm2/
 F:	support/testing/tests/package/test_lzip.py
 F:	support/testing/tests/package/test_lsof.py
 F:	support/testing/tests/package/test_lz4.py
diff --git a/support/testing/tests/package/test_lvm2.py b/support/testing/tests/package/test_lvm2.py
index bdbae7a4ec7..75ea3fa449f 100644
--- a/support/testing/tests/package/test_lvm2.py
+++ b/support/testing/tests/package/test_lvm2.py
@@ -5,13 +5,11 @@ import infra.basetest
 
 
 class TestLvm2(infra.basetest.BRTest):
-    # This test creates a lvm2 volume. A specific Kernel need to be
-    # built with a config fragment enabling this support. This test
-    # also uses resize2fs from e2fsprogs.
-    kernel_fragment = \
-        infra.filepath("tests/package/test_lvm2/linux-lvm2.fragment")
+    # The lvm2 package has _LINUX_CONFIG_FIXUPS, so we cannot use
+    # the runtime test pre-built Kernel. We need to compile a Kernel
+    # to make sure it will include the required configuration.
     config = \
-        f"""
+        """
         BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
@@ -20,7 +18,6 @@ class TestLvm2(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.77"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
-        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
         BR2_PACKAGE_E2FSPROGS=y
         BR2_PACKAGE_E2FSPROGS_RESIZE2FS=y
diff --git a/support/testing/tests/package/test_lvm2/linux-lvm2.fragment b/support/testing/tests/package/test_lvm2/linux-lvm2.fragment
deleted file mode 100644
index 0fade167a3c..00000000000
--- a/support/testing/tests/package/test_lvm2/linux-lvm2.fragment
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_MD=y
-CONFIG_BLK_DEV_DM=y
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
