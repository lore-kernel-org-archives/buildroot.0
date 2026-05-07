Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206ADCD37AA
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 21:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCA2A83C18;
	Thu,  7 May 2026 21:48:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NMuR2NTDF-M2; Thu,  7 May 2026 21:48:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8D3F83C5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778190535;
	bh=fY3u9bWay9yxgbMd50XyiJeZ6pNp/Hnb3hqyuYRHE1E=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=md7fmMDj8dPiep58K5iELSiR7jhvxRNFN+AnEfN2mLoiotvaW9JJLl/q+2lAmrR0V
	 wyhINOiZVcDStTj67lQq/oEG5Kr1KXRUYgVWDAJdGltIvR9RivdG/5S7o6VlGeAM9L
	 9cMcc+HUXRHbQW3Bt7aObJEADWzEa0o+NrmSfVzsaDQkYtiSZOTKAQQ/uSvFoHvSar
	 mLGu2VhF20tPOIC+tfv35UphoPIlMG+JCBssv2vSTe0yAMUYxb9beCLIXWduPjK/hX
	 SGvsO6Yw4WZcHRy+l0Oh5dZF1p+LKz7fR0luWA4MTWR5W03I2GxJLgAz3uSbXlX4VA
	 p9yBQYccuqEBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8D3F83C5C;
	Thu,  7 May 2026 21:48:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 63BFE280
 for <buildroot@buildroot.org>; Thu,  7 May 2026 21:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 549E183C18
 for <buildroot@buildroot.org>; Thu,  7 May 2026 21:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fNMQrHs7ss_t for <buildroot@buildroot.org>;
 Thu,  7 May 2026 21:48:52 +0000 (UTC)
X-Greylist: delayed 304 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 07 May 2026 21:48:50 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D916F83C5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D916F83C5C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.187;
 helo=mout.kundenserver.de; envelope-from=paguilar@paguilar.org;
 receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D916F83C5C
 for <buildroot@buildroot.org>; Thu,  7 May 2026 21:48:50 +0000 (UTC)
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue012
 [212.227.15.134]) with ESMTPSA (Nemesis) id 1MBjA4-1w92l13Wuq-00A75P; Thu, 07
 May 2026 23:43:44 +0200
From: Pedro Aguilar <paguilar@paguilar.org>
To: buildroot@buildroot.org
Cc: Pedro Aguilar <paguilar@paguilar.org>
Date: Thu,  7 May 2026 23:43:27 +0200
Message-ID: <20260507214327.219293-1-paguilar@paguilar.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:AbSGXippJ0LVl8u6EQ8POnqxP7+AbiIDKQgMhWJlIKpSY0daqju
 9pyRvD8Cyl37u7PkTU+1BSAgKKWFpFHxkcM4VzG7RJ7SYHS/OzD9d/FxifBpZ75RsnaBOhZ
 tO6uN1HBDbles4TIoVN7hK8SLB//jDttw4ezPQ0ANW9ZH2mV68tTl9RiI15RDRJRC82ZzCD
 uiCk9rc0rMqv3Q9S5NMfQ==
UI-OutboundReport: notjunk:1;M01:P0:2rdfar1Naqc=;mmG9avMEA4UGtExFdhLN71S7iQv
 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
 =
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paguilar.org; 
 s=s1-ionos; t=1778190528; x=1778795328; i=paguilar@paguilar.org;
 bh=S96MbFL9mBT0FZZUbfRUqcD9FPhSTHYyOhotipUN508=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=g39wxIk6wgcKodYrJd2QT1+R8FwcXYpzOkpbzOUF4x0mofKYocEJ8agbXqpJfvMT
 N63bmX6ZlmBqNtBfF7B4IfX1SEv+9j5k7tVCbJiUlu4RVZsuhjStn+dqEML7oP1TM
 gw2a2JyCYKuuH4kBHZ5wq7uxXjLt6aVOA8lVH5TZJgyCQ+U8XZPJxf5oGmTm0C9I6
 XJstCsgkP61jMgeKqtGQP2TzCbRQbc4NDyGHWysm3Ls8kzPj9Cg1vy0tEgsEDGbcq
 omFx9WH2ilFwl90V+ornt4K+ZvI3QdpnhsJ1BfIgSkmzOMOtwuYkTp4DTb4zhtJHe
 UWmYbX6SBKRKrS3ymQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=paguilar.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=paguilar.org header.i=paguilar@paguilar.org
 header.a=rsa-sha256 header.s=s1-ionos header.b=g39wxIk6
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
