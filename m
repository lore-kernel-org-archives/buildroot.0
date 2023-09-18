Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA467C46CA1
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 20:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DFCC40948;
	Mon, 18 Sep 2023 20:31:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DFCC40948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bzv56AmoR7ZD; Mon, 18 Sep 2023 20:31:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EC384158E;
	Mon, 18 Sep 2023 20:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EC384158E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B6E371BF3D8
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 20:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FCB141596
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 20:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FCB141596
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E-rMQC2LFWsv for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 20:31:08 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2115C40948
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 20:31:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2115C40948
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-401da71b83cso56028775e9.2
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 13:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695069066; x=1695673866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f9ZvsU5tZiNVwlqHHl+VgQ69nCjMVZswlK0my/jWSHU=;
 b=cPZszaGUILytLH884iUobDMcnJKQNoCF0qveW/G6MA2oNUIN7/huEtXPH3bKS/JnL3
 /xCathewRxSjKRUAHNMDKt4pNu2VZ8FHnQb7U+JyJGW6Q0VHIS2Ej0LG+F7LNu8PDuI2
 1wbatbE9xTLb9fthcPRq3+0Zs/DJucnJBfXhyEhvwpqUZ6KHrKiDLPYP6bBjRNPyduk2
 rjFeCP0XKk2LBsVY2qZZuZxM9c6aK2li0DyziVM7bcyFcdo3xniVWZ2xFLUcHHQjXbns
 /Tg1g25+Gt5yRx/IpSt8NQ6/TG7EWQynuOXScVFJiI5lOOnArcENZdFXj9R8THHZDb2e
 wIMg==
X-Gm-Message-State: AOJu0Ywrst25chWU3XDCTdT+smTp4VLZVJovzkZYuZfmA8rj5/dXbjPk
 SAbGk8L7d3khWPWDPB8KV+6OzPSSpH0=
X-Google-Smtp-Source: AGHT+IE5HBgLXdrG+gP8kNj+KWu3tkH1bRSP4owIubwZ47tajKFWTnIbYR0m69cc2InpQ7iZCsNe5A==
X-Received: by 2002:a05:600c:229a:b0:3fe:25b3:951d with SMTP id
 26-20020a05600c229a00b003fe25b3951dmr8435188wmf.5.1695069066055; 
 Mon, 18 Sep 2023 13:31:06 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:9624:48f1:9fd0:3d3c])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a7bc8ca000000b00401d8181f8bsm16238956wml.25.2023.09.18.13.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:31:05 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 18 Sep 2023 22:31:01 +0200
Message-Id: <1e19b88b0da10c014997ee3f2d2f98921202af7d.1695069059.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1695069059.git.yann.morin.1998@free.fr>
References: <cover.1695069059.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695069066; x=1695673866; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f9ZvsU5tZiNVwlqHHl+VgQ69nCjMVZswlK0my/jWSHU=;
 b=e+CvpMMaABFJOtk4ysRoFF34N8xbLtoG3uiMMIBurivN76ThOjGIC4DFROJ/iIoHU3
 t82qQd5M4cvqw2RPGy+wYKvEvtukMwR9PpatlSUJjNwWYlTofDYqUCWSYz2KzLh6uyoL
 tpNqDOuaTipdVTubB6x3VW0Jt6VjJc7B1muwWIgnoML4UlW10k+lGtNQD2UM4P0BOZMT
 DGGa4FfWOtW0jC6QubxQ6YsBb/DWdHnBJZlIoe71Kr8ww73geIeAuDEaMDgTE/dWQbFr
 O+l4CMIhjSFjU3UBO4kq7fSa+vlYf3JDmOKyUtVvv6E3nVope83DO93oIECTZeRHwMEy
 wbdg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=e+CvpMMa
Subject: [Buildroot] [PATCH 4/6 v2] package/luajit: use the git download for
 known-reproducible tarball
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
Cc: Francois Perrad <fperrad@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since version 2.1, LuaJIT foolows a rolling-release scheme, which means
that any commit is as good as any other; LuaJIT uses the comitter's UNIX
timestamp as its semver patch level. It uses the git-attribute
export-subst for the .relver file that contains the %ct placeholderfor
git-archive to expand it.

In c9dcd9e459d6 (package/luajit: bump to version 41fb94defa8f...), we
switched to such an upstream version. There was some confusion around
the handling of the git-attribute and where/when it is generated, and
the first revision of the patch used the git download method, so had to
use post-extract hooks to do the replacement, but the second iteration
kept retrieving the archive generated by github, which has the
replacement already done, but the post-extract hooks were not dropped
although now useless...

In the future, there is no guarantee that LuaJIT will not change the
format it uses; this will require a bit of care when reviewing every
version bump, to check whether this is the case or not...

To avoid any confusion, and to be future-proof, switch over to using the
git download helper, which now has support for handling export-subst in
a reproducible way. Drop the post-extract hooks as they are not needed.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Francois Perrad <fperrad@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luajit/luajit.hash |  2 +-
 package/luajit/luajit.mk   | 12 ++----------
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index 578bb7a3e2..da243d8c2a 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  b518721280390e4cec1af30f6819d86756ce4234d82410a55a4e121855f64e08  luajit-41fb94defa8f830ce69a8122b03f6ac3216d392a.tar.gz
+sha256  df50bfe78919691ce9a630c8312386a8cb6ca49f327922a833e77656e82ef6c6  luajit-41fb94defa8f830ce69a8122b03f6ac3216d392a-br2.tar.gz
 
 # Locally calculated
 sha256  1130331ac861a4b4520e9c8ad0814efdc6f1e79ea55ea9c460c73733d13ccb5f  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 06c8993391..6b1c6b3386 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LUAJIT_VERSION = 41fb94defa8f830ce69a8122b03f6ac3216d392a
-LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
+LUAJIT_SITE = https://github.com/LuaJIT/LuaJIT
+LUAJIT_SITE_METHOD = git
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
 LUAJIT_CPE_ID_VENDOR = luajit
@@ -33,15 +34,6 @@ LUAJIT_HOST_CC = $(HOSTCC) -m32
 LUAJIT_XCFLAGS += -DLUAJIT_DISABLE_GC64
 endif
 
-# emulation of git archive with .gitattributes & export-subst
-# Timestamp of the $(LUAJIT_VERSION) commit, obtained in the LuaJit
-# repo, with:   git show -s --format=%ct $(LUAJIT_VERSION)
-define LUAJIT_GEN_RELVER_FILE
-	echo 1693350652 >$(@D)/.relver
-endef
-LUAJIT_POST_EXTRACT_HOOKS = LUAJIT_GEN_RELVER_FILE
-HOST_LUAJIT_POST_EXTRACT_HOOKS = LUAJIT_GEN_RELVER_FILE
-
 # We unfortunately can't use TARGET_CONFIGURE_OPTS, because the luajit
 # build system uses non conventional variable names.
 define LUAJIT_BUILD_CMDS
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
