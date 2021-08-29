Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8274C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 02:46:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E4E460E97
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 02:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E4E460E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 395D8404B9;
	Sun, 29 Aug 2021 02:46:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Wgti8svLSME; Sun, 29 Aug 2021 02:46:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83AEC404BD;
	Sun, 29 Aug 2021 02:46:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F7721BF37E
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 02:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AFB3404BD
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 02:46:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WQMkT81W7s2Y for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 02:46:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1F6D404B9
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 02:46:42 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id y18so14773243ioc.1
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 19:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T+a0uhkh3/CNwS3tAmG3c/IFKIJO/nvu6Xmgc2TcnE4=;
 b=V/8JqeSIaUQ4q6cVx9JPO/6dvRZnLr182dWpK2NfdnMCbLgE4OkMgV3vFXbk5wlc9Z
 gNZRSBCGjeHr86FTzh/gjUsxi1iq9uMgO9cd4ccVoqr9OqieoePlLOC06F1D9mmIN4NU
 0+MS58BRJ3VrU9jfYeO5RUkOpy1i1oFyECI7B7jWZAYOhlhMRehgVNErSA1c0xoxiVVq
 xvJDh/rTAa6F3N0icrAJxQYuTR9MJD3Q5/5Gm3AotjFMe5cGn4ojnVq89smpJHEuL/cg
 xtQoy39sLc8Mcn59HFMynn4NqWrz2vQ2KIMMZqtwg/2rOinSHMYssoq87qxsYtpQZXqb
 LvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T+a0uhkh3/CNwS3tAmG3c/IFKIJO/nvu6Xmgc2TcnE4=;
 b=UAN+QzAW50jRCiUwE3eG0VkSTSq0NrD1PZGM41qlP628KmkIJZEwkpcmkDJC0n4IGG
 db5KDL1NabKWNtYEbcbYEOdxOWWzUYGc2pf/ARcTShhRtF1aeLhyw+6NrEx4uwcrlPVR
 XviowYDKBeFQp4yd4/1Le0keudeY4hHZYSV97smWzDA6phHlJymbtKELn2xdAlfZP75q
 1vpmMH6xUIDc/xgHwFYfxP9zE4Op/rzxfbg7To/4Oezf/7nDDPukWldE7bYYGX1mL5bB
 6Cm0GZAw3/AMiFb4Ymka/J347+Ud1v9lU5/PEN9Uwb/jjccR28WfaNHHsD/MPBmteHOx
 mEOw==
X-Gm-Message-State: AOAM533caHMJ6MtOmBIk+R+bavjrAprn/RDgDlT01poeUOo932/6nYNy
 s86vLI+IFzW9Qa74SuFJrbXrumvbTmg=
X-Google-Smtp-Source: ABdhPJyjT0d8PLRWrVnaVlXpDnB9nah9ttXgJ+yd5LNI/wlQD6Sr6vgZzlHTzJuB9O/TCrF7Ug+3gA==
X-Received: by 2002:a05:6602:2219:: with SMTP id
 n25mr13092636ion.185.1630205202004; 
 Sat, 28 Aug 2021 19:46:42 -0700 (PDT)
Received: from james-x399.localdomain (97-118-237-25.hlrn.qwest.net.
 [97.118.237.25])
 by smtp.gmail.com with ESMTPSA id g23sm5741951ioc.8.2021.08.28.19.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Aug 2021 19:46:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 20:46:26 -0600
Message-Id: <20210829024632.682029-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210829024632.682029-1-james.hilliard1@gmail.com>
References: <20210829024632.682029-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/8] package/swupdate: don't require website
 for services
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

The swupdate services do not depend on
BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE, so install them unconditionally.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/swupdate/swupdate.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 42008cddd7..f4a398ac8e 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -213,7 +213,6 @@ $(error No Swupdate configuration file specified, check your BR2_PACKAGE_SWUPDAT
 endif
 endif
 
-ifeq ($(BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE),y)
 define SWUPDATE_INSTALL_COMMON
 	mkdir -p $(TARGET_DIR)/etc/swupdate/conf.d \
 		$(TARGET_DIR)/usr/lib/swupdate/conf.d
@@ -230,6 +229,5 @@ define SWUPDATE_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/swupdate/S80swupdate \
 		$(TARGET_DIR)/etc/init.d/S80swupdate
 endef
-endif
 
 $(eval $(kconfig-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
