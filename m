Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6006BC7618E
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 19:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B375A60E22;
	Sat, 18 Mar 2023 19:32:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B375A60E22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wmoyhp4kvQlJ; Sat, 18 Mar 2023 19:32:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F00EC60C2F;
	Sat, 18 Mar 2023 19:32:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F00EC60C2F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB0471BF4E2
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 19:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B492D81EC8
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 19:32:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B492D81EC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VJmtMlGy9x63 for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 19:32:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 076668204D
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 076668204D
 for <buildroot@busybox.net>; Sat, 18 Mar 2023 19:32:07 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id y4so32659973edo.2
 for <buildroot@busybox.net>; Sat, 18 Mar 2023 12:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679167926;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HoI1SAnNjJnUPdiMU3GnIQLD95UoeGY6hUs7vgH7H28=;
 b=jWpMuJ+aFS8ubO6q4sinGFpr3KA2PRrsS9F+UuLSmFQXJmxtQCiIdlkYIKttNaSGNu
 4JOm3ztYds/8M8CMc4G7cqBEnY9jkTHvkvy6tkiByTKftlFv9YncqNWkAnf02RyzSTkv
 sJUazzxBDZi8FlMj1urWQZkCbiU4v4m7+FUA0vThKOiT0+gGkCaHOAwIzeri+00nkZuF
 OHnWfM5YtC20rAWe5sWoi9TA95pSCPp/2eAX2WNVetEuE8YltEW11UxNQqvmVJF84y2j
 Gy5yUOIyUV1B7Og5X7TJkjGD6JVt9IHQDzt9oBQWG3qCyltRf61ldeC+bGYfnQLwSQPJ
 M+9Q==
X-Gm-Message-State: AO0yUKXwjDeNhUaoHkDcaRU7MR/Fuch2UmuRX0LtPmhPrur2oAhJxTvr
 A+DK4xadCTzPmlDi0vLR3+PVp4zaGzs=
X-Google-Smtp-Source: AK7set+VYyGgi270n4OCF26su/D1nLSNmFJ+zWHXp3j1azrbrTNPAIi9ZENEzuF4BtLFacCR4mw0mA==
X-Received: by 2002:aa7:de03:0:b0:4fb:fd9f:7375 with SMTP id
 h3-20020aa7de03000000b004fbfd9f7375mr7465614edv.2.1679167925968; 
 Sat, 18 Mar 2023 12:32:05 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 24-20020a508758000000b004fb419921e2sm2745137edv.57.2023.03.18.12.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 12:32:05 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 18 Mar 2023 20:31:58 +0100
Message-Id: <20230318193159.1418922-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679167926;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HoI1SAnNjJnUPdiMU3GnIQLD95UoeGY6hUs7vgH7H28=;
 b=ErOIaT9aAbJyAsQQoQlj+YDDM/wuhnRfuWcMG216kBWFrwMaz+06HvpcsV0Qs67qCG
 kd1FTzuP/XZMZCNfk3crenNP9RrA7sK9kof962SLiQewU6j4Fi2YrKvFze3Pe22hsqgj
 MJBivVcRwglOyoDzsiah4R2EHpDWphalbtiLMoFTXTH9+UtMPBuLVCk1ZeNpbGIoVWUR
 5yjS1gvawSrA9Egj3nSOOreOgBk4zBhasUAImruNZIdPY3EWib3aegnUkPvTS/jBGdW7
 O9HXPQN7+6BYDYROuitrh0Qey+gg+lq+jR+b18sG3zkI0jv/xkDz2HGFwDEKmyJAMag1
 PLMw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ErOIaT9a
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
index 7ef8f79a7..5000d7230 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1057,6 +1057,7 @@ F:	package/copas/
 F:	package/coxpcall/
 F:	package/dado/
 F:	package/ficl/
+F:	package/graphene/
 F:	package/janet/
 F:	package/libtomcrypt/
 F:	package/libtommath/
diff --git a/package/Config.in b/package/Config.in
index c7bb52d27..272ea7f4a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1574,6 +1574,7 @@ menu "Graphics"
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
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
