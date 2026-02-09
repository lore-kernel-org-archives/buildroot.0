Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806A6E78D74
	for <buildroot@archiver.kernel.org>; Mon,  9 Feb 2026 09:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2A0F40486;
	Mon,  9 Feb 2026 09:27:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zepu4_r2wGuv; Mon,  9 Feb 2026 09:27:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 446E040509
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770629237;
	bh=SSaLriBZO+/3Q1ZyOB19antSy4iZE1Llq9somzoo7/4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=knOLtbJT6W4end7FrCnzzVije41zXriC2iIxRapDJwQo6GAOZdoiyCz9yLZYPJ8wm
	 parJNOCdZd+ex2prQXKF62TRk4XIDanp/IX9Xl3/utw6p6aRkvD58G7007pCY11sJS
	 7uq4tWmQaDqDjeychpmxm+IWfsF4OpK6NaWp0ZV2vzZat+CdChsnL0nXAga1wCYB2L
	 hFuad9r2MMf4VrA/I7YsavNjkbx1pbEGR4e0ViISb8CUrIDzbaFN9iEyq7Q59v91G/
	 v04kFBHWCVviW9bXL7xK3xmdvwZF7trCCY63t00MyYfpflWN7hKDnFmy5HCpE/CVfb
	 SyuH8TUrFIR4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 446E040509;
	Mon,  9 Feb 2026 09:27:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4791E219
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 09:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CA2B826E7
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 09:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gIp9XlEE50pf for <buildroot@buildroot.org>;
 Mon,  9 Feb 2026 09:27:14 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C5F1826E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C5F1826E5
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C5F1826E5
 for <buildroot@busybox.net>; Mon,  9 Feb 2026 09:27:13 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso10312935e9.1
 for <buildroot@busybox.net>; Mon, 09 Feb 2026 01:27:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770629232; x=1771234032;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fAb+73gxjJqkj0rEmwwdaxXTNHSrotDOQgvW/BGjcwY=;
 b=uuqDAUqvg5X60WGOx3dfF/O3dESrNFIlFVfEmj9aO+CLQI3WWjzt3ABfZSBqsCKgZ+
 Dn3osg9orLdNGSVzY9dzcttF5bxgZymJucxgSP38I0wAXqN9JTfd+BneNI01vyvUFGfr
 1FMEXvnuAX8go2si8yGlqOO6tNI7axDE0zRfawzLlrxXjBZSFBHEaa3c62YFAOQdhA+n
 Dd5ZydT8CmVL9B/QCoRN6ciGsE8ailL0MiadGupBjf2xohiGLVLs8MRyZarUBa7eKa3J
 XcAqXnBdfwWCAXlTpTGS7xKe9TrL2CcXeK6zOfB7zVOPK0lZG+YOT9JGM9SeBQVlKd51
 xLgg==
X-Gm-Message-State: AOJu0YzCIUW5feA02HuLPKZVgittNtbecsyMqLHDNHqOEw7sYENrZVtu
 t3qQoqq2vmUuW1cM7NeTnCJI9inodjFGGbBaFB7gSxubkaGLn+PfQDalFsVZIOrs9PJDwXz06R1
 Lda57JQ==
X-Gm-Gg: AZuq6aIeyQXphi/KZ9FT5VMYchphntYqof8m2aSKqWlC048REKG/SgOILMKIhv9Vtzz
 4Jcz2YX8UPLWh5oJYzTofdElsocRy/ZGGKRwMh+2bCv+nvbFIE7lf0+431SwNn7yp+aBx99nqh9
 U8h8mcYLkhIi3mmOuY0PFMxBegTnTHJt8nwWX0JUwK2ARILE3vJZWlhCo0Vwx1xgFCYRRwevSPI
 yEDhTmShGvbbpCnZZQWN81QzrXV1XMsiDO8XgjYxhGShVLwvs5yHZHIT5EtC4IhIhB2H5M2A8tN
 FjfyjHbJGu50KW9Nwv4L8WlYXv+PAxEovTD9HTnPUAcImjMbw+Knj41sTH9KZq+ODYBFteScgH9
 BQzLsxswwGxgdCC5Hm+7VjzR4s4ESFMIQedNrLzYtDYWsht9aoltL4A07uVjCoWdlPu0BDg8ac6
 1J0r9C2qOg3FpJ2RPTo96zE569ZargcMVQrwbRwQ==
X-Received: by 2002:a05:600c:4e48:b0:46f:d682:3c3d with SMTP id
 5b1f17b1804b1-483201e5913mr156595245e9.13.1770629231734; 
 Mon, 09 Feb 2026 01:27:11 -0800 (PST)
Received: from vm-2404.. (249.184.66.37.rev.sfr.net. [37.66.184.249])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d3e245sm350084895e9.8.2026.02.09.01.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 01:27:11 -0800 (PST)
To: buildroot@busybox.net
Date: Mon,  9 Feb 2026 10:27:03 +0100
Message-ID: <20260209092704.13687-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1770629232; x=1771234032; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fAb+73gxjJqkj0rEmwwdaxXTNHSrotDOQgvW/BGjcwY=;
 b=qeq+oBjpDOdS5O0CRIGYDS1mKS6/GaRJCiFy7eE8Eqkuq8SvePj7i4qNJ+nRbb8/c4
 d2J6gcJtNCh+CMvI8CndL2dB0tC1h0nFidqNJB+b5k3kv39z/QVpXZeKB1hHZG7+Ufiu
 4f+9qOT1J/Tu8t8QeYUi4EqC+iUnPJ+0fE5zTWMnKAGNTY+knrreQRMbz7BvLxJdMWNW
 p/x+n9NvHWWSGFC0VyZ2UCzwpR0GYhv/dYP1rykOtGyVW8YMI7Qy3CZZ+AJe2yyDdMo5
 z6OOHuIp8qVbLEmpegtji0irTGpgn7AgBnLCD/9dm50XCN1zkG/gSqnYetzD9HO8STeT
 llIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=qeq+oBjp
Subject: [Buildroot] [PATCH] package/lua-cffi: bump to version 0.2.4
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

remove upstreamed patch

diff COPYING:
    -Copyright (c) 2020 Daniel "q66" Kolesa
    +Copyright (c) 2020-2025 q66 <q66@octaforge.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../0001-src-platform.hh-fix-or1k-build.patch | 39 -------------------
 package/lua-cffi/lua-cffi.hash                |  4 +-
 package/lua-cffi/lua-cffi.mk                  |  2 +-
 3 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 package/lua-cffi/0001-src-platform.hh-fix-or1k-build.patch

diff --git a/package/lua-cffi/0001-src-platform.hh-fix-or1k-build.patch b/package/lua-cffi/0001-src-platform.hh-fix-or1k-build.patch
deleted file mode 100644
index 35d023df4..000000000
--- a/package/lua-cffi/0001-src-platform.hh-fix-or1k-build.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 2294e61b057215bf089b1d1c482a5dcbcad6b414 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 23 May 2024 17:50:18 +0200
-Subject: [PATCH] src/platform.hh: fix or1k build
-
-Fix the following or1k build failure raised since version 0.2.2 and
-https://github.com/q66/cffi-lua/commit/27755f61e4c625dff951302bade4ad07e3609ca5:
-
-In file included from /home/buildroot/autobuild/run/instance-0/output-1/host/or1k-buildroot-linux-uclibc/sysroot/usr/include/lua.hpp:6,
-                 from ../src/lua.hh:23,
-                 from ../src/parser.hh:4,
-                 from ../src/ffilib.cc:7:
-../src/ffilib.cc: In static member function 'static void ffi_module::setup(lua_State*)':
-../src/ffilib.cc:1616:28: error: expected ')' before 'FFI_ARCH_NAME'
- 1616 |         lua_pushliteral(L, FFI_ARCH_NAME);
-      |                            ^~~~~~~~~~~~~
-
-Fixes: 27755f61e4c625dff951302bade4ad07e3609ca5
- - http://autobuild.buildroot.org/results/4e14753732c5b6fe8ba9ecc4050ffb35f471c428
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/q66/cffi-lua/commit/2294e61b057215bf089b1d1c482a5dcbcad6b414
----
- src/platform.hh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/platform.hh b/src/platform.hh
-index 84e0a89..dab1e76 100644
---- a/src/platform.hh
-+++ b/src/platform.hh
-@@ -192,7 +192,7 @@
- #  endif
- #elif defined(__OR1K__)
- #  define FFI_ARCH FFI_ARCH_OR1K
--#  define FFO_ARCH_NAME "or1k"
-+#  define FFI_ARCH_NAME "or1k"
- #elif defined(__riscv) || defined(__riscv__)
- #  if __riscv_xlen == 32
- #    define FFI_ARCH FFI_ARCH_RV32
diff --git a/package/lua-cffi/lua-cffi.hash b/package/lua-cffi/lua-cffi.hash
index 318f60fef..c036a702b 100644
--- a/package/lua-cffi/lua-cffi.hash
+++ b/package/lua-cffi/lua-cffi.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1d2577a62a843e5e6db35af1b58300d279b4df58eccef5e823441501f960d388  lua-cffi-0.2.3.tar.gz
-sha256  f5653a4d5864a3920ea1e07dacfd646067314be647598f0acaaf685beaa2e396  COPYING.md
+sha256  89e418e734c3628d4169fe5d237dff3f7769d0c42de5ed8b484a404f42cdc061  lua-cffi-0.2.4.tar.gz
+sha256  38211991cb0a5685f962f231a013d416330c9a33e7797f35f635034349751668  COPYING.md
diff --git a/package/lua-cffi/lua-cffi.mk b/package/lua-cffi/lua-cffi.mk
index f0127b335..bc1f20c0d 100644
--- a/package/lua-cffi/lua-cffi.mk
+++ b/package/lua-cffi/lua-cffi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_CFFI_VERSION = 0.2.3
+LUA_CFFI_VERSION = 0.2.4
 LUA_CFFI_SITE = $(call github,q66,cffi-lua,v$(LUA_CFFI_VERSION))
 LUA_CFFI_LICENSE = MIT
 LUA_CFFI_LICENSE_FILES = COPYING.md
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
