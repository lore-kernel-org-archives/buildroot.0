Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15D2C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 23:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B87241875;
	Thu,  3 Nov 2022 23:11:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B87241875
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id llk3_ckkvQ-I; Thu,  3 Nov 2022 23:11:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30C324181F;
	Thu,  3 Nov 2022 23:11:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30C324181F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB24F1BF322
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 23:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B50A66104C
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 23:11:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B50A66104C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tnkFu9h3eDBN for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 23:11:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B48906102D
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B48906102D
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 23:11:50 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id v7so2085422wmn.0
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 16:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lhAddRQ9nHsiMnyR6ypiN0QlbchWtBxgawhkpjRfLdY=;
 b=opQHvgHr2GNcuSO6aBqIKBUbzyKuAjRwqilwTYrBg7xv+iVvQlA1Rk3yvc440+4/Bh
 BvZDapew+1PBX/XXOns7R73jW1RD94Iyj1GwDS8TDBXEpExOyXNbEUfxwIqNl9VYUlHX
 4O2RS3DblPrXjkOQ/BFOosL/ljpf79hr+9zxwn4IZdnmtIQZJu7ZNgG2ZtL2w2q1y/9O
 YwO69SB9+p0Gt9IOxrFRFy/vGjuAfMPzdXaps0hrJ5439+rk27282Zy7iYV9c5SlyB5o
 RqNA1xvhuJtP7MxARedRE1U2uHuklULYdcCo7Z8xAPpgvm04WxX+NzUm6WDyN8bNSASK
 1xMw==
X-Gm-Message-State: ACrzQf0G3qcq2Vg0LCEFl/WlwxcjRl8CA3qQ84hCl2w42JIJjv1uzRJf
 CdMFatuRXbmxCpnfheFZjcZz0K158gk=
X-Google-Smtp-Source: AMsMyM7s3uhIJ8dU1cMJR/JYhblyjDB5Eai5fnQmslLnck6q5lCUGgCB1uMdHlQ1tfbeMgMyh0/ZwA==
X-Received: by 2002:a05:600c:3510:b0:3cf:8443:e8c with SMTP id
 h16-20020a05600c351000b003cf84430e8cmr9311843wmq.164.1667517108552; 
 Thu, 03 Nov 2022 16:11:48 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n21-20020a05600c3b9500b003b4c979e6bcsm1321351wms.10.2022.11.03.16.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 16:11:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  4 Nov 2022 00:11:40 +0100
Message-Id: <20221103231140.235582-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lhAddRQ9nHsiMnyR6ypiN0QlbchWtBxgawhkpjRfLdY=;
 b=YpQ/KSRVWiEdkZNh8m6KAZgHdvzwmVhjeaOaKvp6W29SFxAhwHubsGpy7MZdzSYAuG
 U0iBt6iyvoMs8Du9u6vjbUcgT0C/8w1EUNq0fzGHcJ9WBxw8hU4jxVL0YJ++kouwaWv8
 3owgH1wO5QcrmxHZrG5UvT9XZnZWEM+tSKinB8rm2+aLoumP/L70HghLN6htyXGGcuFO
 KUUNcTWo5orCh1vwP+As6Ys/0P2/n2UOukMjID67VlnjGH4Eicqpgf2Dh7+1bOZBuzYn
 TFlWJNRpqzkHi4hMMsd4BwdVuvEWGijCFibui5g/T6K9wuUOAwIBSCZ2SsNMnsZz2vv+
 r50Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YpQ/KSRV
Subject: [Buildroot] [PATCH 1/1] package/multipath-tools: add
 MULTIPATH_TOOLS_CPE_ID_VENDOR
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:opensvc:multipath-tools is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopensvc%3Amultipath-tools

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/multipath-tools/multipath-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
index f3ce3ca8b8..4b4e24621d 100644
--- a/package/multipath-tools/multipath-tools.mk
+++ b/package/multipath-tools/multipath-tools.mk
@@ -18,6 +18,7 @@ MULTIPATH_TOOLS_LICENSE_FILES = \
 	LICENSES/LGPL-2.0 \
 	LICENSES/LGPL-2.1 \
 	README.md
+MULTIPATH_TOOLS_CPE_ID_VENDOR = opensvc
 
 MULTIPATH_TOOLS_DEPENDENCIES = lvm2 json-c readline udev liburcu libaio host-pkgconf
 MULTIPATH_TOOLS_MAKE_OPTS = \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
