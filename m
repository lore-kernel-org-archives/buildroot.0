Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF55CC4706C
	for <buildroot@archiver.kernel.org>; Tue, 16 Jan 2024 06:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79F47419B8;
	Tue, 16 Jan 2024 06:58:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79F47419B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bFUGThDbOb4X; Tue, 16 Jan 2024 06:58:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06BB941A13;
	Tue, 16 Jan 2024 06:58:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06BB941A13
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBE721BF417
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 06:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A32DD41A27
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 06:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A32DD41A27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ewOnx5j2fJxD for <buildroot@lists.busybox.net>;
 Tue, 16 Jan 2024 06:58:39 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06FF941A00
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 06:58:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06FF941A00
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40e67e90d5aso34925215e9.1
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 22:58:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705388316; x=1705993116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IvKOSo3OedwF/8T3rCh1HwCLiyK0dHpYoq9pOTs6QNg=;
 b=CV123U8w1uzo5ZwKSkAVubdMdzca92XHzFdIsnPy8U4JtPvOmvXrC1CSFua91rsD7g
 e6tflnsDLPT+rAoxtQLymE5YlYQfFAVTQQeFyxz8coaGLXzi+1OX+brcOz+pz/ffBDGj
 XoS7Rs/Stw2z702lHrkaqz5zHw36fSqjRjkTlGhRRqQXYRAMcbT0qPzud/JaXGq9JYvT
 xdoyr1aXypldwwEwA68CRC5KzQUJ3muTORu2FGwNV6HmfUleJveyRkX3WMVXW/8ZYjNf
 j+AvWjhmUBC/trDALWfaC0/hlOVYGQjvh8GuIy3BV3BpbiUVHO7KAXbvl0MbCngv0HKS
 TvWg==
X-Gm-Message-State: AOJu0YySg1xiRmaTuUMfA2DkAxjjAzsxCN054mvoDOfO/K6/6KNRVDSL
 O2Le3TDEAVCx6COwCN8Unzy2IOiewpA=
X-Google-Smtp-Source: AGHT+IGP6tJBLrdsmXfon/q/SqSZVzJTydDsTEcqu8Dxv8TolaHzO6FORy0rr7Lv9MIRIJDYEorYcA==
X-Received: by 2002:a05:600c:3114:b0:40e:5a81:621e with SMTP id
 g20-20020a05600c311400b0040e5a81621emr3325931wmo.134.1705388316157; 
 Mon, 15 Jan 2024 22:58:36 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-239.w92-167.abo.wanadoo.fr.
 [92.167.208.239]) by smtp.gmail.com with ESMTPSA id
 bd15-20020a05600c1f0f00b0040e7df962eesm4125652wmb.14.2024.01.15.22.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 22:58:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 Jan 2024 07:58:31 +0100
Message-ID: <20240116065831.9471-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116065831.9471-1-fontaine.fabrice@gmail.com>
References: <20240116065831.9471-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705388316; x=1705993116; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IvKOSo3OedwF/8T3rCh1HwCLiyK0dHpYoq9pOTs6QNg=;
 b=Lg7aEi/ZPHG8HP7z2hVB+Q+4ifsO4Ej4/GtIpFVjZmBf3sC+WFG7qj0ZGEdAMcuJXQ
 Xo495yUuhdLmRFnQBL8vCICsU2Jtiwym6g5EsIfzsj85zjqo2VmyZl3rLdCDclnm1Kmb
 chh5EOLWzD5NxbSjAy0nXtElSjlYOdf9Juao1TDYhPocikbSJS+sb7LFzz0jh31iSb3q
 pg9ukxv0GR34AtQCZEp0WKrceFF/nv8GwmasyeidumOagLB/Aw07cXh5WfdDnQKsxdSM
 au1Ob7opoGKCFIPUgqcTA2y7uhn1e+RqJO2v2LZxoUB7nrbfdvTBw2aNTH3LZ+wb5xRK
 P+2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Lg7aEi/Z
Subject: [Buildroot] [PATCH v2, 2/2] package/attr: affected by gcc bug 101766
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

attr is affected by gcc bug 101766 since version 1.5.2 and
https://git.savannah.nongnu.org/cgit/attr.git/commit/?id=11b9069098b4d4c23efb06c9457a085b784354d4
resulting in the following build failure on microblaze since commit
b31b91296e7f985b909f104f06a098adddef1fea:

libattr/syscalls.c:133:10: error: symver is only supported on ELF platforms
  133 | # pragma GCC visibility pop
      |          ^~~

So let's disable package attr and packages depending on it.

Fixes:
 - http://autobuild.buildroot.org/results/29c76e02becedf922bd7dc0533338c078bf77d2a

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Giulio Benetti):
 - Update commit log
 - Update casync and lua-flu

 package/acl/Config.in     | 4 ++++
 package/attr/Config.in    | 4 ++++
 package/casync/Config.in  | 4 ++++
 package/lua-flu/Config.in | 4 ++++
 package/systemd/Config.in | 4 ++++
 5 files changed, 20 insertions(+)

diff --git a/package/acl/Config.in b/package/acl/Config.in
index 92f2251878..132c6e8ad3 100644
--- a/package/acl/Config.in
+++ b/package/acl/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ACL
 	bool "acl"
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_101766 # attr
 	select BR2_PACKAGE_ATTR
 	help
 	  POSIX Access Control Lists, which are used to define more
@@ -8,3 +9,6 @@ config BR2_PACKAGE_ACL
 	  This package also provides libacl.
 
 	  http://savannah.nongnu.org/projects/acl
+
+comment "acl needs a toolchain not affected by GCC bug 101766"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_101766
diff --git a/package/attr/Config.in b/package/attr/Config.in
index 554772b75d..b9d9f57d8f 100644
--- a/package/attr/Config.in
+++ b/package/attr/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_ATTR
 	bool "attr"
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_101766
 	help
 	  Commands for Manipulating Filesystem Extended Attributes.
 	  This package also provides libattr.
 
 	  http://savannah.nongnu.org/projects/attr
+
+comment "attr needs a toolchain not affected by GCC bug 101766"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_101766
diff --git a/package/casync/Config.in b/package/casync/Config.in
index 89a9520e35..c5be9b521e 100644
--- a/package/casync/Config.in
+++ b/package/casync/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CASYNC
 	bool "casync"
 	depends on BR2_TOOLCHAIN_USES_GLIBC # scandirat() is not implemented by musl and uclibc-ng
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_101766 # acl
 	select BR2_PACKAGE_ACL
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_OPENSSL
@@ -11,3 +12,6 @@ config BR2_PACKAGE_CASYNC
 
 comment "casync needs a glibc toolchain"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
+comment "casync needs a toolchain not affected by GCC bug 101766"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_101766
diff --git a/package/lua-flu/Config.in b/package/lua-flu/Config.in
index 9b55ce5ab0..ae343866c8 100644
--- a/package/lua-flu/Config.in
+++ b/package/lua-flu/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LUA_FLU
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
 	depends on BR2_USE_MMU # libfuse
 	depends on !BR2_PACKAGE_LUA_5_4
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_101766 # attr
 	select BR2_PACKAGE_ATTR
 	select BR2_PACKAGE_LIBFUSE
 	help
@@ -17,3 +18,6 @@ config BR2_PACKAGE_LUA_FLU
 comment "lua-flu needs a toolchain w/ threads, dynamic library, Lua <= 5.3"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || BR2_PACKAGE_LUA_5_4
+
+comment "lua-flu needs a toolchain not affected by GCC bug 101766"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_101766
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 859332d9e4..f0f92b78b0 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -451,6 +451,7 @@ config BR2_PACKAGE_SYSTEMD_RFKILL
 
 config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
 	bool "enable SMACK support"
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_101766 # attr
 	select BR2_PACKAGE_ATTR
 	select BR2_PACKAGE_SMACK
 	help
@@ -463,6 +464,9 @@ config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
 	  When this feature is enabled, Systemd mounts smackfs and
 	  manages security labels for sockets.
 
+comment "SMACK support needs a toolchain not affected by GCC bug 101766"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_101766
+
 config BR2_PACKAGE_SYSTEMD_SYSEXT
 	bool "enable sysext support"
 	help
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
