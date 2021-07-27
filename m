Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1424CC4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 07:20:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4F4D611C5
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 07:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4F4D611C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 832EB40186;
	Tue, 27 Jul 2021 07:20:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P0U2a_6JQvSI; Tue, 27 Jul 2021 07:20:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA719401F1;
	Tue, 27 Jul 2021 07:20:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 442811BF2A1
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 07:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 413F281AC4
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 07:20:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J_A-xtbQ0ljF for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 07:20:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70E8881A5F
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 07:20:22 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 m38-20020a05600c3b26b02902161fccabf1so1113018wms.2
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 00:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yAMxkCzMEh7hnWrhYNammHoGWdiwrVw60NGKSt4QCFs=;
 b=R15C5/+Ca7fXlPi4WysCvjC5mYDvDPmSWnKrfiTZ8x4MPgaemBImjjMdyKQF684pki
 7whZUwBLQ3JNfIpYV8OgNTUzxFbOZJTR6out451tsbz4NZQKzWEvs6BL7Xlqxm1FLeT3
 Dwlp9a0i4MzgyCZv6ttl3cfpJd8TOqMAKidc8XwZ2p9E+R5lqx3yCGHXzXDeibY3IZFL
 8ddJzZt/Ft1brpUdQo5CE7FARQ5CKCpSQbZQdWv39BGbpbBJjCA/w7RNi6iWu8m0oJ15
 0MOhfY1cOOaErraPKlvryZeTv79txqWOTf2+MrITjflLal/+eEhODwFcrqyv8GMh0BIG
 iCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yAMxkCzMEh7hnWrhYNammHoGWdiwrVw60NGKSt4QCFs=;
 b=MpYYwuy9N7IUosD0FMv+OUzSo/ahwWsG2wKAKiiQDZADF6WpJt1lwpFGDJIotxWLEg
 ubC+zq2RRKC51wL0Eodv+dkKf4zaX+PTsZ3i22NcQIOC+2A8GcTRgbtUmLPYdBzVlDm8
 mza/7esx5AuWXDHr62dYiHyDZjyN/D7PSNhiz27uh8Oz0GZ8DuXMqrsXAvqLzPa82/Q2
 d+wckA+MIfle/VJOCqognvosDSieMAnM7pSBdJjhWGc2ye46Rx0Dp3NIWN7axk0TTnl9
 X9QvZCGZYcz+2UBs1Tz4zQqXBx+EiiC9Q29C+Bv4CnucUYz654+h6zYNm2WM9gwnwMta
 ia2Q==
X-Gm-Message-State: AOAM533tHJQzoWM7QPkhmanmrEgd3HDEeYf8tE8cepcdeHYdIFeKijPJ
 Yp4htJnsJ/Xfe2K4fsAquCFwcqVOU11znQ==
X-Google-Smtp-Source: ABdhPJwrdEuG6USwu6LPbc6FVyvZyq34LUutcMQXfF2MRZqHYBmPVmLoUXAvZboh7SyFlQ9xsE68HQ==
X-Received: by 2002:a05:600c:4ed2:: with SMTP id
 g18mr2651856wmq.148.1627370420382; 
 Tue, 27 Jul 2021 00:20:20 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id w15sm2069259wmi.3.2021.07.27.00.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 00:20:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jul 2021 09:20:11 +0200
Message-Id: <20210727072011.2272682-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: hid needs hog
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
 Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Build of hid without hog is broken since commit
fb9fc969d91f69851b4c70dba512b607e52bda7b:

/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: profiles/input/bluetoothd-manager.o: in function `input_init':
manager.c:(.text+0x2fd): undefined reference to `input_set_auto_sec'

Fixes:
 - http://autobuild.buildroot.org/results/9222879c9fe958e01e33f69531270355ea016d17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bluez5_utils/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 9f20bf83ac..f2b63b0a1c 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -78,6 +78,7 @@ config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID
 	bool "build hid plugin"
 	default y
+	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HOG
 	help
 	  Build plugin for HID (input) profiles.
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
