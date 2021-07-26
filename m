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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29644C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:27:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9EB560F53
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9EB560F53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3A7E83837;
	Mon, 26 Jul 2021 08:27:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UQULZJxVMa48; Mon, 26 Jul 2021 08:27:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0462D83829;
	Mon, 26 Jul 2021 08:27:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FA301BF293
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0ECE0607AF
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:27:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WiI60wCDtN3I for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 08:27:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 38AFA606B4
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 08:27:48 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 a80-20020a1c98530000b0290245467f26a4so5746490wme.0
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 01:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sWec6uIsdhHL+BMKbilDAkHcxr29r0mG5EAQtcDwdPk=;
 b=udoG5g0UUFUY31LTE1ZhcoE/6mSdbNHePiJ9aypv4u910viIZiWhrckPuqBK6Ue+HP
 jnaAR3iMPfuLTS4L3PE/GjpspVvbn0JXQhY30m0nZXxz96Qk1rk9Ec3zp4G7GXpZWp7E
 hwHRcHQNaCWIvwOHSTewF8ohKHpDB5W7XvwfZMNfi0Ch/etqX84Qr2KX9XOQ3lhcrqTQ
 2/NEDVryfhkbXOJAPEZTwRxqvO8O2Mg88pWhUByUkUeQvtHMGnxBB1R699d4aB4TrfwQ
 yrmX+JTt1ml/RmZcyBhBFEoHtW1KEJj4dmGeGPxuHXsIoAklzzdGaE6+Pa1Vf/e1rJhy
 40yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sWec6uIsdhHL+BMKbilDAkHcxr29r0mG5EAQtcDwdPk=;
 b=MVrS5BATOXNWxVTrUoYqzAxVxnPy2/Bh7dN3hQ7g9GN0gxf89OoCnJZ40WyWXmnZKE
 p1h2XUMkIMtQ+fuI+h+rwXHWCDs/XclQO5bmpviv9PCotl6yWm1c4/37W+9e/2LeRNhT
 BsYjCcTIfRTtYqFV0C3aEDl1TVELV3gn5vqFXAswlosXKlc283VTk3q6SiCUjmNQtQCK
 unj6UwcViWywiT55l5234R4o7nXo9izJJ2k8FW4Eze7kvJ8zA8J2QCb4DNTYmv2nZf/k
 +AbhVo6LReTIb8/X8BlL4aOR4NZgI0/AOW0RsfR7+ceTDyKb+wivOmHoN1Xj5ckXFK2b
 M5Qg==
X-Gm-Message-State: AOAM533QBdfUfJ/lU/knKKkPkLY+VhmYz6wZ1Xi2uYu35I8cKcyEC4yw
 2d85f7mMY7EK//lQG0lCIautchEGozDRIg==
X-Google-Smtp-Source: ABdhPJzCHTRmf/LyRk33pd+124pdFcfxLBIi57Brf77mDTdw/fYfsuzD+au7a1Nj6xb55+4bxgyT1g==
X-Received: by 2002:a05:600c:190d:: with SMTP id
 j13mr3310229wmq.127.1627288066280; 
 Mon, 26 Jul 2021 01:27:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id d203sm8067451wmd.38.2021.07.26.01.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 01:27:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 10:27:40 +0200
Message-Id: <20210726082740.1706633-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: add SELinux module
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

Support for fetchmail is added by the services/fetchmail module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fetchmail/fetchmail.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 7233da98a5..c2e5e3e9c4 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -11,6 +11,7 @@ FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FET
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
 FETCHMAIL_LICENSE_FILES = COPYING
 FETCHMAIL_CPE_ID_VENDOR = fetchmail
+FETCHMAIL_SELINUX_MODULES = fetchmail
 
 FETCHMAIL_CONF_OPTS = \
 	--with-ssl=$(STAGING_DIR)/usr
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
