Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45F8C43334
	for <buildroot@archiver.kernel.org>; Thu, 14 Jul 2022 10:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 654DD60A93;
	Thu, 14 Jul 2022 10:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 654DD60A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RK3B1_FDdBys; Thu, 14 Jul 2022 10:00:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DE8A6151F;
	Thu, 14 Jul 2022 10:00:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DE8A6151F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F8D51BF33E
 for <buildroot@lists.busybox.net>; Thu, 14 Jul 2022 10:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36C5760D59
 for <buildroot@lists.busybox.net>; Thu, 14 Jul 2022 10:00:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36C5760D59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LqZmO_FnjHmh for <buildroot@lists.busybox.net>;
 Thu, 14 Jul 2022 10:00:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FC2E60A93
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FC2E60A93
 for <buildroot@buildroot.org>; Thu, 14 Jul 2022 10:00:09 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id v14so1847056wra.5
 for <buildroot@buildroot.org>; Thu, 14 Jul 2022 03:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Iy1UpNvjSyOm24QNYHiwsLjs+R6aB9PdQqwEFiOoYiI=;
 b=03FDj+mKZp96gZbAM7P/Mpixbbxhqvu27fIhvBIz9Maze7RA2BciYLZf4FzeQNhJZW
 v2JFkpLCoivk69dR1SncniwVhdcSCbv/SMwkIGnJDlNc2FpUpAlcvp/7CqcZFWfccDo2
 enyqO+ZrDPSUviVjuLErDNuFt7bXu8YQ9brzRD9uziTLfY337rCipz7DkhKWyk0/orBp
 eaB2zREyvowSkFc4q/xquuapzyswcTTD3pVcA2ssDxaonzP4soeeSdtesz+PF8BjEWd5
 SirwrvgVCqJaZih1OEFK8Rc9HcSi8PPKDhZohT+DIBdJ0CLG2K/LUlWreczpfBQmJFI2
 mZHw==
X-Gm-Message-State: AJIora/0JS637eoE42CYpDGD2z3IYU1GpKsVn9RalC1gp6imgfZX8rkt
 YHm8wQ7z6gn2Qe/XilwmJ33dSmpxjok=
X-Google-Smtp-Source: AGRyM1vofLhJhSn302mIoQGJO8JqeeYcznFDGjWqM4ctKkt19VbMc/MtsCxFJNuZ7ZDK4gY/LkZgNw==
X-Received: by 2002:adf:f705:0:b0:21d:74fa:c043 with SMTP id
 r5-20020adff705000000b0021d74fac043mr7824829wrp.77.1657792807422; 
 Thu, 14 Jul 2022 03:00:07 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a05600c3b1100b003976fbfbf00sm1583115wms.30.2022.07.14.03.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 03:00:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Jul 2022 11:57:01 +0200
Message-Id: <20220714095701.746554-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Iy1UpNvjSyOm24QNYHiwsLjs+R6aB9PdQqwEFiOoYiI=;
 b=HbQX3eZPk8D+pHTp5VTvpAB3jo1fV7V1b0vdzIHezsloQen3YjcsePNzv57tzEJOuo
 TEcy8jVrnSOu1y3NpFvoq7WCwR/sWHLaizZwmKNr4xlKOtiF6EU/XXD9HXJVRiJvrsWO
 9lJiNHj9BAD8BJ2pzZ3mPIcnb+5lKbSPII9ZN20yc7VHe8v0RMuWCSbeEo2qDG0VCZYw
 sRjGaE2qfcbOzeuNkhWp7GBmAQGmJo/Rx2nUkuLT3kygEFuP776vdnYcc1SlF+EVymbM
 ZbTlU734YnulBfVF3gNxSSe67k+s2a5RB7AdRTe5rddhP7VjYw0u8WXMaZjG9VHajtL6
 LPgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HbQX3eZP
Subject: [Buildroot] [PATCH 1/1] package/lxc: add linux-pam optional
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lxc/lxc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 9311dc8775..abe4f0804a 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -51,6 +51,13 @@ else
 LXC_CONF_OPTS += --disable-liburing
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+LXC_CONF_OPTS += --enable-pam
+LXC_DEPENDENCIES += linux-pam
+else
+LXC_DEPENDENCIES += --disable-pam
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LXC_CONF_OPTS += --enable-openssl
 LXC_DEPENDENCIES += openssl
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
