Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFBCC3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 13:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25AB580FF8;
	Mon, 15 Jul 2024 13:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wf7VTh1r4lGv; Mon, 15 Jul 2024 13:09:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20667810F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20667810F0;
	Mon, 15 Jul 2024 13:09:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB98B1BF3BE
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 13:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9CD8810F0
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 13:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xDU3WpgUy9nU for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 13:09:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7E2E280CE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E2E280CE0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E2E280CE0
 for <buildroot@busybox.net>; Mon, 15 Jul 2024 13:09:51 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-427b1d4da32so4110865e9.0
 for <buildroot@busybox.net>; Mon, 15 Jul 2024 06:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721048989; x=1721653789;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DHnfW8GlMYvSd+PLjLpJvuFVxNmXi9/hayywGtuBzbI=;
 b=bGS6V33vxeyE+zpWMepr958tu+9E43TMV7fZpVCHFbfakxgUN+n7xqhIILjspg3/vg
 gh9q+UP7vf6hSeDR6S5CL1njaZR5dq5q0NE4d5PdaKddfAsHAokoE1IAjKnE8w7aqnew
 gJX7IZmhsrImZ1yYdvz8LHFB0pFsR5rLH3+DW0xIqHy96Is2Y4BjxS3QQ4/e7xEBTev0
 tOO9qT+NSLY1g+glP5AjOdVDVujGF2qwleGv0VNJ4LbHLJOervdY32yLhCBh6PaOtXct
 c0yARAwM/7qcSeWP1fWLcZSP5ilIn7oLUKWjrk2c+jtoexUzzZ/z/tmRoEbgMzAgKIfm
 CXmw==
X-Gm-Message-State: AOJu0Ywq3WGbBa2rBHTcRauqScdzl0zyLTDI7hhBx1M7dLJ7T/XrN7Ci
 0fTUjxFjT2VXGPYYwE9SBrCX6+X1T9bvBbdUG8QpQdM7KCAy3ateZXkGiKgukecaFf9J13NCftU
 =
X-Google-Smtp-Source: AGHT+IEocPEnQmAAHZyHlkzLPjg94vFUIuVsXX0VxViEO1HZxrP0XIzdwZJt2AcCxuSmrpHJSkSkRg==
X-Received: by 2002:a5d:64a7:0:b0:363:ac4d:c44f with SMTP id
 ffacd0b85a97d-36804ec285cmr8286036f8f.17.1721048989054; 
 Mon, 15 Jul 2024 06:09:49 -0700 (PDT)
Received: from vm-2404.. (140.33.66.37.rev.sfr.net. [37.66.33.140])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dab3cb0sm6359227f8f.10.2024.07.15.06.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 06:09:48 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 15 Jul 2024 15:09:38 +0200
Message-ID: <20240715130940.470769-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1721048989; x=1721653789; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DHnfW8GlMYvSd+PLjLpJvuFVxNmXi9/hayywGtuBzbI=;
 b=MJ3C9Me/cJ8Lw19j5aHbqSXlrX3C1bGym/XxVhjbueMdZiuhLUqQytqyIpsPA7KnQS
 /x1WeVslfUyFDKjIy88h/ky5/VowwcGPJdu/LUNh7GVHj+pjtRI9TjJLtq+F855DaWkc
 VxxEymT9iaefrFRGFfJQ6TXP1sLQSl7WR04ZX+6dZtjQU9fHfydxc7S7UcXy4zY4v2MA
 vROH+s+fQxtAWm9PatLMgUU/IkMKQrmL+hKS+Lw3YOIbKKltcSVifs0fWyMgVDq/1iX3
 scXkcICz3m0T7p8sRW8KutTYs2osaYlQJlTrpBmbjvDFc9ytvNb6cxvO6RI9CT5ICaib
 Yxig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=MJ3C9Me/
Subject: [Buildroot] [PATCH v2 1/3] package/lua: bump to version 5.4.7
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
 .checkpackageignore                                         | 6 +++---
 package/lua/5.4.6/lua.hash                                  | 5 -----
 package/lua/{5.4.6 => 5.4.7}/0001-root-path.patch           | 0
 package/lua/{5.4.6 => 5.4.7}/0002-shared-libs-for-lua.patch | 0
 .../0011-linenoise.patch => 5.4.7/0003-linenoise.patch}     | 2 +-
 package/lua/5.4.7/lua.hash                                  | 5 +++++
 package/lua/lua.mk                                          | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 package/lua/5.4.6/lua.hash
 rename package/lua/{5.4.6 => 5.4.7}/0001-root-path.patch (100%)
 rename package/lua/{5.4.6 => 5.4.7}/0002-shared-libs-for-lua.patch (100%)
 rename package/lua/{5.4.6/0011-linenoise.patch => 5.4.7/0003-linenoise.patch} (97%)
 create mode 100644 package/lua/5.4.7/lua.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 72ebab6d8..497cac8d4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -985,9 +985,9 @@ package/lua/5.1.5/0012-fix-reader-at-eoz.patch lib_patch.Upstream
 package/lua/5.3.6/0001-root-path.patch lib_patch.Upstream
 package/lua/5.3.6/0002-shared-libs-for-lua.patch lib_patch.Upstream
 package/lua/5.3.6/0003-linenoise.patch lib_patch.Upstream
-package/lua/5.4.6/0001-root-path.patch lib_patch.Upstream
-package/lua/5.4.6/0002-shared-libs-for-lua.patch lib_patch.Upstream
-package/lua/5.4.6/0011-linenoise.patch lib_patch.Upstream
+package/lua/5.4.7/0001-root-path.patch lib_patch.Upstream
+package/lua/5.4.7/0002-shared-libs-for-lua.patch lib_patch.Upstream
+package/lua/5.4.7/0003-linenoise.patch lib_patch.Upstream
 package/luajit/0001-no-bin-symlink.patch lib_patch.Upstream
 package/luajit/0002-install-inc.patch lib_patch.Upstream
 package/luasyslog/0001-remove-AX_LUA_LIBS.patch lib_patch.Upstream
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
diff --git a/package/lua/5.4.6/0011-linenoise.patch b/package/lua/5.4.7/0003-linenoise.patch
similarity index 97%
rename from package/lua/5.4.6/0011-linenoise.patch
rename to package/lua/5.4.7/0003-linenoise.patch
index 5054ae19e..2fcbc49f6 100644
--- a/package/lua/5.4.6/0011-linenoise.patch
+++ b/package/lua/5.4.7/0003-linenoise.patch
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
