Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F28FECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 06:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34C4560B60;
	Sun, 28 Aug 2022 06:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34C4560B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fcL4NgW1iqWL; Sun, 28 Aug 2022 06:37:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43EA160B33;
	Sun, 28 Aug 2022 06:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43EA160B33
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E1151BF2E4
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 06:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD4E440190
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 06:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD4E440190
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kOkRCw29b3Yg for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 06:37:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D658A40137
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D658A40137
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 06:37:33 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 h204-20020a1c21d5000000b003a5b467c3abso6519440wmh.5
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 23:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=BFfWHVeICW0C/2raquRHJQ7xN4j8LxcKwA8yFEpdB9s=;
 b=LdiDbm52A1yHAodU9d9FtjfbfYDz0uovl6LpYczm3wNEgotMkou1KzkOvWXOOQRiOH
 htckAdus5NVAOO54ab+j338+u7N2ddx7Ge/OsrembmAAyGln6NUhZ+foyEkTwCmf/WIY
 qmTJ7X+uE1uFbSMvYA2EuAdeeXWx4l/ri42DHPqNHrcnnV3GjQyJNe7hN4pK0AkEJEqh
 bJ6XWbQo3PfBlj3oWs8E56RvXaL9geeLN5L1W5TThExtWk6QY1WAvIDHUKgeCTwMQVsV
 r7JteXgGSsmFzTajtYi16lp3jllVLpaKC+cvaygEWrSvgbVjoGWrNawH+erOMZHBAxXF
 SwRw==
X-Gm-Message-State: ACgBeo1PKPUi5b5xP9dVG07KcdiyYVjG14sV+Q1KyFyCgxEeKceNUTpQ
 qEqKhRc7Pu3uqJl/3V6hUded03MBn9Q=
X-Google-Smtp-Source: AA6agR6ysLE6VRT7++UCerm7eYaHNbm8h35lPPYy14ZfoxievmTeCnBL2dP6kLf82jQfW0TKzKSyhQ==
X-Received: by 2002:a05:600c:4e15:b0:3a6:152a:9143 with SMTP id
 b21-20020a05600c4e1500b003a6152a9143mr3727814wmq.20.1661668651914; 
 Sat, 27 Aug 2022 23:37:31 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 i9-20020adfefc9000000b002251c75c09csm4440611wrp.90.2022.08.27.23.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Aug 2022 23:37:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Aug 2022 08:37:24 +0200
Message-Id: <20220828063724.4028-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=BFfWHVeICW0C/2raquRHJQ7xN4j8LxcKwA8yFEpdB9s=;
 b=HkboHmzWpzArdy1KA2GKkZt5Ew5SpsEgmiHN+Q6StNNfra39by57OuywiCmjwcsj1B
 L6EB929qetgmT751dTS9f171XJZH1nMS5LxnI2w7iRKhaUkEq7hSo9hAL1FnOQYk68vc
 8cpVxh/0IdKfJYF+UvWGsQJG6kJyjvemZNGR3SlvgKWYAjkolXj2Qq87xmZSU9k6mYZw
 6HrpRwv4sKW0Zez5Cd/c8IM7qhXdVlWdjo1S9P+iZ5BcSYZz/XxDJkNOn930E+xHV3ZI
 oJWP6098WDLGA27k8o6+axJAnXatRxAw79I2dHTkLi/XqpMeHRM1XPFMkdmpFpwsqc/Z
 cmnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HkboHmzW
Subject: [Buildroot] [PATCH 1/1] package/mutt: bump to version 2.2.7
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

This is a bug-fix release, fixing a $edit_headers bug on MacOS, along
with a few other small bugs. It also tightens the $query_command parser
to accept a single tab between fields, and changes $pager to accept a %s
expando.

https://gitlab.com/muttmua/mutt/-/blob/mutt-2-2-7-rel/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 0bec59def4..27e439183a 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ffa2d93517cfc606fe01daffc5f12e42062a1c134d3b9af78484ebc5430888d3  mutt-2.2.6.tar.gz
+sha256  eb13858f58bb369f477bf652d90e9b6aaddd0d610acbea3455049e5efad36df1  mutt-2.2.7.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 5b1119c79b..7a4bc1b10c 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.2.6
+MUTT_VERSION = 2.2.7
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
