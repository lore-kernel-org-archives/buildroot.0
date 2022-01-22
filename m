Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F81C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 18:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8AE040904;
	Sat, 22 Jan 2022 18:14:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c4mZz8JPg09o; Sat, 22 Jan 2022 18:14:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F213E408DF;
	Sat, 22 Jan 2022 18:14:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E1721BF2C2
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 18:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 899AC404BD
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 18:13:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lAn2fVEXM0MF for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 18:13:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4829400CE
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 18:13:49 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id s18so5870075wrv.7
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 10:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3ja9EPckjjbpJnzgyWXH5idHG0Phw5fmvq7NeDfAhww=;
 b=bRmfqY9vnlXjpltrixA8XLOYrMy9dTdiwceZm36/IRcdi3Vh0y1oG300TH/XU2FNfU
 owCrnJqpllBi3LOsOwGNA6UlqKB0BmJVY3csdO9EdbBOCrtaexfkFGFphmXIguJw8Y1i
 hASnFsIAbG3DHGPQUihcTxE0AMtJi40TyY0J/Mf/pxVzzJWQmMmA/bu/ECJ3b+3mfZSM
 52xhbrABx+zm1/vVoU/zO63Q9xBiG7jvOMrcjTAZXGOPSEqEintbqEI4EsZq9WUIjcXc
 dknfBMhfWd2691kDDr61nQkaUTRZ8LOE267Knlnw2pTTXAyhPFShjBMjUaYUWZQGx0E0
 5xQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3ja9EPckjjbpJnzgyWXH5idHG0Phw5fmvq7NeDfAhww=;
 b=rQ4v/aTGHGfjx7sH7P+6Y8M4+jlYE1xowt+7yCB1X5oltyAm1WEydj2Lnv619x2hgo
 MQup4ZqRb1Vh4TG6eKeOVIwthBxiU7xaqG7HmVK/QO4eLeIo2cqMu7q3KmRP0DE+CcwX
 E/FAJXAX0XPcNfsYGER+agidbQueVmr3WUrz9rJXZQyN2ue6C6wdQF71qxLjF31aQ2aN
 5VgClTn1cRvm8U3RUio0W/KXvvXX9jioVfQYj+9ha61MrwrWomBiEDU9R4pf0iN+HQZ2
 jJGC+zVWJ4RUvzJXM6ZzqCNjppU2z0oRCw7uLeZaCCjCMgjlbPcFtpAhsFNMsTxBExBR
 RDaw==
X-Gm-Message-State: AOAM531EIxmDn9IRMdPpGChiusnJxuCVxIbsBt7t1S047qZip8s2u5RH
 0LItjUKVxjMEb3BpGyR2USnKHAhwi+s=
X-Google-Smtp-Source: ABdhPJxxQyd0nUC9tGomMkmZD+pWNCeN6iEWGMytVSJyJJIcL49BDwTkt5zZRFjKbYX+x0C4rCULXg==
X-Received: by 2002:adf:eb45:: with SMTP id u5mr8476051wrn.496.1642875227973; 
 Sat, 22 Jan 2022 10:13:47 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:8038:e8ec:605a:7149])
 by smtp.gmail.com with ESMTPSA id 31sm11713638wrl.27.2022.01.22.10.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 10:13:47 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 19:13:45 +0100
Message-Id: <0883bf75cfefe1b97c562b8dae4b2349dd9ece4f.1642875217.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642875217.git.yann.morin.1998@free.fr>
References: <cover.1642875217.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2 v2] core/pkg-generic: apply post-prepare
 hooks before monitoring directories
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Monitoring the target/ and host/ directories and so on, will serve to
generate lists of files installed by the packages. Those lists are then
used to generate graphs of the size those package take on the target
for example.

With PPD, we will also want to use those lists to only copy those files
actually installed by each dependencies of a package, recursively.

Currently, those lists are not entirely reliable, as the starting points
are established before we apply PPD fixup hooks. As such, at the end of
a package installation, fixed up files will be found to belong to the
current package, while they were in fact provided by one of its
dependency.

While this does no big harm, if at all, for the size graphs, it will
trigger overwrite detection when we eventually gather packages together
to aggregate a PPD or te final host and target. So, we better have the
lists of files be reliable.

So, we only start monitoring the directories after we apply the PPD
fixups (or seen the other way around for a smaller diff: we apply the
PPD fixups before we start monitoring the directories).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Herve Codina <herve.codina@bootlin.com>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 78226ee266..b3a7e1d60e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -273,11 +273,11 @@ $(BUILD_DIR)/%/.stamp_configured:
 	@$(call MESSAGE,"Configuring")
 	$(Q)mkdir -p $(HOST_DIR) $(TARGET_DIR) $(STAGING_DIR) $(BINARIES_DIR)
 	$(call prepare-per-package-directory,$($(PKG)_FINAL_DEPENDENCIES))
+	$(foreach hook,$($(PKG)_POST_PREPARE_HOOKS),$(call $(hook))$(sep))
 	@$(call pkg_size_before,$(TARGET_DIR))
 	@$(call pkg_size_before,$(STAGING_DIR),-staging)
 	@$(call pkg_size_before,$(BINARIES_DIR),-images)
 	@$(call pkg_size_before,$(HOST_DIR),-host)
-	$(foreach hook,$($(PKG)_POST_PREPARE_HOOKS),$(call $(hook))$(sep))
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
