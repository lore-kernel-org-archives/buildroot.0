Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D741077604
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 18:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B397A41745;
	Wed, 18 Mar 2026 18:41:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T856fobJbTL5; Wed, 18 Mar 2026 18:41:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03F9641710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773859283;
	bh=B89LEdqZzRCSYfBLfHc7YZSsOfKdC1Pq3ynYCryflAM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EKVMz1wR/AQgm8eaqC68Qf9oHD4R1STVWyHUTzzRRdcpDK/hEi4yUYWxvrjitEMPX
	 n7gGVtbu3XkU9oVs9qWhpKa3zMohbIgA+SoE8qYDQ3zT0LfmhZIhBBLCZdel4ezBlF
	 W+8VNh14ZOr11/zTxZr0TRFqSNsxidKLdWAv5CPACPwS0Llj5eKWEz8DjFgg53iZFI
	 XFt2WL/o7GBkKGaa6yMV5v8+fhvYiyV96ABSS6IGZLqfYfsr1bAYnSWczJGoZT8woq
	 cLqXnpTUDeZ4aavrtIEsioQyPEOQ5NGm8GWvpylLG6tbKkIdqvjbvi1uYdAJ7GK/7o
	 nY6iWsUhPVGGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03F9641710;
	Wed, 18 Mar 2026 18:41:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 004041B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9FA660C19
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5jnSA_uezfxc for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 18:41:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.11.138.130;
 helo=gloria.sntech.de; envelope-from=heiko@sntech.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 368A860C11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 368A860C11
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 368A860C11
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:41:18 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Etienne Carriere <etienne.carriere@foss.st.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, heiko@sntech.de,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Date: Wed, 18 Mar 2026 19:41:09 +0100
Message-ID: <20260318184110.2121178-3-heiko@sntech.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260318184110.2121178-1-heiko@sntech.de>
References: <20260318184110.2121178-1-heiko@sntech.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
 bh=yKO+yIgGDlzeJhrx51ZB6CKeIcZsbt83GRPmxGgTMM4=; b=uZ86xEoLT7vqc6r9Sa5wsjv0yB
 mhLTFTVO0LVwUk6+1Pr0oS1nU9tY5xPxylZLAs/WVx7g4PmqZ4yTTjV1aeCQVkfweGDs+w+3utnhr
 OHnzy2VDNCWZ71xTBKTHexDwmBvIP5wU5AeV7lkmsAsR1Y9mYsdmvTMzjjjCJZ4DzC93jyHMdzyCk
 XuCG4i9uQ5TS0bWc5l6wDmHdI+IBpILbqRg+yJJqNfr+3pepzKiOntg3d9XjUkOZYXJvdDU8XYqmL
 fvfP202QNT14TjqrwwtLeb6t81RPyByz5JU4rW+dKBEJ6Q6Uni/2VW/AMWhw34sHJ7gzejP1iOdS/
 JNdarlFA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=sntech.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de
 header.a=rsa-sha256 header.s=gloria202408 header.b=uZ86xEoL
Subject: [Buildroot] [PATCH v2 2/3] boot/uboot: add option to override the
 CPE_ID_VERSION
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
From: Heiko Stuebner via buildroot <buildroot@buildroot.org>
Reply-To: Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Heiko Stuebner <heiko.stuebner@cherry.de>

CPE_ID_VERSION defaults to {pkg}_VERSION by default.

When using custom tarballs or repo-revisions, this VERSION will contain
either "custom" or the repository revision as its value.

This prevents tooling like CVE checkers, etc that use the show-info
output to know what base version to check against.

To solve this add a config option to (optionally) allow overriding the
CPE_ID_VERSION if needed.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 boot/uboot/Config.in | 11 +++++++++++
 boot/uboot/uboot.mk  |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 3331b81e8c..410ad60e9c 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -83,6 +83,17 @@ config BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION
 
 endif
 
+config BR2_TARGET_UBOOT_CUSTOM_CPE_ID_VERSION
+	string "Set custom U-Boot CPE_VERSION"
+	depends on BR2_TARGET_UBOOT_CUSTOM_TARBALL || BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG || BR2_TARGET_UBOOT_CUSTOM_SVN
+	help
+	  CPE_ID_VERSION defaults to the package version, but when using
+	  custom tarballs or custom repository revisions, the version of
+	  that software is unknown and set to custom or the revision.
+
+	  Allow to set a separate CPE_ID_VERSION, that will generate
+	  more accurate CPE entries for the software-version used.
+
 config BR2_TARGET_UBOOT_VERSION
 	string
 	default "2026.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 5b3f46ac74..795bfd6c00 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -11,6 +11,9 @@ UBOOT_LICENSE = GPL-2.0+
 UBOOT_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_UBOOT_LICENSE_FILES))
 UBOOT_CPE_ID_VENDOR = denx
 UBOOT_CPE_ID_PRODUCT = u-boot
+ifneq ($(BR2_TARGET_UBOOT_CUSTOM_CPE_ID_VERSION),)
+UBOOT_CPE_ID_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_CPE_ID_VERSION))
+endif
 
 UBOOT_INSTALL_IMAGES = YES
 
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
