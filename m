Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1AAE7DEEF
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 14:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 913F960B33;
	Mon,  2 Feb 2026 14:26:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nrUfYbpuEmnC; Mon,  2 Feb 2026 14:26:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1331D60722
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770042368;
	bh=n0+ksvmcHVPTQ0xVgaldzgHWTZ4RnL+E7x9t+Vs8jKg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=LqERP7zrIC6mgTKPF1sXMSXOz/JWyo9ns8t/hSVOP6ezliWMtfFYoQi4R2incUIVg
	 PIP4vryiaH4MFf9letBdGS7rPNTdX9drGsvaZ9xZwOI/5bSYozrR7psnQob4sNV+gS
	 DxjtLkU5JRrldm7hwatGd9ZoUbQ+GBMAMWEnckyrv0UJtcYrKNfhd+e6aDzGoo29m1
	 OtVbudbpBSY8BtH0BufRkUXAfux5B/vgiDaFHTtxxfgyIP/2nk+Zho3S0mlJvi1uCX
	 +yTP44TTb1HsDqKn80FqeA2GUJl86OdL8U324rtLZCtFCzgnxDkF2Hwr4JlymKUnwk
	 7Hq7UQVef/ryQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1331D60722;
	Mon,  2 Feb 2026 14:26:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6996B23E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 579A44028C
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7xysnsIassi for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 14:26:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=207.54.77.50;
 helo=esa3.hc555-34.eu.iphmx.com; envelope-from=jimmy.wesolowski@mobileye.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 070CB401E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 070CB401E9
Received: from esa3.hc555-34.eu.iphmx.com (esa3.hc555-34.eu.iphmx.com
 [207.54.77.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 070CB401E9
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:26:04 +0000 (UTC)
X-CSE-ConnectionGUID: Z799pc4rSH6+TXODCbC8cw==
X-CSE-MsgGUID: VtCBz25sTRKgrKC86QfOlg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
 by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 16:26:03 +0200
X-CSE-ConnectionGUID: hA6ZBTVwRiitQqoHvgz/rA==
X-CSE-MsgGUID: pK6WgjrFTMW2XmoBZhQvSA==
Received: from unknown (HELO epgd074.me-corp.lan) ([10.154.54.2])
 by ces03_data.me-corp.lan with SMTP; 02 Feb 2026 16:28:08 +0200
Received: by epgd074.me-corp.lan (sSMTP sendmail emulation);
 Mon, 02 Feb 2026 16:26:01 +0200
To: buildroot@buildroot.org
Cc: guenther.harrasser@mobileye.com,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Date: Mon,  2 Feb 2026 16:25:58 +0200
Message-ID: <20260202142558.2681969-1-jimmy.wesolowski@mobileye.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
 t=1770042365; x=1801578365;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=atz+F2YyExYir6cKgy/LvK3Awq7BMCGmpMAM4kvoOu0=;
 b=ckYd4juVm6WZbn+j/LrRWNpoYDd6St74EfZsbDI9B/xcQUb01d+fyKm7
 X8doo68DDt6Ttg9IUlGQ8ts+cFkTj8ZSAAMyaamIxkwMZLx3sC46WIq9F
 9c4VRC+fhTMYOSbtOalODMoEkPcdpAcP+G6C8ZpliSB4DTjrZJn6fBWDz
 j5GsHjzD2B5zRAR00TVKzTutCHZKDcGzOh+bICSnD2pameZkubfu/6mpo
 d/YlnDKuzjSibL2oM8XrVMX0XkKoLrpTdMSCgmAQ2iJKfo2MUjUIrGqpw
 wTy95ySVELDXF7qx4CWM2Zrd7CdURN8MY9k5nScjbNCSz5Yz2GgG6i51S
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
Subject: [Buildroot] [PATCH] pkg-kconfig: call "make defconfig" and "make
 all" the same way
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
From: Jimmy Durand Wesolowski via buildroot <buildroot@buildroot.org>
Reply-To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building the Linux kernel, if LINUX_KCONFIG_DEFCONFIG is defined, we
first call "make NAME_defconfig", then call "make all".
When calling the defconfig step, we use 'HOSTCC="$(HOSTCC_NOCCACHE)"',
while we build all with HOSTCC set to a more complex set of options
(see linux/linux.mk l.164).

When rebuilding objects or executables, the kernel always compare the
current command line against the one previously using "if_changed" and
"if_changed_dep".

Since we changed the HOSTCC between the 2 builds, the kernel rebuilds
all the host tools. On highly parallel builds, this can result in a
very low probability race condition that another object that uses fixdep
(through the "cmd_and_fixdep" definition) would use it while it is being
recompiled, resulting in the error:
scripts/basic/fixdep: Permission denied

This commit ensures HOSTCC is the same, allowing build commands to be the
same between the defconfig and the build steps, and thus avoiding the
recompilation of the host binaries.

Note: The PKG_KCONFIG_COMMON_OPTS has been unset but is kept to allow
adding other common options in the future.

Important note: Please note that this might break
128aa05dd950 "package/pkg-kconfig: pass HOSTCC during kconfig steps", but
that commit indicates
> So practically speaking, this commit does not fix anything, as the two
> only problematic packages that use $(HOSTCC) are not fixed. However,
> it makes things more correct by explicitly telling kconfig which
> compiler to use.
So reverting it should not break anything.

Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
---
 package/pkg-kconfig.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 0af4ab09e6..b3c4a8bcb7 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -27,8 +27,7 @@ define kconfig-package-update-config
 	$(Q)touch --reference $($(PKG)_DIR)/$($(PKG)_KCONFIG_STAMP_DOTCONFIG) $($(PKG)_KCONFIG_FILE)
 endef
 
-PKG_KCONFIG_COMMON_OPTS = \
-	HOSTCC="$(HOSTCC_NOCCACHE)"
+PKG_KCONFIG_COMMON_OPTS =
 
 # Macro to save the defconfig file
 # $(1): the name of the package in upper-case letters
@@ -148,7 +147,7 @@ $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
 	done
 
 $(2)_KCONFIG_MAKE = \
-	$$($(2)_MAKE_ENV) $$($(2)_MAKE) -C $$($(2)_DIR) \
+	$$($(2)_MAKE_ENV) $$($(2)_MAKE) $$($(2)_MAKE_FLAGS) -C $$($(2)_DIR) \
 		$$(PKG_KCONFIG_COMMON_OPTS) $$($(2)_KCONFIG_OPTS)
 
 # The specified source configuration file and any additional configuration file
@@ -251,8 +250,9 @@ $(2)_CONFIGURATOR_MAKE_ENV = \
 $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $(1)-%: $$($(2)_DIR)/.kconfig_editor_%
 $$($(2)_DIR)/.kconfig_editor_%: PKG=$(2)
 $$($(2)_DIR)/.kconfig_editor_%: $$($(2)_DIR)/.stamp_kconfig_fixup_done
-	$$($(2)_CONFIGURATOR_MAKE_ENV) $$($(2)_MAKE) -C $$($(2)_DIR) \
-		$$(PKG_KCONFIG_COMMON_OPTS) $$($(2)_KCONFIG_OPTS) $$(*)
+	$$($(2)_CONFIGURATOR_MAKE_ENV) $$($(2)_MAKE) $$($(2)_MAKE_FLAGS) \
+		-C $$($(2)_DIR) $$(PKG_KCONFIG_COMMON_OPTS) \
+		$$($(2)_KCONFIG_OPTS) $$(*)
 	rm -f $$($(2)_DIR)/.stamp_{kconfig_fixup_done,configured,built}
 	rm -f $$($(2)_DIR)/.stamp_{target,staging,images}_installed
 	$$($(2)_FIXUP_DOT_CONFIG)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
