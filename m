Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0341C4707B
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 17:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7BBC824CE;
	Wed,  3 Jan 2024 17:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7BBC824CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0INUBZ5Qec8S; Wed,  3 Jan 2024 17:37:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F328882157;
	Wed,  3 Jan 2024 17:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F328882157
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D2D051BF869
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 17:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABBDA60AF6
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 17:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABBDA60AF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qYLDpqQRXOuZ for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 17:37:55 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E534760AE2
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 17:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E534760AE2
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40d3352b525so116709945e9.1
 for <buildroot@buildroot.org>; Wed, 03 Jan 2024 09:37:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303472; x=1704908272;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j3+r80RyQ9rOGN3vJEEpFx+rXnjXA6v3EybxKYNw3JM=;
 b=SzbVTu4DE+VE+1FqmNtAdp44gD/QYAJOM26a00qrPcVSnvTmyomQR/ZXYMA0OqMgBE
 w5MpSo+VbbpWEOnSkfM8FPOyMs8IsDiHS43a96MZxS9Gg5g7KlxTjrDfhlPFMflqcTn8
 BItkdOsXZeJ8Gv6pVMgnJkozGV/3JyjZicITXsHADm52CpoX0yR2HdANZ0V30+vPFxdC
 rm81NsidPtn7pWK4EuaUwejhZkqiuCV6WLIdVGc4RWhxBpqqUE+SvsxgikaYs2wVHoUn
 jFEtob2wWtbVeJdfCwzg/9ygCSEXIMk+il91+4isT9n9Pq9CYaKncRJQvqK0VwirxoxG
 kv/w==
X-Gm-Message-State: AOJu0YxMEdpIGipDqw+PPrlxqrq2lXt1VoHSO8cNyy3i7r/B3ahHvMhF
 7RrAP3YGP3BIzZi0UaOFTfQo6gpsKH8=
X-Google-Smtp-Source: AGHT+IEWImIyTE5zhOclSfCv91USeHEz0V5A3JVwcYAgrFcM9q/l4AuMKxyQ2F09rNp2/JX6t43kBw==
X-Received: by 2002:a05:600c:4fcc:b0:40d:5d9a:ac0 with SMTP id
 o12-20020a05600c4fcc00b0040d5d9a0ac0mr5987152wmq.48.1704303471963; 
 Wed, 03 Jan 2024 09:37:51 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z6-20020a05600c0a0600b0040b3d8907fesm2976366wmp.29.2024.01.03.09.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:37:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 18:37:40 +0100
Message-ID: <20240103173741.850916-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704303472; x=1704908272; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j3+r80RyQ9rOGN3vJEEpFx+rXnjXA6v3EybxKYNw3JM=;
 b=imYMz9Zqm2Z9S3SlM034LykvSdb3KC3UQtdu/MwM8y9iZn6kUs5lY/p31W2a+muSvz
 f2765340XXySmt3e8fjEgg6qjm3iR3k9cQXc3zyznJW5dXRLwLJvo9Kz0arKKeH0wZ/+
 uRsL9548B5MlxrLqUtdquf5tkLjyz/RfnMxB+X/VKCQ7AXkqOfFKQoRJos7M9ZBP7ODU
 ha/rEAiVZ3RHXn4pqO6Ezl/winFak/VOBScnQGNEGqXnnn3PSKxi78h8gjF6HoMt/wtl
 TB+5vHBYkVMWUZquLz7t6RewfJa6/CAT0HBTS79T3RqbwQoWSf7w7wesTdPgYBpLA8Dg
 hkGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=imYMz9Zq
Subject: [Buildroot] [PATCH v2,1/2] package/lm-sensors: add host package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host package is needed by python-pysensors

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lm-sensors/lm-sensors.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index 1bf27fc25a..f085c8acb0 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -9,6 +9,7 @@ LM_SENSORS_SITE = \
 	$(call github,lm-sensors,lm-sensors,V$(subst .,-,$(LM_SENSORS_VERSION)))
 LM_SENSORS_INSTALL_STAGING = YES
 LM_SENSORS_DEPENDENCIES = host-bison host-flex
+HOST_LM_SENSORS_DEPENDENCIES = host-bison host-flex
 LM_SENSORS_LICENSE = LGPL-2.1+ (libsensors), GPL-2.0+ (programs)
 LM_SENSORS_LICENSE_FILES = COPYING.LGPL COPYING
 
@@ -50,4 +51,14 @@ define LM_SENSORS_INSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/,$(LM_SENSORS_BINS_))
 endef
 
+define HOST_LM_SENSORS_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) PREFIX=/usr -C $(@D)
+endef
+
+define HOST_LM_SENSORS_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(HOST_DIR) install
+	rm -f $(addprefix $(HOST_DIR)/usr/,$(LM_SENSORS_BINS_) $(LM_SENSORS_BINS_y))
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
