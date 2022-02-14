Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2E0C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 04:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03CD540141;
	Mon, 14 Feb 2022 04:19:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vLC-3B3YztOd; Mon, 14 Feb 2022 04:19:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A7744012A;
	Mon, 14 Feb 2022 04:19:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A02B1BF312
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 04:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2487F402C1
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 04:19:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xb9ZrXr8azhh for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 04:19:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05525402BB
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 04:19:34 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id n5so11390419ilk.12
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 20:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KokodWovGOvZAsvwJVOIpZsfqT+zs7DnXo9QP3/FBa0=;
 b=F92d3Ubwo9YGdM3eZi5i7s/f3D1SthWMPz3VIpc5xxv8BKq/H34OvZ0ZtsW40VZVTA
 NcRmfN8Q5FmKMdP7VhbwTeEbdzD8CEhLApxBeK4mHbcAdWrHf1T5pzZ/eYOy8AQO/INI
 7p1hQIU8wh4jRWzPpg2PBb7iwFheTTE/UqOWz8C51MF0lccYt41+t5ZfzQK2nIWT7s5+
 KvO8Wbf7DLW/ZkVDRy7toIHhfpaui5QWkrD+fi1i6Cgp0eEQp6UPttDhwrlgAyQDXsLI
 iGbRzzhVkGUA3/97DPuil88jcf/ZjvW8Z4lQjbDP41iuUn/QJ0oqXP4t3KFP3WpvPRqk
 mvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KokodWovGOvZAsvwJVOIpZsfqT+zs7DnXo9QP3/FBa0=;
 b=FWzLkmVcvyOCXjh5BPX3Fm8lwoiq1WJzBr6C2hDTy+U/TgRHE5eAKFvYHUNywL3Nh0
 NYyVjBdukzQ5zwDtmXlh52HwZ7EA7lYNax18EiJ+rI71dKv9LLvK76rKYLr0+/y/WvP5
 lPqQiX8oVuFXh03+fLP1pGJfk4/DZNV7dLnh9PZdWuNoVNBLQB2FyKdPKiCC5ddDbZOE
 riUFWTGXQIHWUpAqRpkU1F/LODvE1eWrVygkGLpJ6bRbQ9EBpXF11hXrpUaOtLnNxBAN
 pfTAsfVQ4/MZ87zC5lHnVXf1TZAqRXEEH5adq2zdAVh5cz0CFOhXA7OkiWaW1DHjT5Cx
 1xiA==
X-Gm-Message-State: AOAM533QaH0NaHr3ZFyLgrT4WAGFVI+KxPTfZDV22U//uSYxf5qIo6nV
 6hlj8u3srXnK8mZAffP+EbEnkJf3FG0=
X-Google-Smtp-Source: ABdhPJwrTUlBOJp6cHZufkDIcziz8r9r0/fBdemMJIU2ocyePGIIlxP4AcP0YxKBmC8KBzgpS03s6w==
X-Received: by 2002:a05:6e02:164c:: with SMTP id
 v12mr6703092ilu.183.1644812373790; 
 Sun, 13 Feb 2022 20:19:33 -0800 (PST)
Received: from james-x399.localdomain (97-118-156-98.hlrn.qwest.net.
 [97.118.156.98])
 by smtp.gmail.com with ESMTPSA id y3sm4628957iov.29.2022.02.13.20.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 20:19:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 21:19:25 -0700
Message-Id: <20220214041929.1916468-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v7 1/5] package/qt5/qt5base: enable ccache via
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
 Peter Seiderer <ps.report@gmx.net>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Corjon <corjon.j@ecagroup.com>
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
