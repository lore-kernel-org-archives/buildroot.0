Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA41C43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 17:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8553D4151F;
	Sun, 19 Jun 2022 17:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8553D4151F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bBwAyrj0z_qD; Sun, 19 Jun 2022 17:43:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AF80414E6;
	Sun, 19 Jun 2022 17:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AF80414E6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B91131BF401
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 17:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92948414E6
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 17:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92948414E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CVVXuC7pgupI for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 17:43:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EC64414C6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0EC64414C6
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 17:43:22 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 x6-20020a1c7c06000000b003972dfca96cso4657050wmc.4
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 10:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dXY2XTT8VrrynufE+4zWPTv9EAyg3jB/TQ71lCw3Yuc=;
 b=JlCKtRcMsELO4B1YEud8ct7vZuW148kzuxrggmA4GZU64YWQIM/gHj9nROzEZpx3Gn
 g0z/1JbDCM8f56z5TteguCxBbfdVKOYGBlYTeVn9qnD/MdR+CbYOtnaUITFOQRyQqnX/
 tQ+yyxwVZKN3cyB1dCg7r+vk7XlVDYeuS4Id5o8KiLOVVGQk2sq5K58dGTCv7XKEShd+
 lkNR/SwbX5+/mUaVhzwrxFYp1Y/owTV0NukJKHH0tUgvyWnfOWgOBK7YXbnLB0Zm16vr
 E5k4h+xGy3oFEc76F5RHigYD/vE+EJIuNPdXSSlBFdmtibBev7rE/F15rl7IuMcbGc/6
 R7+Q==
X-Gm-Message-State: AOAM531m777iA09YbJBYRLhlCkTqxdafK1xisYmKCe5xA5NoodbcU99n
 E2+Lq20hiKuYxs2dtuzSLxYEfduveDM=
X-Google-Smtp-Source: ABdhPJyQJm6W3hlGPk6N3G5aAfEPSgoBCj7/eJ2Pawc5P6qu2Um6UYuL6PySrDvoS1JIVDKBCXFEiw==
X-Received: by 2002:a05:600c:4ed2:b0:397:7493:53e6 with SMTP id
 g18-20020a05600c4ed200b00397749353e6mr30548615wmq.61.1655660600850; 
 Sun, 19 Jun 2022 10:43:20 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t15-20020adfeb8f000000b0020e63ab5d78sm10691735wrn.26.2022.06.19.10.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 10:43:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 19:40:39 +0200
Message-Id: <20220619174039.823864-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dXY2XTT8VrrynufE+4zWPTv9EAyg3jB/TQ71lCw3Yuc=;
 b=WNMnoUIs8whD8doH/UqPx3m0MJKGT6uBuRm2edRwtvy7cV2ID5jXdQhn7PHGR5Yw+S
 oyygqQduGKin3Up9+NffLRtNAJe8Z1L/VjAF7B9Nd2N4wvRjl4kKIsBG6g9/x6FZzBsg
 o7Js13ooOj943ybScQuk/g3a75m4Jh/B2wnEklrc/whynlw2DSVozKStP1GxQ0/cdbWI
 oDeEV+GOxSasnQJ8tBMiNOZrEuXqd3IvulrOub+GJ4VRoYza3m9ohVpYn41beaQajkjz
 +7lCSPlM71L8gxhgk8k5nBbTWwtuYmBp6gScWmRZhyAllhVdH3Wd2J6aAJ9TiuTyntqj
 Y4dw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WNMnoUIs
Subject: [Buildroot] [PATCH 1/1] package/spice-protocol: bump to version
 0.14.4
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.freedesktop.org/spice/spice-protocol/-/blob/v0.14.4/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/spice-protocol/spice-protocol.hash | 4 ++--
 package/spice-protocol/spice-protocol.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/spice-protocol/spice-protocol.hash b/package/spice-protocol/spice-protocol.hash
index f02cf7f0e2..cd74c84ec7 100644
--- a/package/spice-protocol/spice-protocol.hash
+++ b/package/spice-protocol/spice-protocol.hash
@@ -1,5 +1,5 @@
-# From https://www.spice-space.org/download/releases/spice-protocol-0.14.3.tar.xz.sha256sum
-sha256  f986e5bc2a1598532c4897f889afb0df9257ac21c160c083703ae7c8de99487a  spice-protocol-0.14.3.tar.xz
+# From https://www.spice-space.org/download/releases/spice-protocol-0.14.4.tar.xz.sha256sum
+sha256  04ffba610d9fd441cfc47dfaa135d70096e60b1046d2119d8db2f8ea0d17d912  spice-protocol-0.14.4.tar.xz
 
 # Hash for license file
 sha256  eb55ea746be694c449224c7ddce6340648b075fd377281712a19094e7fb7ef92  COPYING
diff --git a/package/spice-protocol/spice-protocol.mk b/package/spice-protocol/spice-protocol.mk
index 172d45687d..dbeeb90b1d 100644
--- a/package/spice-protocol/spice-protocol.mk
+++ b/package/spice-protocol/spice-protocol.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPICE_PROTOCOL_VERSION = 0.14.3
+SPICE_PROTOCOL_VERSION = 0.14.4
 SPICE_PROTOCOL_SOURCE = spice-protocol-$(SPICE_PROTOCOL_VERSION).tar.xz
 SPICE_PROTOCOL_SITE = http://www.spice-space.org/download/releases
 SPICE_PROTOCOL_LICENSE = BSD-3-Clause
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
