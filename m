Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE91EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 10:36:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB97660F70
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 10:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB97660F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABEA680D80;
	Sun, 14 Nov 2021 10:36:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BdvlqFcinJ8k; Sun, 14 Nov 2021 10:36:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF24B80D8C;
	Sun, 14 Nov 2021 10:36:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BC8B1BF3D5
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 10:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6657C80D8C
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 10:36:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4iTXj07nd-FC for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 10:35:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BBBE80D80
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 10:35:59 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t30so24298385wra.10
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 02:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sH4TtuuHVbKJ80roLjyeWIvFfdLOynUvqRbtoG7qPE4=;
 b=Q2EivltU6Chmes5AEbOyNjaesfjjre7L69s9rlGL8J9MxJeHh8RgZnJfbM+w9Ifu0V
 4s39FA8iMGPRBVKvTNimcz+qvUG0Mu1RLBsow//ny/9wfOol07aRQqMAWn/yKVO0XpC0
 r27AbzYBWnlpH/41RKFGNuXbyw1BJmEHrGTM+yn6nEdKxNLlxmkE1393srZk/Bj4bNcR
 ra1kQ7PWp8WCoGd9Zqr2PeKnFRFn6XUAVG8cJv1oj9ANFOOiCCwQDny1CWw0rHII7erz
 XYK6IXlGcumMuk9CehPYCTeurDOgZYDL8Xu1+CNZHW/LaS7gOf0S/QzHt/3+CTIuTuDa
 3dwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sH4TtuuHVbKJ80roLjyeWIvFfdLOynUvqRbtoG7qPE4=;
 b=H+cyJgscaWElmFwb36U+7T6ywex+9uU6JlFIVj2pMpfnPLA14E0MG9yBg6WVkaroNw
 hydX1ZdkmpQnR9Kl5KpvbkIyy+OeCZJhzcnn4iToNMwP1xL6Wvr56othMfLQ1pkOw2Rg
 jA+oR+AbxDGTxRmqcslTEsbuSLHk1aUrb5Jo/WwS4g+CT0F8Eib5WfYI3QBFc2uh9Ol/
 unSRlNWnBTPyKg+WETloVMPAgVzBaQNxZ50t8OSUyq/p5Z6YkaYO9H47rZY+45xqae6A
 siT9J/XtkJcxBxq+WDkMJVFy0plCROlobTWbzQVEoYZLPFL9/0jgmJLRqANIQ2Vjfr81
 czhA==
X-Gm-Message-State: AOAM532E24gnYxf/Mry42CHBQKFlVLRfw1rFFaI7aNtcMkCzrBwbHaZz
 qtfAdpn0QaQ8wIQvdHOR0nhnYCBB6Mk=
X-Google-Smtp-Source: ABdhPJwZh6FEk3ZKSIGFPmlnlZReJYJBgQq2N3vgGrXpL7hiI3XWrOoRIY2s/Uy4/LnvgbkXPgPx6Q==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr34694645wrr.314.1636886156920; 
 Sun, 14 Nov 2021 02:35:56 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id z8sm11365582wrh.54.2021.11.14.02.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 02:35:56 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 11:33:49 +0100
Message-Id: <20211114103349.962611-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5base: add libkrb5 optional
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libkrb5 is an optional dependency which is enabled by default (with no
user option) since version 5.14.0 and
https://github.com/qt/qtbase/commit/93b7b0ec76572427291d8e2eef9a10eb499417a9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qt5/qt5base/qt5base.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index b04d710d78..ba2971dc08 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -233,6 +233,8 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_TSLIB),tslib)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_LIBGLIB2),-glib,-no-glib)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_LIBGLIB2),libglib2)
 
+QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_LIBKRB5),libkrb5)
+
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_ICU),-icu,-no-icu)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_ICU),icu)
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
