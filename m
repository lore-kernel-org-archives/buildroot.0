Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C973EC6377A
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:01:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 765C160FF1
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 765C160FF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3371440155;
	Wed, 21 Jul 2021 20:01:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T22nVpR08mX3; Wed, 21 Jul 2021 20:01:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8856840134;
	Wed, 21 Jul 2021 20:01:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B89C41BF337
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B032A82A3B
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:01:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0iM2DntKuXLc for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 20:01:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CF7182A2D
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 20:01:50 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id u1so3455030wrs.1
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 13:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qnuhV+4WcqVpLzYENQ3/u1oFVvgMSv3KcCckmsC4duc=;
 b=Zx4kJ+n/lY9IKMFjITTiZ1KUuCmyUZlQF1HmzBowP3cGxEBw9rns4d64nWXfbivXRZ
 6dzJBuOompH2FfbMu+A7wydi5UjYFUh1XKeI5y9D+cbYaQZKxTjc9FoTpTcyN2I3F7Ul
 laSumI8VMsj25AxL/azbNzTQf5+UqeecA7lURZmItta41VZPo25skdUJdlsRhDCK6h0s
 NRTRMQvWtY3BSlv0Dgirh8BHBPEX2gbijKAfPTIOf0jQfHWbqtdUMOiL9CId6cvaNmH7
 mtcVyN6aFUe3wr6YFCsUkxfLrNna2xa50XZmmKlY1TXeRCZaBozWjBA66x1EBFmzoLcN
 bKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qnuhV+4WcqVpLzYENQ3/u1oFVvgMSv3KcCckmsC4duc=;
 b=hM4Q4T6upAWWqxAhgchdi1ghNzCZeE5vmzEDiJ/Vfn9+XvlnOPXjZlSxXNGDRcM2QH
 uDLKnHw/outaaAXaj1xsbVRBPgWcwqZdVtikyE87R1aLucgdwf7zNK5GmvBHW3Je5ALw
 CHxgGrIiHW4otZFAhmAKPWXl8SDUAYjnfkrfPXW2j83mTn9HNdYBZaMRSNF3bZZjhyGK
 k3c86I3iwR3n3XuXONtJXjQb8r9whqbj1wWw8Xx8bO4vgfPVrOmS1ASgqrwdoGlByTzZ
 zlkdn8TWKRh0fIdHKAuOcTyiNUE/xLIsxUFY9/+989UulIYl/75ZLDUSXjmJikAUyWIy
 bYeQ==
X-Gm-Message-State: AOAM531N3ik5PKt9w/LXgtsR1Tk9GBOwqfMKAcbS5cwnLY5gL9BsG8if
 4ddnav5bat8DEYO/TIssFp/bYaRflx30JA==
X-Google-Smtp-Source: ABdhPJyoBePXDHXCGXscGIxWOrAgRx1k3n8KhBRK7jUgD/PVMyI3GFua5J+H54EQl7WGZ5tmr0q89w==
X-Received: by 2002:adf:b318:: with SMTP id j24mr45907075wrd.361.1626897708462; 
 Wed, 21 Jul 2021 13:01:48 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id q19sm740011wmq.38.2021.07.21.13.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:01:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 22:01:39 +0200
Message-Id: <20210721200139.502098-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/boinc: add SELinux module
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for boinc is added by the services/boinc module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boinc/boinc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index c8eecdc559..5d9a8abe3b 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -11,6 +11,7 @@ BOINC_SITE = \
 BOINC_LICENSE = LGPL-3.0+
 BOINC_LICENSE_FILES = COPYING COPYING.LESSER
 BOINC_CPE_ID_VENDOR = rom_walton
+BOINC_SELINUX_MODULES = boinc
 BOINC_DEPENDENCIES = host-pkgconf libcurl openssl
 BOINC_AUTORECONF = YES
 BOINC_CONF_ENV = ac_cv_path__libcurl_config=$(STAGING_DIR)/usr/bin/curl-config
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
