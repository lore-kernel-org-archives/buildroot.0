Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F91CCD5BC9
	for <buildroot@archiver.kernel.org>; Mon, 25 May 2026 18:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC12881A39;
	Mon, 25 May 2026 18:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xBd4NAGtkyUZ; Mon, 25 May 2026 18:40:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82D9A81A23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779734442;
	bh=fY3u9bWay9yxgbMd50XyiJeZ6pNp/Hnb3hqyuYRHE1E=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Zyhgk6DuNus9Id3GkxMSCDA7KihEaA67eSGPUAeBjnu/HqC0u6T7950WZ3akID+bl
	 e2ssBk+hut/h+AhTZOyYFcR3A9yBzIMIUfp3CP9Sn5l86qI3cOBG+SORU4dsWg8iUk
	 DKZO420N5um7H4KOXWTQGcfpNQa9xqDu8LLE9mAnnn/FvVBSV7evBEeRFUKFHChE+3
	 NE40HsRryT3/zxhcS32p8LYsc9nKwfxGa97i6HgPXcj7Pl8XAeZTLvzn7/MpXw5MMt
	 o4IM+6UqIdKqKi4gTMuWxAZpJ7YcUlc0z24bvgCHLzVRFosIZaPkKdywusbXRgjZK+
	 VPf4592hbJAzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82D9A81A23;
	Mon, 25 May 2026 18:40:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EBBC3265
 for <buildroot@buildroot.org>; Mon, 25 May 2026 18:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1F5981A18
 for <buildroot@buildroot.org>; Mon, 25 May 2026 18:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fK8OyC2vqkxH for <buildroot@buildroot.org>;
 Mon, 25 May 2026 18:40:39 +0000 (UTC)
X-Greylist: delayed 463 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 25 May 2026 18:40:38 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1DDA381A23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DDA381A23
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.13;
 helo=mout.kundenserver.de; envelope-from=paguilar@paguilar.org;
 receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DDA381A23
 for <buildroot@buildroot.org>; Mon, 25 May 2026 18:40:37 +0000 (UTC)
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue107
 [212.227.15.152]) with ESMTPSA (Nemesis) id 1MEF87-1wZaNr3eJ3-00Gowz; Mon, 25
 May 2026 20:27:39 +0200
From: Pedro Aguilar <paguilar@paguilar.org>
To: buildroot@buildroot.org
Date: Mon, 25 May 2026 20:27:29 +0200
Message-ID: <20260525182729.8002-1-paguilar@paguilar.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:yMRmaRBDKZrIXLyWmtTUME+ruyXf8syaA3Ez8lBucCkUpvRx3bU
 XyI8Tp5jSmGIpyZzTBNJ0due3sKyps0o6wFQwS1jJjxCOU6W6qMZPhY7rMowRaOBp28zZak
 M/JHjrd8akXwr8VkVIDF3QZ3uoo3y2IvYEn0nW6EM2/BnK2Ryj53PX3wPGhOfb9QT30kpw+
 8d7uhhjyq0G5xQ7ZZhkmA==
UI-OutboundReport: notjunk:1;M01:P0:26RLZ9nmZrQ=;wdV8QLT2HEZ1xI8uCPV84AFYOXY
 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
 =
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paguilar.org; 
 s=s1-ionos; t=1779734435; x=1780339235; i=paguilar@paguilar.org;
 bh=S96MbFL9mBT0FZZUbfRUqcD9FPhSTHYyOhotipUN508=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=h0jdo99HXOIf9WBz/acqDnO8MuLUTog/9zIOO3WXAwg/x9oHQOO6UZUVB6Jqk5H4
 Winz8Ci/djwFaRRDfiTvJA4q9mxFggXiAA6RwRpFY+oI/Dp3Mww3zWknDDPrOnsfs
 Tho57YPjrIy8fq+9JpF3NQe0lgocyfUx30H95OB0Og3EOg2k+0OflXXhn0+WCfXc4
 PnaLfXrIeZ3vjlXQoAX8DdW91SpLTQHQqtS6jCyiKsUgMBsEjGDATYc2lo0zPbSKG
 lUfj38vWa4G5DomPFozUwciAkHsZfLI3gwuOsqQT4lltBzf0mS7m4am5JE2Y08dVk
 buFqwctfQW9yv/Exvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=paguilar.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=paguilar.org header.i=paguilar@paguilar.org
 header.a=rsa-sha256 header.s=s1-ionos header.b=h0jdo99H
Subject: [Buildroot] [PATCH 1/1] package/guile: bump to version 3.0.11
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
Cc: ju.o@free.fr, Pedro Aguilar <paguilar@paguilar.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version does not seem to need anymore the patch
0002-Makefile.am-fix-build-without-makeinfo.patch since it builds
even if 'makeinfo' is not installed, so it's removed.

Changelog:
Changes are detailed in the git repo logs:
$ git clone git://git.sv.gnu.org/guile.git
$ git whatchanged

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
---
 ...kefile.am-fix-build-without-makeinfo.patch | 51 -------------------
 package/guile/guile.hash                      |  2 +-
 package/guile/guile.mk                        |  2 +-
 3 files changed, 2 insertions(+), 53 deletions(-)
 delete mode 100644 package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch

diff --git a/package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch b/package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch
deleted file mode 100644
index 0d16f92387..0000000000
--- a/package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 9304ad88a5f4b083d348563c5de00da53b34cf46 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 6 Mar 2020 23:20:39 +0100
-Subject: [PATCH] Makefile.am: fix build without makeinfo
-
-Don't build doc subdir if makeinfo is not available otherwise build
-fails on:
-
-make[4]: Entering directory '/nvmedata/autobuild/instance-7/output-1/build/host-guile-2.0.14/doc/ref'
-  MAKEINFO guile.info
-/nvmedata/autobuild/instance-7/output-1/build/host-guile-2.0.14/build-aux/missing: line 81: makeinfo: command not found
-WARNING: 'makeinfo' is missing on your system.
-         You should only need it if you modified a '.texi' file, or
-         any other file indirectly affecting the aspect of the manual.
-         You might want to install the Texinfo package:
-         <http://www.gnu.org/software/texinfo/>
-         The spurious makeinfo call might also be the consequence of
-         using a buggy 'make' (AIX, DU, IRIX), in which case you might
-         want to install GNU make:
-         <http://www.gnu.org/software/make/>
-
-Fixes:
- - http://autobuild.buildroot.org/results/9605aac6f760bfff190d0ab95fa50f65486ffe90
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to bug-guile@gnu.org]
----
- Makefile.am | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index ebbf6d476..2270afb9f 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -38,8 +38,12 @@ SUBDIRS =					\
- 	test-suite				\
- 	benchmark-suite				\
- 	gc-benchmarks				\
--	am					\
-+	am
-+
-+if HAVE_MAKEINFO
-+SUBDIRS +=					\
- 	doc
-+endif
- 
- DIST_SUBDIRS = $(SUBDIRS) prebuilt
- 
--- 
-2.25.0
-
diff --git a/package/guile/guile.hash b/package/guile/guile.hash
index b671edad9d..4db8b1855b 100644
--- a/package/guile/guile.hash
+++ b/package/guile/guile.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  1a2625ac72b2366e95792f3fe758fd2df775b4044a90a4a9787326e66c0d750d  guile-3.0.9.tar.xz
+sha256  818c79d236657a7fa96fb364137cc7b41b3bdee0d65c6174ca03769559579460  guile-3.0.11.tar.xz
 # Locally computed
 sha256  b51c6f20e6d029cb5b3e5bf235ac562c9a188c5bdc4ffcdc663897772d6e0260  LICENSE
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 82daaf5ad4..467a21f5a2 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GUILE_VERSION = 3.0.9
+GUILE_VERSION = 3.0.11
 GUILE_SOURCE = guile-$(GUILE_VERSION).tar.xz
 GUILE_SITE = $(BR2_GNU_MIRROR)/guile
 GUILE_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
