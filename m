Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C81C3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 09:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A20A40575;
	Sun, 21 Jul 2024 09:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpyhHtT9iYhI; Sun, 21 Jul 2024 09:06:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAC73404A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAC73404A0;
	Sun, 21 Jul 2024 09:06:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A35A1BF31B
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 09:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8309E60759
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 09:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lRdIfsAdMqmy for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 09:06:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 36B9260755
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36B9260755
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36B9260755
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 09:06:24 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3685b3dbcdcso1572288f8f.3
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 02:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721552782; x=1722157582;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=86CAwvScoEDUyxy2tMBuPr6kKeRKgRlGCFkF1ySrZFM=;
 b=NAEbRZbrHiAlfJNs5Y7EiWuxhkwyOxjNOaYvrqNQdkK059h05hcmAgq3WIlNY/FsNJ
 ICkHTnNrZsu/JU9HCL6r4zOeQUwjaAshHnEfp/7DvNg0cegRXn5pOnGM7OZGIA+MnbCf
 pQEzXGnaZ/c6DYXWi4VdGwRSJ5c1W/q03hKY6vi2lK96aCkN3kk8U1bSpR6pgRogNByN
 3Zlr2CizXsycYUwk+qy8LHVxrqbag5XVzcYzL0j4tQDtkrE9ApSNmkVifwXALMemcUdY
 h1kpWOHbCAxmTFkmgc0yS7QwJ3rkRzCx6kZD8WN8qof+fD6kmtJ0xvph5sSeOC0Yrx16
 rxwA==
X-Gm-Message-State: AOJu0YzBzWSAFY5ol99cA7WM6RppKW3aHGQHXR75xAz/1rLjbM9OeHab
 YL7jdl4q8iDxVnF3bT4A1Gdm0pjQ1OBET2LyL3pgBEViNSu3NoYuOkF3Rg==
X-Google-Smtp-Source: AGHT+IEPboXh7pWxGn14t4oc+yROZPZ9y5OMisKIkzmocNpg/cFyfZXVtHeQZo+CRjAAyAD2AqAcew==
X-Received: by 2002:a5d:64ca:0:b0:35f:122e:bd8c with SMTP id
 ffacd0b85a97d-369bae62d28mr2960778f8f.17.1721552781639; 
 Sun, 21 Jul 2024 02:06:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368786943d3sm5522770f8f.50.2024.07.21.02.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 02:06:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 11:06:17 +0200
Message-ID: <20240721090617.375263-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721552782; x=1722157582; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=86CAwvScoEDUyxy2tMBuPr6kKeRKgRlGCFkF1ySrZFM=;
 b=LcOhzu5ge1P5A7BTXdTzlO9Sz3zSw9JvyKtAUGHWD6D/v5r586JXY3O5Eyrcp1bG8k
 OPD9MoLwiRas+kmq/FyynjR1FALdFy3nYAKfBeaZ+ujqpbG7vBpC7OXcDdmbNODqx67a
 v02RGdXGuIFrRziI/AtJdcWkxeXZnE82JOTTlCBl24H/5xF5fCbs+hXr4anNDyz292A4
 2RTHL0iCurZQDqecnBIrUYGG6SwyKjN9HusYRl/YT491wRYBHDFV9tPlrNWPqFncrdFk
 IJCtIdeikYlhHzSvfJRopRUm8P1cf5ceKgbX6V4KKWEkrsBs4Wt2HJRYLOasE3lEixGz
 Cpww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LcOhzu5g
Subject: [Buildroot] [PATCH 1/1] package/rtmpdump: bump to latest git
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (not needed since
https://git.ffmpeg.org/gitweb/rtmpdump.git/commit/06142d3ef4754c9ebd6c4c5f52c858aa63811161)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                          |  1 -
 package/rtmpdump/0001-include-limits.h.patch | 39 --------------------
 package/rtmpdump/rtmpdump.hash               |  2 +-
 package/rtmpdump/rtmpdump.mk                 |  2 +-
 4 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 package/rtmpdump/0001-include-limits.h.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 84bcd88fee..66d427ae68 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1222,7 +1222,6 @@ package/rpi-userland/0005-dtmerge-add-missing-include-for-va_list.patch lib_patc
 package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch lib_patch.Upstream
 package/rpi-userland/0007-GLES2-gl2ext.h-add-GLint64-GLuint64-and-GLsync-typed.patch lib_patch.Upstream
 package/rt-tests/0001-Fix-a-build-issue-with-uClibc-ng.patch lib_patch.Upstream
-package/rtmpdump/0001-include-limits.h.patch lib_patch.Upstream
 package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch lib_patch.Upstream
 package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch lib_patch.Upstream
 package/rubix/0001-dont-use-legacy-functions.patch lib_patch.Upstream
diff --git a/package/rtmpdump/0001-include-limits.h.patch b/package/rtmpdump/0001-include-limits.h.patch
deleted file mode 100644
index 172a9630f7..0000000000
--- a/package/rtmpdump/0001-include-limits.h.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From b9d010d2c07e07eeffa510f14ff833ecb10dc0c8 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Mon, 24 Jun 2019 21:11:33 +0200
-Subject: [PATCH] include <limits.h>
-
-Needed after
-https://repo.or.cz/rtmpdump.git/commitdiff/c5f04a58fc2aeea6296ca7c44ee4734c18401aa3
-
-to fix
-
-rtmp.c: In function 'HTTP_read':
-rtmp.c:4459:26: error: 'INT_MAX' undeclared (first use in this function); did you mean 'INT8_MAX'?
-
-reported by buildroot autobuilders:
-http://autobuild.buildroot.net/?reason=rtmpdump-c5f04a58fc2aeea6296ca7c44ee4734c18401aa3
-
-Patch sent upstream by e-mail to author of
-https://repo.or.cz/rtmpdump.git/patch/c5f04a58fc2aeea6296ca7c44ee4734c18401aa3
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- librtmp/rtmp.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/librtmp/rtmp.h b/librtmp/rtmp.h
-index 6d7dd89..48d4fc3 100644
---- a/librtmp/rtmp.h
-+++ b/librtmp/rtmp.h
-@@ -32,6 +32,7 @@
- #include <errno.h>
- #include <stdint.h>
- #include <stddef.h>
-+#include <limits.h>
- 
- #include "amf.h"
- 
--- 
-2.20.1
-
diff --git a/package/rtmpdump/rtmpdump.hash b/package/rtmpdump/rtmpdump.hash
index feec5f4878..3aca9bda39 100644
--- a/package/rtmpdump/rtmpdump.hash
+++ b/package/rtmpdump/rtmpdump.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  810908e60c8f4e453bc828775937e4bad996fafac89b9546652f17e08a3dac81  rtmpdump-c5f04a58fc2aeea6296ca7c44ee4734c18401aa3-git4.tar.gz
+sha256  372b5574af90ad3ec8cb7fde9bb3db76f7f7379c135a31d7af2c1ebba3051526  rtmpdump-6f6bb1353fc84f4cc37138baa99f586750028a01-git4.tar.gz
 sha256  03fe7ca91cc28e99b4003d5b3bd4ce3b084d4c475fdf9975cf0e7fdf4dc739cd  librtmp/COPYING
diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index 4c8ecfe127..4dfacb594a 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTMPDUMP_VERSION = c5f04a58fc2aeea6296ca7c44ee4734c18401aa3
+RTMPDUMP_VERSION = 6f6bb1353fc84f4cc37138baa99f586750028a01
 RTMPDUMP_SITE = https://git.ffmpeg.org/rtmpdump
 RTMPDUMP_SITE_METHOD = git
 RTMPDUMP_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
