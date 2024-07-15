Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542ABC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 13:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9928C80CE3;
	Mon, 15 Jul 2024 13:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FWX3AXI52fbY; Mon, 15 Jul 2024 13:10:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 778E681151
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 778E681151;
	Mon, 15 Jul 2024 13:10:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B213A1BF3BE
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 13:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E094810F5
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 13:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cEd__GKXBtsx for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 13:09:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8067C80CE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8067C80CE3
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8067C80CE3
 for <buildroot@busybox.net>; Mon, 15 Jul 2024 13:09:53 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2eeb1ba040aso55974971fa.1
 for <buildroot@busybox.net>; Mon, 15 Jul 2024 06:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721048991; x=1721653791;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+PYjC6ivnnjsz44T/WlayGphx/bsi8iSLuJUuPtUqt0=;
 b=FCbbzKwc+O69R+qaKavMpjcqwBUyLMO9PBvVvdcgdQ4f7I/oPHnTZCCYiPPZ2PgH0t
 FjldANIc3mAjYqX8e40Y0QnUKaWK1dNwuuqQforAVB46fyC/qL23gnQWqLwfAVnPm1Bv
 Pm2gygZQxIkZfnxrSeENGzyrrPAUJy9CrrC/8RGLRt3maRBuaAiS50UanbwS7lOj94It
 89rmHEP7OU6w8GgbaZSoCu0X5G+HhBD4wveMIASsHknLo45utud4G5yqyu6xNv29n7lW
 Btu6Oy83vCh32bI8EF4MwGx0a2ijZ/wvV/rKP9xN9ZvnoGDwVWUGacaFNmZvCvAxZ+aa
 8BMw==
X-Gm-Message-State: AOJu0YxVFDiN2+/2koSR6rduZxy/MH3IdVI49a+xCSo2wne1N8F7eUf7
 IBC3H10lsPUmvfCDFpvHCZAnACOtZGXFlGbIhUPFTVEi7pe+rsXw2W0RMOR5IK9Sj0wQAB0HPXU
 =
X-Google-Smtp-Source: AGHT+IHc5A+RHZDR1/invUEQmR4Dpq9yWwNpCWLzsJtU2WzKXE79u35p/EYv5dCtQaMtn35SODidZA==
X-Received: by 2002:a2e:b059:0:b0:2ee:4a63:e927 with SMTP id
 38308e7fff4ca-2eeb3188c8dmr123091121fa.39.1721048990811; 
 Mon, 15 Jul 2024 06:09:50 -0700 (PDT)
Received: from vm-2404.. (140.33.66.37.rev.sfr.net. [37.66.33.140])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dab3cb0sm6359227f8f.10.2024.07.15.06.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 06:09:50 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 15 Jul 2024 15:09:40 +0200
Message-ID: <20240715130940.470769-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240715130940.470769-1-francois.perrad@gadz.org>
References: <20240715130940.470769-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1721048991; x=1721653791; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+PYjC6ivnnjsz44T/WlayGphx/bsi8iSLuJUuPtUqt0=;
 b=Gmp/D2+ezEEHvJD/+ClxTbgMu6MeD2LHx7HIk3rN5DoJZBtTe3w/kHHOz8Xh6fR/lk
 jerBYJpZdqD+90KqQXM/1/EgRCm596C5uMARiK3zKhZRH6fAbtQNox/AcxJUhgtSZJ8b
 s0CU9h6Nlay4/9owSq02a1RkegsfBeZbp0fgkrOVzuPEGYdJ96n7Q4lYiAFlyZQigOJy
 pbolmgY9nysU1K5ZaZmPA+zv4b1w6zMYlHCidRH7u91+sz77ZQ0PjjQA6J7/z31pfscn
 QCNY7i1GUcQlwLKMPWlTaSTUMEaGqLQnjRBkqRTrFn2y7sctlFkrmtgRBfsjY3fl8jbI
 OJag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=Gmp/D2+e
Subject: [Buildroot] [PATCH v2 3/3] package/lua: add tag Upstream in patches
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
 .checkpackageignore                              | 6 ------
 package/lua/5.1.5/0001-root-path.patch           | 1 +
 package/lua/5.1.5/0002-shared-libs-for-lua.patch | 1 +
 package/lua/5.3.6/0001-root-path.patch           | 1 +
 package/lua/5.3.6/0002-shared-libs-for-lua.patch | 1 +
 package/lua/5.4.7/0001-root-path.patch           | 1 +
 package/lua/5.4.7/0002-shared-libs-for-lua.patch | 1 +
 7 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4b7553b7a..b172b011e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -978,12 +978,6 @@ package/lua-gd/0001-Protect-declaration-of-LgdImageCreateFromPng-with-GD.patch l
 package/lua-lunix/0001-remove-link-with-librt.patch lib_patch.Upstream
 package/lua-sdl2/0001-Do-not-reference-host-directory-for-headers.patch lib_patch.Upstream
 package/lua-sdl2/0002-CMakeLists-do-not-require-C.patch lib_patch.Upstream
-package/lua/5.1.5/0001-root-path.patch lib_patch.Upstream
-package/lua/5.1.5/0002-shared-libs-for-lua.patch lib_patch.Upstream
-package/lua/5.3.6/0001-root-path.patch lib_patch.Upstream
-package/lua/5.3.6/0002-shared-libs-for-lua.patch lib_patch.Upstream
-package/lua/5.4.7/0001-root-path.patch lib_patch.Upstream
-package/lua/5.4.7/0002-shared-libs-for-lua.patch lib_patch.Upstream
 package/luajit/0001-no-bin-symlink.patch lib_patch.Upstream
 package/luajit/0002-install-inc.patch lib_patch.Upstream
 package/luasyslog/0001-remove-AX_LUA_LIBS.patch lib_patch.Upstream
diff --git a/package/lua/5.1.5/0001-root-path.patch b/package/lua/5.1.5/0001-root-path.patch
index fd0da6eb5..41de4ba2b 100644
--- a/package/lua/5.1.5/0001-root-path.patch
+++ b/package/lua/5.1.5/0001-root-path.patch
@@ -1,5 +1,6 @@
 Adjust installation location to /usr.
 
+Upstream: N/A specific for Buildroot build
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
 Index: b/etc/lua.pc
diff --git a/package/lua/5.1.5/0002-shared-libs-for-lua.patch b/package/lua/5.1.5/0002-shared-libs-for-lua.patch
index 3f863a530..5ae0756c4 100644
--- a/package/lua/5.1.5/0002-shared-libs-for-lua.patch
+++ b/package/lua/5.1.5/0002-shared-libs-for-lua.patch
@@ -3,6 +3,7 @@ Compile the lua binary with the shared library.
 And install the shared library.
 The variable BUILDMODE allows to switch between static and dynamic mode.
 
+Upstream: N/A specific for Buildroot build
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
 Index: b/Makefile
diff --git a/package/lua/5.3.6/0001-root-path.patch b/package/lua/5.3.6/0001-root-path.patch
index a44c55c95..b41df3ecb 100644
--- a/package/lua/5.3.6/0001-root-path.patch
+++ b/package/lua/5.3.6/0001-root-path.patch
@@ -1,5 +1,6 @@
 Adjust installation location to /usr.
 
+Upstream: N/A specific for Buildroot build
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
 Index: b/src/luaconf.h
diff --git a/package/lua/5.3.6/0002-shared-libs-for-lua.patch b/package/lua/5.3.6/0002-shared-libs-for-lua.patch
index 493828c9d..082100747 100644
--- a/package/lua/5.3.6/0002-shared-libs-for-lua.patch
+++ b/package/lua/5.3.6/0002-shared-libs-for-lua.patch
@@ -3,6 +3,7 @@ Compile the lua binary with the shared library.
 And install the shared library.
 The variable BUILDMODE allows to switch between static and dynamic mode.
 
+Upstream: N/A specific for Buildroot build
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
 Index: b/Makefile
diff --git a/package/lua/5.4.7/0001-root-path.patch b/package/lua/5.4.7/0001-root-path.patch
index 5e3037b78..cec9066ee 100644
--- a/package/lua/5.4.7/0001-root-path.patch
+++ b/package/lua/5.4.7/0001-root-path.patch
@@ -1,5 +1,6 @@
 Adjust installation location to /usr.
 
+Upstream: N/A specific for Buildroot build
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
 Index: b/src/luaconf.h
diff --git a/package/lua/5.4.7/0002-shared-libs-for-lua.patch b/package/lua/5.4.7/0002-shared-libs-for-lua.patch
index 388aa9966..611596095 100644
--- a/package/lua/5.4.7/0002-shared-libs-for-lua.patch
+++ b/package/lua/5.4.7/0002-shared-libs-for-lua.patch
@@ -3,6 +3,7 @@ Compile the lua binary with the shared library.
 And install the shared library.
 The variable BUILDMODE allows to switch between static and dynamic mode.
 
+Upstream: N/A specific for Buildroot build
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
 Index: b/Makefile
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
