Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BFEC433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 01:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BE5E60D5D;
	Tue, 15 Feb 2022 01:53:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hKJdHKMlzYmJ; Tue, 15 Feb 2022 01:53:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61C8760AD0;
	Tue, 15 Feb 2022 01:53:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 724431BF282
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 01:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B3688267F
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 01:53:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ou1WOuHqEevk for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 01:53:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6BE182572
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 01:53:11 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id 9so22228338iou.2
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 17:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KokodWovGOvZAsvwJVOIpZsfqT+zs7DnXo9QP3/FBa0=;
 b=feH6bHxIbeBJLi77GlZvtjwD37dGlyIvjqO+rC4gukV1MDQQ3iUb1zD2rirKKK/fQj
 r7trJmMfzTgLyirqVEOJa1hN7gf6ghb8aayYLNd5OANzUBCyyEA/dw4hpmraqWxngSEg
 aY8rzmwNVddvrwsSkzpYsec/ejNX6gLgUhtpM7MsV4kF45Ywdd05Fq5qncdCNX4tO9nI
 1o+5NI751jnk15KzNWkFfy4nefJxXM2uMOyg2DWGplsdus1AP2rFPnfgOGvxn8q/UQRJ
 pWequNRu5zY8brfnMqEbmcXNwWtx84R6/lz56QC6Y0QKaASdLZ37S/lJJEBYf5KOe/1C
 /XqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KokodWovGOvZAsvwJVOIpZsfqT+zs7DnXo9QP3/FBa0=;
 b=jv9DAJsdgprISNRzUBL9PqyAifvwRfJUDNGtmiuhsH/OtXv1zrZ5du4lGDUx3OEI+o
 XXpiQ30axz+PZwrOHIddY08FQ0kz4qbOVcCdETfMY9xJ7siA80/9fI3XLxp68zEb3t+o
 uniTCP7itfESZ0U2rtQm+dYhECfXZExWiZTB7JSQLWBVo/1PeKPuCqD+/o662Kn2KwYS
 pEaHFX1Rc+MIE1J0d6JXE60tMjzuD9vRBV1ImEOcaKpZfsJWLI/QQD65UkJu/TxZ3Q7l
 pnYE7cHBSK2EEkZa5AB0zm2yS7J/5+zzpvBCkS0+jyPGelE4r3qCNzMRCWz/PAmv4HRa
 /ooQ==
X-Gm-Message-State: AOAM531hXmd2yAVd1dLzDS9zhKvooJJBrOWuYnxne9lQTkkixAvDGp5T
 zLNV7nGFcRr/qfjk8nbiH9XCiaeEIpw=
X-Google-Smtp-Source: ABdhPJxVpMlf/Io/URmTtT9PGk4+u7PkzxeyGG3hwjz5myZK4HqGD42v22erV0OOYc6sv4v9W9ETbg==
X-Received: by 2002:a02:cc59:: with SMTP id i25mr1127261jaq.118.1644889990479; 
 Mon, 14 Feb 2022 17:53:10 -0800 (PST)
Received: from james-x399.localdomain (97-118-156-98.hlrn.qwest.net.
 [97.118.156.98])
 by smtp.gmail.com with ESMTPSA id u15sm4729628ill.75.2022.02.14.17.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 17:53:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 18:53:03 -0700
Message-Id: <20220215015307.855341-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v8 1/5] package/qt5/qt5base: enable ccache via
 configure option
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This should be cleaner than editing mkspecs/common/g++-base.conf.

This should be more reliable with qt5webengine gn build system.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v6 -> v7:
  - remove QT5BASE_CONFIGURE_HOSTCC variable
---
 package/qt5/qt5base/qt5base.mk | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index ef38d03253..cce92db81b 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -297,10 +297,9 @@ endef
 endif
 
 # This allows to use ccache when available
-define QT5BASE_CONFIGURE_HOSTCC
-	$(SED) 's,^QMAKE_CC\s*=.*,QMAKE_CC = $(HOSTCC),' $(@D)/mkspecs/common/g++-base.conf
-	$(SED) 's,^QMAKE_CXX\s*=.*,QMAKE_CXX = $(HOSTCXX),' $(@D)/mkspecs/common/g++-base.conf
-endef
+ifeq ($(BR2_CCACHE),y)
+QT5BASE_CONFIGURE_OPTS += -ccache
+endif
 
 # Must be last so can override all options set by Buildroot
 QT5BASE_CONFIGURE_OPTS += $(call qstrip,$(BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS))
@@ -316,7 +315,6 @@ define QT5BASE_CONFIGURE_CMDS
 	touch $(QT5BASE_ARCH_CONFIG_FILE)
 	$(QT5BASE_CONFIGURE_ARCH_CONFIG_LIBATOMIC)
 	$(QT5BASE_CONFIGURE_ARCH_CONFIG_LIBEXECINFO)
-	$(QT5BASE_CONFIGURE_HOSTCC)
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
