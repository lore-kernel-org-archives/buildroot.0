Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F191C04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 06:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D82DB82784;
	Tue, 14 May 2024 06:26:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4fFpFvIDXJbw; Tue, 14 May 2024 06:26:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7E8C82786
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7E8C82786;
	Tue, 14 May 2024 06:26:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C59231BF38D
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 06:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF7D9408B9
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 06:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uY4ZYY-8V40O for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 06:26:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5DE9D40839
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DE9D40839
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DE9D40839
 for <buildroot@buildroot.org>; Tue, 14 May 2024 06:26:14 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 4FF1D35208EF; Tue, 14 May 2024 08:26:09 +0200 (CEST)
Date: Tue, 14 May 2024 08:26:09 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZkMEATm9Efp16zRg@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1715667972; bh=70mYTo9EzyVJdh5ItgIo//uozp5mG0+zotKxWQx9UNU=;
 h=Date:From:To:Subject:From;
 b=PzEhBIm6lrInRm4ntPwAJmwWXbmsI/32ZmjBZr9IBB0FBYbVgjvHqtdpO2KC/uMQ0
 VR0UQh320oidWq5toT8FWnWgYBXBH86UOzqWv+2x0A/Dt63OOWl4AzGj/Socr6AqdT
 qYICCSTQxz3asABXVyQfpt6844IRm3Nt/WlX6YJgt8BDW7Cu5LfhUpr9iB8wyxywnZ
 mWOkZzKqNEXhAA9EMJskJP6kVXVDXM8aYOxA1FGVkQL/cGTa74SYnCv46QbKD5lMbG
 9p4Ir5i+BLiZ2gtcLpoiraOEr3Vap897T2JiVSKDcMM3FbBI+ChYBJcDMi4gfRlk9D
 7Y6jKhPSZTHkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=PzEhBIm6
Subject: [Buildroot] [PATCH 1/3] arch: add support for loongarch64
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 arch/Config.in             | 12 ++++++++++++
 arch/Config.in.loongarch64 | 14 ++++++++++++++
 package/glibc/Config.in    |  1 +
 package/musl/Config.in     |  1 +
 4 files changed, 28 insertions(+)
 create mode 100644 arch/Config.in.loongarch64

diff --git a/arch/Config.in b/arch/Config.in
index f39c33ef7f..070a4aca3a 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -77,6 +77,14 @@ config BR2_i386
 	  Intel i386 architecture compatible microprocessor
 	  http://en.wikipedia.org/wiki/I386
 
+config BR2_loongarch64
+	bool "loongarch64"
+	select BR2_ARCH_IS_64
+	select BR2_USE_MMU
+	help
+	  Loongarch is a RISC microprocessor from Loongarch Technologies.
+	  https://en.wikipedia.org/wiki/Loongson
+
 config BR2_m68k
 	bool "m68k"
 	# MMU support is set by the subarchitecture file, arch/Config.in.m68k
@@ -374,6 +382,10 @@ if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be
 source "arch/Config.in.arm"
 endif
 
+if BR2_loongarch64
+source "arch/Config.in.loongarch64"
+endif
+
 if BR2_m68k
 source "arch/Config.in.m68k"
 endif
diff --git a/arch/Config.in.loongarch64 b/arch/Config.in.loongarch64
new file mode 100644
index 0000000000..2b5bac095d
--- /dev/null
+++ b/arch/Config.in.loongarch64
@@ -0,0 +1,14 @@
+config BR2_ARCH
+	default "loongarch64"
+
+config BR2_NORMALIZED_ARCH
+	default "loongarch"
+
+config BR2_ENDIAN
+	default "LITTLE"
+
+config BR2_READELF_ARCH_NAME
+	default "LoongArch"
+
+# vim: ft=kconfig
+# -*- mode:kconfig; -*-
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 81c64083f4..5385e2a855 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_aarch64
 	default y if BR2_aarch64_be
 	default y if BR2_i386
+	default y if BR2_loongarch64
 	default y if BR2_m68k_m68k
 	default y if BR2_mips
 	default y if BR2_mipsel
diff --git a/package/musl/Config.in b/package/musl/Config.in
index a6e2af054c..70475326f5 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_MUSL_ARCH_SUPPORTS
 	default y if BR2_arm
 	default y if BR2_armeb
 	default y if BR2_i386
+	default y if BR2_loongarch64
 	default y if BR2_m68k_m68k
 	default y if BR2_microblaze
 	default y if BR2_mips
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
