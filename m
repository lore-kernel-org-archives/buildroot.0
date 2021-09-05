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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F396AC433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 06:57:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D6C360F90
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 06:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D6C360F90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C50B81947;
	Sun,  5 Sep 2021 06:57:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qiZiwZG6hR8n; Sun,  5 Sep 2021 06:57:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBFDA8191E;
	Sun,  5 Sep 2021 06:57:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D0A41BF5D7
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 06:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25DA18191E
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 06:57:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bdrqnDpq5YYo for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 06:57:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E0F481911
 for <buildroot@busybox.net>; Sun,  5 Sep 2021 06:57:00 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q11so4785502wrr.9
 for <buildroot@busybox.net>; Sat, 04 Sep 2021 23:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qrYqWzI7wk6wKfYQpiwAnqPI4YSU7vhfN7kr8TI/inc=;
 b=LkS5IzG/c6qon+FEyP38rQqchJTmQkBFLhk0chnxqR30sVl8UJgUONXhqYRMTunWX5
 zmId+hdMWpW9r/+sMrePZZ4hUXqrp3rsrh77l8aVmi23AgsXgnPxVQ3SVOQK82TSG2Og
 3hRz+6ZmzhzRAzy8mkDMJdrDrYjuqCh/lZ/jIvo6En9YnatNqs/lA3LJRvJEOgiXOV83
 2mjNzput0+ZAnlXR9S5F3xt1CxsIYrP3jgS/me0BniZjELtnctC1qCY7VkPSs6mddkz+
 sFQKySVEqLw2+W0yNhgObsxRd23L2SkIBToZcaJF09ul9y8vA3MlE75VNW9dS8RgzocQ
 E0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qrYqWzI7wk6wKfYQpiwAnqPI4YSU7vhfN7kr8TI/inc=;
 b=G18hpi/GhkZk+XpN8gOTyRlaeJBosshhHYNqFZ2x6Um/XzRllO3ND3FKUpt3Nh5GwC
 hwm0gVGlXlmUopk5SoqOzdPvtHBtfv9SZO/pAVzxc9LZcio3HnPNVO9lFhvWiXQvPaYL
 IiVrPcvkTdk4vAYI2eH7+C1EHDhWsD8Hxh/u4jjlo6IwZDEwFDfNj6Pu6Cfz6Eelt/0n
 G+a/gAdrTFklPF5G9woirluv4AjR0+mcHPa5+cFd6kJUy6f0+fPdyyEeu8kxzEfU9PL0
 EhqiPc9VTXHoJeQ/iZz744qhIvDUpTrTcJU+P74f4pQoaecFPnOWVvoCesyF5m+q8AcZ
 FQ6g==
X-Gm-Message-State: AOAM531BO3WJd1J/EnroHdxZ4xeCZiE1LB0HZN5617l1KNC6Omvaozua
 VZPxb8kXHFHjrcnC/blPq/knCjcMYh4=
X-Google-Smtp-Source: ABdhPJzg+51Y9aU0bh6fsM6Vg5ZSIh4pjugzVqGdCLb/9H/bv9XIH2pZlVmxGWjjY89JrBbKPrYOIg==
X-Received: by 2002:a05:6000:160c:: with SMTP id
 u12mr7042135wrb.100.1630825018492; 
 Sat, 04 Sep 2021 23:56:58 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id f17sm4802140wrt.63.2021.09.04.23.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 23:56:58 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  5 Sep 2021 08:56:50 +0200
Message-Id: <20210905065650.1828578-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/liberation: bump to version 2.1.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/liberation/liberation.hash | 2 +-
 package/liberation/liberation.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liberation/liberation.hash b/package/liberation/liberation.hash
index 6606142d8..1f673228e 100644
--- a/package/liberation/liberation.hash
+++ b/package/liberation/liberation.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  14694930f28391675008c67b18889d1a7dfea74b16adf50394f8057b57eaf8e0  liberation-fonts-ttf-2.1.2.tar.gz
+sha256  26f85412dd0aa9d061504a1cc8aaf0aa12a70710e8d47d8b65a1251757c1a5ef  liberation-fonts-ttf-2.1.4.tar.gz
 sha256  93fed46019c38bbe566b479d22148e2e8a1e85ada614accb0211c37b2c61c19b  LICENSE
diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
index 522a038dd..c08ca378e 100644
--- a/package/liberation/liberation.mk
+++ b/package/liberation/liberation.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBERATION_VERSION = 2.1.2
-LIBERATION_SITE = https://github.com/liberationfonts/liberation-fonts/files/5722233
+LIBERATION_VERSION = 2.1.4
+LIBERATION_SITE = https://github.com/liberationfonts/liberation-fonts/files/6418984
 LIBERATION_SOURCE = liberation-fonts-ttf-$(LIBERATION_VERSION).tar.gz
 LIBERATION_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/liberation
 LIBERATION_LICENSE = OFL-1.1
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
