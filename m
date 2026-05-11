Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9E0CD37B2
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 15:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3487812EB;
	Mon, 11 May 2026 15:57:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wJPhfAABuWiQ; Mon, 11 May 2026 15:57:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9961E8116D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778515076;
	bh=GMRW1He+ehYn8gViQx1je0oMuqFkz5NOqmAS17xmyMY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UwkT/0M1sxpJbPLbHcnzod7QBXzTRfTkfZSiylUvNBfunYqBnWDWIaCSA/XUgBWrt
	 8jTVAEQf7MHZa/buJFj/dwermmj5NXi2QRjRD2AWXIJP6pAORwmZ4APKp191pnysHm
	 IHyXENpejY3nrpIJIL8bAWVfLTdr8abSrBoH9E7/tuK1DbLweQ/BwqsfDyYpuCs0u7
	 UX2AZ5xO3vgB8p4qgxjg5exqHv7XmIgGu6qAfzaHo71+XZql4L/HvnO2In//Tvh3VI
	 o+HPUzDxSaeyfQhze541vVlUdAUXaUbpY6DOlLcP7YaS2iP8k/E2o4u1/iv7VZ/DU+
	 6gyKixJPQjToA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9961E8116D;
	Mon, 11 May 2026 15:57:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 71A44223
 for <buildroot@buildroot.org>; Mon, 11 May 2026 15:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54811608D6
 for <buildroot@buildroot.org>; Mon, 11 May 2026 15:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id npgvqVLWwRNQ for <buildroot@buildroot.org>;
 Mon, 11 May 2026 15:57:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6C9DC608D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C9DC608D1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C9DC608D1
 for <buildroot@buildroot.org>; Mon, 11 May 2026 15:57:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c559.dip0.t-ipconnect.de [79.214.197.89])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EEF1BA4C3595
 for <buildroot@buildroot.org>; Mon, 11 May 2026 17:57:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46654)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMT0v-000000007GT-0b6g
 for buildroot@buildroot.org; Mon, 11 May 2026 15:57:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 11 May 2026 17:57:49 +0200
Message-ID: <20260511155749.1223615-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778515070;
 bh=IgHXp92DfWi4nklSWA8Au8f5qBi2HhsIAJELE+DZAyc=;
 h=From:To:Subject:Date:From;
 b=JRgmKQmZ/Q/lFwqYmM2qNhqP2AfyxuzQ0c8pip4DHlVLgpk+7zOndmBL+iJ3rBZrf
 GhO+Si1mRAHm6+IcFKb3e3l9RWZ414Njlba8LE+zY0+15+kU7XKIIYK57ePJgZlkyd
 3CNqd+xVTdjtMBXCmjZPySri5WuHsSJLBadxl1q2/LffMkiQnJzjGTIZx0M/Oh8vjt
 5LXrz1LfeFym6LmQe+4zXzVbyn4DLO0bxPP7Ji2ZdZzrmTSg3JiibOGfxlJBzk8mTq
 cLzMWK5A3qCnP2TcMrGuA690XcNF8wjg2+ezNosc+R6jCzr7t5ga/Oj8eTRlVM5eG0
 jJjS09YSCOIyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=JRgmKQmZ
Subject: [Buildroot] [PATCH 1/1] package/elfutils: bump version to 0.195
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

https://sourceware.org/pipermail/elfutils-devel/2026q2/009226.html

Rebased patch 0002 due to upstream commits:
https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=1fb2723c504588b60c3f796d91b535b50e0f4fd0
https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=45bf7360166b30465d5aebb7822f93c26f370b1b

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...eally-make-Werror-conditional-to-BUILD_WERROR.patch | 10 +++++-----
 package/elfutils/elfutils.hash                         |  4 ++--
 package/elfutils/elfutils.mk                           |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch b/package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch
index f35c2d48aa..c3d2713840 100644
--- a/package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch
+++ b/package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch
@@ -12,12 +12,12 @@ function [-Werror=maybe-uninitialized]
 cc1: all warnings being treated as errors
 
 [Vincent: tweak patch for 0.166]
-[Bernd: rebased patch for 0.177 & 0.189]
 [Dario: make the patch to be applied with fuzz factor 0]
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: rebased patch for 0.195]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  config/eu.am | 1 -
@@ -27,10 +27,10 @@ diff --git a/config/eu.am b/config/eu.am
 index e6c241f9d88a..cad1baa27a5f 100644
 --- a/config/eu.am
 +++ b/config/eu.am
-@@ -99,7 +99,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
- 	    $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
+@@ -135,7 +135,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
  	    $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
- 	    $(USE_AFTER_FREE3_WARNING) \
+ 	    $(USE_AFTER_FREE3_WARNING) $(MISSING_PARAMETER_NAME_WARNING) \
+ 	    $(DEPRECATED_NON_PROTOTYPE_WARNING) $(FREE_LABELS_WARNING) \
 -	    $(if $($(*F)_no_Werror),,-Werror) \
  	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
  	    $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
diff --git a/package/elfutils/elfutils.hash b/package/elfutils/elfutils.hash
index 933420d1dd..f06196f0a1 100644
--- a/package/elfutils/elfutils.hash
+++ b/package/elfutils/elfutils.hash
@@ -1,5 +1,5 @@
-# From https://sourceware.org/elfutils/ftp/0.194/sha512.sum
-sha512  5d00502f61b92643bf61dc61da4ddded36c423466388d992bcd388c5208761b8ed9db1a01492c085cd0984eef30c08f895a8e307e78e0df8df40b56ae35b78a5  elfutils-0.194.tar.bz2
+# From https://sourceware.org/elfutils/ftp/0.195/sha512.sum
+sha512  e1e1fdf4f7f72bf520deb0103bb8fd208dc247bab14af100c6fb56d38c0ef6c6d54ff5bd15b84e4f70e2b2ea481e5999fea2842360f8932a861122df79b5fc8f  elfutils-0.195.tar.bz2
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING-GPLV2
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 176dc79f79..65ac15e64a 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELFUTILS_VERSION = 0.194
+ELFUTILS_VERSION = 0.195
 ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
 ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
