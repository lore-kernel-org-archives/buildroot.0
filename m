Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE79C47DB3
	for <buildroot@archiver.kernel.org>; Thu, 18 Jan 2024 18:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB0FE60B03;
	Thu, 18 Jan 2024 18:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB0FE60B03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MZd898-XoIfr; Thu, 18 Jan 2024 18:28:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55234608A5;
	Thu, 18 Jan 2024 18:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55234608A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB7831BF2FF
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 18:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B020F80EC8
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 18:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B020F80EC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OqkdQ3p-MCHP for <buildroot@lists.busybox.net>;
 Thu, 18 Jan 2024 18:28:24 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AECD980E92
 for <buildroot@busybox.net>; Thu, 18 Jan 2024 18:28:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AECD980E92
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-337bcaef29eso2420116f8f.0
 for <buildroot@busybox.net>; Thu, 18 Jan 2024 10:28:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705602503; x=1706207303;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bYEBDd8zqPZHYQ22coIGXFVQTSMEV6HeijIxruEf+fo=;
 b=IBgqXBWfX4WZZfZksCj2TG/NjGvecKtN75wZzHhmN9dVQGRteuzmN3y1Rs9D2z/18l
 TIi0Y82e0Ezvc3XdSuANDjpx3LWIEZh24zyT8EqaF0A8iGe3xMiOsgfqIuVE7kJ0iAFN
 rf3C+Q1buM626yfXwS6k81NQq51/iS7emEc7Tjb0vaLrHA68wZdE26kvkh/qXprFqtmC
 X9jpoKpB5nmYrhlA7boUzOVG9kvTJi4Ab7tseZ+wpdpn7dd7Dn0EKXQvmbE1Mx9CXvTV
 hdcjngUVlBcOMfzNvSQ6gHgMyhICIYN589gLQjPqQ+CPyvXV4FXt0tPAJfkmLJ+PP4rF
 dGyg==
X-Gm-Message-State: AOJu0YzNWptjxTREPgAZE2io8HImn5FYDlNhWicCZeMP+mIrKeUx9mlg
 GFjOLnR2wyrkq8aFSWGVCUDpZO8hNCV9FCM5T6DtzaCRl93HZh4Qnv4rAw7y
X-Google-Smtp-Source: AGHT+IG2QNdd/1E9L6yBC1ErMtm9FJPxpcmYLAO+b7RBSLbyZHs/zzRggOsuIdNUtDxAZ6XgJhtz+w==
X-Received: by 2002:adf:fd90:0:b0:337:b2c0:7526 with SMTP id
 d16-20020adffd90000000b00337b2c07526mr1005311wrr.6.1705602502475; 
 Thu, 18 Jan 2024 10:28:22 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 u9-20020a5d6ac9000000b00337d392c6c3sm1821541wrw.13.2024.01.18.10.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 10:28:22 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Thu, 18 Jan 2024 19:28:08 +0100
Message-Id: <20240118182808.551258-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705602503; x=1706207303; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bYEBDd8zqPZHYQ22coIGXFVQTSMEV6HeijIxruEf+fo=;
 b=kY/LMOoWk4jOXIxh+FFz5G54vgkzclIrwq8T9aJ0Eq8IADOqBS4pRLTftJVzSz9TjK
 0nHrqPLemH1ffK3Zrr1+8rg1QiPrwyGyyHgI7TnV2Dh0RN3Ty2MrnzmqzK+vM000wU9/
 xtRJ17nC6uY8Ux6tt6YUMqBKB0BKwGWEiOS7tlrEHnhMOf8rOluElvvHgZgmZx5l9w1s
 sMw7HNbPiR/dbRKjwgP0VnLuS8NNbcky+nbcil6yNDU966xcDoNXimxD0sjSBehPOJc+
 pMmogJgBEEqaP8cjhWV4w6o0JMCeiLL4P80uWfTEGxXTjBC0mkTzK47+G7HR9M+LYCty
 5OWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kY/LMOoW
Subject: [Buildroot] [PATCH] package/autoconf: bump to version 2.72
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

https://git.savannah.gnu.org/cgit/autoconf.git/tree/NEWS?h=v2.72
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/autoconf/0001-dont-add-dirty-to-version.patch | 2 +-
 package/autoconf/autoconf.hash                        | 2 +-
 package/autoconf/autoconf.mk                          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/autoconf/0001-dont-add-dirty-to-version.patch b/package/autoconf/0001-dont-add-dirty-to-version.patch
index e8d9f6a29..8df227686 100644
--- a/package/autoconf/0001-dont-add-dirty-to-version.patch
+++ b/package/autoconf/0001-dont-add-dirty-to-version.patch
@@ -17,7 +17,7 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 diff -Nura autoconf-2.69.orig/build-aux/git-version-gen autoconf-2.69/build-aux/git-version-gen
 --- autoconf-2.69.orig/build-aux/git-version-gen	2013-06-27 11:31:02.340200154 -0300
 +++ autoconf-2.69/build-aux/git-version-gen	2013-06-27 11:31:13.734577033 -0300
-@@ -203,7 +203,7 @@
+@@ -210,7 +210,7 @@
        *) # Append the suffix only if there isn't one already.
            case $v in
              *-dirty) ;;
diff --git a/package/autoconf/autoconf.hash b/package/autoconf/autoconf.hash
index de0840dd8..f94b2d9de 100644
--- a/package/autoconf/autoconf.hash
+++ b/package/autoconf/autoconf.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  f14c83cfebcc9427f2c3cea7258bd90df972d92eb26752da4ddad81c87a0faa4  autoconf-2.71.tar.xz
+sha256  ba885c1319578d6c94d46e9b0dceb4014caafe2490e437a0dbca3f270a223f5a  autoconf-2.72.tar.xz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYINGv3
 sha256  1f1cde9fb68b9b3cff18c420894bec5bd4defacd700b7d13df54a887301e5350  COPYING.EXCEPTION
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 15ce9d592..48bfc80e7 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOCONF_VERSION = 2.71
+AUTOCONF_VERSION = 2.72
 AUTOCONF_SOURCE = autoconf-$(AUTOCONF_VERSION).tar.xz
 AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
 
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
