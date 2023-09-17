Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A63CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 18:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 079A560774;
	Sun, 17 Sep 2023 18:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 079A560774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EXGAtHTdGN0J; Sun, 17 Sep 2023 18:51:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02427608B7;
	Sun, 17 Sep 2023 18:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02427608B7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95C001BF3D1
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 18:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68C4A410D5
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 18:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68C4A410D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MeTI5S1GJlIR for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 18:51:21 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 444974005B
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 18:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 444974005B
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3214cdb4b27so353442f8f.1
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 11:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694976679; x=1695581479;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wYrsuKK7JrGrLP3MttJISN4GmKf1r3GLkBXxMGiSgok=;
 b=vOdOn6F1CSICHCB2CdMXDUIhMu3aiJANSWEj4V9V4VafJsqiWubE0G5rADBPmfZ0M1
 hAiyh+3jVYBh4YR9eZTBAqd9MSl4PVlqhEX5yyefUIYVqC04GPHuT4ayv48CFzXi7NaX
 fPn9kS9kZeIi4Ax5FA2Cclkjg+HLPWhds4Ek4mecgCN7gy3yM752BzvuCPbt4tjZdUOm
 huXluOmB6YpOfK8YhFtMqTL2cJgSwIISB/oXDPCwB/7Yn8VNbi5GYhQSjynz7Zp6ojWS
 AJ+LSPFbvjfoQwBX9zH0iazFNB+9q6ANcfy3gZJBKZETRgA1c6Ox08utXD8lHoAdXAc4
 6otg==
X-Gm-Message-State: AOJu0YwFuYM57xVJHYF+PsU6JRoh4Wv7zRezlE8NcA3owB/f+zCIyYFc
 dmD3aLLrKLWqeWo4E3qQey4x2eTTSgc=
X-Google-Smtp-Source: AGHT+IGQS6YivwL8ADxV+Itck6+lc4XuZcGHGMePIihFcH7hNWk4lIV0vKf0kY3hJf0A29SUIMWfkg==
X-Received: by 2002:a5d:4e46:0:b0:31a:d2f9:7372 with SMTP id
 r6-20020a5d4e46000000b0031ad2f97372mr5859040wrt.29.1694976678646; 
 Sun, 17 Sep 2023 11:51:18 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m18-20020a5d4a12000000b0031f65cdd271sm10308071wrq.100.2023.09.17.11.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Sep 2023 11:51:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 20:51:16 +0200
Message-Id: <20230917185116.182810-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694976679; x=1695581479; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wYrsuKK7JrGrLP3MttJISN4GmKf1r3GLkBXxMGiSgok=;
 b=HkmoVSR9Xe6nHskJ1h3yHosoTZpOQBCb9R/sTF7oAEaFNrOrQw2j1FMoxB1IgqKUZL
 Y6M2c6JN2gfn4YhO9L02m1x5Sy4i6lWtF1vftaU/5Z6/vvy3ok+E5nsgqTBfjFjU5NVC
 RlC0PKnutajcPKYfrjAgGvhOLtnKva3j+Vqfm0VKo8TfRWadCbzWBBY34NPyHcLkWV7p
 pbYKk7t2cINukg9eL9NOL2tiR3mco0Zsir6sqz+54Q0BKsSB4kFf8sp19a4FxnpYnvAn
 XH/MXqDokxLolxMAq5D8iRKaEYviXLDYhb9tYDNg0AvJeujpkMIj08DMh+WNlUSQMk7Q
 u9gQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HkmoVSR9
Subject: [Buildroot] [PATCH 1/1] package/libglib2: fix atomic handling
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Correctly fix atomic handling to avoid the following build failure with
all users of libglib2 (e.g. gdk-pixbuf) raised since bump to version
2.76.1 in commit 3f9622fe3d85b4d9f734b879abc1d485afea19b2:

/usr/lib/libglib-2.0.a(gthread-posix.c.o): in function `g_mutex_trylock':
gthread-posix.c:(.text+0xda8): undefined reference to `__atomic_compare_exchange_4'

Fixes:
 - http://autobuild.buildroot.org/results/24a358869b98d83ab374c7c3a185ced450064d35

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0004-link-with-latomic-when-needed.patch  | 45 +++++++++++++++++++
 package/libglib2/libglib2.mk                  |  5 ---
 2 files changed, 45 insertions(+), 5 deletions(-)
 create mode 100644 package/libglib2/0004-link-with-latomic-when-needed.patch

diff --git a/package/libglib2/0004-link-with-latomic-when-needed.patch b/package/libglib2/0004-link-with-latomic-when-needed.patch
new file mode 100644
index 0000000000..275d86032b
--- /dev/null
+++ b/package/libglib2/0004-link-with-latomic-when-needed.patch
@@ -0,0 +1,45 @@
+From d1814dbd3a88c95a43d4c9805bb4a523cf62d97b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 17 Sep 2023 20:42:00 +0200
+Subject: [PATCH] link with -latomic when needed
+
+Some architecture such as sparc and some flavors of arm needs -latomic
+to avoid the following build failure:
+
+gthread-posix.c:(.text+0xda8): undefined reference to `__atomic_compare_exchange_4'
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3586
+---
+ glib/meson.build | 1 +
+ meson.build      | 2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/glib/meson.build b/glib/meson.build
+index c26a35e42..7a761306b 100644
+--- a/glib/meson.build
++++ b/glib/meson.build
+@@ -426,6 +426,7 @@ libglib = library('glib-2.0',
+     pcre2,
+     platform_deps,
+     thread_dep,
++    atomic_dep
+   ],
+   c_args : glib_c_args,
+   objc_args : glib_c_args,
+diff --git a/meson.build b/meson.build
+index 25ae10fc2..5ae84b3b3 100644
+--- a/meson.build
++++ b/meson.build
+@@ -2130,6 +2130,8 @@ libffi_dep = dependency('libffi', version : '>= 3.0.0')
+ 
+ libz_dep = dependency('zlib')
+ 
++atomic_dep = cc.find_library('atomic', required: false)
++
+ # First check in libc, fallback to libintl, and as last chance build
+ # proxy-libintl subproject.
+ # FIXME: glib-gettext.m4 has much more checks to detect broken/uncompatible
+-- 
+2.40.1
+
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index c06ded2a5b..bffc565f11 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -64,11 +64,6 @@ ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 LIBGLIB2_DEPENDENCIES += elfutils
 endif
 
-# Uses __atomic_compare_exchange_4
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-LIBGLIB2_LDFLAGS += -latomic
-endif
-
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 LIBGLIB2_DEPENDENCIES += libiconv
 endif
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
