Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6539E8783D
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 14:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B733F83C16;
	Tue,  3 Feb 2026 14:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_jYRxuPa0Ch; Tue,  3 Feb 2026 14:56:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5F3083C2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770130598;
	bh=6leZyZ4uf0JKFfKLz8J5bF3Aiqoo+5vLumYj5KkMgX0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=c7QdKCSheEBhinhBq1Z7Bci70fWqbGXLYK+HH3FjLXhH3njjkR6gqx8EWggpVdj5U
	 JXCnOq9B9eYOfU+CN5kofILvtuyQ+TcT9+iykFz56AwbGMONe4hZ7rHAq0OfEzxBPp
	 HbcaTZI2T3d/qUuqIPxCrfqw7j/0pMmFnshSXPkiNpbdRf0wrN+M5s7bLeLikrksac
	 l0c3EZetjPR5LecBNTulUjE+/CVm76MOIh14uB6wsuEW7A6mg2qb1qbrvSEfR66W0x
	 jhslvyIza+MOOd8rcLIAVawZznQ+zrElWnKNH7BMZkZESuG5ZekVW3gL371VEpWycu
	 sIMWcK6quMIyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5F3083C2C;
	Tue,  3 Feb 2026 14:56:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35189F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EE1440352
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eGETkF6CrRhb for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 14:56:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1FD7240338
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FD7240338
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1FD7240338
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:56:34 +0000 (UTC)
Received: from home.juju.sh (unknown [109.89.232.55])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id C1BFB19F5A5;
 Tue,  3 Feb 2026 15:56:29 +0100 (CET)
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <bubu@bubu1.eu>,
	Julien Olivain <ju.o@free.fr>
Date: Tue,  3 Feb 2026 15:56:20 +0100
Message-ID: <20260203145620.806729-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770130592;
 bh=MUNuNx2+ehg3CGnqw7M+3i4a6UbrAL38r1ixBtmE5Z0=;
 h=From:To:Cc:Subject:Date:From;
 b=bwh4wqngQO8l1ZrzRWKDbqyZVeAwId1o/o209kc2dbD58OrjuJe1KsqkVFGxr0mpz
 ABzikA5ZoIJoaB/0MbDCFbkCM14Bsfr5emlXMMyMozqmO4XGfdRljFNYLt6f1KvYMM
 zNqi4wEz0lgrZepq5v+3jqdt5jKyjJjKM5hLs+DGWWx5SpGJagrdjutny1LK5Zpbyn
 sNviQlXZOQzhm+erTcI6i4DR+DF/ofCox3OA9j/WcZLprLNDetBHCNJWBLIJiVq2Ap
 3x60UlvHlHrAoIDiXtTd3YQ3ECgGqfkYMaZlSFOnhQu+Wd7lDg566ESmOXqwQ8r5lo
 buorInskD/Pqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bwh4wqng
Subject: [Buildroot] [PATCH 1/1] package/pico{tool,
 -sdk}: install sdk files to $(HOST_DIR)/share
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commits [1] and [2] are installing host SDK files
"$(HOST_DIR)/usr/share".

check-package (see [3]) reports the error:

    package/pico-sdk/pico-sdk.mk:23: install files to $(HOST_DIR)/ instead of $(HOST_DIR)/usr/
    package/pico-sdk/pico-sdk.mk:24: install files to $(HOST_DIR)/ instead of $(HOST_DIR)/usr/
    package/picotool/picotool.mk:15: install files to $(HOST_DIR)/ instead of $(HOST_DIR)/usr/

This commit installs the host SDK files to "$(HOST_DIR)/share" to fix
this error.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/12970341499

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/ceb800d3c63fe91628f42ce749c211ebef278628
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/926381d360082e926cb6be28cb1e97639d26ea0f
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/29a0dd4a3006c06d4b8d82821bd74b8b9f26715a

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pico-sdk/pico-sdk.mk | 4 ++--
 package/picotool/picotool.mk | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pico-sdk/pico-sdk.mk b/package/pico-sdk/pico-sdk.mk
index 5bcf71650d..dfb29d2320 100644
--- a/package/pico-sdk/pico-sdk.mk
+++ b/package/pico-sdk/pico-sdk.mk
@@ -20,8 +20,8 @@ define PICO_SDK_INSTALL_STAGING_CMDS
 endef
 
 define HOST_PICO_SDK_INSTALL_CMDS
-	mkdir -p $(HOST_DIR)/usr/share/pico-sdk
-	cp -r $(@D)/* $(HOST_DIR)/usr/share/pico-sdk
+	mkdir -p $(HOST_DIR)/share/pico-sdk
+	cp -r $(@D)/* $(HOST_DIR)/share/pico-sdk
 endef
 
 $(eval $(generic-package))
diff --git a/package/picotool/picotool.mk b/package/picotool/picotool.mk
index bca9489665..cf8e294835 100644
--- a/package/picotool/picotool.mk
+++ b/package/picotool/picotool.mk
@@ -12,7 +12,7 @@ PICOTOOL_LICENSE_FILES = LICENSE.TXT
 PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(STAGING_DIR)/usr/share/pico-sdk
 PICOTOOL_DEPENDENCIES = libusb pico-sdk
 
-HOST_PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(HOST_DIR)/usr/share/pico-sdk
+HOST_PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(HOST_DIR)/share/pico-sdk
 HOST_PICOTOOL_DEPENDENCIES = host-libusb host-pico-sdk
 
 $(eval $(cmake-package))
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
