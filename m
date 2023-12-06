Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D799FC4167B
	for <buildroot@archiver.kernel.org>; Wed,  6 Dec 2023 09:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F18A41A81;
	Wed,  6 Dec 2023 09:40:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F18A41A81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wh7fk0pzLS_m; Wed,  6 Dec 2023 09:40:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CB944360F;
	Wed,  6 Dec 2023 09:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CB944360F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D4001BF83E
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 09:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5591C81CAD
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 09:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5591C81CAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8DGr-FJrY2EF for <buildroot@lists.busybox.net>;
 Wed,  6 Dec 2023 09:39:40 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFC2B81EDE
 for <buildroot@busybox.net>; Wed,  6 Dec 2023 09:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFC2B81EDE
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a00f67f120aso70616666b.2
 for <buildroot@busybox.net>; Wed, 06 Dec 2023 01:39:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701855579; x=1702460379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qYOybJ1Xzf0HuWTgLw9KB1fAut4NScrq83R1ff4Wo9Y=;
 b=p61MZ7bwrz+9IXDy6EHyRC6rt9ly1V0W8dBpkT7Xv2vvJMICjT57zOe9x7Uu1kYW98
 C3WMADDyfTsBBhK2teHdMiWA9/CGiwVqo3o3fgIakQmjt8QpcyvkzHfyLZvkX3wtgaZf
 W1LPhNpgVZz6MUdyx8lPhwwJ/qHP8c1UmC0c+sG3ByF0yYSyMKY0nrBGBiQWInxl/t3q
 18flPkHefzdX80u2XA+AZ5adXLibY933TY3NWDh6WU46Z32OWPUwE0iGDQ6bGS66FU9+
 bD01MaoHYFDGhNsE7QlRsy/nT4z1oCp0IzYnG5gh/Dht7NT7RYT/1Iymwv91l/7GTS4U
 ukmg==
X-Gm-Message-State: AOJu0YzmaUvvlUkD66tr/uZMV9nGEbOV0Z/OOBy4L+vtUwJrq5TOHbLP
 0BIBSJINc7YQXjOJA6jkZx54amHOlX4=
X-Google-Smtp-Source: AGHT+IH2z1k6lOjtj2pBROPDynApULfjqNhCvqOMZ4b0tDMU5fy+slGzRQQdPMuYGy2kYa88zLwF5w==
X-Received: by 2002:a17:906:9c17:b0:a19:25eb:97e1 with SMTP id
 ff23-20020a1709069c1700b00a1925eb97e1mr311405ejc.20.1701855578721; 
 Wed, 06 Dec 2023 01:39:38 -0800 (PST)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 e20-20020a1709062c1400b00a1c7b20e9e6sm2111294ejh.32.2023.12.06.01.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 01:39:38 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  6 Dec 2023 10:39:31 +0100
Message-Id: <20231206093931.1548389-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231206093931.1548389-1-francois.perrad@gadz.org>
References: <20231206093931.1548389-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701855579; x=1702460379; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qYOybJ1Xzf0HuWTgLw9KB1fAut4NScrq83R1ff4Wo9Y=;
 b=bVEudpioXd2VMgJwbB02+y+NrxzvTtLetpRiROmsb+rfJXso3DHjLZx7wQYZW42Dev
 bKmtdwYc3c/TDhNXCmuD9zFoljnZbeQfSeCw+eFWPewEqmNqWarELPlu1xt9gjBge96n
 mObw1zpXVoW6zN5txf+WZqmSCGanN9zmen3bIZV1LI/AY+z15fQ4kzwv5dqgkcUd4QkR
 HKBByvjnjNkqC8NHk12ZEszQ+Ht+eq3ZfxSWYNdkqedQMLTXORaMinqoyz9rQOzuR+DM
 /8VFlBNaKhA/IryG7yKkil9p0adDKUrYvIOubtK2bqg4LsibcJpHDv7tR539lyjDWzIR
 jshQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bVEudpio
Subject: [Buildroot] [PATCH 3/3] package/lua-lgdbm: new package
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
 package/Config.in                               |  1 +
 package/lua-lgdbm/Config.in                     | 12 ++++++++++++
 package/lua-lgdbm/lua-lgdbm.hash                |  2 ++
 package/lua-lgdbm/lua-lgdbm.mk                  | 13 +++++++++++++
 support/testing/tests/package/test_lua_lgdbm.py | 14 ++++++++++++++
 5 files changed, 42 insertions(+)
 create mode 100644 package/lua-lgdbm/Config.in
 create mode 100644 package/lua-lgdbm/lua-lgdbm.hash
 create mode 100644 package/lua-lgdbm/lua-lgdbm.mk
 create mode 100644 support/testing/tests/package/test_lua_lgdbm.py

diff --git a/package/Config.in b/package/Config.in
index e7032127cd..e8c210e22b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -739,6 +739,7 @@ menu "Lua libraries/modules"
 	source "package/lua-iconv/Config.in"
 	source "package/lua-inotify/Config.in"
 	source "package/lua-lightningmdb/Config.in"
+	source "package/lua-lgdbm/Config.in"
 	source "package/lua-livr/Config.in"
 	source "package/lua-livr-extra/Config.in"
 	source "package/lua-lpeg-patterns/Config.in"
diff --git a/package/lua-lgdbm/Config.in b/package/lua-lgdbm/Config.in
new file mode 100644
index 0000000000..ac5c64cc79
--- /dev/null
+++ b/package/lua-lgdbm/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LUA_LGDBM
+	bool "lua-lgdbm"
+	depends on BR2_PACKAGE_LUA_5_3 || BR2_PACKAGE_LUA_5_4
+	select BR2_PACKAGE_GDBM
+	help
+	  A database library for Lua using GDBM.
+
+	  http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/#lgdbm
+
+comment "lua-lgdbm needs Lua >= 5.2"
+	depends on !BR2_PACKAGE_LUA_5_3
+	depends on !BR2_PACKAGE_LUA_5_4
diff --git a/package/lua-lgdbm/lua-lgdbm.hash b/package/lua-lgdbm/lua-lgdbm.hash
new file mode 100644
index 0000000000..06f22f1509
--- /dev/null
+++ b/package/lua-lgdbm/lua-lgdbm.hash
@@ -0,0 +1,2 @@
+# computed by luarocks/buildroot
+sha256  8cb7e25254b1c9889894654f6cf26d09f2c2ee10fe966f45152eb5deb0a24f9b  lgdbm-20211118.52-0.src.rock
diff --git a/package/lua-lgdbm/lua-lgdbm.mk b/package/lua-lgdbm/lua-lgdbm.mk
new file mode 100644
index 0000000000..35ca9c93f4
--- /dev/null
+++ b/package/lua-lgdbm/lua-lgdbm.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lua-lgdbm
+#
+################################################################################
+
+LUA_LGDBM_VERSION = 20211118.52-0
+LUA_LGDBM_NAME_UPSTREAM = lgdbm
+LUA_LGDBM_SUBDIR = gdbm
+LUA_LGDBM_LICENSE = Public Domain
+LUA_LGDBM_DEPENDENCIES = gdbm
+
+$(eval $(luarocks-package))
diff --git a/support/testing/tests/package/test_lua_lgdbm.py b/support/testing/tests/package/test_lua_lgdbm.py
new file mode 100644
index 0000000000..b21565fb6e
--- /dev/null
+++ b/support/testing/tests/package/test_lua_lgdbm.py
@@ -0,0 +1,14 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLgdbm(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_LGDBM=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("gdbm")
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
