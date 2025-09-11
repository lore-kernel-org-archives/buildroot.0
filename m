Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2D0CAC58D
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 09:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76B72846AE;
	Thu, 11 Sep 2025 09:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ovYGaEAUXWMU; Thu, 11 Sep 2025 09:23:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D409846A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D409846A7;
	Thu, 11 Sep 2025 09:23:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD845E20
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 09:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9072E613A7
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 09:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fx0z72ZETNM for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 09:23:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DF16A61369
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF16A61369
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF16A61369
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 09:23:17 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 3488235208B3; Thu, 11 Sep 2025 11:23:08 +0200 (CEST)
Date: Thu, 11 Sep 2025 11:23:08 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aMKU_BEQ4TKSd6qq@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.41 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1757582588; bh=W4z9M78jdPhoLT7eadnL+IePLe8sCxOWc12aUdBCXVQ=;
 h=Date:From:To:Subject:From;
 b=s1io1sXI58FiyhG4pT+wMNPYzvBtqM5FTybxrd/iGzjt4a+l7E8JOD9sCV2ytw84S
 /iezGLfB8Lz4JUsNDV5X39+oo77bXFVTAufRjO8m37Dv4cn9HxnEwdluI+cS/jmznt
 BvaR7uCqd0q72y7CfJUIL4KlHKQ7L5aUvhVnFW/zqPrtiZOYjwcu8oA1upu2eu5hIy
 1I9u8DdrKNixji4eoOGFtaxyNmFfytS1bMP3wsdDw53J28T1g/Sw95k4QPgE4eOhwz
 5FmQGaSOjGoqKLoENYBRZtONA91yZwAC6OmMyHBwykLSTUwQ+A5NnSOfjyY5ViDg1v
 Qslk9Coq5qcIQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=s1io1sXI
Subject: [Buildroot] [PATCH v2] package/evilwm: fix compilation with
 external toolchains
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

Fixes:
 - https://autobuild.buildroot.org/results/250/25040ce7e94acf8f92c24db895d7dea081de1d7a

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
  - add link to autobuilder (suggested by Arnout)
  - use TARGET_CROSS (suggested by Arnout)
---
 package/evilwm/evilwm.mk | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/package/evilwm/evilwm.mk b/package/evilwm/evilwm.mk
index 78b531095b..12934427b9 100644
--- a/package/evilwm/evilwm.mk
+++ b/package/evilwm/evilwm.mk
@@ -18,4 +18,26 @@ endef
 
 EVILWM_POST_INSTALL_TARGET_HOOKS += EVILWM_INSTALL_XSESSION_FILE
 
-$(eval $(autotools-package))
+EVILWM_TOOLS_PREFIX += $(patsubst %-,%,$(TARGET_CROSS))
+
+# the configure script is not generated by autoconf
+define EVILWM_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		./configure \
+		--prefix=/usr \
+		--mandir=/usr/share/man \
+		--host=$(EVILWM_TOOLS_PREFIX) \
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
