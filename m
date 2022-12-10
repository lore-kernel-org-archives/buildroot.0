Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6D0C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 17:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38A36608A5;
	Sat, 10 Dec 2022 17:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38A36608A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XbpHo5yg1mlI; Sat, 10 Dec 2022 17:54:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E9516061B;
	Sat, 10 Dec 2022 17:54:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E9516061B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E69471BF3FD
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 17:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA97B8100D
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 17:54:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA97B8100D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rRqD6yuSptno for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 17:54:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8494B80DD5
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8494B80DD5
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 17:54:19 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id i83so3719769ioa.11
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 09:54:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PRxMBQmwj5GXV7LVajW5h+2DS0yY4cAYIIAGxa5l2CM=;
 b=oVwmNz1izlyf/geQHIXAzclLGLMmywAMgL302feNtl2420xDRLdrre9dJl+c4v6uQ7
 xD7Ki5VHez1Eb9OizD0uv4oOoJ7UL0+KbC4gCJm0FzYl62KLoAo9giTUvzZ6BGfSDXz/
 vOygrNGkdzhnx134uD2G/EYB94sZ3OGQMfnd0IW3oRuEFMzcdxbujEkqMJEfnlV2EZCP
 uNAsj5q6QUFjT8ZDa7P2U7USkgQlTZjw4JsurEAQjeNzBUr0asX7cZmFR3eC8JIVaNjh
 W2hYqJX2bm8sq/Qv7wjscAQsu67CcRbABZ5q/pTns7PGs8DFe3UDVWH505p/Sb3hN2IR
 CXYQ==
X-Gm-Message-State: ANoB5pmeT7mbLlSd4DMPqZQAWYAYlDy3qVnPfWz1kncpwMdZL4+/dmp7
 Oas9UTH8aaoXzaAXB2fRTe2/6PhbJYltCQ==
X-Google-Smtp-Source: AA0mqf6W2RBoFBi3OHQw5RdwxcJxWQyrVlP6AwmgC12DdpaF/hiz1LBGWFURlA0Bo7J0wCp9x5luIg==
X-Received: by 2002:a5d:9284:0:b0:6df:3b35:4a2d with SMTP id
 s4-20020a5d9284000000b006df3b354a2dmr6977516iom.16.1670694858358; 
 Sat, 10 Dec 2022 09:54:18 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 k20-20020a02cb54000000b00389de6759b8sm1518146jap.162.2022.12.10.09.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 09:54:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 10:54:16 -0700
Message-Id: <20221210175416.2808560-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PRxMBQmwj5GXV7LVajW5h+2DS0yY4cAYIIAGxa5l2CM=;
 b=PObMgcEmBKr/VDX6paYBZCVxH2nyEDUGRnwJQh7rU/vEGsLgzgPoXYZcHJhxU591Mz
 Nk5rTt+tYcW/lAMlqY6gf96HwZwTO9t+2Uo9eFUeHuDtBjVy9gOuGiBRYT83tSuEQKR0
 uMhYK7aGGO5NdQ96C/3RS6heLpsYFWsTq2N6Igj5QGtOe1vwfo9C+wOQ9M3alFnadJkk
 bLaI+PI6MkmvuZOUsSj5qNOjz1+YSvOvFJbS++2mzHycx4NBlnRZbJdTQeQQDHtLTKtd
 J1970usqVf3+1igHIAI4aek1S873mB+D7oBbSWj1PGTSz1HF1r5n5QjReMJ0wc7iLaTE
 SFtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PObMgcEm
Subject: [Buildroot] [PATCH 1/1] package/python-gobject: bump to version
 3.42.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-gobject/python-gobject.hash | 4 ++--
 package/python-gobject/python-gobject.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index 0c14efb1d4..4398356006 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,3 +1,3 @@
-# from http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.42/pygobject-3.42.1.sha256sum
-sha256  1f34b5f7624de35e44eb5a7eb428353285bd03004d55131a5f7f7fa9b90f3cc9  pygobject-3.42.1.tar.xz
+# from http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.42/pygobject-3.42.2.sha256sum
+sha256  ade8695e2a7073849dd0316d31d8728e15e1e0bc71d9ff6d1c09e86be52bc957  pygobject-3.42.2.tar.xz
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index 2fa7504d51..014090540f 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_GOBJECT_VERSION_MAJOR = 3.42
-PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).1
+PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).2
 PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.xz
 PYTHON_GOBJECT_SITE = https://ftp.gnome.org/pub/gnome/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
 PYTHON_GOBJECT_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
