Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA92C4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 11:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DF8F40395;
	Sun, 18 Dec 2022 11:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DF8F40395
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 87pV9aX9BRbU; Sun, 18 Dec 2022 11:13:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8692D40420;
	Sun, 18 Dec 2022 11:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8692D40420
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 698ED1BF2A2
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 11:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E24460692
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 11:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E24460692
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hsm_3C1LLAEV for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 11:13:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6C516068D
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C6C516068D
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 11:13:51 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h11so6249457wrw.13
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 03:13:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zcD6gzeGbq56d1frj+ag8fyfh1/THxEutpAQdHFITeM=;
 b=BqF9aQYH7O6t9D3qU1EPpu5KgZpPRzr5mc9/2mVFuClR3WjXl08IOm8UHMRR7wlIcK
 h6fsMU8lwstZIq1iSQkPo01lmQ/xc/z/a+mwEjh8urZfKaEfUjnfbq7eIUY7uRxxE9uU
 rDbtF72kY8XV8h1WNEbttOR7TWWVGzTyMaLs/Kjxtn6Ejm/rDPm9C6ZQM9h3eIJoE83x
 9449JWM0BFR3YwGTL/hw9/ADgWO8bQQbISJIESCjPQCCFtRSsdVAZyXRMxTIwYgXJxF9
 E+kMfH8q7TIC5eVW/mUxuT6nD5aF3JIWxdLGZ8JxNaPmaQPnWD3kglGzsja9/mlBNxcT
 DxhQ==
X-Gm-Message-State: ANoB5pk8cFz2bKaQoh165q5blTRJEwHMgIj2YF0nsWDKMkxioMAcqQte
 MuRFzhRMGVKN+ZE53pzwqRe0E9FC6MY=
X-Google-Smtp-Source: AA0mqf5kfqt6gcYaQwb5eyVWuPg2Qis0ZHQ0WBiaFgQgbc+niGozuGOd4ybAtAfz3GzTikwr4I/Qww==
X-Received: by 2002:a5d:4e03:0:b0:242:37e3:1747 with SMTP id
 p3-20020a5d4e03000000b0024237e31747mr22790061wrt.21.1671362029600; 
 Sun, 18 Dec 2022 03:13:49 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 cl4-20020a5d5f04000000b00242209dd1ffsm7144613wrb.41.2022.12.18.03.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 03:13:49 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 12:13:47 +0100
Message-Id: <20221218111347.21289-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zcD6gzeGbq56d1frj+ag8fyfh1/THxEutpAQdHFITeM=;
 b=YblFq5FP/jh0H8SSs8CUGxfPda2YgVwt6123kVNq6HYa0lva0sG3+ScueyB4jv571F
 rCaL8y2Ow35X8TIKaM4Oh/WG6TqafgdGuvxQHSOdzbw8VqSZbWbfly60U2hq3TlPMOYR
 yTAvdIj0jBb9ceuFhQ8nQNgLlYnMQOgGHBhCMliuPYnhsLVaAz6I/0Dw2On/u+jHG1lx
 fIwyi8mg4YBRTjbWjt5T7NssXeilC8mYbXn89J36GLrxdjjxxSIxY1QhfkIiwKTUYJQO
 xZHYip/o99QrZQcuS2B3zNENsuvSEjheDycxuCUW6og8Zmtw91GBIZhHxLoGevWsc4iS
 bePA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YblFq5FP
Subject: [Buildroot] [PATCH 1/1] package/motion: bump to version 4.5.1
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

https://github.com/Motion-Project/motion/releases/tag/release-4.5.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/motion/motion.hash | 2 +-
 package/motion/motion.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/motion/motion.hash b/package/motion/motion.hash
index 9b99256864..21f74b481f 100644
--- a/package/motion/motion.hash
+++ b/package/motion/motion.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  42320a1c7b54a3f0b5a49cecf34a5d752760b28383bc573b3ca1240581786fe5  motion-4.5.0.tar.gz
+sha256  0c824276bb23565b7cf10409ebdcb46b85fb1f6abca957252e52290bb1fe473e  motion-4.5.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index 18fe0eb630..4e9ccdc3f7 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOTION_VERSION = 4.5.0
+MOTION_VERSION = 4.5.1
 MOTION_SITE = $(call github,Motion-Project,motion,release-$(MOTION_VERSION))
 MOTION_LICENSE = GPL-2.0
 MOTION_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
