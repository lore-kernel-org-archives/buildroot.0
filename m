Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C990CC433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 09:40:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4590B60ED8
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 09:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4590B60ED8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D217C400E4;
	Sun,  5 Sep 2021 09:40:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OO5xYVofhQH7; Sun,  5 Sep 2021 09:40:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8101400FE;
	Sun,  5 Sep 2021 09:40:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 441AD1BF592
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 09:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40D3380F12
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 09:40:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OQ671xYvbZ61 for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 09:40:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5836980F08
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 09:40:53 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id me10so7097380ejb.11
 for <buildroot@buildroot.org>; Sun, 05 Sep 2021 02:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TvF7ybphfIDoApgmCNcHSbNrCB8nzI1wuTOoTH2N7Jo=;
 b=iGap8ZE0WMQ3y9KT1/6EQJsr8Qaksl4GpKBH/qwPoULoRI0ZeyVTE89v5hFXmr9KGX
 wUbm2GHulsiyv8f4KbFwqlYkaKR6/tn8qWh5SujG47RwzVs+AiG1Oa15cglikrh2kWOD
 HH/DePwZcOk+sLf5uWH5LUo3/OkOm1BUil/ojczGV2fJV463k9BwpjsQDDOKXKhSnI37
 wyw8X11gmB0u6nl+gTpjSeSeJjNgLZaZjvXUoHUXC42djvzhBTvt+EiUc9DJsWrVNTl3
 u9FzCzL3/1cD9dLE/tfGR9ux3TbAZz+0s4aFrFHxY1WlvcPeRMdilgfvVBFTsd/kEFb0
 bubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TvF7ybphfIDoApgmCNcHSbNrCB8nzI1wuTOoTH2N7Jo=;
 b=X4eUC2pHCouGfqr0SRpWbHieUdm1hkG8Ij/zldLaN7tgZXPj57hCyUH701YcXZ5p7S
 XU177yDIE21sKfSvvz7nL1vE6kAe5mkOhzZzcSPLwupA/EldW0/F/dWzjiSHXFpLEmbh
 ih2yRJwPUCjxX28zXcnmUUUGq/OaXbbzm5HpyjFJKi0O66K2Sd26oFoCIJb3ie+nUllG
 adTd1y0wT4bMVpdDvABcQcHuA9TjPq0yv7meanmZyGnYaZlUDokyrQIEftKu2LsC4LYD
 +bTQolNDQD8BcNPvc703B6YK5eqikhXEAF8DjSZT8XypcNV5flCzmiEHw/N8mgoUO3y2
 kf/g==
X-Gm-Message-State: AOAM531Ge2dlBjr+utY9I92ioYCfArdxD/NsoTgDDZRXrapq3lRzOUna
 Uc9LlAid+AkiAwUoFMB5uXxPoyF3ayk=
X-Google-Smtp-Source: ABdhPJxmFlbyxxE/C448CkeYaZK3igu8mMyRTl67iVadxc7LFv78H39dgfk4sW2OweAJRO0tF2sbCA==
X-Received: by 2002:a17:906:774f:: with SMTP id
 o15mr7987420ejn.200.1630834851515; 
 Sun, 05 Sep 2021 02:40:51 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:63d3:7700:47c:f3ae:fe47:54e6])
 by smtp.gmail.com with ESMTPSA id d23sm2572225eds.88.2021.09.05.02.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Sep 2021 02:40:51 -0700 (PDT)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Sep 2021 11:41:18 +0200
Message-Id: <20210905094118.641168-1-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mosquitto: security bump to v2.0.12
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Mosquitto 2.0.12 is a security and bugfix release, notably:

* Fix possible DoS in the broker with MQTTv5
* Fix CVE-2020-13849
* Fix CVE-2021-34434

Read the full announcement on
https://mosquitto.org/blog/2021/08/version-2-0-12-released/

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/mosquitto/mosquitto.hash | 4 ++--
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index baa2a90c5a..2692aa1a9b 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-2.0.11.tar.gz.asc
-sha256  7b36a7198bce85cf31b132f5c6ee36dcf5dadf86fb768501eb1e11ce95d4f78a  mosquitto-2.0.11.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-2.0.12.tar.gz.asc
+sha256  31cf0065cb431d6f4e57a5f4d56663e839c9d177362eff89582d7cfde191c933  mosquitto-2.0.12.tar.gz
 
 # License files
 sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 52f9c98733..06b963a994 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 2.0.11
+MOSQUITTO_VERSION = 2.0.12
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
