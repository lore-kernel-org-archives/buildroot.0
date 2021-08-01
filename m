Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E84A0C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:21:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EF32610A7
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8EF32610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69AB2607EA;
	Sun,  1 Aug 2021 12:21:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZVdl4AMm1mro; Sun,  1 Aug 2021 12:21:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9FBA6076C;
	Sun,  1 Aug 2021 12:21:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C0CF1BF2EF
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C0456076C
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SOukgTQP5qje for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 12:21:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35018600C6
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 12:21:26 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 f14-20020a05600c154eb02902519e4abe10so12019356wmg.4
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 05:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZB4qs2hfcTsJVTbZKbbadEchHX08fUzB1+7alJhn4Jk=;
 b=OiyR75SLNrgFiPmr54t6+RUBIEA51WrWKQKPaJo7vT7HjRbNRba6ZS1zZUK6v7XDj+
 W7rSAYxpo+YsWTlTnR08iqHIRIoC8KW8Mtv+UM0pWXEinrwRGTpk5/HJLAdnMwUXTVmr
 CFssf1XygfnOXreYYVc0miTcExVv9O3vyhFyLEjSUb3RvSv+VbJp3AMbB3FQI6cCHtiY
 EeZ/qfen7sDY9XPzFDdZJPmoA0vNApt4RagXdo81LUKQ7h3sPF7mHrkyfrrK1NCXIcya
 jVsg0OzwQ42vJUnN0u5v6aBeqmhQXspNaEOCtTWhr/cBBsqUQ+Te92Q0wn8STEry6LJc
 iIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZB4qs2hfcTsJVTbZKbbadEchHX08fUzB1+7alJhn4Jk=;
 b=Mekq1Vn3Imcyz/FOz9XMGtb/Vox2KJ6xWliKROmIvFsCBIYEqfa9eFwGqtS1nRbuWl
 Y3huWUOgoWv3T2YDSJISJSh7f4L6cZqAODsuSWClqG8MYbCVy+/QE4Ug/swIxroqGYp5
 MlRLn4KmEdtGeXBg62v9lioI/RyZgG9kPxpg9JUJ1jSUz5w+XwHcIpVFkk/oqrhb8A6C
 K0Gg3AQsyFmOBcpdQjzcUHADwVWZ9BL442WgZnTBT3F1MDPXBLRBqHy2DX9lsGbgvnKX
 8MhhkNUaKbaBHvayXF7OXy5SWhPSlbiHFK43OuJR7lZjj0Zh/26vHsrff8cOZU7e/sZY
 fqhg==
X-Gm-Message-State: AOAM533Zxj8VD7/Xtxkl7Wrt0u1DW16w0pYWwhdjSogZeU35DCbcehrV
 g5FrXClkUBEG0nXMY4VVEw7qXsZRDHq/Wg==
X-Google-Smtp-Source: ABdhPJyEKR/hsPx8Fdm/Gdg2XeeIG29BnMQKuX+xNsQwpPdSMAYkAibnk5l4GpsSKp8gG3m6UGsNOA==
X-Received: by 2002:a1c:c9:: with SMTP id 192mr11603583wma.128.1627820485024; 
 Sun, 01 Aug 2021 05:21:25 -0700 (PDT)
Received: from kali.home (pop.92-184-116-62.mobile.abo.orange.fr.
 [92.184.116.62])
 by smtp.gmail.com with ESMTPSA id o34sm7152433wms.10.2021.08.01.05.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 05:21:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 14:21:17 +0200
Message-Id: <20210801122117.3061059-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/vnstat: add SELinux module
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
 Rodrigo Rebello <rprebello@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for vnstat is added by the services/vnstatd module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vnstat/vnstat.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/vnstat/vnstat.mk b/package/vnstat/vnstat.mk
index c5836cf037..7f5ff67b82 100644
--- a/package/vnstat/vnstat.mk
+++ b/package/vnstat/vnstat.mk
@@ -8,6 +8,7 @@ VNSTAT_VERSION = 2.7
 VNSTAT_SITE = http://humdi.net/vnstat
 VNSTAT_LICENSE = GPL-2.0
 VNSTAT_LICENSE_FILES = COPYING
+VNSTAT_SELINUX_MODULES = vnstatd
 VNSTAT_DEPENDENCIES = host-pkgconf sqlite
 VNSTAT_CONF_OPTS = --disable-extra-paths
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
