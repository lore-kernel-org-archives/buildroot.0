Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEF1C83F1B
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 06:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55E2383D31;
	Wed, 16 Jul 2025 06:15:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p9cax7Hs7Gyj; Wed, 16 Jul 2025 06:15:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A7AC83D30
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A7AC83D30;
	Wed, 16 Jul 2025 06:15:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 421F31514
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 06:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33D1E83D2E
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 06:15:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nRReXBZWxBIT for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 06:15:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D45F83CE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D45F83CE2
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D45F83CE2
 for <buildroot@busybox.net>; Wed, 16 Jul 2025 06:15:31 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so349576f8f.0
 for <buildroot@busybox.net>; Tue, 15 Jul 2025 23:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752646530; x=1753251330;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fj8u8o/Y7SdKEB8Kv2T46dbjsfx7exn3aXR3LxhwlYc=;
 b=TZAHf9eR1MKyFk6/PciZ1nS2jYUuZxIgBam+noyMsIM1E43kaieqWox94+O7QL+xqQ
 55d3nUY7A2WQSiVU0Cj5qwnWIpQKK1uRf4LJisQyLs1VA+HqdLcwpMVC+4DKU3iviMPY
 +JLxnqBCXUjNML+JXg3DzITWbOB6K9jLHEfRKkSlp8J8GUzq3UJUQ7TOfsW6yFKOsPou
 I5bahRX1j2quNXrEet1FzUVWO9+Y6a9tkCkXMS3LV/9cTuU+yQPLm7WuQ8KSGYDousx9
 iEHAnENr9v/tnPxwVliqNygMdQC+qezetp1rwJvf9vXEprdhDR/ap3hJLzavRCLqudvL
 U3bg==
X-Gm-Message-State: AOJu0Yz2x4PpeP478Fukr7sTKc+vaVyeQsUEA5HSoTeX3kfIrd+8Vlz5
 slvVK2WgL8yRxGCb8bfDBVj/7o6uwxC08AOvGYkb6xN/FtLG5LoIRv6J6/kz5ivZENA1of8zXVh
 gvl3nyg==
X-Gm-Gg: ASbGnctLRia9UzmRUycudE+lR4gZI7qrMLdiVTv+wLrGlJPBNtJPzfDMTQxaiSFAiEf
 ZobQq0374ELjtz507rvbEwY7v0xYXu12HPkXcOjj4gUlMhmeoke/YwhF7Ti6O/BoD0DQxlIfhLo
 xd0UVlCDRNHw9T/azEyhZV/G/nwHIXiSBVQxm2Ic499WHCtGCTzob3RYMP3BlWPUNu+1CHkw9Qw
 ac0ZPY9ZI6caLajzigObQaoAT6qNZc9TW+EVkwC9lCn9z6s70pwqfczYeAm4WUpDcT8yY4b2o3U
 FyZMohiIBg2kaEk5hihjuaR3FY/hTr+cNA0ribLG6uWF+Zd9Zp+9kUg9NiapuYNSF5qmr+q4hU3
 yXajeQI+lmtOdEKNsZd6VbIlbi4UP8NMpO/36ZKgaox41xmQl0Yrh37pW
X-Google-Smtp-Source: AGHT+IETIwpQK7ZMMWuYm/Ck8H4NIfNA+C4AKOBWQGApYi7tVAKQe7qJyyelkfN69Zr8gxgxbEbOuw==
X-Received: by 2002:a5d:5f48:0:b0:3a4:eee4:f73a with SMTP id
 ffacd0b85a97d-3b60dd72beamr1356418f8f.22.1752646529400; 
 Tue, 15 Jul 2025 23:15:29 -0700 (PDT)
Received: from vm-2404.. (10.187.66.37.rev.sfr.net. [37.66.187.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e1e285sm16667492f8f.76.2025.07.15.23.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 23:15:29 -0700 (PDT)
To: buildroot@busybox.net
Date: Wed, 16 Jul 2025 08:15:14 +0200
Message-ID: <20250716061514.1425011-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1752646530; x=1753251330; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fj8u8o/Y7SdKEB8Kv2T46dbjsfx7exn3aXR3LxhwlYc=;
 b=Sr2taPIff+mX1u6SHOlNyhhfsHxYZzV2Ltt8zN/6vNiBPcAL3YdwgcPwKx9XTxhSRO
 127LTZ0WBpIpSxmtiUyBUNAogKD5XM+A+XbbFhUHO+OWBHhayu2PDH1MXNNuw1ZiXXiN
 Ot31ne0ov7uF/mwt8iKJQxAhOTPRg/B4qt7xcT01tEQ50ttWcBfv7Xaj3X2mWo61EA4o
 pR4xCdppE6EQqm5wGMZf5+f/PQ4zIt3RMYyC7fiFknen54xVqmJiva7PJ2nWNof7uX6b
 Y4Uj7iwFVTNeKhkIEOHNLLePtqxOSOrEc9yclCH0PwOz928fwOQqLhEXkq9L8PtdTWRW
 iLNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=Sr2taPIf
Subject: [Buildroot] [PATCH] package/lua-lrexlib-pcre2: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                             |  1 +
 package/lua-lrexlib-pcre2/Config.in           |  7 ++++++
 .../lua-lrexlib-pcre2/lua-lrexlib-pcre2.hash  |  3 +++
 .../lua-lrexlib-pcre2/lua-lrexlib-pcre2.mk    | 14 +++++++++++
 .../tests/package/test_lua_lrexlib_pcre2.py   | 25 +++++++++++++++++++
 5 files changed, 50 insertions(+)
 create mode 100644 package/lua-lrexlib-pcre2/Config.in
 create mode 100644 package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.hash
 create mode 100644 package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.mk
 create mode 100644 support/testing/tests/package/test_lua_lrexlib_pcre2.py

diff --git a/package/Config.in b/package/Config.in
index 579b5ffc8..1ec830050 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -761,6 +761,7 @@ menu "Lua libraries/modules"
 	source "package/lua-livr/Config.in"
 	source "package/lua-livr-extra/Config.in"
 	source "package/lua-lpeg-patterns/Config.in"
+	source "package/lua-lrexlib-pcre2/Config.in"
 	source "package/lua-lsdbus/Config.in"
 	source "package/lua-lunitx/Config.in"
 	source "package/lua-lunix/Config.in"
diff --git a/package/lua-lrexlib-pcre2/Config.in b/package/lua-lrexlib-pcre2/Config.in
new file mode 100644
index 000000000..0d73ee8d6
--- /dev/null
+++ b/package/lua-lrexlib-pcre2/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LUA_LREXLIB_PCRE2
+	bool "lua-lrexlib-pcre2"
+	select BR2_PACKAGE_PCRE2
+	help
+	  Regular expression library binding (PCRE2 flavour).
+
+	  https://github.com/rrthomas/lrexlib
diff --git a/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.hash b/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.hash
new file mode 100644
index 000000000..090b83d48
--- /dev/null
+++ b/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256  9bb1cb2f307eb70d66fdab499864de732c891aace0ceb6a338194e2e6631b9c3  lrexlib-pcre2-2.9.2-1.src.rock
+sha256  067992fa7c5866e01d6c8fe93dfa1e1456a6ac81fa59ccdc72f5adcd6e5b3690  lrexlib/LICENSE
diff --git a/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.mk b/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.mk
new file mode 100644
index 000000000..3d0c3c57f
--- /dev/null
+++ b/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-lrexlib-pcre2
+#
+################################################################################
+
+LUA_LREXLIB_PCRE2_VERSION = 2.9.2-1
+LUA_LREXLIB_PCRE2_NAME_UPSTREAM = Lrexlib-PCRE2
+LUA_LREXLIB_PCRE2_SUBDIR = lrexlib
+LUA_LREXLIB_PCRE2_LICENSE = MIT
+LUA_LREXLIB_PCRE2_LICENSE_FILES = $(LUA_LREXLIB_PCRE2_SUBDIR)/LICENSE
+LUA_LREXLIB_PCRE2_DEPENDENCIES = pcre2
+
+$(eval $(luarocks-package))
diff --git a/support/testing/tests/package/test_lua_lrexlib_pcre2.py b/support/testing/tests/package/test_lua_lrexlib_pcre2.py
new file mode 100644
index 000000000..07a1a3e03
--- /dev/null
+++ b/support/testing/tests/package/test_lua_lrexlib_pcre2.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLrexlibPCRE2(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_LREXLIB_PCRE2=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("rex_pcre2")
+
+
+class TestLuajitLrexlibPCRE2(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUA_LREXLIB_PCRE2=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("rex_pcre2")
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
