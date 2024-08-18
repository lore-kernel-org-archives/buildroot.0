Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A17AC52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 12:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB3A940025;
	Sun, 18 Aug 2024 12:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ndgGS7LbXs7q; Sun, 18 Aug 2024 12:25:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9776540129
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9776540129;
	Sun, 18 Aug 2024 12:25:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 195891BF47F
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 12:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F9AB80BF2
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 12:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P-Cjj-jbHv_T for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 12:25:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD69E80BED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD69E80BED
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD69E80BED
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 12:25:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id AA2E71C0006;
 Sun, 18 Aug 2024 12:25:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Aug 2024 14:25:20 +0200
Message-ID: <20240818122521.955359-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723983923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=KwDGeRGY0nE0Mt3uEjxq2EnCUHv7zkaNXBxb64tp5wQ=;
 b=WVxnjqWIEpTLSxrCCdRR1EtaxS0N7Gs3O2t2h2hHizSf7kxIKAOJRnRTvfcLUgCEXyG0Kh
 c7CD0iwk7e4+015xoLOqEZ/jf+QQMNTGqvobkWemPynSNE+8oOYDjoKQf/mFxdSlARwwCK
 xtLUwxBixoXQMX+c4CU724LXwpc1pk8IL2Sjt+QXaEQKHICCvbB9CHy5ShhufL/XfpS2Jr
 QB9wqLGw3WRCocyl5xD5dSgbSsk9vUI8g2SV+RheiBjMzibY9n1OZLkniBNLt5Mp+xfsal
 NoXMyMuqU9jGtW+QTL6mIZppOUGxUSr9mcE3QEegcFnyl1qPDqka/MGPFIgnKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WVxnjqWI
Subject: [Buildroot] [PATCH] package/systemd: account for arch dependency of
 vmspawn support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since upstream commit
5c57a8650630304d8434a348283b6b643fbc676b ("vmspawn: add support for
-D/--directory"), src/vmspawn/vmspawn-util.h defines a
QEMU_MACHINE_TYPE based on the architecture, and not all architectures
are supported. This commit first appeared in systemd v256.

Due to this, the unsupported architectures fail with:

In file included from ../src/vmspawn/vmspawn-util.c:27:
../src/vmspawn/vmspawn-util.h:46:4: error: #error "No qemu machine defined for this architecture"
   46 | #  error "No qemu machine defined for this architecture"
      |    ^~~~~

So let's add a BR2_PACKAGE_SYSTEMD_VMSPAWN_ARCH_SUPPORTS and use it to
ensure vmspawn support is only used on architectures that are
supported. Even though no-one selects BR2_PACKAGE_SYSTEMD_VMSPAWN (and
would therefore need to inherit the
BR2_PACKAGE_SYSTEMD_VMSPAWN_ARCH_SUPPORTS dependency), we nevertheless
introduce BR2_PACKAGE_SYSTEMD_VMSPAWN_ARCH_SUPPORTS to make the
depency list prettier than a long "depends on A || B || C || D ||
...".

Fixes:

  http://autobuild.buildroot.net/results/0e614375f731f7bfe3c6041c6e89a09c31898053/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/Config.in | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 6708adce9b..113a8093c4 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -599,8 +599,22 @@ config BR2_PACKAGE_SYSTEMD_VCONSOLE_DEFAULT_KEYMAP
 	  Default keymap for the system. Leave empty to not set a
 	  default keymap.
 
+# See for which architectures QEMU_MACHINE_TYPE is defined in
+# src/vmspawn/vmspawn-util.h
+config BR2_PACKAGE_SYSTEMD_VMSPAWN_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386
+	default y if BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_riscv
+	default y if BR2_s390x
+	default y if BR2_x86_64
+
 config BR2_PACKAGE_SYSTEMD_VMSPAWN
 	bool "enable vmspawn"
+	depends on BR2_PACKAGE_SYSTEMD_VMSPAWN_ARCH_SUPPORTS
 	help
 	  systemd-vmspawn may be used to start a virtual machine
 	  from an OS image. In many ways it is similar to
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
