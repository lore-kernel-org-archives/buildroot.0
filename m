Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB51CD1292
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 16:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED3A640223;
	Thu,  4 Apr 2024 16:30:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q72A4RU_XWSN; Thu,  4 Apr 2024 16:30:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D07A840A78
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D07A840A78;
	Thu,  4 Apr 2024 16:30:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 35B1E1BF366
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 16:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22EE582CFD
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 16:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c13eYb-nFihh for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 16:29:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8F47082D0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F47082D0F
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F47082D0F
 for <buildroot@busybox.net>; Thu,  4 Apr 2024 16:29:54 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-34005b5927eso783959f8f.1
 for <buildroot@busybox.net>; Thu, 04 Apr 2024 09:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712248192; x=1712852992;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0NRVDF4uZIP/AZo9tIKgZE4BZFKXgJNVsmVOmCU/lbE=;
 b=pi1JUbtXgpzZEtBvGwtR06+XXLkX9lLCTC7i0MRvHkdZRYw5lwEJtOETu4TsgkMj/j
 X/oIjetWXbh7IBPDztzQ+vMJkzgmPV37JD5pH9S7WEH0SKBIjYxT86F3qGnVYBXBvkg/
 6R83n52iJ/LP1QvogvzVWSaqUBO6Dk3g2AC7zm4AD6JSY/MLdnu64jNly9ik5CMKvht+
 7sPLGJengJkOI8ir+myNH6+chr1FwphGpElu+57Ods3OGlyY5BXYW5v2+zpX6bHf0D8x
 kQw42Q9KnLxtsnZQhYCd2snlsAxuUwrCnBrBOYQZD1v9nSNpuA/sOnCFFhVJzF3PN+WJ
 WsNg==
X-Gm-Message-State: AOJu0YwA8spJOyEaEj594jOZyN9UNPKqt1eOtLFcMQthC+sKjD5amn09
 uwoLlk3gqNuv3KwOTPEpThURkomqnnjeMvYD79gB2EtNAFuPo6+xGSiTDCE2j/m4h0GxeQDMDJA
 =
X-Google-Smtp-Source: AGHT+IEUfCbfCq3h6eRyfa5VXCARwKMxmkFDezBIaTBexeRXOD22NHS2lAV2r4sBpMxOArPrfPeqfg==
X-Received: by 2002:a5d:59a8:0:b0:343:c697:7602 with SMTP id
 p8-20020a5d59a8000000b00343c6977602mr1889959wrr.6.1712248192228; 
 Thu, 04 Apr 2024 09:29:52 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 bo15-20020a056000068f00b00341e2146b53sm5395900wrb.106.2024.04.04.09.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 09:29:51 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Thu,  4 Apr 2024 18:29:38 +0200
Message-Id: <20240404162938.33317-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240404162938.33317-1-francois.perrad@gadz.org>
References: <20240404162938.33317-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1712248192; x=1712852992; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0NRVDF4uZIP/AZo9tIKgZE4BZFKXgJNVsmVOmCU/lbE=;
 b=VuvzFEJIDXg2md5t+EoLwtGfnjZ6jwtltcho2CvUr+vfNL+Kk+v/fgXuZ4AJf3E0Iw
 Zoh/RoofVOAACDZxgDk9NDVadiJP/u377RlQO7/RFXkJjogT6fnWirXfSERF45Cesxzv
 ParTWFhQiA6DakfoL6qkQxQ85Z3T9jYJc+P0fibIRVdkhHZBYbHlTsqO7UNVuvWl81sF
 1LocbWh5ENGy5u86Tfo+ebbnqCFpTWplDxEstrviqJp9YJGbUqd0FhvF00C3dlTiGwLW
 DDg9/2zbHse8fX5ObvKbUkgweeaq139Ca4OrdHTG1iIGp/tEnm9IPe29bAXVMmz7J4+c
 +w+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=VuvzFEJI
Subject: [Buildroot] [PATCH v2 2/2] package/lua-lightningmdb: new package
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
 .../testing/tests/package/test_lua_lightningmdb.py | 13 +++++++++++++
 5 files changed, 44 insertions(+)
 create mode 100644 package/lua-lightningmdb/Config.in
 create mode 100644 package/lua-lightningmdb/lua-lightningmdb.hash
 create mode 100644 package/lua-lightningmdb/lua-lightningmdb.mk
 create mode 100644 support/testing/tests/package/test_lua_lightningmdb.py

diff --git a/package/Config.in b/package/Config.in
index d8862c4cc..cc8102bda 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -744,6 +744,7 @@ menu "Lua libraries/modules"
 	source "package/lua-http/Config.in"
 	source "package/lua-iconv/Config.in"
 	source "package/lua-inotify/Config.in"
+	source "package/lua-lightningmdb/Config.in"
 	source "package/lua-livr/Config.in"
 	source "package/lua-livr-extra/Config.in"
 	source "package/lua-lpeg-patterns/Config.in"
diff --git a/package/lua-lightningmdb/Config.in b/package/lua-lightningmdb/Config.in
new file mode 100644
index 000000000..cd08cfbe7
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
index 000000000..49ac7ea09
--- /dev/null
+++ b/package/lua-lightningmdb/lua-lightningmdb.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256  d836709e8a1374eb8913f0e9787bb3f0fc4d49b29e01112691b619f7d1355f8c  lightningmdb-0.9.22.1-1.src.rock
+sha256  3d0562e11bc52bf45a735e1d60c6f8522886927a8bcfbe7dee219a61ec30b07a  lightningmdb-0.9.22.1-1/LICENSE
diff --git a/package/lua-lightningmdb/lua-lightningmdb.mk b/package/lua-lightningmdb/lua-lightningmdb.mk
new file mode 100644
index 000000000..f70cbc4b0
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
index 000000000..cc5b82043
--- /dev/null
+++ b/support/testing/tests/package/test_lua_lightningmdb.py
@@ -0,0 +1,13 @@
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
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
