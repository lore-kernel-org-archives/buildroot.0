Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B27C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:15:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AC0260F70
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3AC0260F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 079286071B;
	Sun, 26 Sep 2021 21:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9j6EZpKzY26x; Sun, 26 Sep 2021 21:15:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DE4E605D6;
	Sun, 26 Sep 2021 21:15:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C19C1BF370
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A29C40214
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:15:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ecTDOgxrV2Hd for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:15:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1710540172
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:15:36 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t18so46180268wrb.0
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 14:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pEhdsPsG6lmPv2yrNZbY3hXpOj2Y34hrh7YddPCJ/lg=;
 b=hhDAB1B6sRNryN1YFQwsOCuOBpeP30USlH3f9in5NKXqk+/EO8DfaB23COUCYjYsgl
 qwayYt7yLzh1jpdkeA7g4IjnfU8CGeB/X9RFBM3xRgiEpMS16M+4AzLwoILEZehxLfzG
 4R+2N15oPWFxRjtf1So2Pw0xlBWh7Rw/RxGmZ+npVtCEpltF0RWcKUQGjRlaIe3BYyDB
 g74vS5U/LK12ihPfHcQi4nOCjEOUcBK7EdGTJhCxgrZiN9UXFMsx5JF0D6la+wWBP+xP
 38YbvMIKdL+9Ok96XDiOnbAXujUN+giSreFWh2fm5qej7vlX4lGHW1VJIK1Ccqj9h7MC
 Pm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pEhdsPsG6lmPv2yrNZbY3hXpOj2Y34hrh7YddPCJ/lg=;
 b=0PtCzANt12mCQdCNY489UJkE7mIe7uaaQaAC8SnCvn1PR/NB8NpgakbwuTvXNn03ck
 jhYJk65UcP5LEcPEbmrghh/l81rMb1tePXqZDSqXGxeIJYId7mU5HsepGUwZbczqzTSm
 EC5SQPwVuar6HHPDmfU73FL0DdnDQOrRaHd7/xZjahZ1IPqgPXHkdrvpanJJ2shXrmnY
 cXms5cQojjIPiU57K8LuqsgLYUQtGWHDsRHTXBRfBbeeutqo5C+oLy4GAC0of/92fdtt
 CauNhOKasGbGxGVeAaUMcMilLlqzjyRqje0G0jhZBMxQYbHbZejt78jn/tE+pkaX+L1X
 GWOw==
X-Gm-Message-State: AOAM531BcxfV+93DFNENRwaKS4litNapmMpN1r6MDPRQXf4p7xFrROel
 d0+OS+8YeWZCaznDyvKfXLBlvcUcwi4=
X-Google-Smtp-Source: ABdhPJxWPA8WCoNT30NnUzMF/XfZGBuQ6ptWUYDCWi9aT2394XvoXY3MEVcKIbCvrH6Pb3l8uLsTVQ==
X-Received: by 2002:adf:ded1:: with SMTP id i17mr23944318wrn.83.1632690934074; 
 Sun, 26 Sep 2021 14:15:34 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id g2sm15475087wrb.20.2021.09.26.14.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 14:15:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 23:15:02 +0200
Message-Id: <20210926211503.897587-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/mtr: use ncurses option
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use --with-ncurses and --without-ncurses options which are available
since version 0.88 and
https://github.com/traviscross/mtr/commit/4e2a948a167d9b8a0a63b46a423d4ae1519ad759

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mtr/mtr.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/mtr/mtr.mk b/package/mtr/mtr.mk
index 7198cbcc1c..0400a12021 100644
--- a/package/mtr/mtr.mk
+++ b/package/mtr/mtr.mk
@@ -10,10 +10,16 @@ MTR_AUTORECONF = YES
 MTR_CONF_OPTS = --without-gtk
 MTR_DEPENDENCIES = \
 	host-pkgconf \
-	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
-	$(if $(BR2_PACKAGE_NCURSES),ncurses)
+	$(if $(BR2_PACKAGE_LIBCAP),libcap)
 MTR_LICENSE = GPL-2.0
 MTR_LICENSE_FILES = COPYING
 MTR_SELINUX_MODULES = netutils
 
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+MTR_CONF_OPTS += --with-ncurses
+MTR_DEPENDENCIES += ncurses
+else
+MTR_CONF_OPTS += --without-ncurses
+endif
+
 $(eval $(autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
