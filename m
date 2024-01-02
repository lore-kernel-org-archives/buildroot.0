Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3772FC47074
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 21:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9EEE80C05;
	Tue,  2 Jan 2024 21:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9EEE80C05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O2U24kMFK9IQ; Tue,  2 Jan 2024 21:38:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F63C80C1C;
	Tue,  2 Jan 2024 21:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F63C80C1C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF11B1BF2FB
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2B804055F
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2B804055F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Feje1TgQx7E for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 21:38:36 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 538E2400CB
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 21:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 538E2400CB
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40d4f5d902dso86928425e9.2
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 13:38:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704231513; x=1704836313;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nj1v9kzw3OvgoT782DiNw/vgRVRNdHQ739+UQHJmPZ8=;
 b=lvjwvnGaKnKTJUhPDrU/MtVqda/5AboDdKfMeW0aW2DDG7C0xgDS1ZOTMZm5Lo63VY
 p2dFqsCWYf4XUxA2i0NRe16owVe6k3qUmBQWFaaQZSGUVxcq0gqNnRNsOA7LhtePAw8Y
 2YwT7fimJ8wfecoUg2Lx6cnnjtTmxj4IXcYTZV66rBv6g+0xQSdTb4MPwpKT4GuUZ0q8
 ezeM+JmQVX1uQ8aYO9dl8qi02R/LskxdeBrzn+nVgHTm8mLouu0LP+4jeJGi7m3wjkgS
 F86TxV/r8iEW2CIRVC8TMMAZi8p8xGGsm4aCxxktgcul9eXxKZ1MpQ2CKaNqEx0vj0zk
 LF4A==
X-Gm-Message-State: AOJu0YyqigSIsV+17IK7+O7D64JY+khmhyzOVSPpIKIHltl9J4oCCbtO
 MOSAMzfaVVbl3zjrftYlZ+opx9wHW7U=
X-Google-Smtp-Source: AGHT+IHlsLEDIDKFSEEophDD01g7lvO9KoIEFkiaKlANHqbZc1h+s3+ycdzRJtfusnc31QhTxhz+aQ==
X-Received: by 2002:a1c:7507:0:b0:40d:581c:f317 with SMTP id
 o7-20020a1c7507000000b0040d581cf317mr6490897wmc.127.1704231513320; 
 Tue, 02 Jan 2024 13:38:33 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 he5-20020a05600c540500b0040d8919bf20sm208684wmb.32.2024.01.02.13.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 13:38:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 22:38:22 +0100
Message-ID: <20240102213822.2010020-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704231513; x=1704836313; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nj1v9kzw3OvgoT782DiNw/vgRVRNdHQ739+UQHJmPZ8=;
 b=kmyl6dcjCKxkLXiXJ0pYaNStzD4Xyof3bF35tVTiNu10wVQ+qKtf+/ejEa73lF6XN0
 SSM1VEcjQzTF8SgPBcfXaMGjMGZ3aRyA2OulPlu272CIlarJc5UifXzsJBC7R28o7z6S
 VHBVAKSvhyHFF6Dh0dvU14wed3oRa/YsYJRBgc3wfH8nlxtbPN7shdXxd1m3UaGnKBbG
 +kNYFr2rgSYv6POu3eVjsaLiDJEgVeujxb7ydyPHSuBa8PkQ47Wie5M0TKmObFydyf31
 X/rEferZMXeGzOOeexbgeNZaFccMMALGrLPMv+sYeOZWDyo2TxSJX+trW/eNfoxacW3h
 W4hg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kmyl6dcj
Subject: [Buildroot] [PATCH 1/1] package/ipmiutil: bump to version 3.1.9
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
Cc: David Bachelart <david.bachelart@bbright.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update site to avoid redirections

https://ipmiutil.sourceforge.net/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ipmiutil/ipmiutil.hash | 6 +++---
 package/ipmiutil/ipmiutil.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ipmiutil/ipmiutil.hash b/package/ipmiutil/ipmiutil.hash
index c1a813ad1f..ecefdac547 100644
--- a/package/ipmiutil/ipmiutil.hash
+++ b/package/ipmiutil/ipmiutil.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ipmiutil/files/
-md5  b38ef567b6bb8a24418e448f23115190  ipmiutil-3.1.8.tar.gz
-sha1  0697fc2342c55ba4374e31dcd38e58a00d1287e8  ipmiutil-3.1.8.tar.gz
+md5  332f688084510771ed79946c815a2ba7  ipmiutil-3.1.9.tar.gz
+sha1  3959d22d6c83b2452d087b1c325f47e6bc2b08ac  ipmiutil-3.1.9.tar.gz
 # Locally computed
-sha256  b14357b9723e38a19c24df2771cff63d5f15f8682cd8a5b47235044b767b1888  ipmiutil-3.1.8.tar.gz
+sha256  5ae99bdd1296a8e25cea839784ec39ebca57b0e3701b2d440b8e02e22dc4bc95  ipmiutil-3.1.9.tar.gz
 sha256  7e0ec8238aa1431e95a4950032a4483fe33fec3fac348eaade5856cdc5ae3e39  COPYING
diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index b48eaa7cb2..b5a83b8042 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IPMIUTIL_VERSION = 3.1.8
-IPMIUTIL_SITE = https://sourceforge.net/projects/ipmiutil/files
+IPMIUTIL_VERSION = 3.1.9
+IPMIUTIL_SITE = https://downloads.sourceforge.net/project/ipmiutil
 IPMIUTIL_LICENSE = BSD-3-Clause
 IPMIUTIL_LICENSE_FILES = COPYING
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
