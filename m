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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6371DC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 08:44:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14BEB6108D
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 08:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14BEB6108D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2E4C607D9;
	Sun,  1 Aug 2021 08:44:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QFEiAS3ryuiX; Sun,  1 Aug 2021 08:44:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42B3C607C2;
	Sun,  1 Aug 2021 08:44:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B8AA11BF42D
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 08:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A684F40172
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 08:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h8PrspsGnyt2 for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 08:44:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 70D1B400A8
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 08:44:42 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id k4so6799484wrc.0
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 01:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=80NR5+rBuslrSIK8W9mxofbGVS5naTaAuc74TujnIl0=;
 b=STpsBJI8PWymf3exVy0jHY5FVHZUm+6Ir5DC6zyKcpDOPlFxfgBcA71GRc2Sd3TB95
 mRu4KC9sbF8HF90QBe5felrqfXZr278tgNYia1Ib3/EEr5CC4Oc4cUhCYQJwfDezhOJC
 A6QIezaSaCQk4IDUh5GGCcsXfwvHTU4W3IXAJ+/BWosZ9LVPLl3Jba97vV3Ja3r/m4MU
 WfNARmXxkqjHr5mZCwEeZRrqbSnQbCQZx2tOqoh26YK0Jx0SUPnzFnTaYft39gfbayrG
 xH/4M25epRoppPJGMnMTAMANHjwMgiH1xMp/Z+F2VXH6J2N+3SHojUWp2uPmee4eVyfe
 9tog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=80NR5+rBuslrSIK8W9mxofbGVS5naTaAuc74TujnIl0=;
 b=L2r1M9hYsHUKL0aoBJMEtbAMCQvtqOtKWBywQzqTp8Vx8n8guJcHkihhwQUmcSP5hG
 8obFfifR67k0SkeSz/Z1jWFzi3snC0XF4dXrszBBilmpOM3FSsgKhsc+lLI78vIw1R0U
 JHuqWpXwuS13+z+KfXuNdkrPVQFy9aDjmuq0Op9lngkvbFT0fXWtGSBGlDlgPzux5sVq
 q9dCZjJlCAPHXMkDGVOoJwp8lFOjUoo/RV3APVPODDlFQQkYzVNbZatdOgqqjaP7++1e
 HdvfgCWfo7HVwmmLjeHDxQH043nTcmqYMVmtTX0zCatrn/13M10i+4BaUqBK3EkQ72gS
 YQow==
X-Gm-Message-State: AOAM532AYbqjEsT9cRhUb1tEqX10Q4S0vJQiQxwjEOko3W2B2ABBBWEj
 jpqVhQ6wwsd0ZA0I60PZ58aEQMH72Zvqpw==
X-Google-Smtp-Source: ABdhPJwQqQEV6t7qmKR0SfQGd/Ax/VyGlbImyg4vbK+Qj7a42J96HXKzzAlayAjZAiKf1oCJnNFtzg==
X-Received: by 2002:a5d:680e:: with SMTP id w14mr11988937wru.71.1627807480364; 
 Sun, 01 Aug 2021 01:44:40 -0700 (PDT)
Received: from kali.home (pop.92-184-116-243.mobile.abo.orange.fr.
 [92.184.116.243])
 by smtp.gmail.com with ESMTPSA id j4sm6018818wmi.4.2021.08.01.01.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 01:44:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 10:44:33 +0200
Message-Id: <20210801084433.2762395-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/redis: add SELinux module
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Daniel Price <daniel.price@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for redis is added by the services/redis module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/redis/redis.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index c1d435015d..a260dcf719 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -9,6 +9,7 @@ REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
 REDIS_CPE_ID_VENDOR = redislabs
+REDIS_SELINUX_MODULES = redis
 
 define REDIS_USERS
 	redis -1 redis -1 * /var/lib/redis /bin/false - Redis Server
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
