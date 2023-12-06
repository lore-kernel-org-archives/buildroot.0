Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2BFC10DC1
	for <buildroot@archiver.kernel.org>; Wed,  6 Dec 2023 09:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00C3541A1C;
	Wed,  6 Dec 2023 09:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00C3541A1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BIjDX5317o7Y; Wed,  6 Dec 2023 09:39:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C013B4360F;
	Wed,  6 Dec 2023 09:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C013B4360F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F1271BF83E
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 09:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34FE881490
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 09:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34FE881490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M5562ykzXBPT for <buildroot@lists.busybox.net>;
 Wed,  6 Dec 2023 09:39:40 +0000 (UTC)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F71381CAD
 for <buildroot@busybox.net>; Wed,  6 Dec 2023 09:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F71381CAD
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a1caddd6d28so81461666b.1
 for <buildroot@busybox.net>; Wed, 06 Dec 2023 01:39:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701855578; x=1702460378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gAR2JTJ20hx18+p7Fo82kgrey41DQV9Q/P/Y3469XIo=;
 b=q//rtd1+918ttcpnLdGWXUJDb2dSrphgsgYCsgdjqUhc6qpLG5OQk+76O6MdpPiOab
 s/uHPMHWdd/pqmmaDy0JcHVhceIe02pf8OQhYAqxqqET4AWVcDWv+XmN1WozDCpdfkps
 sVEdPz64+cwSOAt0fwIQ6FK7hGp/lyRXFAVXGFJ3nYoQ1klCwsVkNwVjSYHqTA53tAZM
 C5+QIv+RUfPDCkm6PsXf+oHpCZVvPGtt1F4hp89Da/Hgzeh4+1UU63fXJ23kEr9wkezK
 f3LTgWzlMHY55zoeFb1Nkw3JRlSnIzBaVzjPxAMWtVILQnNf3HciZ8INs96WTvuPVcik
 UGiA==
X-Gm-Message-State: AOJu0YyWn1hPLgm/QcI2b6G1Eq2Mxhrra8R7aUZyEMm/aaJOgOtBZ7UD
 WpukZgPLyA1WdzcGXM9DqSGPyymVUIA=
X-Google-Smtp-Source: AGHT+IEzu2QV+kdLi7SMiVj/FTYMS28r785rosQ07e/mfaz5Nb1eqGU7bjX0p/eg/biNuzGprCvnzw==
X-Received: by 2002:a17:906:24cf:b0:a19:9b79:8b55 with SMTP id
 f15-20020a17090624cf00b00a199b798b55mr310001ejb.102.1701855578017; 
 Wed, 06 Dec 2023 01:39:38 -0800 (PST)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 e20-20020a1709062c1400b00a1c7b20e9e6sm2111294ejh.32.2023.12.06.01.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 01:39:37 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  6 Dec 2023 10:39:30 +0100
Message-Id: <20231206093931.1548389-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231206093931.1548389-1-francois.perrad@gadz.org>
References: <20231206093931.1548389-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701855578; x=1702460378; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gAR2JTJ20hx18+p7Fo82kgrey41DQV9Q/P/Y3469XIo=;
 b=UFa5aJRdNYUUuD/ftgqvQ0acZ9bgmC9/ZHX4LsqCrZBPY2Fvp5A55k30Y6DDm0hC9j
 U3V6B7O25dplnO4szKTUxeBVsvVXm26d8aGquUEZDfrTswLlao+c5ik4lqe31lhg/DFl
 PEEqRa+RTop4zRxslJbFfjP/QshfjVhqtge+/ACFLhHEOv7Twf1PcX7A4fk9HgrFaALj
 9TYTbjWMcHTL0xcgIUy5Z538SdISoRQhdSpyEf/tUrIkxVyO8/5YNYpfy8BeBPKGr7on
 WrxFTqkc8m/OVcBSamMSgItYHpfSdjru8PvVYbhX6RAxl0jP4+3OQDwogq9hFKGlizmu
 Ii7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UFa5aJRd
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
