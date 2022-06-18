Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12877C43334
	for <buildroot@archiver.kernel.org>; Sat, 18 Jun 2022 08:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BB71405C8;
	Sat, 18 Jun 2022 08:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BB71405C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zBa3msDb2cjS; Sat, 18 Jun 2022 08:59:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51AEF405CD;
	Sat, 18 Jun 2022 08:59:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51AEF405CD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CF181BF20B
 for <buildroot@lists.busybox.net>; Sat, 18 Jun 2022 08:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8895405B2
 for <buildroot@lists.busybox.net>; Sat, 18 Jun 2022 08:59:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8895405B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a1rNi9oEg423 for <buildroot@lists.busybox.net>;
 Sat, 18 Jun 2022 08:59:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FADA400BF
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FADA400BF
 for <buildroot@buildroot.org>; Sat, 18 Jun 2022 08:59:50 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id k22so1942360wrd.6
 for <buildroot@buildroot.org>; Sat, 18 Jun 2022 01:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gaftXFzOOj3SapAI92DDxRkHQayNTaQYl1FaVZ8yMyo=;
 b=0ktqgeCRPV7kakhAFAZKBrz3JPYELVc92HKBSnKzyS1m5y/S+8A2IBmyr27EaPuPlP
 7b3jhx3BgHCE8JUkWxn3KjXr81+9whSYoogHnd5dr1Hwab0ews+qAC4GTkxVOOXBaNQj
 f63RKa/dPfVlgCsZUe6X6xUt1kUQGu9CPgl+uKcPaFk9HqQl+yg/RMUMxdNMVjOGknPA
 zj7wHqbH37s0Wy67BbgQ/dfr+csZdJowqpdQUcvSm4jAYjafS6GlblwyLbrjJrZPrvrE
 aN104cRHnlPzFGrCIBQMvDO9FA2XbKfAOo/Q4SX2/8aihBAwTqobnrwWR2Ak1okyJ6G8
 Q45A==
X-Gm-Message-State: AJIora8OXmvBv3gzQoexEdRMI9Qcw3GshspLn3GoFifiZlCoPxUjdQu7
 hdxJ2P9nxPZSGEfIF6RSjxbXo6K1VqE=
X-Google-Smtp-Source: AGRyM1vOecTsnHU5/zUJsg2Z5SSLF8Zd4YD3Zu8ytnkeqzsedLH7i9y5VvKghTBb5B8Ir9nOlxe+MA==
X-Received: by 2002:a05:6000:244:b0:210:cc02:889a with SMTP id
 m4-20020a056000024400b00210cc02889amr13236038wrz.141.1655542788244; 
 Sat, 18 Jun 2022 01:59:48 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a05600c3b9700b0039c5224bfcbsm12886524wms.46.2022.06.18.01.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 01:59:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 18 Jun 2022 10:57:04 +0200
Message-Id: <20220618085704.508506-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/php: add
 BR2_PACKAGE_PHP_ARCH_SUPPORTS
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

fiber (https://wiki.php.net/rfc/fibers) has been added in version 8.1.0
with
https://github.com/php/php-src/commit/c276c16b6627222c40bd43907475d664734b9abe

fiber uses asm on supported architectures or needs ucontext since
https://github.com/php/php-src/commit/8fd747a2a0e9f57c12bdad22a1844a736e7b4e57

As result, the following build failure is raised without ucontext_t on
architectures not supported by asm since bump to version 8.1.7 in commit
0ddfece7f7e5b10a5da89f2c462616d5deb5b1ec:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: Zend/zend_fibers.o: in function `zend_fiber_init_context':
zend_fibers.c:(.text+0x68a): undefined reference to `getcontext'

As fiber can't be disabled (only fiber-asm), add
BR2_PACKAGE_PHP_ARCH_SUPPORTS to reflect this new dependency

Fixes:
 - http://autobuild.buildroot.org/results/f4077bae8f879828e343475318cd2ddb99e09ba4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php/Config.in | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/php/Config.in b/package/php/Config.in
index 226d2d5fd2..69b4268c1d 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -1,5 +1,18 @@
+config BR2_PACKAGE_PHP_ARCH_SUPPORTS
+	bool
+	# see fiber_cpu in configure.ac
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_RISCV_64
+	default y if BR2_s390x
+	default y if BR2_TOOLCHAIN_HAS_UCONTEXT
+
 config BR2_PACKAGE_PHP
 	bool "php"
+	depends on BR2_PACKAGE_PHP_ARCH_SUPPORTS
 	# PHP uses -export-dynamic, which breaks with elf2flt with a
 	# message like "ld.real: section .junk LMA [...,...] overlaps
 	# section .text LMA [...,...]"
@@ -52,5 +65,6 @@ source "package/php/Config.ext"
 endif
 
 comment "php needs a toolchain w/ wchar"
+	depends on BR2_PACKAGE_PHP_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_USE_WCHAR
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
