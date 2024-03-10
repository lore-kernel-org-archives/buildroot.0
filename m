Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907F6C54E49
	for <buildroot@archiver.kernel.org>; Sun, 10 Mar 2024 16:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3294E400F8;
	Sun, 10 Mar 2024 16:31:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id awUGQhHrw_OU; Sun, 10 Mar 2024 16:31:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3250840470
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3250840470;
	Sun, 10 Mar 2024 16:31:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 914281BF3E5
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 16:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B1856072C
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 16:31:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P61UsT7ltCFU for <buildroot@lists.busybox.net>;
 Sun, 10 Mar 2024 16:31:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 421976062E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 421976062E
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 421976062E
 for <buildroot@buildroot.org>; Sun, 10 Mar 2024 16:31:56 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-413277347efso1942155e9.0
 for <buildroot@buildroot.org>; Sun, 10 Mar 2024 09:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710088313; x=1710693113;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+1NwhkON9uj4L44vu8qqIjJOu8HXhjDUQX1wEhBx2co=;
 b=GNwtW2Gt/BwCIkqLkKmhqI1r9XbeSs3Pz79cGOrAR5JoMyZ9dZJGoHL1tLbtCrrjap
 k3eb9oPiOQhs8SUpFcuZc+mNJeznQmQ4c9Tjcu6Hpd7vatS1V1fS4d8Xe/5Du3M4MXHp
 ubR0Vrasav5K3/oxmZ5fDI9wz7UWz+20IZaHZ8Ep5vQMk49Jo3upqx9yN0Egv9FUwlIa
 JK/q6LIY8QGTTwV4E77jktDTa4H/rbX2UN9uzb7HGvQjwOvxQpRS+kwVeS4T1oB0n/+k
 9PAmTVa9MAJAY8VKXh7qstOZRZ2PTcgXMfeLwOp7CfLe2hBqtixnjqJ4uYoxjSSHiYJB
 elqg==
X-Gm-Message-State: AOJu0YwxXzMHORvMyfHNKeNwkF1C30yT8GSK/njrOI8lBj9DNSCARbEd
 lf6BxG94JcNOOZbsEZMwgGzGo0A2JiFVnDMTDlVxXvXbfd2os1mUkNAvry+o
X-Google-Smtp-Source: AGHT+IFF1AcSFQ3VEetGWnOKxYTK0jXSiMD9BdppGTJfWmEqe51PS1MSk9WJrBZnvxccT+zJoOVUIg==
X-Received: by 2002:a05:600c:511d:b0:412:e0f7:ef52 with SMTP id
 o29-20020a05600c511d00b00412e0f7ef52mr4755689wms.19.1710088313031; 
 Sun, 10 Mar 2024 09:31:53 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 gw7-20020a05600c850700b004131cf78b4bsm6920085wmb.12.2024.03.10.09.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Mar 2024 09:31:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Mar 2024 17:31:50 +0100
Message-ID: <20240310163150.4373-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710088313; x=1710693113; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+1NwhkON9uj4L44vu8qqIjJOu8HXhjDUQX1wEhBx2co=;
 b=GlTJKQV84cqSJx99HdamwChDW7JGKTYJ85pXjcSJAYpTi3apgFByNGXSNiqGtFtIOj
 tPlTnR31wrLvI0Gry+9vCqesp/VcQbT2ABNfIw3sJfkRKgjbPSxpdjio8L2fYntWdZeV
 Ast2hblcLH4CA4tEq0tuHFi3Ks97CYyWrcNB2rJAPT73m2ckf/vY202dv10se6krXa8L
 ZoL4EFXwaPJ35HyKrlxWAUoEfpzBgP9cR+hAXrxykj8+v4ZRp4O1kTrMzWIViyurI7K7
 jESxIhLM1F8eV4pg6pnXK+CPfqo6b/ZpgP8lm4kn5FHnzj44295SOfmE22OoNlq+Y9qG
 FGQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GlTJKQV8
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: disable -Werror
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable -Werror to fix the following build failure raised at least since
bump to version 3.9.0 in commit e76d9868c940f2d19968077b97e79c49376aa464
and
https://github.com/zhaojh329/libuhttpd/commit/81db1fa371bc80f40c1bfe60010e7d64bdf30b46:

/home/autobuild/autobuild/instance-8/output-1/build/libuhttpd-3.14.1/src/file.c: In function '__serve_file':
/home/autobuild/autobuild/instance-8/output-1/build/libuhttpd-3.14.1/src/file.c:322:50: error: format '%llu' expects argument of type 'long long unsigned int', but argument 4 has type '__off_t' {aka 'long int'} [-Werror=format=]
  322 |         conn->send_header(conn, "Content-Range", "bytes */%" PRIu64, st->st_size);
      |                                                  ^~~~~~~~~~~         ~~~~~~~~~~~
      |                                                                        |
      |                                                                        __off_t {aka long int}
In file included from /home/autobuild/autobuild/instance-8/output-1/build/libuhttpd-3.14.1/src/file.c:36:
/home/autobuild/autobuild/instance-8/output-1/per-package/libuhttpd/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/inttypes.h:91:41: note: format string is defined here
   91 | # define PRIu64         __PRI64_PREFIX "u"
cc1: all warnings being treated as errors

Fixes: e76d9868c940f2d19968077b97e79c49376aa464
 - http://autobuild.buildroot.org/results/46349a1409f9cff027b462456078284459e75511

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...akeLists.txt-add-BUILD_WERROR-option.patch | 30 +++++++++++++++++++
 package/libuhttpd/libuhttpd.mk                |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 package/libuhttpd/0003-CMakeLists.txt-add-BUILD_WERROR-option.patch

diff --git a/package/libuhttpd/0003-CMakeLists.txt-add-BUILD_WERROR-option.patch b/package/libuhttpd/0003-CMakeLists.txt-add-BUILD_WERROR-option.patch
new file mode 100644
index 0000000000..2e87014e87
--- /dev/null
+++ b/package/libuhttpd/0003-CMakeLists.txt-add-BUILD_WERROR-option.patch
@@ -0,0 +1,30 @@
+From c0f2260d8b7e435bce765e7ac91d51f1b349b87b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 10 Mar 2024 13:43:12 +0100
+Subject: [PATCH] CMakeLists.txt: add BUILD_WERROR option
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/zhaojh329/libuhttpd/commit/c0f2260d8b7e435bce765e7ac91d51f1b349b87b
+---
+ CMakeLists.txt | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6fb9651..6719e5f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -7,7 +7,13 @@ include(CheckLibraryExists)
+ list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules/")
+ 
+ add_definitions(-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64)
+-add_compile_options(-O -Wall -Werror --std=gnu99)
++add_compile_options(-O -Wall --std=gnu99)
++
++option(BUILD_WERROR "Build with -Werror" ON)
++
++if(BUILD_WERROR)
++    add_compile_options(-Werror)
++endif()
+ 
+ option(BUILD_STATIC "Build static library" OFF)
+ 
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index 0d5306c6dd..78e0f42b22 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -10,6 +10,7 @@ LIBUHTTPD_LICENSE = MIT
 LIBUHTTPD_LICENSE_FILES = LICENSE
 LIBUHTTPD_INSTALL_STAGING = YES
 LIBUHTTPD_DEPENDENCIES = libev
+LIBUHTTPD_CONF_OPTS = -DBUILD_WERROR=OFF
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBUHTTPD_DEPENDENCIES += openssl
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
