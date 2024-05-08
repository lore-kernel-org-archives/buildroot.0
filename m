Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE8DC04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 12:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6317C400E7;
	Wed,  8 May 2024 12:01:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8-kX4jRKMJ5N; Wed,  8 May 2024 12:01:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70A3C40364
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70A3C40364;
	Wed,  8 May 2024 12:01:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D9F01BF391
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 12:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7621382CFD
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 12:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sE3suZ5jTWBM for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 12:01:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E7ED382CFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7ED382CFA
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7ED382CFA
 for <buildroot@buildroot.org>; Wed,  8 May 2024 12:01:14 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-51f29e80800so4625738e87.2
 for <buildroot@buildroot.org>; Wed, 08 May 2024 05:01:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715169672; x=1715774472;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3IsyPFWuey6XgMj27kr5aVRKaHyH93Li/3Zkz6jb7VI=;
 b=AuOIYSAZCWbg4hwO7IhXIfVGe/QuKhGmcs2NpEjxh2wHH3GFu6A1lo+I/Rqq7VfKHa
 /qCYbRMzzP/aoU+7QQzQFYbc2PiGEOFtX+uXXkTtVQB+Xyh6iZm6OFb1ZqpWeO5cWz0e
 jxzHLF8PlAyIHiq7MR7vJubuGwCrTz1znO00B4CbdKIP1p6U8c8+iDxnplOqcyIA2ZLQ
 hgA5kqDumaIrOxJYRLY1SeGEqkjXu04HHyVbgqvKGS0VNWbvFXZNFlr1z5SJ9Ql9D2aV
 lICMhX8Qp4f2S7FsYSQ0autU/r6hskP/bbmjrdyz2P5u5lLprilFVOLpmdaCXjHmJ0Yg
 603A==
X-Gm-Message-State: AOJu0YxUj6Az2WhjGrMvTugVLIo8Od0vHeG3c62uQYmJia0CbCrzvfAe
 ShZ6gqt7oLNOkQPy1/I9hHFiyWVtOx2sXndmUuU8/O5OEPW7WccmFnp/fw==
X-Google-Smtp-Source: AGHT+IEyyQoZNepSzmhTH3RqdS52KNnSbi8Ags8yIalikCAZH6JmW//gsIMCAxDwunR93iHaNd/r7w==
X-Received: by 2002:ac2:5b12:0:b0:521:44ce:2999 with SMTP id
 2adb3069b0e04-5217cd49f62mr1528694e87.47.1715169672004; 
 Wed, 08 May 2024 05:01:12 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 s14-20020adfe00e000000b0034e553f6174sm13610660wrh.98.2024.05.08.05.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 05:01:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 May 2024 14:00:57 +0200
Message-ID: <20240508120057.791378-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715169672; x=1715774472; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3IsyPFWuey6XgMj27kr5aVRKaHyH93Li/3Zkz6jb7VI=;
 b=AxoIDJSFqdBwt7nPBt54nRCDiQWj0qUEUUFNFjns8wl6HXRucpzuhIuHXdEyXlSh/S
 OgJgkQTRiNxXs+Tl/ZiOuPG8ErqufegE9M1gcsaH87Qzq4mnUSVwhzUyd4cU3frZsxKl
 UQlWzrPFCktDAXlEuOZlE56NXklWkmNYbgS3SPsw+m5QnMf8eTzT2PlNdyi7W8GVIE00
 /KdY6jbsm8IlZnvkWlTMzg+Sul3JGFwYCnSsANpX8jjPD5oOMZN4RX8QpdfWreosOd9J
 Z5aD974jLVc8dHgyYGCinJ3iH8nbZa18Fa0MVBAV8Cwtp5nrmw/PbquisiQ1/fPdWyNz
 /SsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AxoIDJSF
Subject: [Buildroot] [PATCH 1/1] package/mdadm: replace PIE workaround
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

Replace PIE workaround added by commit
826e0bc3360ac1daa3581232c52ee47697bfabc6 by an upstream patch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0004-Makefile-Move-pie-to-LDFLAGS.patch   | 40 +++++++++++++++++++
 package/mdadm/mdadm.mk                        |  2 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 package/mdadm/0004-Makefile-Move-pie-to-LDFLAGS.patch

diff --git a/package/mdadm/0004-Makefile-Move-pie-to-LDFLAGS.patch b/package/mdadm/0004-Makefile-Move-pie-to-LDFLAGS.patch
new file mode 100644
index 0000000000..4d46d58230
--- /dev/null
+++ b/package/mdadm/0004-Makefile-Move-pie-to-LDFLAGS.patch
@@ -0,0 +1,40 @@
+From 893a55831e5abbcd15b171db66fa1f389fb61506 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 7 May 2024 19:32:16 +0200
+Subject: Makefile: Move -pie to LDFLAGS
+
+Move -pie from LDLIBS to LDFLAGS and make LDFLAGS configurable to allow
+the user to drop it by setting their own LDFLAGS (e.g. PIE could be
+enabled or disabled by the buildsystem such as buildroot).
+
+Suggested-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
+
+Upstream: https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=893a55831e5abbcd15b171db66fa1f389fb61506
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 7c221a89..adac7905 100644
+--- a/Makefile
++++ b/Makefile
+@@ -132,12 +132,12 @@ CFLAGS += -DUSE_PTHREADS
+ MON_LDFLAGS += -pthread
+ endif
+ 
+-LDFLAGS = -Wl,-z,now,-z,noexecstack
++LDFLAGS ?= -pie -Wl,-z,now,-z,noexecstack
+ 
+ # If you want a static binary, you might uncomment these
+ # LDFLAGS += -static
+ # STRIP = -s
+-LDLIBS = -ldl -pie
++LDLIBS = -ldl
+ 
+ # To explicitly disable libudev, set -DNO_LIBUDEV in CXFLAGS
+ ifeq (, $(findstring -DNO_LIBUDEV,  $(CXFLAGS)))
+-- 
+cgit 1.2.3-korg
+
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 6de9467092..153395d32a 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -21,7 +21,7 @@ MDADM_BUILD_OPTS = \
 	CXFLAGS="$(MDADM_CXFLAGS)" \
 	CPPFLAGS="$(TARGET_CPPFLAGS) -DBINDIR=\\\"/sbin\\\"" \
 	CHECK_RUN_DIR=0 \
-	LDLIBS=-ldl
+	LDFLAGS=$(TARGET_LDFLAGS)
 
 MDADM_INSTALL_TARGET_OPTS = install-bin
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
