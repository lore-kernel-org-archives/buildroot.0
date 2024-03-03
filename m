Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45209C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 18:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC88B406E5;
	Sun,  3 Mar 2024 18:19:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KQxHAqAis5qi; Sun,  3 Mar 2024 18:19:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10B9040771
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10B9040771;
	Sun,  3 Mar 2024 18:19:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6DE201BF37A
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 18:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BB7C40771
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 18:19:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DUOVuxR7wa-m for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 18:19:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5B264406E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B264406E5
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B264406E5
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 18:19:06 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-412e1b52934so1865415e9.1
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 10:19:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709489943; x=1710094743;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dp8/yjWMpRKMLKLWJylWnc0dufEeE6XSetS+G0kLQCg=;
 b=gOrrpgMmdzTzXPgGpaPi+FsQjx8pyD4rC7oWAffEi6bBygEMDiVT1gkGfG0HdRl7S+
 eEKwn5NaepeYQyddlGPgfG+Md0hJfXT/vyGPJELUqTCIqAUAwBd6WA/Jve2/O/ty5Lto
 SqzYw0YdwWegEx7Zg1ZhyGnfVOW/5EmipuPP9gKUisCbUEeVsUKQ94t125d7x5KqYlGy
 g6odIjNHhgh4S7meF74TPWuei0OTeKSnT9HUcmbndZe2wU5HB8u9QT9Ju3Vfc0cMAloK
 QjkpFnnEQBOJnG1Z253Y6tMySMwOseF/LUhqdePWFDkpgIImFtGT27cEl0XPvMLQvecz
 NfTg==
X-Gm-Message-State: AOJu0Yy5VMpUWHt4M/AFbIWhzYTJ04GlnSqBhs9QA3+mK74i1gzIqYre
 Fh/EqfvebGODs74Ixxr5ys02qFCwxh75ZUqbYQ13vdkyqDX9Cnkt7tcnF3FR
X-Google-Smtp-Source: AGHT+IGBizId9+vyZn0MtqWLrF6/+JL6eR85nGsZQS9qkhZm2pPZEhPOm9TaSgaPEI8yP/hQL8zSvA==
X-Received: by 2002:a05:600c:4806:b0:412:d146:8d70 with SMTP id
 i6-20020a05600c480600b00412d1468d70mr3534544wmo.10.1709489943088; 
 Sun, 03 Mar 2024 10:19:03 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fl9-20020a05600c0b8900b00412dd2102b5sm3016345wmb.12.2024.03.03.10.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Mar 2024 10:19:02 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Mar 2024 19:18:59 +0100
Message-ID: <20240303181859.1103815-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709489943; x=1710094743; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Dp8/yjWMpRKMLKLWJylWnc0dufEeE6XSetS+G0kLQCg=;
 b=dL4gE5WCpbArA2wBc+n0o3AKQmFd9I6WmQCDJHt8G9d6Koz7DN9+bLASLl+BVxaAWM
 aqcg76IDrfRQwS6irwFMSmR1z74kG22pHQXUqa/T7E+QLCDuhbTnUAZM4oE6OXfS7KO5
 I7sp8uu+KJDURdPfkmFJVXra6qkH61TaU3o98rAbHmHrehIf8eWtaqmTc8bosp+eyVG5
 2EChX+kE+b4cPIoe6GR+CmquXZW2JJPxjkryAdul1wgUbVwVRpAFWt7fMxBCY0QO31dH
 GuG6YONe4/s26thr2ciY79J9lq7Do0eJsSXXLfSvKP4xrAYsnACZxZV2zGlqCnOZY5L3
 6MtA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dL4gE5WC
Subject: [Buildroot] [PATCH 1/1] package/shadow: disable on uclibc
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

shadow unconditionally uses reallocarray, reallocf and explicit_bzero
since bump to version 4.14.3 in commit
8a01774d9897310c00a0945865f5a6d5167dfca3 and
https://github.com/shadow-maint/shadow/commit/1aa22c14674e14e84efa171614dea2b515d5a223
https://github.com/shadow-maint/shadow/commit/0e0a310acf5111251589116343897a63ebc88e7a
https://github.com/shadow-maint/shadow/commit/0ec157d579931cfec1cc8439288ed17adf19da5d
resulting in the following uclibc build failure:

/home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/13.1.1/../../../../arc-buildroot-linux-uclibc/bin/ld: groups.o: in function `main':
groups.c:(.text.startup+0x20): undefined reference to `reallocarray'

Fixes:
 - http://autobuild.buildroot.org/results/98be07d299aa383a447a1f1dd2924a00c1a29a34

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/shadow/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/shadow/Config.in b/package/shadow/Config.in
index 230271af7d..bc85d0d135 100644
--- a/package/shadow/Config.in
+++ b/package/shadow/Config.in
@@ -2,6 +2,7 @@ menuconfig BR2_PACKAGE_SHADOW
 	bool "shadow"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	help
 	  Utilities to deal with user accounts.
 
@@ -55,5 +56,6 @@ config BR2_PACKAGE_SHADOW_YESCRYPT
 
 endif # BR2_PACKAGE_SHADOW
 
-comment "shadow needs a toolchain w/ headers >= 4.14, dynamic library"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 || BR2_STATIC_LIBS
+comment "shadow needs a glibc or musl toolchain w/ headers >= 4.14, dynamic library"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 || \
+		BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_UCLIBC
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
