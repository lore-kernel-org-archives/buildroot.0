Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8906CFF8867
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 09:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A2DD422AC;
	Wed, 29 Apr 2026 09:23:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ct0GiYKwhvE1; Wed, 29 Apr 2026 09:23:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7056B422AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777454634;
	bh=pxaqcCopkhoXFK3sG396FJZw/HCYz1z/+Y6uQIJcVQI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RD4FTEGAPXgazi8rP2grlfcCjA4kkr/Mlk/GPMChgerVZ+Q9AHDxMMbuLEEgKiW+i
	 3hcA1ZrSAHYUEjego4OAZogJeqTEunOXSWrgJ24RVWI+/3ml9sRz0n2l3555ZI5IXB
	 pUJ6Nbz3SnToPqWlssLGvTTl9khC314K9Pnw/j8VR1nbUc4IruP7cX+ji+ZtlcbXDu
	 DWfeDiLR84iJUYJCiMJxjGfd5Zy4NtwtTLUH9oCV2mprBA4lCTa7lWn4X17LDRF51c
	 t9V6SAfGZyjjv3v0wlk065/MND48Qec+UykvwhLQnYp32agnyC3wo28qmGdCJLa1A5
	 DEohK8Q1R7k5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7056B422AD;
	Wed, 29 Apr 2026 09:23:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 69B29231
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 09:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 664E6613C4
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 09:23:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I617m9KnFnHt for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 09:23:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31;
 helo=sea.source.kernel.org; envelope-from=mwalle@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 93D346134C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93D346134C
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93D346134C
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 09:23:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CAECA409BB;
 Wed, 29 Apr 2026 09:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D06C2BCB3;
 Wed, 29 Apr 2026 09:23:49 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Michael Walle <mwalle@kernel.org>
Date: Wed, 29 Apr 2026 11:23:39 +0200
Message-ID: <20260429092343.979523-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260429092343.979523-1-mwalle@kernel.org>
References: <20260429092343.979523-1-mwalle@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1777454630;
 bh=eP4mZMfwsgo3SUTnm33FRGmfi8B7Tb6feAp75LOJAAE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ePxRJt62HFDn5+WfQLHbBMmMyKDHMjdMwBB11jMCeYTqFoDtLHENfMMibKQDW88u0
 v2fRiF6zsprK8JjnOs2FHA5eXuyv+Uguvk8OFiWE/NrAxI1pHWp6IRBmX/w1SRPSKE
 GHXFPgjAKcCFWZgKOIkBOUhSpp2050FRouenFiT6Lid+z18MnciEqQ3/7oUNfpz5Mf
 KOnblnZU0C+Kev/x5nHq5g3NuNMhywNwgszzF37h3WzK92UzIY6Dwzdsw38Id/Ksxp
 xhqRBALcqBWj8P5/8ELlt71kTtjKPN0i8xl8AmtJ/qkxINgXYTDw23YpDZXp30rrGN
 qPsbpQeqQoCLQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ePxRJt62
Subject: [Buildroot] [PATCH 2/2] configs/kontron_smarc_sal28: enable
 FORCE_CHECK_HASHES
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
From: Michael Walle via buildroot <buildroot@buildroot.org>
Reply-To: Michael Walle <mwalle@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable the FORCE_CHECK_HASHES and the corresponding custom hashes.

Suggested-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../smarc-sal28/patches/linux-headers/linux-headers.hash       | 1 +
 board/kontron/smarc-sal28/patches/linux/linux.hash             | 2 ++
 board/kontron/smarc-sal28/patches/uboot/uboot.hash             | 2 ++
 configs/kontron_smarc_sal28_defconfig                          | 3 ++-
 4 files changed, 7 insertions(+), 1 deletion(-)
 create mode 120000 board/kontron/smarc-sal28/patches/linux-headers/linux-headers.hash
 create mode 100644 board/kontron/smarc-sal28/patches/linux/linux.hash
 create mode 100644 board/kontron/smarc-sal28/patches/uboot/uboot.hash

diff --git a/board/kontron/smarc-sal28/patches/linux-headers/linux-headers.hash b/board/kontron/smarc-sal28/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/kontron/smarc-sal28/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/kontron/smarc-sal28/patches/linux/linux.hash b/board/kontron/smarc-sal28/patches/linux/linux.hash
new file mode 100644
index 0000000000..a4cc7bd3f6
--- /dev/null
+++ b/board/kontron/smarc-sal28/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  9106a4605da9e31ff17659d958782b815f9591ab308d03b0ee21aad6c7dced4b  linux-6.18.tar.xz
diff --git a/board/kontron/smarc-sal28/patches/uboot/uboot.hash b/board/kontron/smarc-sal28/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..36322a6a90
--- /dev/null
+++ b/board/kontron/smarc-sal28/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
index 09d3142589..b1e175b7b2 100644
--- a/configs/kontron_smarc_sal28_defconfig
+++ b/configs/kontron_smarc_sal28_defconfig
@@ -1,9 +1,10 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/kontron/smarc-sal28/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_OVERLAY="board/kontron/smarc-sal28/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/kontron/smarc-sal28/post-build.sh"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
