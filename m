Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5E6CE8D4C
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 04:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1048684962;
	Thu, 19 Sep 2024 04:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZfQkzIPYRLqt; Thu, 19 Sep 2024 04:00:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B125D84972
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B125D84972;
	Thu, 19 Sep 2024 04:00:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 15FBB1BF3DD
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 03:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 041784278E
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 03:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wlKt5D7M0EHu for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 03:59:50 +0000 (UTC)
X-Greylist: delayed 370 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 19 Sep 2024 03:59:49 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 83A7842749
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83A7842749
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@helium.openadk.org; receiver=<UNKNOWN> 
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83A7842749
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 03:59:49 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 372433537471; Thu, 19 Sep 2024 05:53:37 +0200 (CEST)
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 05:53:05 +0200
Message-Id: <20240919035308.2622723-7-wbx@openadk.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240919035308.2622723-1-wbx@openadk.org>
References: <20240919035308.2622723-1-wbx@openadk.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1726718018; bh=1O3Meyssnt0YppOpwzakWQDS2bfcNWSSBkC7Em87QSA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZDw84iGb092L8RyyThUFrOxzhnqbIklLgLf6cqoxUW3HU7trmorhawUvzDnLL7OqL
 40VO1+aAuhD7laOV7AeBcIM0/BtTq1HDjxzP94IdEycxelxfyiF30kpZusKa0W8kOy
 0c5R8uFNIrrdY7UNhxTAdhzkPgSuqBishiEu7oG2w7xInQ+9ZNe9gWjSB94qgsFEGP
 CDGkvA56bkLsCyOtaXc03nT+HWxi+lA++ddf8Ff5VvYLW8he6rfvKq3Y3CC7tKBD55
 +gYDzmxMSGhPiff+glaFCQ4iQg6vdL/nc0uFV1TeXCPY2Efxas+KvTsOEolub3jj4n
 vHIh6s+eDpXBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=ZDw84iGb
Subject: [Buildroot] [PATCH 6/9] linux: pass -mno-fdpic if FDPIC is enabled
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
Cc: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Ben Wolsieffer <ben.wolsieffer@hefring.com>

If the FDPIC ABI is enabled by default in the toolchain, it must be
explicitly disabled when building the kernel.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 linux/linux.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 92035d0da9..80dbeb9e7e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -163,6 +163,7 @@ endif
 LINUX_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS))) $(HOST_LDFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
+	KCFLAGS="$(LINUX_CFLAGS)" \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	WERROR=0 \
@@ -184,7 +185,12 @@ endif
 # sanitize the arguments passed from user space in registers.
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82435
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
-LINUX_MAKE_ENV += KCFLAGS=-Wno-attribute-alias
+LINUX_CFLAGS += -Wno-attribute-alias
+endif
+
+# Disable FDPIC if enabled by default in toolchain
+ifeq ($(BR2_BINFMT_FDPIC),y)
+LINUX_CFLAGS += -mno-fdpic
 endif
 
 ifeq ($(BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT),y)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
