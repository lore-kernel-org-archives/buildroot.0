Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29577CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 08:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E380041689;
	Wed,  3 Apr 2024 08:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id voF6L_YEtRvC; Wed,  3 Apr 2024 08:48:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D08D441694
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D08D441694;
	Wed,  3 Apr 2024 08:48:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2755E1BF44A
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1436A82039
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U4VMYLLo5VQc for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 08:48:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CAB0B82036
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAB0B82036
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CAB0B82036
 for <buildroot@busybox.net>; Wed,  3 Apr 2024 08:48:19 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a4e79d7d21dso151715666b.1
 for <buildroot@busybox.net>; Wed, 03 Apr 2024 01:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712134098; x=1712738898;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RxuZ4ZIll4taVvpgPf3HGjOR0OpVNxCUcEigxSdbNYY=;
 b=phzYI42FTfFjxSvAt1ORu50WJDSShb9EnlBM/Zk9l9UQAFC53lk71NfdQ+UKEGrh2e
 7XH3nnzGj13g8Id1+pWNtIa/604ZLJ6GMTbRaqApMKEb90sVnKTOyAY9KSHXF2SeYR+D
 PyRkOGWg0uWEzhp2TyUHy/FDyB5gJhYNNS7wg3YXcF3OcePBPn6BtLXBCq64c7ubCzk4
 EDr5oBGQrnm9IV9DzmGjgdhERZuSgmSQseYA7B7CI1fA0zwtZ1B6CG2ER7+575QAytBh
 DZGGEKYTQY3/708kUhUIoqj8Ur7gNa8vloBWP3zX+rxDWsCGMAKyLJo/a/5REbR/ql29
 PBBA==
X-Gm-Message-State: AOJu0YwyQ2V+k85NB6YU+102o8PtY9L3fKxxeKvXLVJ2r+dNG2u9t2ST
 JNKAygJB5uiTyv0CIiM/zDyZm3L62zvBrWosfdpCdaSUAU4sMvYfH+8QfPm/6JSeKeRn8IQWu/Q
 =
X-Google-Smtp-Source: AGHT+IHoJHsZfVfeQwA+ZiZ6vPWhebruCYqGw4GZVPdJuCpg2TqArpSLUHPd+mLvlfaiFmBDpWOVUQ==
X-Received: by 2002:a05:6402:5114:b0:56d:fca8:d2d6 with SMTP id
 m20-20020a056402511400b0056dfca8d2d6mr1871007edd.6.1712134097494; 
 Wed, 03 Apr 2024 01:48:17 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 ec47-20020a0564020d6f00b0056e0badec02sm197248edb.38.2024.04.03.01.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 01:48:17 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  3 Apr 2024 10:48:06 +0200
Message-Id: <20240403084807.512825-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1712134098; x=1712738898; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RxuZ4ZIll4taVvpgPf3HGjOR0OpVNxCUcEigxSdbNYY=;
 b=Yxd9cLDmIzrhghfb0qO+Q+KgF+X8gdjf2F6IJVEXmb9eC35qHu7WMXybLtlqpMWqrK
 g10MRbLw1LnkBaz6BF3VxHFPDLuHU7FH2O+SirDBEJdsuaJhKXaifzZPIttuLzTeQ8/p
 osHsWjumZubeccV6CQ0setVoi5FTYUwX6yhUoQjwpLTtYo0nCO1+TzFThUGFVYkcqdrb
 70qtgNnTVuK04HsmQkRSMG/n9ETS9b9XMPkD3qGIFcdb27jJ6NpB4CXjfBrEM4TRESTZ
 0h4GxToMevrsXMtLDcD0HgIQRP3nzzFMgu0oL6ar8jdHwWIsVjUGZOdlFWMoYx1H8SRB
 pNeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=Yxd9cLDm
Subject: [Buildroot] [PATCH 1/2] package/graphene: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

a dependency for gtk4

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/graphene/Config.in     |  6 +++++
 package/graphene/graphene.hash |  3 +++
 package/graphene/graphene.mk   | 44 ++++++++++++++++++++++++++++++++++
 5 files changed, 55 insertions(+)
 create mode 100644 package/graphene/Config.in
 create mode 100644 package/graphene/graphene.hash
 create mode 100644 package/graphene/graphene.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f6fc30137..f4b3d4627 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1120,6 +1120,7 @@ F:	package/copas/
 F:	package/coxpcall/
 F:	package/dado/
 F:	package/ficl/
+F:	package/graphene/
 F:	package/janet/
 F:	package/libtomcrypt/
 F:	package/libtommath/
diff --git a/package/Config.in b/package/Config.in
index 33039331f..9d659320b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1640,6 +1640,7 @@ menu "Graphics"
 	source "package/giblib/Config.in"
 	source "package/giflib/Config.in"
 	source "package/granite/Config.in"
+	source "package/graphene/Config.in"
 	source "package/graphite2/Config.in"
 	source "package/gtkmm3/Config.in"
 	source "package/gtksourceview/Config.in"
diff --git a/package/graphene/Config.in b/package/graphene/Config.in
new file mode 100644
index 000000000..60f6073a1
--- /dev/null
+++ b/package/graphene/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_GRAPHENE
+	bool "graphene"
+	help
+	  A thin layer of types for graphic libraries.
+
+	  https://ebassi.github.io/graphene/
diff --git a/package/graphene/graphene.hash b/package/graphene/graphene.hash
new file mode 100644
index 000000000..7d2b56945
--- /dev/null
+++ b/package/graphene/graphene.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  922dc109d2dc5dc56617a29bd716c79dd84db31721a8493a13a5f79109a4a4ed  graphene-1.10.8.tar.gz
+sha256  cfd9fd7b2be592d2c0910d32dc1d8910c08dc0670b1d9ce417a82fa9eb788df9  LICENSE.txt
diff --git a/package/graphene/graphene.mk b/package/graphene/graphene.mk
new file mode 100644
index 000000000..efdae9140
--- /dev/null
+++ b/package/graphene/graphene.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# graphene
+#
+################################################################################
+
+GRAPHENE_VERSION = 1.10.8
+GRAPHENE_SITE = $(call github,ebassi,graphene,$(GRAPHENE_VERSION))
+GRAPHENE_LICENSE = MIT
+GRAPHENE_LICENSE_FILES = LICENSE.txt
+GRAPHENE_INSTALL_STAGING = YES
+
+GRAPHENE_CONF_OPTS = \
+	-Dtests=false \
+	-Dinstalled_tests=false \
+	-Dgtk_doc=false
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+GRAPHENE_CONF_OPTS += -Dgobject_types=true
+GRAPHENE_DEPENDENCIES += libglib2
+else
+GRAPHENE_CONF_OPTS += -Dgobject_types=false
+endif
+
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GRAPHENE_CONF_OPTS += -Dintrospection=enabled
+GRAPHENE_DEPENDENCIES += gobject-introspection
+else
+GRAPHENE_CONF_OPTS += -Dintrospection=disabled
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
+GRAPHENE_CONF_OPTS += -Dsse2=true
+else
+GRAPHENE_CONF_OPTS += -Dsse2=false
+endif
+
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+GRAPHENE_CONF_OPTS += -Darm_neon=true
+else
+GRAPHENE_CONF_OPTS += -Darm_neon=false
+endif
+
+$(eval $(meson-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
