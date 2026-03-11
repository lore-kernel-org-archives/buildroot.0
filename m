Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D29A1125856
	for <buildroot@archiver.kernel.org>; Wed, 11 Mar 2026 17:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBD2F40EF2;
	Wed, 11 Mar 2026 17:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rgeUcGlaowbc; Wed, 11 Mar 2026 17:33:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D56740ECD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773250432;
	bh=HOVV4Wmdgpu+aoJ9ep/D+tQ7TvdZE94IUqnMm3dyg4I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Wot2jHA4dfpi6yJCkY4kEj6Yv7YPtIjSZLsu31x4Ix3QAgDTThdfLwdEHy0DpMzfL
	 PdgPGGcD1XtCHe+9QB9qrTsJRs3J2uDPlEKAawUMZCnATDPgNTMzVIFEa8ZS66V3uD
	 4SIc5YFK/G4l7rvPrmrtqGSKPIlWMV16yY7LeZGgKu4ty/xF47SMCaDrcSIW1/UpUN
	 ClCaNBm5inOzVvCJIDh5dMdEunqTZ3i9P8xa430mnwXDzikwvBOjtPRc40/da5MOQV
	 1582ERAK+A7m3oMQuFfiijdf4PQ/0M4Oxlzmr1hUIypR+NmiLtvGyTAy7hilrsmrBP
	 N+pqgKiMbjzeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D56740ECD;
	Wed, 11 Mar 2026 17:33:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A80D4201
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 17:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DCB940ECA
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 17:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aLmifA_S91ry for <buildroot@buildroot.org>;
 Wed, 11 Mar 2026 17:33:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.90.104.147;
 helo=esa2.hc555-34.eu.iphmx.com; envelope-from=jimmy.wesolowski@mobileye.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AF4BD40EF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF4BD40EF0
Received: from esa2.hc555-34.eu.iphmx.com (esa2.hc555-34.eu.iphmx.com
 [23.90.104.147])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF4BD40EF0
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 17:33:46 +0000 (UTC)
X-CSE-ConnectionGUID: 36bnGTbEQmOpKo8KKjZA2A==
X-CSE-MsgGUID: wNEciXdmRYayp8Zg7SlEag==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
 by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 19:33:44 +0200
X-CSE-ConnectionGUID: 0Q3uWTjATvia5j+yiZbAGQ==
X-CSE-MsgGUID: d75AW9MgTVOx4Btf704/cA==
Received: from unknown (HELO epgd074.me-corp.lan) ([10.154.54.2])
 by ces04_data.me-crop.lan with SMTP; 11 Mar 2026 19:36:39 +0200
Received: by epgd074.me-corp.lan (sSMTP sendmail emulation);
 Wed, 11 Mar 2026 19:33:42 +0200
To: buildroot@buildroot.org
Cc: guenther.harrasser@mobileye.com, Chris Packham <judge.packham@gmail.com>,
 Andreas Ziegler <br025@umbiko.net>,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Date: Wed, 11 Mar 2026 19:33:38 +0200
Message-ID: <20260311173338.167112-1-jimmy.wesolowski@mobileye.com>
In-Reply-To: <20260212110116.2451538-1-jimmy.wesolowski@mobileye.com>
References: <20260212110116.2451538-1-jimmy.wesolowski@mobileye.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
 t=1773250428; x=1804786428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PQGqZHJU4/mIl5kUBwo2yM9e/9QWVovM8SyxkhxOK00=;
 b=TN4Ss7hBJ+K2bB8AwrgNfSABg2/jhco9QPJ5SBotY/bgsiqqY/OBN7Hr
 lmHUHRkdgU0utBUrmgEiBVknC/z3ci4J+vXXeRzRnEIL7HDqc3GSo9aAm
 0IZ1eQl4G2m/L2PkC+ojr+RBcSHKs+XBSx48H7wnLqHz1mYqKjpGTT5BW
 VPotPQ3vtSlyujzuk/zRNGZg7nRualtux0sKdjaRzF5s3H/3NoeHy+KrX
 3lLe5/gCuDtQ5YUXsp790XPX4vRQBFSCGvYt+l/zHjeWHUDj6VDw/CxvT
 sUKuxUBb6N7WZfKDQGl5wVD4sALzb+Lg7Igsiy9nWDtyuxXteirAns6LY
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
Subject: [Buildroot] [PATCH v4] package/coremark: use USE_PTHREAD when
 possible, allow custom CFLAGS
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

This passes -DUSE_PTHREAD to coremark CFLAGS
BR2_TOOLCHAIN_HAS_THREAD is set, and allows passing any additional custom
ones defined in the Buildroot configuration.

Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>

---
Changes v1 -> v2:
  - do not add mips-i6500 through a patch, but copy it through rsync
    in POST_EXTRACT_HOOKS (suggested by
    Andreas Ziegler <br025@umbiko.net>)
  - allow specifying a port directory to use through kconfig, such as
    mips-i6500. The default stays linux for 32-bits architecture,
    linux64 for 64.
  - allow passing extra PORT_CFLAGS through kconfig  (suggested by
    Andreas Ziegler <br025@umbiko.net>)

Changes v2 -> v3:
  - do not include the mips-i6500 files as they are redundant with
    the linux port. (suggested by Andreas Ziegler <br025@umbiko.net>)
  - fix indentation in Config.in and coremark.mk
  - drop the ability to pass custom port (no longer necessary).
  - adapt the name and description of the patch accordingly.
  - author and signed-off-by reset due to patch significant changes.

Changes v3 -> v4:
  - add -lpthread in CFLAGS (since only CFLAGS are used to compile
    and link).

Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
---
 package/coremark/Config.in   | 10 ++++++++++
 package/coremark/coremark.mk | 14 +++++++++++---
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/package/coremark/Config.in b/package/coremark/Config.in
index f0e13eda63..2f3b6f9551 100644
--- a/package/coremark/Config.in
+++ b/package/coremark/Config.in
@@ -6,3 +6,13 @@ config BR2_PACKAGE_COREMARK
 	  used in embedded systems
 
 	  https://www.eembc.org/coremark/
+
+if BR2_PACKAGE_COREMARK
+config BR2_PACKAGE_COREMARK_PORT_CFLAGS_EXTRA
+	string "coremark port extra CFLAGS"
+	default ""
+	help
+	  Additional CFLAGS to pass to CoreMark platform specific port.
+	  Any additional flags indicated here will be added to the
+	  CFLAGS_PORT variable.
+endif
diff --git a/package/coremark/coremark.mk b/package/coremark/coremark.mk
index 9ea8693e71..38d8ce99ec 100644
--- a/package/coremark/coremark.mk
+++ b/package/coremark/coremark.mk
@@ -9,14 +9,22 @@ COREMARK_SITE = $(call github,eembc,coremark,v$(COREMARK_VERSION))
 COREMARK_LICENSE = Apache-2.0
 COREMARK_LICENSE_FILES = LICENSE.md
 
+COREMARK_CFLAGS = \
+	$(TARGET_CFLAGS) \
+	$(call qstrip,$(BR2_PACKAGE_COREMARK_PORT_CFLAGS_EXTRA))
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+COREMARK_CFLAGS += -DUSE_PTHREAD -lpthread
+endif # BR2_TOOLCHAIN_HAS_THREADS=y
+
 define COREMARK_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D) \
-		PORT_CFLAGS="$(TARGET_CFLAGS)" \
+		PORT_CFLAGS="$(COREMARK_CFLAGS)" \
 		PORT_DIR=linux$(if $(BR2_ARCH_IS_64),64) EXE= link
-endef
+endef # COREMARK_BUILD_CMDS
 
 define COREMARK_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/coremark $(TARGET_DIR)/usr/bin/coremark
-endef
+endef # COREMARK_INSTALL_TARGET_CMDS
 
 $(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
