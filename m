Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88C3C38145
	for <buildroot@archiver.kernel.org>; Sat,  3 Sep 2022 13:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34BBF827AA;
	Sat,  3 Sep 2022 13:58:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34BBF827AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zxpP6NClr9dY; Sat,  3 Sep 2022 13:58:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29BEC81B25;
	Sat,  3 Sep 2022 13:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29BEC81B25
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A7FF1BF616
 for <buildroot@lists.busybox.net>; Sat,  3 Sep 2022 13:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31FC981B25
 for <buildroot@lists.busybox.net>; Sat,  3 Sep 2022 13:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31FC981B25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ByuGLe6_wUoI for <buildroot@lists.busybox.net>;
 Sat,  3 Sep 2022 13:58:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1353D81A95
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1353D81A95
 for <buildroot@busybox.net>; Sat,  3 Sep 2022 13:58:50 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id h1so2787300wmd.3
 for <buildroot@busybox.net>; Sat, 03 Sep 2022 06:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=USyuqh46sJiq4ld7hVKu9XJ1jRkdjlnG02OjgR2R3OI=;
 b=b54XZpgICJvrxNkpOEV244JIHuiGhs4LL8jQWIMQYKbRzxWNudStWktbtP8sREQEJk
 T0ZKLx9nJbWLf0h/YhgC2y22aQvLLUFQTAmPwi7jKOExTmTrJTbCVhrT2FIwbZrqJuqF
 8MKSHZlen7o4Q/HykHi9myiibz0aRMTPj0+7fnAssRafYrhfYGQN4sDY/H9yYjQMXulW
 Crw88A/d1jZisKOfvfFwdwKtQa7WxRG4ISsm97r73FulCqFsNzm45/JJHAZUyuCu3p6M
 xO+pZVIG4rGqsvd+Sv/M+eoW67+WfJR2upgTOU0C7R4Z9mJXDnDq7xUplvQTrR6/ncUX
 UYpQ==
X-Gm-Message-State: ACgBeo3k/QLrjE03IBT/MsJWGH07GPHn3nPYh7Nf9kEiAPilyCY6m+l5
 VSZM842y6N6cYGGBvGyohikBQQkfbSw=
X-Google-Smtp-Source: AA6agR7mk+YGA1QDk8rWLChcmvaUF130w3hfwTH7/cHEq6qeYgycbJNjXNyjQkcJsC6CxsfAmoivXw==
X-Received: by 2002:a05:600c:216:b0:3a6:60e1:2726 with SMTP id
 22-20020a05600c021600b003a660e12726mr5769799wmi.182.1662213528149; 
 Sat, 03 Sep 2022 06:58:48 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 q185-20020a1c43c2000000b003a5f783abb8sm11330720wma.30.2022.09.03.06.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Sep 2022 06:58:47 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  3 Sep 2022 15:58:40 +0200
Message-Id: <20220903135840.2001959-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=USyuqh46sJiq4ld7hVKu9XJ1jRkdjlnG02OjgR2R3OI=;
 b=j1cTL/a9JBkKb0yeQDV1/amcOMwbivmaffFw6s8Clw9hgQwMGlSz1o95qcDndrgfwM
 v7x6RP2uesQoFWQ7X0JzEa36A4f9DU4IF2VYSN0/mUxlKzOltb3Y4O3Xit5S7ZotyD+s
 fX4Iyo0BCIV79Ad+sU/dupQ139Iazl4qKgHpNQ/oZ5jL9eS9ms5Ekv6Am41Ds3hmgLkf
 JIVL+/VQnx7kd9YQ3W9tS0FAxT8mNLjQMGDFUamXzzP0fL3c1Y5wctexK2EZ8lVi2zDr
 Owj68lQoz+5JzvTLcObOr2p2QCWbsd4Sh3hNjos6c1P6/bsuQlv0U2ZAlkqmKuVLQ24S
 AEdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=j1cTL/a9
Subject: [Buildroot] [PATCH] package/lua-lunix: bump to version 20220331
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

remove merged patches

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-lunix/0001-fix-with-uClibc.patch  | 28 -------------------
 ...atch => 0001-remove-link-with-librt.patch} |  8 +++---
 .../lua-lunix/0003-fix-sysctl-detection.patch | 24 ----------------
 package/lua-lunix/lua-lunix.hash              |  4 +--
 package/lua-lunix/lua-lunix.mk                |  2 +-
 5 files changed, 7 insertions(+), 59 deletions(-)
 delete mode 100644 package/lua-lunix/0001-fix-with-uClibc.patch
 rename package/lua-lunix/{0002-remove-link-with-librt.patch => 0001-remove-link-with-librt.patch} (70%)
 delete mode 100644 package/lua-lunix/0003-fix-sysctl-detection.patch

diff --git a/package/lua-lunix/0001-fix-with-uClibc.patch b/package/lua-lunix/0001-fix-with-uClibc.patch
deleted file mode 100644
index 236eec47a..000000000
--- a/package/lua-lunix/0001-fix-with-uClibc.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From ee41d97a80b978f54941ac6857c00b8a8f28de24 Mon Sep 17 00:00:00 2001
-From: Francois Perrad <francois.perrad@gadz.org>
-Date: Sun, 6 Jun 2021 17:55:06 +0200
-Subject: [PATCH] fix with uClibc
-
-uClibc doesn't have is no sys_siglist.
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
----
- lunix-rel-20170920/src/unix.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lunix-rel-20170920/src/unix.c b/lunix-rel-20170920/src/unix.c
-index 5f3a70a..e561ab2 100644
---- a/lunix-rel-20170920/src/unix.c
-+++ b/lunix-rel-20170920/src/unix.c
-@@ -438,7 +438,7 @@
- #endif
- 
- #ifndef HAVE_SYS_SIGLIST
--#define HAVE_SYS_SIGLIST (!MUSL_MAYBE && !__sun && !_AIX)
-+#define HAVE_SYS_SIGLIST (!MUSL_MAYBE && !__sun && !_AIX && !__UCLIBC__)
- #endif
- 
- #ifndef HAVE_UNLINKAT
--- 
-2.30.2
-
diff --git a/package/lua-lunix/0002-remove-link-with-librt.patch b/package/lua-lunix/0001-remove-link-with-librt.patch
similarity index 70%
rename from package/lua-lunix/0002-remove-link-with-librt.patch
rename to package/lua-lunix/0001-remove-link-with-librt.patch
index 7b1c8ddd5..2650e9117 100644
--- a/package/lua-lunix/0002-remove-link-with-librt.patch
+++ b/package/lua-lunix/0001-remove-link-with-librt.patch
@@ -7,13 +7,13 @@ librt is not available with musl
 
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 ---
- lunix-rel-20170920/lunix-20170920-1.rockspec | 10 ----------
+ lunix-rel-20220331/lunix-20220331-1.rockspec | 10 ----------
  1 file changed, 10 deletions(-)
 
-diff --git a/lunix-rel-20170920/lunix-20170920-1.rockspec b/lunix-rel-20170920/lunix-20170920-1.rockspec
+diff --git a/lunix-rel-20220331/lunix-20220331-1.rockspec b/lunix-rel-20220331/lunix-20220331-1.rockspec
 index 741179d..76cafeb 100644
---- a/lunix-rel-20170920/lunix-20170920-1.rockspec
-+++ b/lunix-rel-20170920/lunix-20170920-1.rockspec
+--- a/lunix-rel-20220331/lunix-20220331-1.rockspec
++++ b/lunix-rel-20220331/lunix-20220331-1.rockspec
 @@ -26,16 +26,6 @@ build = {
  		};
  	};
diff --git a/package/lua-lunix/0003-fix-sysctl-detection.patch b/package/lua-lunix/0003-fix-sysctl-detection.patch
deleted file mode 100644
index 18656b192..000000000
--- a/package/lua-lunix/0003-fix-sysctl-detection.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-sys/sysctl.h was removed with glibc 2.32
-
-Fetched from: https://github.com/wahern/lunix/pull/20/files
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
----
- lunix-rel-20170920/src/unix.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lunix-rel-20170920/src/unix.c b/lunix-rel-20170920/src/unix.c
-index 272820a..fa00876 100644
---- a/lunix-rel-20170920/src/unix.c
-+++ b/lunix-rel-20170920/src/unix.c
-@@ -165,7 +165,7 @@
- #endif
- 
- #ifndef HAVE_SYS_SYSCTL_H /* missing on musl libc */
--#define HAVE_SYS_SYSCTL_H (defined BSD || GLIBC_PREREQ(0,0) || UCLIBC_PREREQ(0,0,0))
-+#define HAVE_SYS_SYSCTL_H (defined BSD || (__GLIBC__ && !GLIBC_PREREQ(2,32)) || UCLIBC_PREREQ(0,0,0))
- #endif
- 
- #ifndef HAVE_STRUCT_IN_PKTINFO
--- 
-2.30.2
-
diff --git a/package/lua-lunix/lua-lunix.hash b/package/lua-lunix/lua-lunix.hash
index 6e3c920db..911f475b0 100644
--- a/package/lua-lunix/lua-lunix.hash
+++ b/package/lua-lunix/lua-lunix.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  4a4007b394ae884e18e9d0319ea584e8b4a682d7bf8fa5b99c7eea9baf1e5ed6  lunix-20170920-1.src.rock
-sha256  9b74be104d59caa45bf3321ebe771f9cc7874209261a93f1cf971ceca44fbe03  lunix-rel-20170920/LICENSE
+sha256  eb13e89e1dfcc82aec3915ed4185f3a2a9205ec3e98a991b13cc39d7f389c427  lunix-20220331-1.src.rock
+sha256  9b74be104d59caa45bf3321ebe771f9cc7874209261a93f1cf971ceca44fbe03  lunix-rel-20220331/LICENSE
diff --git a/package/lua-lunix/lua-lunix.mk b/package/lua-lunix/lua-lunix.mk
index 28cb2dc41..f3c159cbf 100644
--- a/package/lua-lunix/lua-lunix.mk
+++ b/package/lua-lunix/lua-lunix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LUNIX_VERSION_UPSTREAM = 20170920
+LUA_LUNIX_VERSION_UPSTREAM = 20220331
 LUA_LUNIX_VERSION = $(LUA_LUNIX_VERSION_UPSTREAM)-1
 LUA_LUNIX_NAME_UPSTREAM = lunix
 LUA_LUNIX_SUBDIR = lunix-rel-$(LUA_LUNIX_VERSION_UPSTREAM)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
