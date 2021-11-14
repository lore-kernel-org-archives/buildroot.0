Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148FEC433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 10:18:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71CD561027
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 10:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 71CD561027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0472640126;
	Sun, 14 Nov 2021 10:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zl5DTa9vQKPV; Sun, 14 Nov 2021 10:18:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21745401C5;
	Sun, 14 Nov 2021 10:18:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A67B1BF3D5
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 10:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2746180BE5
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 10:18:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a4XTbnEMqdSN for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 10:18:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54B2780BE0
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 10:18:22 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso10427293wms.3
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 02:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O8H0Efet7Ty4cDbywErBXZ18hD3XVz9e1NstWZD9Y1s=;
 b=l7zzCwmOMx1VDWieZURGsrgy4L3k/Mo099TfXNJngvxki6il/i4fVAGla/dU9JZhcx
 MmNdIzpwn6063Hc7UI4vtNiW1fkTpE+w2DmnLEDR9mChry9JQFq1fcZ/7nrY65TNPEr9
 tJePonlEUWb4gU2lpl8LQ8BXZqQTJMu3cxnXscveuLjDr32awVNfO9c3vk7SduBqK28F
 XJdKS9mZchekq4mrQIt80wdcMmCXATbSscj4RDFg+TxuI2XBTAjGSLOeSUHKDGBRodFP
 JgbAESITE2Ik5w3Z12NMstRFyDPDCOdpGma5Ef/R0D6uqMKQFEJm/3+d4rj0OJryPqP9
 X05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O8H0Efet7Ty4cDbywErBXZ18hD3XVz9e1NstWZD9Y1s=;
 b=dsW7bdF+TVX2wkgqDloXuQD0vxJ2JCb7kZjukfGUSweac5cj1DJJ4t8tyZyIpQBbPe
 +p3fuhrFZQDRcPX1KMXRya6LSL+FjF+ZDOO3fdgPog7/7EoFzF+PDaW+jabtech7DWMs
 6jg79OZIaXYCeoOvuHxfdpsQbm1l/gBtOrlqCIWDjVd2LSYXSDHS81gxcTnrIyKhgMsM
 AJvK3zBpxYALR6ie2KXjTT0RgPDem4MyyPP/U5FYQHj32CUP9GzLv0wTa8ClHrpmZMU/
 6J+Wsac55ncj5vSwYDz1woBWhj3QCPB5kQ3hZgsZxCcdNOq8i8GxkQjrqaLdIRpJi9aC
 EBsQ==
X-Gm-Message-State: AOAM532Rm5RoYqqKFKZebfJCwGpfH9YS3xhRL2oX+5xvTWM152JIPB/a
 ENyc2OfGR/aY3lL765MDV8QLZVrRDaU=
X-Google-Smtp-Source: ABdhPJytIzxFzeyliKYP0Qp4kEgXnpjcZayYHPsvX8nzD8TaZtSnbnB+eW3NWeQELjl5NYpr9Kfo/Q==
X-Received: by 2002:a05:600c:3584:: with SMTP id
 p4mr32910149wmq.65.1636885100400; 
 Sun, 14 Nov 2021 02:18:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id u19sm11118996wmm.5.2021.11.14.02.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 02:18:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 11:15:54 +0100
Message-Id: <20211114101554.878427-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5base: add zstd optional
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

zstd is an optional dependency which is enabled by default since version
5.13.0 and
https://github.com/qt/qtbase/commit/f25bc30d8d9d13fffd34213dfbf5e7373a18222a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qt5/qt5base/qt5base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 9da3de468a..b04d710d78 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -116,6 +116,13 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-cups
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+QT5BASE_DEPENDENCIES += zstd
+QT5BASE_CONFIGURE_OPTS += -zstd
+else
+QT5BASE_CONFIGURE_OPTS += -no-zstd
+endif
+
 # Qt5 SQL Plugins
 ifeq ($(BR2_PACKAGE_QT5BASE_SQL),y)
 ifeq ($(BR2_PACKAGE_QT5BASE_MYSQL),y)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
