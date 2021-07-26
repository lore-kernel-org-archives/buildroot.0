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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C5D8C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:23:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4E5260243
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4E5260243
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC51A4020A;
	Mon, 26 Jul 2021 09:23:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9YPV-a8MwOtq; Mon, 26 Jul 2021 09:23:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5BA1401E4;
	Mon, 26 Jul 2021 09:23:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25B431BF23F
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1521B6062E
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:23:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SPsFIFB0hdv9 for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 09:23:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBC9E600B6
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 09:23:31 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id n21so4875176wmq.5
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 02:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3ifvBOX5E8stIdLNpHMjrONE20Q47Gw9GFtqia3JvvM=;
 b=h/VC/1I3Nil5G0dwGONr9sfSN0UwiYnxqLr2Y045doUK1hJQUSTpeD30PrOufobK4+
 8xlucBhLGljTB2muLONhDDkXDgjo1+paP6eu7/B0WQKEQODbgTrB+bNFLt9SwrEYKmUA
 bovYVa/kVkmJNQ13mcXyc0rn2SPJH9EO0BNPNDwlfJAlyyP+QCfN0AP3/9SG/wONhhqi
 sAvdpIAUGT3OWvLs5gjWRwurXXCkHOYTrJ4dXO3f/AbIURZxTaWznd3jbTU4hC8mAQi9
 pj5JCuNFu3T2FOoLOFcFxQyThPSWUEUExIbSaKe4dLj3BXgs//eRFuqyNsBq96pw7GII
 9Vdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3ifvBOX5E8stIdLNpHMjrONE20Q47Gw9GFtqia3JvvM=;
 b=qkdBtk+p3JFieMMEGeOTkbhfADcg1HT4ktUqT+pwiRwBOusodsBqhlF84kDt0tDIFm
 5UIHcC68Z+cSRbwSR4cWV1JTS5ErqIfUnfaeqCUIyJW/zh0J8Cr6AEUNF8WLZTu0w7XW
 YFfQLO4XFdH5SfZTfg2Gg+KO2nxgup2fVzcjyOBCg2+iwEbXFUvoCwIFQUoiUHVVbQ7v
 UQxAdRFaXCApE5WqqGWv8nd6ksmJ6x30x/5ITJLFOmWGvKg3l1fEOBgsxr9VZxu20Env
 fB4I73ki2cGhY+zhpT1LIyRQHrHSMPH2Ku6uncUt0RxZaxOEYaTTWHyVg1AZ2AVzrxft
 udiA==
X-Gm-Message-State: AOAM533Uo5XQxxIdys4sBuVj9YDZN/p8X7u2sq5NXsCDgyoXjMSE6e/Q
 LF/MFzUD1tICZs6o/4tzfsbiTevGTgaA7w==
X-Google-Smtp-Source: ABdhPJw4/A3tbfzDU+tC4tbgG/UfIJIdNAW9FnX4lAdHOmnlGsXJDkBw9CFVxQ4mQkZMb3SKMFejXQ==
X-Received: by 2002:a7b:c144:: with SMTP id z4mr5035328wmi.54.1627291409819;
 Mon, 26 Jul 2021 02:23:29 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id 19sm12865437wmj.2.2021.07.26.02.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 02:23:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 11:23:24 +0200
Message-Id: <20210726092324.1713723-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ntp: add SELinux module
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for ntp is added by the services/ntp module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ntp/ntp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 0dc75a7a6d..ff23cdc2b6 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -15,6 +15,7 @@ NTP_LICENSE_FILES = COPYRIGHT
 NTP_CPE_ID_VENDOR = ntp
 NTP_CPE_ID_VERSION = $(NTP_VERSION_MAJOR).$(NTP_VERSION_MINOR)
 NTP_CPE_ID_UPDATE = p$(NTP_VERSION_POINT)
+NTP_SELINUX_MODULES = ntp
 NTP_CONF_ENV = ac_cv_lib_md5_MD5Init=no POSIX_SHELL=/bin/sh
 NTP_CONF_OPTS = \
 	--with-shared \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
