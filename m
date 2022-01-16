Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F6FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 21:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5D1F40892;
	Sun, 16 Jan 2022 21:10:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i5iDUGoSmOhF; Sun, 16 Jan 2022 21:10:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19AAF4088B;
	Sun, 16 Jan 2022 21:10:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A50FE1BF403
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 21:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A14998176C
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 21:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lVSEdYFa3wE4 for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 21:10:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B34D81772
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 21:10:16 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso19797666wmc.3
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 13:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ts7NCWPLsX53hOe5EPOIGtmmtNr9KCE6d/cBUZjlBMg=;
 b=YeYcIyXqhMYFkzqtnmkmzS1+01AB27qj528775H4SBbfHxurhjVccttQt8ZAGTJG+N
 wjziXqLjuwYESfXQnTRc2cgvaJ8qcIolUHb+L8hroy9JI2k6+qDHns1Z+vP/Azh6aDWv
 Farb/T4EXbf6hHTy8oTJQMyqRhOlt4ltZGVetfcy3gBZk3+tr09jcbkOeyT8NANO/4YE
 apCEHAw0KJ5Eecr7vzg2jw0ZymPHMr1G0i9+aeOVtMehKhG2I8kWDt2O8PbErvBQ6Htv
 cvu/mtvW7dZnCbRz+vo+XnDIx+VR0B0qbSuLZRVFlbhhBNOEwX1YaO3RjxhEn5ILsWg2
 LUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ts7NCWPLsX53hOe5EPOIGtmmtNr9KCE6d/cBUZjlBMg=;
 b=QnhX6vLMhAd8jn6HMnbFyj9sll/3v9t4GVyJ333ESkeVJseyecBDUQcW5gyflszirq
 78PohfixE/H4SoQt2w+eyLB8bx6M1yNVM92VChypp1jw0yCfRjygzFTVq14ipoP52O+t
 d+8KIMlf9W2bibZkwUpsK+Qmg/hDbYZsWRzSJWptSlwCASEjS7Rl2Col7VV/H8Thijfy
 lbJ8CXzo+r5gWO3LEW8OzTfKQXap+Op/ketVnLOHJY5mqGfq8U8CpgUWpzVkSCDO1tPx
 yqklaw8KGadVvoMrQTKpKfX/U/n5L2kIwA2qVnsjVlwVdsV/BsMPlO2tXJmHp/a44D6Z
 ByQw==
X-Gm-Message-State: AOAM5336C0Lqd5fP/OJlJUuxeLcGowoanFoxFHipGYvAgtsTjCL7snKl
 dMtX970zcoSt8ZTs1da2ASlbEZyAeIY=
X-Google-Smtp-Source: ABdhPJw7WaTem/vw774NoGHYHX/IBWRx6cnVWPwml3kL6b2+I6kBKcHaBFVFGqEb8AH14Bhj3jRSiw==
X-Received: by 2002:a05:6000:1846:: with SMTP id
 c6mr16939352wri.117.1642367414383; 
 Sun, 16 Jan 2022 13:10:14 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id q6sm12152519wrr.88.2022.01.16.13.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 13:10:13 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jan 2022 22:08:16 +0100
Message-Id: <20220116210816.3210061-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/expat: security bump to version
 2.4.3
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

Fix CVE-2021-45960, CVE-2021-46143 and CVE-2022-22822 to CVE-2022-22827

https://blog.hartwork.org/posts/expat-2-4-3-released
https://github.com/libexpat/libexpat/blob/R_2_4_3/expat/Changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/expat/expat.hash | 8 ++++----
 package/expat/expat.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 8cf563d8f5..0853c3c76d 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.4.1/
-md5  a4fb91a9441bcaec576d4c4a56fa3aa6  expat-2.4.1.tar.xz
-sha1  7988e4df355162500f09837aa95cbb48e6754420  expat-2.4.1.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.4.3/
+md5  b1137f030590b3f0c41c69c6cd68fa90  expat-2.4.3.tar.xz
+sha1  cfaacc4f929b34cfbde2b8f33b74ec84c0cbb329  expat-2.4.3.tar.xz
 
 # Locally calculated
-sha256  cf032d0dba9b928636548e32b327a2d66b1aab63c4f4a13dd132c2d1d2f2fb6a  expat-2.4.1.tar.xz
+sha256  b1f9f1b1a5ebb0acaa88c9ff79bfa4e145823b78aa5185e5c5d85f060824778a  expat-2.4.3.tar.xz
 sha256  8c6b5b6de8fae20b317f4992729abc0e520bfba4c7606cd1e9eeb87418eebdec  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index bb1cfd8c8a..a7ace66095 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.4.1
+EXPAT_VERSION = 2.4.3
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
