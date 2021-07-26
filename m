Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40D4C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:21:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B03AB60BBB
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B03AB60BBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83BBA82BF5;
	Mon, 26 Jul 2021 08:21:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zch0KP1Q0lX2; Mon, 26 Jul 2021 08:21:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFFBD82AA7;
	Mon, 26 Jul 2021 08:21:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3FF771BF293
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C909402A0
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:21:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O51f9AD-vTOM for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 08:21:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 518804029C
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 08:21:41 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id c16so155180wrp.13
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 01:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4+k7a1UBDyNG6JokJ4gDZjU2gxe6Y7mBBE4rZw5pRJw=;
 b=irFDuiBx1FrpvfKaAqAdftnyP5ei1A04o8mPiTYb/VqkiVmx2VSKhBSAZeCkUIpqBZ
 spGDl2fUy/MGQZRrkkwiLrOnQOA6dXtrPKWCG1UcYM7JFrjPfGGYWLqTJ2+fh+NYI75x
 eKEo/V9vfNpYF6HrKRErxgCOJ6CJxrI168tHC4H5+Gt0y+TtX0+3Kf9F1nUqxgJ0fexP
 i2bokTD2+FhwkYVhDs9DFlkdAzS2EHaDen1FvoBGWBFHLLQkWRICIUi0xXLCj2TQsmpi
 XboNWLL+/dGmvHe/r7Qq6X6tQknPXVsX2i+sAIgPDm1jTcCYrHjoOfo1UeoO9Q7dySQw
 KK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4+k7a1UBDyNG6JokJ4gDZjU2gxe6Y7mBBE4rZw5pRJw=;
 b=pI6nfOcdQ9WAdGuw0T1b/t9GNvKRiRoWTdEXPiy3k5KNznkcH6I9AUzNV+4nEZmCzf
 lMXTHoBWVAkrEsLyxrpj3BIKL/IruuZWbGEpPwpgby7OUw1TAqawFBiFbMpkecPl7FoR
 U3lEIUwFvK2EQClo/zwv9HzfvJ/4YV5hDoLR5Oh53aLgcJhVqwPp4s+ZV6etX3Ziwqbx
 J5TkIITBIPZ5OJk51e7e/axmUuHZumhFRM02pGpYVZiGjGDD2u2P5SvPMIFULL+7uj7K
 BxSJ8XFvzwukkvHgPimjYDecYHOXiOKrRNP27xjhVM5a3jI8qJ6K8WGNw+UxmWD6SaAx
 zQ4A==
X-Gm-Message-State: AOAM530e/4aZ85tsvoY6gJvSXtH9MpdgPeJWsxc9CIFqLX84SAMn6VKx
 C0xG3N/D2L2j+LBgqgycUi+8INPcQx/Tig==
X-Google-Smtp-Source: ABdhPJzu6L/W2N+cSwhYIxBC/fyh/FpJHkW/J3dHE+v9wzPVzd9uWsEW6ZVv7enpigsEu4MCibOmfQ==
X-Received: by 2002:a05:6000:184c:: with SMTP id
 c12mr8359939wri.52.1627287699189; 
 Mon, 26 Jul 2021 01:21:39 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id e3sm41848415wra.15.2021.07.26.01.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 01:21:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 10:21:31 +0200
Message-Id: <20210726082131.1705945-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/drbd-utils: add SELinux module
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for drbd-utils is added by the services/drbd module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/drbd-utils/drbd-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/drbd-utils/drbd-utils.mk b/package/drbd-utils/drbd-utils.mk
index 8ea581eb27..6482cf70b6 100644
--- a/package/drbd-utils/drbd-utils.mk
+++ b/package/drbd-utils/drbd-utils.mk
@@ -8,6 +8,7 @@ DRBD_UTILS_VERSION = 9.15.0
 DRBD_UTILS_SITE = http://www.linbit.com/downloads/drbd/utils
 DRBD_UTILS_LICENSE = GPL-2.0+
 DRBD_UTILS_LICENSE_FILES = COPYING
+DRBD_UTILS_SELINUX_MODULES = drbd
 DRBD_UTILS_DEPENDENCIES = host-flex
 
 DRBD_UTILS_CONF_OPTS = --with-distro=generic --without-manual
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
