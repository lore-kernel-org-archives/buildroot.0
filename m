Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B63E66892
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 21:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7254083CC6;
	Fri, 19 Dec 2025 21:10:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMpI-HHVxGMD; Fri, 19 Dec 2025 21:10:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3756383CA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766178623;
	bh=A05J533Z9mwCbaGZvPCcyqZ9Kmh/XoFCEgar07IJXAU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TbpUz1l7mLfu5knPV8h/qlcSilxvu0SwLs37ZXEilE/tyi1Su5wdflvEdnHrcvbMB
	 YrbVoWU8IVTu+jTCt2hwa2OqEMEkhtX/3dRki5+mOKuMWjUNhiWj8YgPkObOIx86bh
	 sdlV7xMab0L7YnO52BMwWSyx9cHCZKMHU337QQSY21x7h2GaMHjjW/QXmhsyaTmwaH
	 UBs+lHHs3I7SPjCMzSWmBDfqZdjB0hl30/+ddhxTCSGimr13HPYdBaQblFgz+LsOb1
	 nAd6foEEKoY0p8K0AosbpbDsyjnxBKj+Hhn8UfcCaJS2GuOS/Va8reSULMYGtoGN6R
	 jU1MA4ZMAgIOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3756383CA3;
	Fri, 19 Dec 2025 21:10:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4427B293
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 21:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 368F8401A0
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 21:10:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wo0e90X3HQi9 for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 21:10:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 302B740051
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 302B740051
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 302B740051
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 21:10:21 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a0d:e487:418e:8c09:857b:bc67:c232:7cba])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id BE0C6780383;
 Fri, 19 Dec 2025 22:10:16 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Fri, 19 Dec 2025 22:09:56 +0100
Message-ID: <20251219210957.556930-3-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219210957.556930-1-ju.o@free.fr>
References: <20251219210957.556930-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766178619;
 bh=RujvlEicb933cGyz8ckt48TiYmrx+taY6dJwsC8O63M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=amTIvTSLQqpqJZ2sSPSz+ApJ/lsxjinbNFtmkydPk84gBQ/tObzUBsiYF02JxY4dv
 rNFRz+wzPT7CDvEo45QJBoV9o30xsA/jpcenFs5+e3m49l7j6FevcRwAiCjsDqBy7b
 ao1+BWsa0BVti0CPKsnQPuBsyPHJcVmb+0y611iFrP4UrayDqET2sACo+WUhIi9DIL
 D3iQmGrut1rrH9pN/BuAzPhQxu7ax9st+XmANd5zjHyIjfsdlk0cWuc0k+ko0TK38l
 f9fLhS6LzWBqrHW85AaMWz7UGSY+2FxoeCPIm26k0YCWadIl5AmNTSzuDwD9qFhUyv
 kyrHqbRYSnuhw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=amTIvTSL
Subject: [Buildroot] [PATCH 3/4] support/testing: ddrescue: use f-string for
 test config
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_ddrescue.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/support/testing/tests/package/test_ddrescue.py b/support/testing/tests/package/test_ddrescue.py
index eb3f63ae53..bd34694737 100644
--- a/support/testing/tests/package/test_ddrescue.py
+++ b/support/testing/tests/package/test_ddrescue.py
@@ -10,8 +10,10 @@ class TestDdrescue(infra.basetest.BRTest):
     #   mapper dm-dust, which are used to simulate a failing storage
     #   block device.
     # - lvm2 user space package is needed to configure dm-dust with dmsetup
+    kernel_fragment = \
+        infra.filepath("tests/package/test_ddrescue/linux-ddrescue.fragment")
     config = \
-        """
+        f"""
         BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
@@ -20,16 +22,14 @@ class TestDdrescue(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.2"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
-        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
         BR2_PACKAGE_DDRESCUE=y
         BR2_PACKAGE_LVM2=y
         BR2_TARGET_ROOTFS_CPIO=y
         BR2_TARGET_ROOTFS_CPIO_GZIP=y
         # BR2_TARGET_ROOTFS_TAR is not set
-        """.format(
-            infra.filepath("tests/package/test_ddrescue/linux-ddrescue.fragment")
-        )
+        """
 
     def test_run(self):
         img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
