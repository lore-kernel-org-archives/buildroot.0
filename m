Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE19C77B73
	for <buildroot@archiver.kernel.org>; Sun,  4 Jun 2023 15:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 204AE81ECE;
	Sun,  4 Jun 2023 15:48:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 204AE81ECE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qChcGDOO4xjj; Sun,  4 Jun 2023 15:48:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A3E381E55;
	Sun,  4 Jun 2023 15:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A3E381E55
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BF9C1BF4E3
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 15:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7450408BD
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 15:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7450408BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bwylyCHgYr9r for <buildroot@lists.busybox.net>;
 Sun,  4 Jun 2023 15:48:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3671408D4
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3671408D4
 for <buildroot@buildroot.org>; Sun,  4 Jun 2023 15:48:25 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f004cc54f4so4883926e87.3
 for <buildroot@buildroot.org>; Sun, 04 Jun 2023 08:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685893703; x=1688485703;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oAjMHdttYc4y4sm4IJC5rN8nOf7uxHk6J5Yf9Ptvkow=;
 b=CnvuUJwm3l/Yw7VtpDlyTpBsVOgHYgfT2BK7utpCU9sBkYG6jiGcl1pTyOMC/mwP7Q
 zm0pS0pdS8soqEbmrhoUG2y2ACzO2qvy4TKgAgaUrP91RC/GhB4VCEhgQQ3eFgcjloJ5
 sBwUEUqPB2TdGBRkKvCgdG2JIevZ/8fSuM4Bk6Dz4XeuJ0qjeO6PRu72vN6hIQYafZth
 weKJnOiWdy62ZBV7Kp29pIZ/5wB39N3ka66x/VO3rj/iruAoVP+ItJSm5QF9qBdLcl5z
 77eeGMPBc9IMtYJz6orr5obQYPSmTpITgOk/n7YxLkPuiK1hDYKGsgcPZawzPfR7iNzN
 Oy/g==
X-Gm-Message-State: AC+VfDxVRxEQ9BeutGw6f142XM14DFiBSSgtFbBQZlCro70E0z7S8Ubs
 8B2OkOZ76z1zNRklQe7kTifaLfhiQCg=
X-Google-Smtp-Source: ACHHUZ4u1z7uOZHIVVvlsZI+BXQLyGfzdt4/gj08glppNR+KVNrwj8NbPqkz4VKh3KZGDR+AnGgpRg==
X-Received: by 2002:a05:6512:11cc:b0:4ef:ed49:fcc2 with SMTP id
 h12-20020a05651211cc00b004efed49fcc2mr3810410lfr.26.1685893703478; 
 Sun, 04 Jun 2023 08:48:23 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:21e:3500::522])
 by smtp.gmail.com with ESMTPSA id
 j7-20020ac24547000000b004f5a548820asm809636lfm.156.2023.06.04.08.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 08:48:22 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Jun 2023 17:48:18 +0200
Message-Id: <20230604154818.3681851-3-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230604154818.3681851-1-troglobit@gmail.com>
References: <20230604154818.3681851-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685893703; x=1688485703;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=oAjMHdttYc4y4sm4IJC5rN8nOf7uxHk6J5Yf9Ptvkow=;
 b=TKi/4qQ7994Rwb5pyNfv59un/3VHkRiHl724vZu4oNOx6lXSLXAu8U+P5dwYLQUT3/
 bqYlBEy5iBVYB2k/KtRi73T6f8+C7QGCuJayHRzmsjFyLmD0uDm6jSADCwGtPyqRLCg7
 VMv0a00B6ppnTCBjiNinhkkUHr+TTPL1c67bvKcuMmG6Wp8S5hIbBrYqsT91KLCujknf
 hPP01AF4ZVG7EZ1ddKp3jNi16kMoYjCgt1QBSP58ixaEUW7PiiRXZ78C2+uEndeZkQ35
 xhgou/yHwCn3EvPelu+7qllY0djm+V6E+I05A6nrFejqcVgq5lDCd6pPvDRJ+BHyiywa
 r8ZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=TKi/4qQ7
Subject: [Buildroot] [PATCH 2/2] package/mrouted: add /var/lib/misc for
 systemd builds
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Similar to dnsmasq, mrouted saves state data across reboots in the
/var/lib/misc/ directory.  In the case of mrouted it is the unique
generation id (used by neighboring mrouted routers to identify any
router restarting).  This file is generated on first boot.

Workaround only needed for systemd builds, the sysv skeleton already
has the /var/lib/misc/ directory.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/mrouted/mrouted.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 3e2f49dc10..0d2071c4f0 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -18,6 +18,7 @@ define MROUTED_INSTALL_INIT_SYSV
 endef
 
 define MROUTED_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/var/lib/misc/
 	$(INSTALL) -D -m 644 $(@D)/mrouted.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/mrouted.service
 endef
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
