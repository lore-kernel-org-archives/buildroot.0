Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB96C19F29
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 06:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E60360AC1;
	Wed, 27 Jul 2022 06:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E60360AC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7e5W7U2hrxrN; Wed, 27 Jul 2022 06:54:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E01E60A7D;
	Wed, 27 Jul 2022 06:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E01E60A7D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E892E1BF3A8
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 06:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C378D401C5
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 06:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C378D401C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id svd1aWVQJI6T for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 06:54:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E813F40132
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E813F40132
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 06:54:14 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 f24-20020a1cc918000000b003a30178c022so618115wmb.3
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 23:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FrgXwhqGCiUQXn6umy26D3WizKq/2zP2qPoKbWc4YZ0=;
 b=CJKxF1ZRE3PL8LrVjkSCD4NCs+qSU4pDQzUglRQDbvSjgwISRN9Z/SwIXvnae+E1Z8
 mgdOsOnwPm5VP8MMTVKBIMkwFzW/UyWhIFtKvvTuidwc8RW34yPfIdJTaXiCLkSrGqEi
 NzllNLk6fJRW9uLlCNGvFRM3IhZMoYZwmibw7bowrapgVk4RzXl389kljki6To85Hjf/
 CUJUe+5pTut/YrilCz7mS01yeiDV52yAe9FxN+iJwzW4m55JHSMyoS1AFETG2AerEvzL
 cKPUeFo7UI8YdeJrsOdHI1wkPVn/4dXM9XYpgpg1irNkW/qsWQCBp80Oz40KS8T6ztHD
 mKbw==
X-Gm-Message-State: AJIora9zHM5CN53AH62t/GbHNuV5VsZtWpZoTOkgKC6cF6VBXGhdFDdp
 42cc8iA931bVgTymlg6BoTQBykcepGs=
X-Google-Smtp-Source: AGRyM1uAt9hPIOvdVmzyy+myAGXKGMCUHj6WP1TZv9Yv2y2f4TCTJe83k067whayqgpFcikNTd5s9A==
X-Received: by 2002:a05:600c:a18e:b0:3a3:4068:d845 with SMTP id
 id14-20020a05600ca18e00b003a34068d845mr1756091wmb.15.1658904852970; 
 Tue, 26 Jul 2022 23:54:12 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 bg2-20020a05600c3c8200b003a35ec4bf4fsm1289364wmb.20.2022.07.26.23.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 23:54:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 08:54:09 +0200
Message-Id: <20220727065409.326410-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FrgXwhqGCiUQXn6umy26D3WizKq/2zP2qPoKbWc4YZ0=;
 b=UIB4EksJFJt0/Usj4thuJjYNke2wbIHNc7ovLwiJBaDeisQRQN5dwcnzJ/KLRcjeB6
 4/bGUi4o3Lz+TmdVWi437tPztYZBoK1QH34Uh/AYLhxzrNUFm0JMDE6Pd+SLVFU1iVvG
 6Fg1Ud34DtbDPUT/RKVYjYM0oNEXY5Tda5Nyy5vMwjHAt6FSC2lDINBENIuuwQoSsCkX
 ecpk/8kqelST9WTLPPL7xImaBipU8NqwTUbrWdSOUeiN/OWSnMnLmXJNaSbY7Ne7zT5W
 OKO8qT9nkhCvcPgEbaJS1b3+ne5Mr/rHDNSUK127JjxyD6/Fu3DstFYYKfL8wELMD5sx
 Y4OQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UIB4EksJ
Subject: [Buildroot] [PATCH 1/1] package/netdata: add freeipmi optional
 dependency
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netdata/netdata.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
index 9e661f4943..4bc573df59 100644
--- a/package/netdata/netdata.mk
+++ b/package/netdata/netdata.mk
@@ -36,6 +36,13 @@ else
 NETDATA_CONF_OPTS += --disable-plugin-cups
 endif
 
+ifeq ($(BR2_PACKAGE_FREEIPMI),y)
+NETDATA_CONF_OPTS += --enable-plugin-freeipmi
+NETDATA_DEPENDENCIES += freeipmi
+else
+NETDATA_CONF_OPTS += --disable-plugin-freeipmi
+endif
+
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 NETDATA_CONF_OPTS += --enable-jsonc
 NETDATA_DEPENDENCIES += json-c
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
