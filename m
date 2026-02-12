Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDB5EB4901
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 11:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 859EB4007B;
	Thu, 12 Feb 2026 11:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DNSGnbjCqPrX; Thu, 12 Feb 2026 11:01:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69048401EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770894089;
	bh=1WOfpjUlgQfXq2BtTc9AUuQLQq67faHOhNZxdaJyask=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QhZL3pnrmvGDKvfJk34+Uec/k+5UcxtcJfnf86LQ+UeAjJw9MB6No/6WbIi8nEVlW
	 rcDf8dstUvEsiy7XK9mX33j3Wfcd/Ava4kL+NniH9S9bsRhsAmzjwW18peHTHnWw7a
	 bej+cWTpoBew0nqzR0otGeylJqdWZVZ6i+OaVOEk5YS3XGEzl8+XpsSfUiBvp9+x4W
	 M/InCTzmiOjNj767p8QQZps1TIcswmbwyadfsaGRibNAOzmZiZV07KlKwOlEuDKorE
	 jY43DSE9tHJtt9yshf5DLYLoD9kph+B34TpjKBhZ2UqUZVt9powac/b8oalGl9890i
	 QDSGQ+NyFxRYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69048401EF;
	Thu, 12 Feb 2026 11:01:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A4687BE
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 11:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86E39841C9
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 11:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHwOJYusLhT1 for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 11:01:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.90.104.147;
 helo=esa2.hc555-34.eu.iphmx.com; envelope-from=jimmy.wesolowski@mobileye.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EBCCD8209B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBCCD8209B
Received: from esa2.hc555-34.eu.iphmx.com (esa2.hc555-34.eu.iphmx.com
 [23.90.104.147])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBCCD8209B
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 11:01:25 +0000 (UTC)
X-CSE-ConnectionGUID: uW8/btZ6T+Oll9E9PFcZ4Q==
X-CSE-MsgGUID: OlQi7dGASIa61Lcv1ucLgw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
 by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 13:01:22 +0200
X-CSE-ConnectionGUID: jnNwPH/GTj2KiK/ydDsDYg==
X-CSE-MsgGUID: 2L5qVCslRQqpPx+lmvmApA==
Received: from unknown (HELO epgd074.me-corp.lan) ([10.154.54.2])
 by ces04_data.me-crop.lan with SMTP; 12 Feb 2026 13:03:42 +0200
Received: by epgd074.me-corp.lan (sSMTP sendmail emulation);
 Thu, 12 Feb 2026 13:01:21 +0200
To: buildroot@buildroot.org
Cc: guenther.harrasser@mobileye.com, Chris Packham <judge.packham@gmail.com>,
 Andreas Ziegler <br025@umbiko.net>,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Date: Thu, 12 Feb 2026 13:01:16 +0200
Message-ID: <20260212110116.2451538-1-jimmy.wesolowski@mobileye.com>
In-Reply-To: <20260202155535.3412990-1-jimmy.wesolowski@mobileye.com>
References: <20260202155535.3412990-1-jimmy.wesolowski@mobileye.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
 t=1770894086; x=1802430086;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1RSbXAfFw0xlmKMdtNM3t7fOM2VOdECkxYWacM/E3P4=;
 b=pXgTgVBqdkout3W1wz/T9pIyXiURie+BKr4UQ8RvGL94lgVi/0WIBbSY
 Mnj9ugKob97DF9dvPaOwTixfi45dM6PN6ZEAdl5MPq57SA8Gnd0i+4csO
 qIbjedG8sioYbB3QeVk2DFowdvrp7U1XrvTriuf1dxxw+KRRHlbBvQPaq
 fTKoYVI7MYA1C3JyC8SDtIQhkTXyXJLCiIUw0/M1rwgIPOHHiOkhsoEC6
 52oFQ53vi5juMgFjRs7slLI/Xf8E2Vv/bp3BMRPrOsAasb8dZYvMnP93j
 4TxjDjw2AHoNlj0W2dikOLySF4PnIoV24hrtPs7g8/IrVALaxxW2oEhui
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
Subject: [Buildroot] [PATCH v3 1/1] package/coremark: use USE_PTHREAD when
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
index 9ea8693e71..e1c6e7e00e 100644
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
+COREMARK_CFLAGS += -DUSE_PTHREAD
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
