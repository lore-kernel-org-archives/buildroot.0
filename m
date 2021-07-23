Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74299C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 22:00:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0881E60EB2
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 22:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0881E60EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDC744035B;
	Fri, 23 Jul 2021 22:00:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZJkm1sCNyL3j; Fri, 23 Jul 2021 22:00:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 251F140368;
	Fri, 23 Jul 2021 22:00:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B99361BF5A1
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 22:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F8714016A
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 22:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mneJWSXTOMKV for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 22:00:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7C1D400B9
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 22:00:51 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id b128so1573591wmb.4
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 15:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6FEqTZz0kyAHt1+v2QjG0stTPiE61QZSVryXfCCTX4g=;
 b=EgNCCHbyKgc9dGyJ0PfmhTGxLxehN1hM7fZ6tOo3DLsSRJ4eXBRE4hXEiKZoHHqJjT
 1c6qsImxCq72J/YRsfpDkhUMCPpp7Z5rVF1Wi8Su1OtezN309Z4iFNVaUjMLR/5LOWdd
 sjvq5ZzgeXLure/czHNBRJ6IsJXeQ5neoPuJrg/JFw0cfBzhLqsJcr01jj3/ax9Mc9WK
 0Vrr9dCHhszRcfNzXO2L18LbpXEqQ2vpABJxw/t+IeoBUO58coZt+u6aZVRFk0A+4Pqy
 xRLSKyK5bhCtUxqACvui7vZgue5oWnNHpPZqebFlMrKG4Tjt89Uyi90FUcINdellncYK
 kcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6FEqTZz0kyAHt1+v2QjG0stTPiE61QZSVryXfCCTX4g=;
 b=ZMaIcD4lPrFBa2wKkksvW4ymwRnmVGx3RIOjSstESjKs2YcYwK7od1TwlbspILf+Wh
 yl+hoBIy3uuMVMXoIUQaAizs1DfcpeF1lAnahXG1QkUyjIp8nSM04RgCKg6ngyUuEMxY
 xvJuy12cK8j9tcFyTFYA+nDQTmAwzq6W96x0kE+i8YWTWsM7kgRwNkXPGCwHaQ0g4sDW
 Ws1kcy+EdlmcJ1bjCYUd/QQJn07DaoK7vmpJ4NsGDbS6ileNKsAvu1oO+/4RccapfvDx
 8/KwuX6ZN+R+zLJxSDtTy8IZzPOc/pkHUhaXpCO1vIUfSqulCNnVT4g+6FIfesonh0Lo
 NFeg==
X-Gm-Message-State: AOAM530H5cwYBuTRIzLo+8vIIdwhV3uAYJZYXYENFX3BuLxT4NS3yznq
 C43UaXYyadCMv1sKiqVmPmKh6Ow2XAkaJg==
X-Google-Smtp-Source: ABdhPJyNYZEqx1b3GKFa//d4m2K1kY77CWB4MAjd4b5E/eY4xeeyyg2icdclF6NvLgyoL+zP6lVlvA==
X-Received: by 2002:a1c:f206:: with SMTP id s6mr6152701wmc.102.1627077649805; 
 Fri, 23 Jul 2021 15:00:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id v15sm6530340wmj.39.2021.07.23.15.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 15:00:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 00:00:41 +0200
Message-Id: <20210723220041.511374-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libmbim: drop unrecognized option
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
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--enable-more-warnings has been dropped since version 1.22.0 and
https://github.com/freedesktop/libmbim/commit/448e8fe7c50493c2c42399ed903906b9bb35d244

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmbim/libmbim.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index e21194ca20..b343dec238 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -14,9 +14,6 @@ LIBMBIM_INSTALL_STAGING = YES
 
 LIBMBIM_DEPENDENCIES = libglib2
 
-# we don't want -Werror
-LIBMBIM_CONF_OPTS = --enable-more-warnings=no
-
 # if libgudev available, request udev support
 ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
 LIBMBIM_DEPENDENCIES += libgudev
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
