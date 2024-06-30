Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE8BC27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 13:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0887406A1;
	Sun, 30 Jun 2024 13:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G7zcu4OJMmRi; Sun, 30 Jun 2024 13:51:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65DD4406AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65DD4406AB;
	Sun, 30 Jun 2024 13:51:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 219A51BF3A1
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 13:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D42381992
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 13:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zOO7i4G2sodp for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 13:51:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ABC9B8198A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABC9B8198A
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABC9B8198A
 for <buildroot@busybox.net>; Sun, 30 Jun 2024 13:51:12 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-425680b1d3aso14685775e9.2
 for <buildroot@busybox.net>; Sun, 30 Jun 2024 06:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719755471; x=1720360271;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0W+sF7HW3EMjl3qqyM/1F+rVeN/R4e95Rf+G7IE09FM=;
 b=QKXTw8FbkkTxd3ITm9RVspMBEf6Yey6j6oi6z1OuibOxs++EHjZnSOQvMpiVuZkLrg
 6Eb67NuG4a+JHDxg48qUR/x815MLSmS20Mv50xGdRZzOkhNoGt20V1LNrvgfvo6jbLn3
 mnp/A5r534WKQMDsDVZZo0SV5jqjGnrn78TJa5u3jvJaBu/EOX4GvEp7PdgSWjY9dsWX
 28mhEI3LpET6IV5aRbGSH+bSiF2sLscvaPFIY93/TaPIwnVFfkd+1JijNbYq8Bg9y4Ie
 QUiFr+Cx5pvFhkjTFCPG9fJnySUfsG+Q7FACD3JjGM9KyV7a4kd0FTGNvG8LAxNKpjgf
 oTlw==
X-Gm-Message-State: AOJu0Yzj4W3qSIvy1+OfswYPMZaZYsIPnjx5NLi79u/QiUQFbnc7XRwD
 4YpzVMaU4vbcICjI0oCpw2wDM3RUn4YB+J0c7OarXwOn/ult8AwBCsv6DLmsUqhhC5MS/RFWkWy
 zQw==
X-Google-Smtp-Source: AGHT+IFUL5+BhbSNt412EVDE+S9q0hBjc319kBti5L0SPTYtBebSc8ZS6paM+/Vy+2mSWYeYT4qoJg==
X-Received: by 2002:a05:600c:480f:b0:425:7bbf:fd07 with SMTP id
 5b1f17b1804b1-4257bbffdecmr17625685e9.5.1719755470645; 
 Sun, 30 Jun 2024 06:51:10 -0700 (PDT)
Received: from vm-2404.. ([37.166.9.170]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4257dee5f2asm23333375e9.22.2024.06.30.06.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jun 2024 06:51:10 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 30 Jun 2024 15:51:28 +0200
Message-ID: <20240630135128.2222416-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1719755471; x=1720360271; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0W+sF7HW3EMjl3qqyM/1F+rVeN/R4e95Rf+G7IE09FM=;
 b=PXTe26sAXXidGszpz+8Yjb7yygno22enRuzxNIEsYiBEQPEK4R16jvJTruWj7Sfqmw
 iKbHqo9++afvBpZ3WcbXJ7sNA27sZ+AA4hTz/MIbBMqdQj4PhGOkXaP7OA60zzsn/Hou
 Rxy0yxGF66+p+kP0kR56dDIZggwRRdVMDWB0D3htAtCnUUnqD/naSvFQVOIFtBzqvyuu
 H+8VhaJ0v89+1vbCVmYRQIo2HXoZm7OgbrWTVaZvV2Oixql+cCcaTA4hKbEdCALClHJt
 D18EIuVuF5SpC9NQW6hoUH7PJpm72mn9GOdNcUQpYyqpEY8KaWpX/H15QkuESqGv/gEo
 b30g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=PXTe26sA
Subject: [Buildroot] [PATCH] package/lua: bump to version 5.4.7
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
 package/lua/5.4.6/lua.hash                                  | 5 -----
 package/lua/{5.4.6 => 5.4.7}/0001-root-path.patch           | 0
 package/lua/{5.4.6 => 5.4.7}/0002-shared-libs-for-lua.patch | 0
 package/lua/{5.4.6 => 5.4.7}/0011-linenoise.patch           | 2 +-
 package/lua/5.4.7/lua.hash                                  | 5 +++++
 package/lua/lua.mk                                          | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 package/lua/5.4.6/lua.hash
 rename package/lua/{5.4.6 => 5.4.7}/0001-root-path.patch (100%)
 rename package/lua/{5.4.6 => 5.4.7}/0002-shared-libs-for-lua.patch (100%)
 rename package/lua/{5.4.6 => 5.4.7}/0011-linenoise.patch (97%)
 create mode 100644 package/lua/5.4.7/lua.hash

diff --git a/package/lua/5.4.6/lua.hash b/package/lua/5.4.6/lua.hash
deleted file mode 100644
index 0b03fd563..000000000
--- a/package/lua/5.4.6/lua.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# Hashes from: https://www.lua.org/ftp/
-sha256  7d5ea1b9cb6aa0b59ca3dde1c6adcb57ef83a1ba8e5432c0ecd06bf439b3ad88  lua-5.4.6.tar.gz
-
-# Locally computed
-sha256  8f1bff27c5b0585ab679dbe4e37e75a1014af0f79732f42a79f86728321a0c6d  doc/readme.html
diff --git a/package/lua/5.4.6/0001-root-path.patch b/package/lua/5.4.7/0001-root-path.patch
similarity index 100%
rename from package/lua/5.4.6/0001-root-path.patch
rename to package/lua/5.4.7/0001-root-path.patch
diff --git a/package/lua/5.4.6/0002-shared-libs-for-lua.patch b/package/lua/5.4.7/0002-shared-libs-for-lua.patch
similarity index 100%
rename from package/lua/5.4.6/0002-shared-libs-for-lua.patch
rename to package/lua/5.4.7/0002-shared-libs-for-lua.patch
diff --git a/package/lua/5.4.6/0011-linenoise.patch b/package/lua/5.4.7/0011-linenoise.patch
similarity index 97%
rename from package/lua/5.4.6/0011-linenoise.patch
rename to package/lua/5.4.7/0011-linenoise.patch
index 5054ae19e..2fcbc49f6 100644
--- a/package/lua/5.4.6/0011-linenoise.patch
+++ b/package/lua/5.4.7/0011-linenoise.patch
@@ -8,7 +8,7 @@ Index: b/src/lua.c
 ===================================================================
 --- a/src/lua.c
 +++ b/src/lua.c
-@@ -438,6 +438,14 @@
+@@ -447,6 +447,14 @@
  #define lua_saveline(L,line)	((void)L, add_history(line))
  #define lua_freeline(L,b)	((void)L, free(b))
  
diff --git a/package/lua/5.4.7/lua.hash b/package/lua/5.4.7/lua.hash
new file mode 100644
index 000000000..d67fdcf6c
--- /dev/null
+++ b/package/lua/5.4.7/lua.hash
@@ -0,0 +1,5 @@
+# Hashes from: https://www.lua.org/ftp/
+sha256  9fbf5e28ef86c69858f6d3d34eccc32e911c1a28b4120ff3e84aaa70cfbf1e30  lua-5.4.7.tar.gz
+
+# Locally computed
+sha256  33a975a766520bc54de2d71e45442e504effa0519e331e31ee3fc46eca4f98bd  doc/readme.html
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 93d480381..15772dbdf 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_LUA_5_4),y)
-LUA_VERSION = 5.4.6
+LUA_VERSION = 5.4.7
 else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_VERSION = 5.3.6
 else
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
