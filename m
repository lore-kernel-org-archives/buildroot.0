Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2ABAC47077
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 08:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66AAB83D0A;
	Sun,  7 Jan 2024 08:29:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66AAB83D0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b_ZMlgewoSF4; Sun,  7 Jan 2024 08:29:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C527883D11;
	Sun,  7 Jan 2024 08:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C527883D11
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3ECE31BF36E
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 08:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1048983D11
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 08:29:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1048983D11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MGhsUEoe51T2 for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 08:29:46 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0A3383D0A
 for <buildroot@busybox.net>; Sun,  7 Jan 2024 08:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0A3383D0A
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-554fe147ddeso934988a12.3
 for <buildroot@busybox.net>; Sun, 07 Jan 2024 00:29:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704616184; x=1705220984;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qx0WtCjxhTO+xlSyUzPDgmdnczVdGKzzXy5aKJ8mOPE=;
 b=DYLxfFbhtPbYm5Cg14+accI0mCIbpvz2LwZCnKcLM5abE4mk8LfucWRMf3MW6snDnc
 V35JL4wI4+4E2H4R/iY/XpIJNP/jvvoGLojWnTPSGr8wnDogxuT61wndhNxpgrtcP7Pt
 oWOJ7750pnUspaxyRVQDhFrSvGlkmvFfVjiQ5tzWmZBefLmicsbYyP4e4tXvO3rR7EAh
 g1V2sPVMJyKIuQNqKdWTk66GHkkzfI08BHB0gqjyFqdsHgbwkpeCvN+noczAQb1Z1UZZ
 SnjZOxWNqsgFeCE+5CSut32u2BSj00szG9TVBEqd4LxU24lnnT9CP0gacC0ohaT2o7yd
 JnEA==
X-Gm-Message-State: AOJu0YyZjNh3PRGmiw3x+AI2BxDubq/4wQ7hCZjCsyOazxiy+O+4Eudu
 kEp+UDIKD8Uz4uN4e0HTqpftWcs+4X4=
X-Google-Smtp-Source: AGHT+IFRD//FCtyOQnCJyw5T+MtQ2dE9/bVih7TTsarWZP7W3gGcqtx1pqYiN9gEI1BkdMJBLV3M2g==
X-Received: by 2002:a50:9982:0:b0:557:64f2:5e03 with SMTP id
 m2-20020a509982000000b0055764f25e03mr728572edb.120.1704616184380; 
 Sun, 07 Jan 2024 00:29:44 -0800 (PST)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 sd15-20020a170906ce2f00b00a26af2e4d58sm2806945ejb.1.2024.01.07.00.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 00:29:44 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  7 Jan 2024 09:29:34 +0100
Message-Id: <20240107082934.1648341-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704616184; x=1705220984; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qx0WtCjxhTO+xlSyUzPDgmdnczVdGKzzXy5aKJ8mOPE=;
 b=Zv1+QAkDA5fhyNFjumKSWLAVfQJZ/b0pwrx1bxzlxqzkNFQZvE7yj9OB+MIOMrNNKh
 LE0+E0LKQNCsUFoNBd8qKiqFx51V0ONGwdTYhZm9S6bhp8+aVCUOZWS5Xy/4PGPZD1qP
 VMsDLb1rPONi4Ey4AV99t0StiBkUGcuMK6/pjUBxpUy+xSao9HfrXeKoxiWoniMePdm4
 0oYTnmhcTOkoNem3lhXj95vnFaORrEoU6CsT/o9uHqvx8QqDq7uhfgO7+7zEU6zkTcHV
 8HJvUkCFsQev4OF3LTxt1JlovhZZ0ciCsM/KuNsdAJ4yY4aBckCCZ+G0sHEiZZphUxKD
 7Gtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Zv1+QAkD
Subject: [Buildroot] [PATCH] package/lua-lsdbus: new package
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                  |  1 +
 package/lua-lsdbus/Config.in       | 12 ++++++++++++
 package/lua-lsdbus/lua-lsdbus.hash |  3 +++
 package/lua-lsdbus/lua-lsdbus.mk   | 17 +++++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/lua-lsdbus/Config.in
 create mode 100644 package/lua-lsdbus/lua-lsdbus.hash
 create mode 100644 package/lua-lsdbus/lua-lsdbus.mk

diff --git a/package/Config.in b/package/Config.in
index c18a17af91..b5d1b79a05 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -744,6 +744,7 @@ menu "Lua libraries/modules"
 	source "package/lua-livr/Config.in"
 	source "package/lua-livr-extra/Config.in"
 	source "package/lua-lpeg-patterns/Config.in"
+	source "package/lua-lsdbus/Config.in"
 	source "package/lua-lunitx/Config.in"
 	source "package/lua-lunix/Config.in"
 	source "package/lua-lyaml/Config.in"
diff --git a/package/lua-lsdbus/Config.in b/package/lua-lsdbus/Config.in
new file mode 100644
index 0000000000..f4eda20d6e
--- /dev/null
+++ b/package/lua-lsdbus/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LUA_LSDBUS
+	bool "lua-lsdbus"
+	depends on BR2_PACKAGE_SYSTEMD
+	select BR2_PACKAGE_MXML
+	select BR2_PACKAGE_LUA_COMPAT53 if BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
+	help
+	  Lua D-Bus bindings based on sd-bus and sd-event
+
+	  https://github.com/kmarkus/lsdbus
+
+comment "lua-lsdbus needs systemd"
+	depends on !BR2_PACKAGE_SYSTEMD
diff --git a/package/lua-lsdbus/lua-lsdbus.hash b/package/lua-lsdbus/lua-lsdbus.hash
new file mode 100644
index 0000000000..369370d63a
--- /dev/null
+++ b/package/lua-lsdbus/lua-lsdbus.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  b515cd00c844abc80993e9552d884c71a80a680e47b90a628f1f7bd18b9b821a  lua-lsdbus-d132f8b2bd390d0b1c7d17b300190279f92bd494.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/lua-lsdbus/lua-lsdbus.mk b/package/lua-lsdbus/lua-lsdbus.mk
new file mode 100644
index 0000000000..cbd7ee9d4b
--- /dev/null
+++ b/package/lua-lsdbus/lua-lsdbus.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# lua-lsdbus
+#
+################################################################################
+
+LUA_LSDBUS_VERSION = d132f8b2bd390d0b1c7d17b300190279f92bd494
+LUA_LSDBUS_SITE = $(call github,kmarkus,lsdbus,$(LUA_LSDBUS_VERSION))
+LUA_LSDBUS_DEPENDENCIES = luainterpreter mxml systemd
+LUA_LSDBUS_LICENSE = LGPL-2.1
+LUA_LSDBUS_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_LUA_COMPAT53),y)
+LUA_LSDBUS_DEPENDENCIES += lua-compat53
+endif
+
+$(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
