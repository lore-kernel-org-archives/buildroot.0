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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C34BC6377A
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:02:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDD0E6120D
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDD0E6120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB93E81C19;
	Wed, 21 Jul 2021 20:02:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xwQ4tu-t7Vx6; Wed, 21 Jul 2021 20:02:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A433818AC;
	Wed, 21 Jul 2021 20:02:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8881A1BF337
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77009403A3
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:02:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id viF0XMzaV-fo for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 20:02:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD8E4402EC
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 20:02:24 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d12so3395231wre.13
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 13:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OGPQkq03cb9omMNBsGofMyK567b5ZlYQBv0xUFb7XmQ=;
 b=LyN6lXWRMERKYYTRZJH4DIQgsRNBxUi2ewRKDHSlhYX6ZEaHGuRudCyxy24SMgvbr9
 tCzH6tEk+hIO+L0hIU/2ZQfOfllAFQ0PWcBg8dzVf885ttEG8rEOkDpoiJ5rtjgYE6af
 lIe1cg4oK6Wo3zcG6xISAkBeOFheP/ftuoSGYwoYxw8i9VxBl+MGml1PSP66ClEbdYzP
 EE2RaQVLDY8gvykaTkBp5fokEQysVQPTgKvuH7gEQaRYZ+3iYQKlSiIO1v3OBaNq48X8
 D3LBacvueuU4H3ql02Ato5So20IDfNoXMh7Rx4IbLmaJ90S4NlsoqPyyksMZiLHkTAEb
 CQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OGPQkq03cb9omMNBsGofMyK567b5ZlYQBv0xUFb7XmQ=;
 b=Ns9cMwSINrYF3DtT3BHzuLh3CI6r0hScKLYSDldxDrsFcTXQu7lfBJsxHZnhAkqhVx
 G7ltaYiU03ydzSLvKP8DLWKF3uBhmnhooaR9AiTFZO5Y/2uWVeootUUWQqfgbgzbTrX/
 ZIPM1lLcw9I5wpnTGjas1XmBLnJzLi0BvK+0vygcgv9CdDn4RpuXyso8LssgWCunFMyH
 TxVfbv6imCraozuEbtarJfVDv6LBue6XZdBe2AVq5TTudQsNXglT73WrEnKd9zSuAjvZ
 ASa/AE9ED2rYdLrGJQA1TOO40OHJAwSfkfPdlJLZrP5Yscd9CKzst1rWbXcbNjdQPMsN
 au1g==
X-Gm-Message-State: AOAM531opaUlkW4TrmLbFfu7/zt55hzDM4GGWpbjEcezhb5xo/BXD9c1
 44A911NWVp+zJxKsmL2Q/jN6IxytEhT8zg==
X-Google-Smtp-Source: ABdhPJwS05WxJrAI+tuyGLGtd5fTWUuRCDQJB3V2Wxgw/HM0yHX24M3KPG7QEpqhGlo4oLOqub+vIA==
X-Received: by 2002:adf:f6c9:: with SMTP id y9mr10999417wrp.265.1626897742727; 
 Wed, 21 Jul 2021 13:02:22 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id n5sm21044913wrp.80.2021.07.21.13.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:02:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 22:02:18 +0200
Message-Id: <20210721200218.502238-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/clamav: add SELinux module
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

Support for clamav is added by the services/clamav module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/clamav/clamav.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index eec0e2955c..63af111da5 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -11,6 +11,7 @@ CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
 	COPYING.LGPL COPYING.llvm COPYING.lzma COPYING.pcre COPYING.regex \
 	COPYING.unrar COPYING.zlib
 CLAMAV_CPE_ID_VENDOR = clamav
+CLAMAV_SELINUX_MODULES = clamav
 CLAMAV_DEPENDENCIES = \
 	host-pkgconf \
 	libcurl \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
