Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E78C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 07:58:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70B3760E0C
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 07:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70B3760E0C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49A9E40409;
	Sun, 25 Jul 2021 07:58:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wsbThchtFG8m; Sun, 25 Jul 2021 07:57:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 740D9403FB;
	Sun, 25 Jul 2021 07:57:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 66BCF1BF48C
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 07:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 533FB606BE
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 07:57:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iQAKzbHAlKw8 for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 07:57:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA33F60623
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 07:57:56 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id n21so3313769wmq.5
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 00:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FSlElYDpHFX62ZilE8Z4ilolw1gUPcqPkYwUq1YB0HI=;
 b=NVLpFcdbpgfXSkwgvTO8wbRJTX2wQaBtNCVo5RPJbYg26ZH3fFjNwWoQCHDqJvwj9p
 fAobXJr66uwYBEdZlna3KaxzFV+cueAzvo/JP+k+DM/i4xPDKfyRFzJJEQgADtXkfkb2
 b69PsvjzuyWjTeki+3md5jXaBN2m8/Diz1uyWxEogArMNpCeVnpfZeENBUrDiaXWa+ou
 knxBxH31nvCSC07Pty0yHqG4ZIWnabaN4sEYPoncVhASnxfkWpkCtZAQO6vp/DookrU0
 B85D9KXBs7UY6hsW4cC/cyObfp4xyLJLUxJjWgU3BukjKwQbO6+/AfD/jhcE8xWOR6hk
 d/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FSlElYDpHFX62ZilE8Z4ilolw1gUPcqPkYwUq1YB0HI=;
 b=W+NO2+u2w4tps6a4gmAMhpYUifrTvlB7OsmnTn4zZhZjeKxZf8it9GC/wJC3R1lhoT
 AD+jbynSxocoUEIPY8kwXAbRLVfzPPPTViGFhh6YYsRcLUGCfzrhL1qOw8iAkSFAXIH7
 usJX0ff0bJjNdLNnbqbBaevO5WCSaXcO/lFVxrBYyZt8Oc6vcLlHOFJmFcz6ZLcgaYet
 ZF/5B7piv4t61G4OITKq9TKTYGVScHbRmEbFs9x740oI3fWwO8/pN9gzlOrKDLSE8Z2A
 LMyF3ncdDRkMmjpkb7znxcBqP5YnhCGhUMIwL0EvLkOXD17YfhasdpY8kyUU/taCyWmt
 kp6g==
X-Gm-Message-State: AOAM531yuJSbuD1V0cnzs1RBA1/U5UBNm1drT0EV6dQ6lufgWgbltMo1
 3yNDVxZLnEFzFO8I9qSNpG1OhXRptzud7w==
X-Google-Smtp-Source: ABdhPJwhlWwEnH9bZhXSV+FUNSWXMGMo6/XZCAaWq/dZcpJWlfAer0+g6JJL1YiSeZMkejiQ572wbA==
X-Received: by 2002:a05:600c:4ed3:: with SMTP id
 g19mr11534209wmq.145.1627199874733; 
 Sun, 25 Jul 2021 00:57:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id d10sm37915149wro.43.2021.07.25.00.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 00:57:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 09:57:45 +0200
Message-Id: <20210725075745.855820-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/asterisk: add SELinux module
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for asterisk is added by the services/asterisk module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/asterisk/asterisk.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 67b6da56db..5a125c3abd 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -23,6 +23,7 @@ ASTERISK_LICENSE_FILES = \
 
 ASTERISK_CPE_ID_VENDOR = asterisk
 ASTERISK_CPE_ID_PRODUCT = open_source
+ASTERISK_SELINUX_MODULES = asterisk
 
 # For patches 0002, 0003 and 0005
 ASTERISK_AUTORECONF = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
