Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429E3CA0EED
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 10:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E132C81E4F;
	Thu, 28 Aug 2025 10:56:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rtYawhviiQpV; Thu, 28 Aug 2025 10:56:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14EA481E45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14EA481E45;
	Thu, 28 Aug 2025 10:56:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB5C61B0
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 10:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 965AE81E45
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 10:56:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SGHbDHxObeEL for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 10:56:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8D58A81E42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D58A81E42
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D58A81E42
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 10:56:39 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0F8903520776; Thu, 28 Aug 2025 12:56:35 +0200 (CEST)
Date: Thu, 28 Aug 2025 12:56:35 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aLA14x2bTEN_ALy7@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.1.0-38-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1756378596; bh=U5wzE3RcBO4nCzJDhyLDhVXrQuUrt5VgPrzk/rAEGnQ=;
 h=Date:From:To:Subject:From;
 b=GxXtZBcLZDvfyZe+cbc7tsPG30wKQSPBNcWpv+Qj5xCpGhXD+JvP9SDjgY4sB5sdo
 QP1CUeOTgvEvXAM8ilkgay9Ows1ac7+2qeHoquiXhBMpgpkl2qLz8n+QKsfZhM4X75
 WG9cp3niF9qWvRlBqMuG5nElOHQl345/Upjt0Fyymad4S24e+EEVLFnST5XVsSo6P8
 tsrGxnOISmgHbhqDNhfM4l//XII3ChQbhUPReQ1Co0pouP7j2sx7cARSGKqBebuyQi
 LF+gq8k1YKz/XMdtEoYKdxVqRdKsdtl1N9jD0q7kisR8IgkG6ucJjo1dn3Ee8dtCYH
 b7nrBqUOk2giA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=GxXtZBcL
Subject: [Buildroot] [PATCH] evilwm: fix compilation with external toolchains
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to generic-package, as the configure script isn't really a
autotool generated script. This fixes building evilwm with an
external toolchain.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/evilwm/evilwm.mk | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/package/evilwm/evilwm.mk b/package/evilwm/evilwm.mk
index 78b531095b..22116b7714 100644
--- a/package/evilwm/evilwm.mk
+++ b/package/evilwm/evilwm.mk
@@ -18,4 +18,26 @@ endef
 
 EVILWM_POST_INSTALL_TARGET_HOOKS += EVILWM_INSTALL_XSESSION_FILE
 
-$(eval $(autotools-package))
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
+EVILWM_CONF_OPTS += --host=$(TOOLCHAIN_EXTERNAL_PREFIX)
+else
+EVILWM_CONF_OPTS += --host=$(GNU_TARGET_NAME)
+endif
+
+# the configure script is not generated by autoconf
+define EVILWM_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure \
+		--prefix=/usr \
+		$(EVILWM_CONF_OPTS) \
+	)
+endef
+
+define EVILWM_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define EVILWM_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
