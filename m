Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A38C3C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 02:47:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B7C860E99
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 02:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B7C860E99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34276404BC;
	Sun, 29 Aug 2021 02:47:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mtEKRYVe1_k2; Sun, 29 Aug 2021 02:47:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6910404BD;
	Sun, 29 Aug 2021 02:47:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5CB41BF37E
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 02:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3F1481CA0
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 02:46:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qifmUfbAa4qv for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 02:46:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8550581CD0
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 02:46:43 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id j15so11847528ila.1
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 19:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y0aXRIW+AdLzWiC8QLUnFzcfJBB2v9kxJiEpM84/eHs=;
 b=qAeTQV5geU/FAgYfeRg6QeZU8zuQuCuMCqo2rJqzINXcajTKhwg/Mt0SncHx6AH3PY
 1VTY2N+oBLN6ZWhLrdKaIO5QjGh/AYgrBMSM9JFUYf6PkAGphJwLq9pUUY7EDNAHpZOz
 b8kM7xyQhm3GcTVfZfjmHmzUGiS4//ACr7VA6M+JHBYjvL9REi5QtBAXb8AKaTt+VBC8
 +Yk2EVEAaR6wUwYaU7SHNN5szrDP222SjJFvOmw59kx72afFAPa/iQKGlBEeYs29oIdK
 w78Zo0SH8dIoQzghi3jTA0bMgtA2ubQ+phF4DoJVyHy7zuBCxJfpHL4n6MDRVz0/b8Oh
 Qh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y0aXRIW+AdLzWiC8QLUnFzcfJBB2v9kxJiEpM84/eHs=;
 b=aXpL3IqoXwJQiDd8AaftKy4sG1lL9R5N64MB7ln8aVprN2lN/+z4CUT5GBySuEONkZ
 bAzZypOzBNBEs3p8eZg+WxP7tmPGVFY/z11tzXVfx4/MLq3H5cLcmUCeANJ3p4bVHmWR
 1RFO/UlyeYBU++akEY9ws6fj+E1vbFWus22oxGXyCR35IeFg9l19ECkrM7OuWs6FTL3W
 BehaNtmXij1PN1laonuagCpz3N0QchFaP8l89WdlDosomalqscKNZ5sxbzjSP78v1Cv9
 TJn3QILsUOA8SuknQ9y4CxUNWNpxJL3KKalIZQRFNReOaavFDOQ0M4ZXa0TSkzVwuya6
 LgnQ==
X-Gm-Message-State: AOAM531T2dz2Qj4/+IeX5dzPes94QjpJt2juKgXNJFyHw4Juz1ZYhmvP
 /sWkhegamnqURoKYs31cbFGkGRH7ZzY=
X-Google-Smtp-Source: ABdhPJylxAMZDgmHfrVgcojYmuQ0DmRlr+1JZE6bXMA46kTk3T/LD1uoh6AAu7TWMLYZpZ92Y5Uz4g==
X-Received: by 2002:a92:b308:: with SMTP id p8mr11499839ilh.296.1630205202589; 
 Sat, 28 Aug 2021 19:46:42 -0700 (PDT)
Received: from james-x399.localdomain (97-118-237-25.hlrn.qwest.net.
 [97.118.237.25])
 by smtp.gmail.com with ESMTPSA id g23sm5741951ioc.8.2021.08.28.19.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Aug 2021 19:46:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 20:46:27 -0600
Message-Id: <20210829024632.682029-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210829024632.682029-1-james.hilliard1@gmail.com>
References: <20210829024632.682029-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/8] package/swupdate: use package make
 install for target install
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This ensures all tools/libraries will be properly installed.

Update SWUPDATE_BUILD_CMDS param ordering for consistency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/swupdate/swupdate.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index f4a398ac8e..fd0fb763c9 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -195,11 +195,12 @@ define SWUPDATE_KCONFIG_FIXUP_CMDS
 endef
 
 define SWUPDATE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) $(SWUPDATE_MAKE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D) $(SWUPDATE_MAKE_OPTS)
 endef
 
 define SWUPDATE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/swupdate $(TARGET_DIR)/usr/bin/swupdate
+	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(SWUPDATE_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
 	$(if $(BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE), \
 		mkdir -p $(TARGET_DIR)/var/www/swupdate; \
 		cp -dpfr $(@D)/examples/www/v2/* $(TARGET_DIR)/var/www/swupdate)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
