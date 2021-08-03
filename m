Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A6EC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 16:44:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEF5261103
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 16:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DEF5261103
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3BC8402CB;
	Tue,  3 Aug 2021 16:44:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kW4eTQVQg4HG; Tue,  3 Aug 2021 16:44:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD17540248;
	Tue,  3 Aug 2021 16:44:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF7701BF868
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 16:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABC476066A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 16:44:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7wScYauaUaAY for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 16:44:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E9A660662
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 16:44:53 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id b128so12845613wmb.4
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 09:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QOS+o+7L5EvCosd1+3ealDgNmnH7JGtvEaFn0HVTmsQ=;
 b=Xn4KrKkgqdeOyieqZGIyTFWKc2cVvX0TY0a6grLUG8UdYmOE83hWe/E7Lte7QELeES
 Bwc59yMOEzhnUo6vJjZdwFUbB9J4IvII8RJg6104rJxNX8c9qsG9vgyOepzAYHR7ZOOy
 nVjBAINKdlqojXihn1Q22Xwj/Qz0dJ7/CT4vXyrw2dUriljJ/GrMw5HzbVb1arZ/6J9j
 Zp8QR5Thsc3puoz3DFBqHYhRC2Ps/7MXlypyE3BWiuLblCmAsOkN+sVflni/tZoByUuD
 391D08V3e+UM3mNsESn1TSb2/yQDeBJM4XGRyIkmqoXcfd8DLx0WxqzfSPIFH+SPRNUk
 lLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QOS+o+7L5EvCosd1+3ealDgNmnH7JGtvEaFn0HVTmsQ=;
 b=kDGF4C2Rs5ieYwKuf+sMS9bcu8JeaS4aIYEq4wQ9hFpjEaaYUqxIjjKx+tGFvLkszH
 gbMsOV4KBfIfMrAO1DJ+qOvjvlT1GQW9MFsdHNQGb568h0R9OtxrtIweOH5LHyreJFp8
 flcVLKKw6a+T7cc/zR/pPQhq8THXlaFt2qiKr4hC/53QTtQ8h/JIA1oAAisIWdJWG8Mj
 qbo72EU/3zf4IjBJFPMGJmV8sHqhsktTDSGkGN9g8qLNAeGz/kHPNehxM8ABRDrVZA8O
 Lx+cgzoLb4DbcAavU3Q4p7EsrJUtudrAafB3UJZsYdcIDla3u35qyCZypJ6mW8fTRy8+
 mUjQ==
X-Gm-Message-State: AOAM532hddmLAm8WpOM4PTxj3Nsx4PL3gwdQhR3AEhsR4fhhStnJFHr+
 f9rc7/wwB2gmo8DULejPa/kNG14M7sS6eA==
X-Google-Smtp-Source: ABdhPJw6ZYk7WRYRrEINHOxC/VJbHamrDbhOnIjJmcoD7YqEuulX3O6B0bXCZo+TE5S7e1hKXIl/7g==
X-Received: by 2002:a1c:7c04:: with SMTP id x4mr23813938wmc.48.1628009092036; 
 Tue, 03 Aug 2021 09:44:52 -0700 (PDT)
Received: from kali.home (pop.92-184-97-13.mobile.abo.orange.fr.
 [92.184.97.13])
 by smtp.gmail.com with ESMTPSA id j14sm15297524wru.58.2021.08.03.09.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 09:44:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 18:44:42 +0200
Message-Id: <20210803164442.169821-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sysdig: fix C++ comment
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Replace libjson by jsoncpp for C++ dependency which was wrongly added
by commit 74fc60a267341879ca71f8eaa64a80f5b5aaf78b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sysdig/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 7d3c570392..06d20c7f7b 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SYSDIG
 	bool "sysdig"
 	depends on BR2_LINUX_KERNEL
-	depends on BR2_INSTALL_LIBSTDCPP # libjson
+	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils, jq
 	depends on !BR2_STATIC_LIBS # elfutils
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
