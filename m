Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95978CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 08:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F2BF416D6;
	Wed,  3 Apr 2024 08:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2ZQ8mWA2iWW; Wed,  3 Apr 2024 08:54:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B371C416D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B371C416D7;
	Wed,  3 Apr 2024 08:54:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18AA21BF44A
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05F92810AC
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:54:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EnVZ9ZSsqIVw for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 08:54:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C648D80F53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C648D80F53
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C648D80F53
 for <buildroot@busybox.net>; Wed,  3 Apr 2024 08:54:33 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56829f41f81so8842944a12.2
 for <buildroot@busybox.net>; Wed, 03 Apr 2024 01:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712134472; x=1712739272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gAR2JTJ20hx18+p7Fo82kgrey41DQV9Q/P/Y3469XIo=;
 b=Z3zdqz34SKgmTXbgJmIhLqkMRl+14LmIIyqr7CNXUGH0KsiTmSLgI6EUgMwssOWGZK
 7VpM81oJcSfwJgsJIJgqLrVVSrKf1seTqJ6AsdHXoirrYCNuX0bR4TL/8PD9ypwfBx2H
 lAl3qysWWvscfmKHEy74/yFgQeH2D+DpJRKKXgqyZDgJDrm+Y/tBNKClrPWetSPlOtm6
 2E/lAhsC4TF0hU8/Hn0DnKxDIuRj4pS5ar3E+CZ+a7355GzmPIxI117iC9H5q5Nat8yL
 rjMnYRotmtCvF1j8H3VUXdIT7822yw3nJJPMwAa+zNPs4Tgvv86NO3uCKdM6pHvRa8Be
 7NiA==
X-Gm-Message-State: AOJu0YyIjP0EBCXiKl76JDw52btH/1yOyI/ohLKaN7UsPDM1mDOZBUps
 UmOY72+PXUzeSHJqVHEvyWgKbF+3tBKWai04SHhU8e5y0XzR37ef7kDPnj+9pbIbHdhfLvC2WYA
 =
X-Google-Smtp-Source: AGHT+IEAs6rYb8CWzgdn0CFyYmmB7f0EI6A202fsoh7PEn0UyYcJXaEBPX786CCDToaOEY73m0kVbg==
X-Received: by 2002:a50:9344:0:b0:56b:fd17:3522 with SMTP id
 n4-20020a509344000000b0056bfd173522mr9422254eda.14.1712134471690; 
 Wed, 03 Apr 2024 01:54:31 -0700 (PDT)
Received: from vm.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 dh26-20020a0564021d3a00b0056e0b358e86sm245178edb.97.2024.04.03.01.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 01:54:31 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  3 Apr 2024 10:54:23 +0200
Message-Id: <20240403085424.1650628-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403085424.1650628-1-francois.perrad@gadz.org>
References: <20240403085424.1650628-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1712134472; x=1712739272; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gAR2JTJ20hx18+p7Fo82kgrey41DQV9Q/P/Y3469XIo=;
 b=jF0t3Es6/3v5aePuzx7DGW056OlyFL4uA2MDtVqcue5aEMUL/nBqpkDcP6egFpxmth
 ZkSUnNp6XOlrYvyy/Cz4CFcyzo1HM6Cut3b6qp3qJhhzED8Ir18KGxu03fBm4zliNAOP
 jDZzQVY0smS1zyRK2aK9dIYUR2C9uXRg4h/wy/f3KIG8HC+ch8mU4a72o7LCwew0JtJa
 CeaIvBX0to4dtZlMcTY+WuDIuHUx7Rn9xfCC4cRaaN7FVBu22yBliKxByXQ+b0gRz38K
 11G9XD4WqQNUxYU8DftMBag8R8XO51FgJvLcK2fld1fmTJT7qxjFGKAfqX/7WQIR/mdw
 xIug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=jF0t3Es6
Subject: [Buildroot] [PATCH 2/3] package/lua-lightningmdb: new package
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
 package/Config.in                                  |  1 +
 package/lua-lightningmdb/Config.in                 | 13 +++++++++++++
 package/lua-lightningmdb/lua-lightningmdb.hash     |  3 +++
 package/lua-lightningmdb/lua-lightningmdb.mk       | 14 ++++++++++++++
 .../testing/tests/package/test_lua_lightningmdb.py | 14 ++++++++++++++
 5 files changed, 45 insertions(+)
 create mode 100644 package/lua-lightningmdb/Config.in
 create mode 100644 package/lua-lightningmdb/lua-lightningmdb.hash
 create mode 100644 package/lua-lightningmdb/lua-lightningmdb.mk
 create mode 100644 support/testing/tests/package/test_lua_lightningmdb.py

diff --git a/package/Config.in b/package/Config.in
index 4473169544..e7032127cd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -738,6 +738,7 @@ menu "Lua libraries/modules"
 	source "package/lua-http/Config.in"
 	source "package/lua-iconv/Config.in"
 	source "package/lua-inotify/Config.in"
+	source "package/lua-lightningmdb/Config.in"
 	source "package/lua-livr/Config.in"
 	source "package/lua-livr-extra/Config.in"
 	source "package/lua-lpeg-patterns/Config.in"
diff --git a/package/lua-lightningmdb/Config.in b/package/lua-lightningmdb/Config.in
new file mode 100644
index 0000000000..cd08cfbe79
--- /dev/null
+++ b/package/lua-lightningmdb/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LUA_LIGHTNINGMDB
+	bool "lua-lightningmdb"
+	depends on !BR2_PACKAGE_LUAJIT
+	depends on BR2_TOOLCHAIN_HAS_THREADS # lmdb
+	select BR2_PACKAGE_LMDB
+	help
+	  A thin wrapper around OpenLDAP Lightning Memory-Mapped
+	  Database (LMDB).
+
+	  https://github.com/shmul/lightningmdb
+
+comment "lua-lightningmdb needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lua-lightningmdb/lua-lightningmdb.hash b/package/lua-lightningmdb/lua-lightningmdb.hash
new file mode 100644
index 0000000000..49ac7ea09c
--- /dev/null
+++ b/package/lua-lightningmdb/lua-lightningmdb.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256  d836709e8a1374eb8913f0e9787bb3f0fc4d49b29e01112691b619f7d1355f8c  lightningmdb-0.9.22.1-1.src.rock
+sha256  3d0562e11bc52bf45a735e1d60c6f8522886927a8bcfbe7dee219a61ec30b07a  lightningmdb-0.9.22.1-1/LICENSE
diff --git a/package/lua-lightningmdb/lua-lightningmdb.mk b/package/lua-lightningmdb/lua-lightningmdb.mk
new file mode 100644
index 0000000000..f70cbc4b06
--- /dev/null
+++ b/package/lua-lightningmdb/lua-lightningmdb.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-lightningmdb
+#
+################################################################################
+
+LUA_LIGHTNINGMDB_VERSION = 0.9.22.1-1
+LUA_LIGHTNINGMDB_NAME_UPSTREAM = Lightningmdb
+LUA_LIGHTNINGMDB_SUBDIR = lightningmdb-$(LUA_LIGHTNINGMDB_VERSION)
+LUA_LIGHTNINGMDB_LICENSE = MIT
+LUA_LIGHTNINGMDB_LICENSE_FILES = $(LUA_LIGHTNINGMDB_SUBDIR)/LICENSE
+LUA_LIGHTNINGMDB_DEPENDENCIES = lmdb
+
+$(eval $(luarocks-package))
diff --git a/support/testing/tests/package/test_lua_lightningmdb.py b/support/testing/tests/package/test_lua_lightningmdb.py
new file mode 100644
index 0000000000..6c7a567e7a
--- /dev/null
+++ b/support/testing/tests/package/test_lua_lightningmdb.py
@@ -0,0 +1,14 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLightningmdb(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_LIGHTNINGMDB=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("lightningmdb")
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
