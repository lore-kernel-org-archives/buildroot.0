Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C55C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 09:10:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67BBF60F90
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 09:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67BBF60F90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A385401BB;
	Sun,  5 Sep 2021 09:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IGyMHIhWcVeJ; Sun,  5 Sep 2021 09:10:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 279CA400F7;
	Sun,  5 Sep 2021 09:10:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 807FE1BF592
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 09:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7082880F69
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 09:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6l75J1US1NHD for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 09:10:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 309E780F57
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 09:10:05 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so2598442wmq.0
 for <buildroot@buildroot.org>; Sun, 05 Sep 2021 02:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jsZe3IaDbAY2KcWxHKOVYYD5XOIcSenOj34ORkSw62g=;
 b=aIvRPEkQBj3+tZs5sNoBUVFJMyOyN6Jp94WGlL7S1WpuWWIJMsfLPUqtnHK9siQ5Hv
 8Sa3AieEy8LC4RXS1cJoiAaRH5srBBzN3rOF5FV0iSi5f9bBAnK2axvfIKvZJp551n0W
 jhgVZXaa2HEXsaypXJCP1J95G1aYDyu52OEUOa5CbAfbroS++HP2lo2wdXWZDrVrsP8h
 zDfgGQMwnJLpzuBhpFZDup8YEtZHvaFaDJYgwM5C7R/QcYqr3mfONoy4wMVyYblGjD7Z
 41imZvUXtOb4hVElIipQ9S8Pcf3I4JR9txd1fBgo7HrzivRhhG4OOOoK/8rjXHEZ3XPN
 oykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jsZe3IaDbAY2KcWxHKOVYYD5XOIcSenOj34ORkSw62g=;
 b=CMy97ucQlipoxI6ZbQ3sbvwsLVhSPckDjd2oBe8D48uw+L493whEiRlYIH+auVB/5U
 PXJy+vO3aQfB4UasH8H6aN9PVRjRz9r7coUwqEFhsOxYQ+7/+PQizmVAz/8zyQ6TsRHt
 UKhPWv8OcJw/lkQDS/5BLblKl+y54dQTwT7MGlrbiyu2KOGmDEmsusVkRU//XB5IPuiB
 T5bMA7l65cJwrxBXqDKnz5tjgpScDbPeYJ3tpmZ8/d2PkLxC9UiCxLmcTUTJ46ebjF0Q
 2sHsR2ZcHPeiyTYbngWrMwL01ZEErcGd1ZzjP36AcRbCSPJ1JFInykHBPGzKf6nxVG2V
 F1GA==
X-Gm-Message-State: AOAM531rh0bM7F5ebnO0OBW0ciSw1zN1W3a0Nncoy0cOwRIsdfj7ptkO
 sU5zKxVcluITHYE6dR2NiDJCsJ4DRwYC/w==
X-Google-Smtp-Source: ABdhPJwxWi1R77Q3lFtnM9Crjs2UIl7mEb4bfahrFWgly8HFtFxhI4iil9/IiixhB7H187shf76Qcg==
X-Received: by 2002:a1c:1bc7:: with SMTP id b190mr6538927wmb.57.1630833003154; 
 Sun, 05 Sep 2021 02:10:03 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id u13sm4212453wrg.68.2021.09.05.02.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Sep 2021 02:10:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Sep 2021 11:09:53 +0200
Message-Id: <20210905090953.616481-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libcap: needs host-binutils
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

libcap needs a version of objcopy which supports --dump-section since
bump to version 2.52 in commit 38b0759432070f7a57c0fab84d44a07caead6f06
and
https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/?id=ee3b25c0a877fa74d1aec88f325ac45b09963c82

objcopy --dump-section .interp=loader.txt empty /dev/null
objcopy: unrecognized option '--dump-section'

Fixes:
 - http://autobuild.buildroot.org/results/88cc2be14a5f134dc2aa22ca838836dc11e39930

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcap/libcap.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 45700e56ec..d8e685d1d7 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -14,7 +14,7 @@ LIBCAP_CPE_ID_VENDOR = libcap_project
 LIBCAP_DEPENDENCIES = host-libcap host-gperf
 LIBCAP_INSTALL_STAGING = YES
 
-HOST_LIBCAP_DEPENDENCIES = host-gperf
+HOST_LIBCAP_DEPENDENCIES = host-binutils host-gperf
 
 LIBCAP_MAKE_FLAGS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
