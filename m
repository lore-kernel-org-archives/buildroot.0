Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8183C3600C
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 04:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D80C60BC4;
	Thu,  3 Apr 2025 04:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uMNrZQRJ9CIA; Thu,  3 Apr 2025 04:55:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A26C1607C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A26C1607C3;
	Thu,  3 Apr 2025 04:55:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 74F4F117
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 04:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 670C540139
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 04:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id We9XgtROu07l for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 04:55:06 +0000 (UTC)
X-Greylist: delayed 431 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 03 Apr 2025 04:55:06 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6FA20409B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FA20409B7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.248.49.38;
 helo=mx.socionext.com; envelope-from=hayashi.kunihiko@socionext.com;
 receiver=<UNKNOWN> 
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FA20409B7
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 04:55:06 +0000 (UTC)
Received: from unknown (HELO iyokan3-ex.css.socionext.com) ([172.31.9.54])
 by mx.socionext.com with ESMTP; 03 Apr 2025 13:47:52 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
 by iyokan3-ex.css.socionext.com (Postfix) with ESMTP id 971862091483
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 13:47:52 +0900 (JST)
Received: from kinkan3.css.socionext.com ([172.31.9.51]) by m-FILTER with
 ESMTP; Thu, 3 Apr 2025 13:47:52 +0900
Received: from plum.e01.socionext.com (unknown [10.212.245.39])
 by kinkan3.css.socionext.com (Postfix) with ESMTP id 016CDE29;
 Thu,  3 Apr 2025 13:47:51 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: buildroot@buildroot.org
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Date: Thu,  3 Apr 2025 13:47:47 +0900
Message-Id: <20250403044747.322647-1-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=socionext.com
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: remove absolute path
 of link source for fw_setenv
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

For portability reason, it isn't preferable to include an absolute path
in the link to fw_printenv which is in the same directory as fw_setenv.

Fixes: 42646265d5dd ("package/uboot-tools: add fw_printenv to host uboot tools")
Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 package/uboot-tools/uboot-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index d897a6bc17f4..1925047ccdcf 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -220,7 +220,7 @@ define HOST_UBOOT_TOOLS_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/tools/dumpimage $(HOST_DIR)/bin/dumpimage
 	$(HOST_UBOOT_TOOLS_INSTALL_FIT_CHECK_SIGN)
 	$(INSTALL) -m 0755 -D $(@D)/tools/env/fw_printenv $(HOST_DIR)/bin/fw_printenv
-	ln -sf $(HOST_DIR)/bin/fw_printenv $(HOST_DIR)/bin/fw_setenv
+	ln -sf fw_printenv $(HOST_DIR)/bin/fw_setenv
 	$(HOST_UBOOT_TOOLS_INSTALL_ENVIMAGE)
 	$(HOST_UBOOT_TOOLS_INSTALL_BOOT_SCRIPT)
 endef
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
