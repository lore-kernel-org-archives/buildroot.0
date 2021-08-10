Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1E5C4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 14:58:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2A0960F25
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 14:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C2A0960F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AA0E60731;
	Tue, 10 Aug 2021 14:58:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id alAlsuOT2QYh; Tue, 10 Aug 2021 14:58:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EFE360752;
	Tue, 10 Aug 2021 14:58:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A2FA1BF5A0
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 14:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43801401C9
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 14:58:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fw_gZU6YCBKH for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 14:58:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B79B40357
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 14:58:20 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id r6so4456441wrt.4
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 07:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g2dyApDfYQxu/PHNi5kFBc8G8y0978LliIRpBKhCONA=;
 b=FyJM/E0b7kjSXh9rJijWNei22WyutTdq6LrdBvpFy0NlnWYfkSeHqaVAqWkAPnu+Q7
 gsAuMgr49pl45LRSMn6zk90WgmbXechzfhOYXhMpYjVnT3ePJg+SlcrAJCqiff9Bmr6T
 NluYGJM6cLMHg0LMwdM7QWNrwOd1wPHgn4X986PsA+CeYeuOtTM+t4877UrdEoH3T3um
 uYthRJ19242M/AFSmXiKD4YBmiUOGoEzlhcg/oGaoDnjua9zn8ca+xzDops3Bd+u1zuQ
 aYSfvtzdpiicuYJjYWWqvZGTLijdR1Z6VKMLB7O/fMLQXvGV12D+K90zT5MhRvdIHW1n
 9EDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g2dyApDfYQxu/PHNi5kFBc8G8y0978LliIRpBKhCONA=;
 b=UH1EnKDwEjSsEzgEVe13z2+foYYobiX+giLVhorrUGNt0MSbUifRH4/EYAjKwiPxZC
 LVk3OSbXCfQfaeg43L1y0FbCKpDVOFccf9NScCMMhoOatuvZ6Dbi8715zE/2WcnKZ91V
 6GW7UDBo2e6Y0VeZ1XTBWIg1aZO79GKFXf7VGXIKgeZJzkFTfCFmY1FC9WLtoBUP4R9v
 UABhFbvm1CQ8nm/FKZTcWD9S/K8LHoCj4aH8jPbVv4RU1ek2vBHlWPCs96tdYUjEydjy
 btQzfho8dlSsfDh0uTkXxyDECGcWJnlpp3j7cFHyQrMJ5/tKPq7zkRJL1/INmi6hgBHo
 fqWw==
X-Gm-Message-State: AOAM530Ejydt57hgxDLNiZar4zp71b9Kb9Jl3UiqnL4deoEC++OiK9Mz
 KwAJiyWINhRX9lhMDf0OBPP1NKpLombNAg==
X-Google-Smtp-Source: ABdhPJxCwWZ7BoSbG4iJ0M/FSe4YdByddHQJdGyHEsVYLyUUK174j2+IekEjiGQNhQz2M/oJ/z8j5g==
X-Received: by 2002:adf:f90e:: with SMTP id b14mr30050732wrr.28.1628607498130; 
 Tue, 10 Aug 2021 07:58:18 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id y3sm12605201wma.32.2021.08.10.07.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 07:58:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 10 Aug 2021 16:58:06 +0200
Message-Id: <20210810145806.325205-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/polkit: fix install of polkit.its
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Install polkit.its in $(HOST_DIR)/share/gettext/its as suggested by
https://gitlab.gnome.org/GNOME/gvfs/-/issues/508 to avoid the following
build failure with gvfs because polkit installs polkit.its in
$(STAGING_DIR)/usr/share/gettext:

FAILED: daemon/org.gtk.vfs.file-operations.policy
/tmp/instance-3/output-1/host/bin/meson --internal msgfmthelper daemon/org.gtk.vfs.file-operations.policy.in daemon/org.gtk.vfs.file-operations.policy xml /tmp/instance-3/output-1/build/gvfs-1.44.1/po
msgfmt: cannot locate ITS rules for daemon/org.gtk.vfs.file-operations.policy.in

Fixes:
 - http://autobuild.buildroot.org/results/ba9a8b31e6e275d4db1905241a9153a0513eb335

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/polkit/polkit.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index d5b3955ddb..23adb534d0 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -41,6 +41,14 @@ else
 POLKIT_CONF_OPTS += --with-authfw=shadow
 endif
 
+# polkit.its is needed for gvfs and must be installed in $(HOST_DIR)
+# and not $(STAGING_DIR)
+define POLKIT_INSTALL_ITS
+	$(INSTALL) -D -m 644 $(@D)/data/polkit.its \
+		$(HOST_DIR)/share/gettext/its
+endef
+POLKIT_POST_INSTALL_TARGET_HOOKS += POLKIT_INSTALL_ITS
+
 define POLKIT_USERS
 	polkitd -1 polkitd -1 * - - - Polkit Daemon
 endef
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
