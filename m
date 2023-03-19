Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B7FC7618A
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 19:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C5DB4085A;
	Sun, 19 Mar 2023 19:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C5DB4085A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iS9Opd-DGOL6; Sun, 19 Mar 2023 19:53:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F5E040350;
	Sun, 19 Mar 2023 19:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F5E040350
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E35EF1BF59D
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 19:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC74D402BA
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 19:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC74D402BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QKBwolv4OsAG for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 19:53:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EF4C40258
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EF4C40258
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 19:53:40 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id r29so8543271wra.13
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 12:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679255618;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w2hC8infY5AdlQuSPw3jsQluXm+MQ/vBp0q6Fyb52aM=;
 b=LSv3+UcYCnDD3AHNvrBYMR9RofaMjwFU72ujD4MluKFJxGHh4SSwV/bHQUj1OQpRfl
 R7eqpWzioHYYrzpLvHnDLhk4C+sZXjVIs8Exd1vbZ6J5HHaje87RsbOoeYZhwAxLZlRR
 E4cJPgAP7So6sMMiEROKjNG3h85NhHbfdYgyv3qrwhrBdg4MN3pOvD2oftgCxyYMgURC
 LHGK4mt0NjYH7LwoDH5JTI8N3liNZP3SpuorDvC92fiqg3S5yhwvFfyLi4ewQvAJDgYo
 IafAHSNi4Bm63+4remS1VCwhxz21QLbYr0vcFT9Q6N9A20tvHzK/Rnhz0niKNjv6Q8hV
 bEWw==
X-Gm-Message-State: AO0yUKXaukGRrUr1c+bsjSXz3A3f12hZnNna44c1S3AQoY813chE6Dov
 nxHZeG0xO4YdTZafCP/QHxomPBJaHF4=
X-Google-Smtp-Source: AK7set/3MmZPjS2R+S2VNMKn/LFUv2AalRIV20C9f6MZYcm2yC3tbXyS7HZhLkyl9i9jTRZ9VugHUA==
X-Received: by 2002:a5d:4c81:0:b0:2cf:e8f4:d1ea with SMTP id
 z1-20020a5d4c81000000b002cfe8f4d1eamr11660615wrs.29.1679255618028; 
 Sun, 19 Mar 2023 12:53:38 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z15-20020a5d44cf000000b002ce9f0e4a8fsm7229769wrr.84.2023.03.19.12.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Mar 2023 12:53:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 20:53:27 +0100
Message-Id: <20230319195327.26643-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679255618;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w2hC8infY5AdlQuSPw3jsQluXm+MQ/vBp0q6Fyb52aM=;
 b=W1rh2EJMthVnrsVYiQDwkhjn10Zly47Dz5RiTudPAnn2Yo1f1X5wsD3zhlS1NFc2ka
 +nxF+dkIYeKXu/R21UOVCODBG76SMXbdQd9TY7PtnRFtFpb25dYORgEcJGuC81OoK9Vz
 ErtH2msYykpWtVRymRSbVdpos4F8xiFu8BH2wRU3Clr/br/ISXriCO75rzDsV96W3BHg
 dWcoxJ6epVvuZjkSnucjhbVVJ4lVKjVKhcOPky1EBc16rzddLyJiNrMXNhcfEDW4+wid
 iWTpvv9WXifHrkMurQ5Mqk/eCkKWR59hxov0Tw4zmUMztuClS804YZGKBCoS1nP3hFuf
 Yfng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=W1rh2EJM
Subject: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 9.0.1414
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

Fix CVE-2023-1127, CVE-2023-1170, CVE-2023-1175, CVE-2023-1264 and
CVE-2023-1355

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 4000beedc1..26bc913b8a 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  bcaf9b21ab00ab49de4f3bdfda1bcda82533ec16c412824226544a3fce6506ff  vim-9.0.1260.tar.gz
+sha256  c2bddf283a19c8714d7b21716e0a6a3214f9edb60b080f233cce4143fe228ff3  vim-9.0.1414.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  d187aff219161f37138479257f82d687ea10b2cdd17d58b53a3ec9b79d6dc870  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index e3648bfab9..bb6d4a8d27 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.0.1260
+VIM_VERSION = 9.0.1414
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
