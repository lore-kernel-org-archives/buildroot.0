Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3B8C3DA7F
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 08:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D3B581C46;
	Fri, 26 Jul 2024 08:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7DS_gBbLYFkC; Fri, 26 Jul 2024 08:29:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E28B812BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E28B812BB;
	Fri, 26 Jul 2024 08:29:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D0A071BF3B0
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 08:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE91440247
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 08:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynF2OFwlq2V0 for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 08:29:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2BDCF4049A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BDCF4049A
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2BDCF4049A
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 08:29:28 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42808071810so10547305e9.1
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 01:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721982566; x=1722587366;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U10Hk4NJfB59rIgb7tWfUe4Xx1/Djo857zrNXfjROcE=;
 b=RzcnhIkUVvtk/9WopFFuHUY+S4rJVzKnPS3Ohy+tFchxz1mf0rss9zjsGah+wtw/cT
 BKsZ+6lOT2e8WBmydfJt+9zc0RemOANinXk4rMCyeqJ4A1hshgyXNMPbbKRlHjNXPfc2
 TFAoPQREkilZonP9VO5QK9X5kABIXHS3JLiSL5IDFHRooo0rlTPPZZ+eeF+74zIVWGSG
 s5sk1apApx2P/RlDk5IJpIvnQLOl/E7ZH7hNEcBJ6dU+34pRdBRAKyXrhK+9VY/vgrDF
 ND7Hb/HgZdLcwkS55pQVfJbH0SqeiosmXAkOa8blomtRH9KTcQ0gG1CX0MoPrXRz3hTp
 I2BQ==
X-Gm-Message-State: AOJu0Yzhu7gG0nT3UXIdmm58YwZXXCHQHkyeuaiunQtHdaHuFeE5vE1J
 2Fsza70dcS9wl796TGwRq6fW6jNCa3D+SGlN7twjcQDhjkyHCHTcTro3Ag==
X-Google-Smtp-Source: AGHT+IFhIjWfI67hL3xfpIZydSCzXAdVjmp/qKkqUi4GFvUi+acVlFc94mGrVMoi95W2alCSJOmDzQ==
X-Received: by 2002:a5d:644e:0:b0:362:7c2e:e9f7 with SMTP id
 ffacd0b85a97d-36b363a2c64mr2945795f8f.32.1721982565472; 
 Fri, 26 Jul 2024 01:29:25 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367fd071sm4353047f8f.62.2024.07.26.01.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 01:29:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jul 2024 10:29:19 +0200
Message-ID: <20240726082919.892543-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721982566; x=1722587366; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U10Hk4NJfB59rIgb7tWfUe4Xx1/Djo857zrNXfjROcE=;
 b=nFb5823ypjTOwuGt+C0xgXuAyp7Q8YRV6YWFip84I448mfCb90BQYgDGhLxJn65TtE
 9uqxwH4GHDj7xYxi6xP9BLD35JKEPtleCHkWIkOJqMwsIDXMqWx37sEgWTgAlrOoiZ02
 YkJqXyLoRtqXRiKruuOVn6EHDKWGIEj5cNdCEw//PoaKcRKfySfa9K45sVoHXLIXb069
 mmAyTHq2Up1JbMLT6w9P5D+/WQZpSXXWwIPQgfCLXr6TQ2OWoE/8Q32SPCTq6ShG4TZs
 B196pomxtpwNax1K8HfYJ+LmqlCzwXzgf7INVnBtTvu6sR+S3iAqxbJM7yhH+T1X3l7e
 l8Cw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nFb5823y
Subject: [Buildroot] [PATCH 1/1] package/liburing: add -D_GNU_SOURCE in
 liburing.pc.in
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

Add -D_GNU_SOURCE to CFLAGS as liburing.h doesn't define it anymore
since bump of liburing to version 2.6 in commit
da45ae33040a55d9eaa6a05c75c5e7f24fe73cf4 and
https://github.com/axboe/liburing/commit/c427ed678f39fd144d784f2e970bd8c52f425e14
resulting in the following musl build failure since the addition of
libdex in commit 70319b47f646f74f407ed3355baf5b581a10518a:

In file included from ../src/dex-uring-aio-backend.c:29:
/home/autobuild/autobuild/instance-7/output-1/host/mips-buildroot-linux-musl/sysroot/usr/include/liburing.h:224:39: error: unknown type name 'cpu_set_t'
  224 |                                 const cpu_set_t *mask);
      |                                       ^~~~~~~~~
/home/autobuild/autobuild/instance-7/output-1/host/mips-buildroot-linux-musl/sysroot/usr/include/liburing.h:1212:48: error: unknown type name 'loff_t'; did you mean 'off_t'?
 1212 |                                        int fd, loff_t len)
      |                                                ^~~~~~
      |                                                off_t

Fixes: 70319b47f646f74f407ed3355baf5b581a10518a
 - http://autobuild.buildroot.org/results/276646bf224d5927cf0311cf978571a7f8774116

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ing.pc.in-add-D_GNU_SOuRCE-to-Cflags.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/liburing/0001-liburing.pc.in-add-D_GNU_SOuRCE-to-Cflags.patch

diff --git a/package/liburing/0001-liburing.pc.in-add-D_GNU_SOuRCE-to-Cflags.patch b/package/liburing/0001-liburing.pc.in-add-D_GNU_SOuRCE-to-Cflags.patch
new file mode 100644
index 0000000000..8bd11e4d54
--- /dev/null
+++ b/package/liburing/0001-liburing.pc.in-add-D_GNU_SOuRCE-to-Cflags.patch
@@ -0,0 +1,38 @@
+From 9485c21f8f36a78a754ccba3c4ce30867af9655d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 26 Jul 2024 09:13:16 +0200
+Subject: [PATCH] liburing.pc.in: add -D_GNU_SOuRCE to Cflags
+
+Add -D_GNU_SOURCE to Cflags to avoid the following musl build failure
+with applications using liburing (e.g. libdex) raised since version 2.6
+and c427ed678f39fd144d784f2e970bd8c52f425e14 which reverted
+c34070e08199491fe9653617364f4aea9b9b22be:
+
+In file included from ../src/dex-uring-aio-backend.c:29:
+/home/autobuild/autobuild/instance-7/output-1/host/mips-buildroot-linux-musl/sysroot/usr/include/liburing.h:224:39: error: unknown type name 'cpu_set_t'
+  224 |                                 const cpu_set_t *mask);
+      |                                       ^~~~~~~~~
+/home/autobuild/autobuild/instance-7/output-1/host/mips-buildroot-linux-musl/sysroot/usr/include/liburing.h:1212:48: error: unknown type name 'loff_t'; did you mean 'off_t'?
+ 1212 |                                        int fd, loff_t len)
+      |                                                ^~~~~~
+      |                                                off_t
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/axboe/liburing/pull/1189
+---
+ liburing.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/liburing.pc.in b/liburing.pc.in
+index 2c879b2..790c22e 100644
+--- a/liburing.pc.in
++++ b/liburing.pc.in
+@@ -9,4 +9,4 @@ Description: io_uring library
+ URL: https://git.kernel.dk/cgit/liburing/
+ 
+ Libs: -L${libdir} -luring
+-Cflags: -I${includedir}
++Cflags: -I${includedir} -D_GNU_SOURCE
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
