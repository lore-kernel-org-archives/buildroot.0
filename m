Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E51C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 21:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED1B240173;
	Sat, 11 Dec 2021 21:37:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H8a-Wph5dacD; Sat, 11 Dec 2021 21:37:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE3184021E;
	Sat, 11 Dec 2021 21:37:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E9281BF3A0
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 21:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DE1E8551A
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 21:37:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dvbjRPmIPHrt for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 21:36:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80ACF8539C
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 21:36:59 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id k9so2977334wrd.2
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 13:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fvKl8CoyYyTggxwk+6bszSTcfsQzHnkH7STu8R1MfsI=;
 b=PQnEYRqstgPrNrhH6e93ogys85833ZbkF2+RyO6idez/C1p+7FGrkmuPSOQcbTDn8c
 pWpmhw3q53sfzuimn4wWzF5SJHX7y2dpb+mlXjq9WtNVNU8oXDAQUSrgtepYw9jG5uFO
 S04Wi3FXn6cEW5iCIimLGUVR+Fj1NjmRKa9p+ZulgC+kb7bZMXmno4XiBgKXbC7VkMhZ
 /Dg3dx0keCjg12CycVUVzD5/tSbWP1vqgTgESCpjoXQPHh8YdZE2drPaaw7qkzggAqnZ
 TMmM1JF9VN/jYqg4PCH8879wplMcC1cKKoUsmXJSZd5UMHmLNceMx98HLR+4UUTzHwzl
 KY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fvKl8CoyYyTggxwk+6bszSTcfsQzHnkH7STu8R1MfsI=;
 b=IEzH6UmczDiqkQm7uicwzHN/4vaKLvAHu3u5l8au6JOL46uXkp5dMpGWZ2uPF+C2nT
 xH10u+qQ6EeL2o9yCvt+bsosPM1o88zckGyU03qu4nHxUnRWs81823ehO2MgBTOBjC7b
 mj12fRdurtej/h6S4e+VuLdUbDMnxwBXSYaLoQkYzYgOppbGh42RL3vpcgYIMMPpmXI5
 Ioo/iKtQGKY4dFTZyYUGWlPAItR5iQmIInsDStCgdQPXwIw8aWwmzB5ps1UcgSLPP5Zt
 4IMlKdEHl/g1K+EdW24Qv3Gc1naH8KBbbz8NkyIr/WRf2B15nn1EeA+g6Mk5iTAQ1KLi
 LVCg==
X-Gm-Message-State: AOAM531tmxfbw7fHUwUU8uTLgA0QIaDos2+y7587/xx8jYtxbIa4H2y7
 Hu8ev2dw9OMdTd39MWAjYM6xmRL+pp7Acg==
X-Google-Smtp-Source: ABdhPJwUDYrUgrskkZiTASnKpZp897+Gf+9sRWjENuNN4J8Au2R8QoCIgFprhDDyhk0Jgshq+hqHOA==
X-Received: by 2002:a5d:52c3:: with SMTP id r3mr22954663wrv.115.1639258617596; 
 Sat, 11 Dec 2021 13:36:57 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id g5sm8115994wri.45.2021.12.11.13.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 13:36:57 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 22:36:31 +0100
Message-Id: <20211211213632.537666-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/clamav: bump to version 0.103.4
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ClamAV 0.103.4 is a critical patch release:
https://blog.clamav.net/2021/11/clamav-01034-and-01041-patch-releases.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index a2ed115d24..d68b04af76 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  9f6e3d18449f3d1a3992771d696685249dfa12736fe2b2929858f2c7d8276ae9  clamav-0.103.3.tar.gz
+sha256  def0ad15500fa6aff81d8e68b9f83aa75ee5b607a01335c1d26dbcc959932f85  clamav-0.103.4.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 63af111da5..94b589b975 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.103.3
+CLAMAV_VERSION = 0.103.4
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
