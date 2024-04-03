Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FD6C6FD1F
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 08:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0940241689;
	Wed,  3 Apr 2024 08:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4mLPdIHLz9ht; Wed,  3 Apr 2024 08:54:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B27EC416F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B27EC416F6;
	Wed,  3 Apr 2024 08:54:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CF1D1BF44A
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 174E4810AC
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zDRbJS6tawZF for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 08:54:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CDACA80F75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDACA80F75
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDACA80F75
 for <buildroot@busybox.net>; Wed,  3 Apr 2024 08:54:34 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-56845954ffeso8987504a12.2
 for <buildroot@busybox.net>; Wed, 03 Apr 2024 01:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712134473; x=1712739273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qYOybJ1Xzf0HuWTgLw9KB1fAut4NScrq83R1ff4Wo9Y=;
 b=IwPnNt8QC0M53+TZ3s/m63rR4Ky9JJWzlgAOADnQBVJXlq+Wx6p1eBOMNkKGDbHUSK
 ueNo42pgOviFr6ryWxuXRyK37OW9RitrZ/Jjb/M8IBnAhfDJCztHTiNB2x4uaX7helRF
 pqYj5EPfTDHe3IpreYOUyGURj+0XxL1s9GXwQpKZItqGeQduYWq+xKMsN0rhKCIr4g/f
 WlWctHwrtN68EJ7TRIRUoVVwT4v1CG8O1SzMIp7wqkt4fskQhl42soK4XkawTYaar6Wn
 MftE/6K0Mp6hoNgpnZS1X6rxz4hgZ0rjVsJla0AaUjtYoFociCB9KxmEuf8276R57QVW
 YneQ==
X-Gm-Message-State: AOJu0YxXIZv4d0bnazD8G+gCn37oF18kNzqbcJpqJW7e2o3RKSoP4piS
 NcUo/UFjgcbs/zSbJmYcxMxv7/jJPnaiutI/8DMbdgICBIoMnmeXdci8guEVwHkyK4s50zzTUi0
 =
X-Google-Smtp-Source: AGHT+IEqzj3MDDwcvM3Z+XjimUfRuJ5OZd3ZdWr8z8+exYHRWKv/fTRo/N3GViYcjBSltA8TWn3nYQ==
X-Received: by 2002:a05:6402:1914:b0:56d:eef3:3155 with SMTP id
 e20-20020a056402191400b0056deef33155mr2903974edz.15.1712134472518; 
 Wed, 03 Apr 2024 01:54:32 -0700 (PDT)
Received: from vm.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 dh26-20020a0564021d3a00b0056e0b358e86sm245178edb.97.2024.04.03.01.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 01:54:32 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  3 Apr 2024 10:54:24 +0200
Message-Id: <20240403085424.1650628-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403085424.1650628-1-francois.perrad@gadz.org>
References: <20240403085424.1650628-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1712134473; x=1712739273; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qYOybJ1Xzf0HuWTgLw9KB1fAut4NScrq83R1ff4Wo9Y=;
 b=fpdHM8W5CoobAM9kJYNx/h5lJSCdmrEUfbL7BIFr4G4J+xWLd9+vpBrWSMRLIPPMAx
 zppCVjYl9iQwaSHluznd6Lods8ZO0tFFcLUBFFeCEI909IPv8i1SlkIUHXSHYraXmnub
 o82SxJFzlhCdIAjRPxR+1XbJWwPm4KiUhmEad2fJXh4YuKuBzfhxPYHzuEIwvXAEMUbT
 pBFKh5rsax5FG6nQJBpqSHTpwUrE+NOn5WPiVpVef8HPb7W8kV8hBysTlhR37sIPmTT4
 b0gCCcbN6rjJgl6KBX6f7CGNo8GghD6o+wZiGu0DVAd1VWXPRuTr3Za6JjZukxZuKRJN
 YqjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=fpdHM8W5
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
