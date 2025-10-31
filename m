Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23601CCF9F8
	for <buildroot@archiver.kernel.org>; Fri, 31 Oct 2025 22:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B70F61AE9;
	Fri, 31 Oct 2025 22:23:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MIItAIUYXLgq; Fri, 31 Oct 2025 22:23:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABF4861ADF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABF4861ADF;
	Fri, 31 Oct 2025 22:23:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CDC32A3
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 22:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E704D84B1D
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 22:22:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YKpztuILe7Me for <buildroot@buildroot.org>;
 Fri, 31 Oct 2025 22:22:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9410E84B1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9410E84B1C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9410E84B1C
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 22:22:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b624.dip0.t-ipconnect.de [84.161.182.36])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 218B9A4C5AF0;
 Fri, 31 Oct 2025 23:22:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46840)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vExWJ-00000000888-0aXr;
 Fri, 31 Oct 2025 22:22:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 31 Oct 2025 23:22:54 +0100
Message-ID: <20251031222254.2654876-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761949375;
 bh=ScLB06O9fM8Hvuj7P4/7D+YeOQ46lLRQCk4dM4ag+J8=;
 h=From:To:Cc:Subject:Date:From;
 b=Qfj6/Vf/KpS+fRk8i75hoUqfkHSxMT72IThaTl7rUUVno+isj4c5Fl7KDj7Bfid3c
 oYyHUxO0qs3/G8DnoP/2ipcmMUa3B9ASGXuqgv4ISlm3KJUFgFoNVXVGG0Ce3+ORaW
 +m6Oy8WAJjYh/3Pav0K5AKx791fZ4sx7HAl4ffRD0aXxu47XpTVm/CgdaqI0XsF7RP
 HSqDV1y40/7YUsQPVqk1Pby3wHFbsrOVTYZT6Fov6btTqD71cM7S+k3vEqw+22dacl
 ynR/l5E57+s3hsIqix6bwgf/hhPvo6zBhiik91wu62n1er834D6wcmbKZt5P9+BVIt
 qNNigNoQVjmzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=Qfj6/Vf/
Subject: [Buildroot] [PATCH 1/1] package/exim: bump version to 4.99
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

Release notes:
https://lists.exim.org/lurker/message/20251028.114149.3bf19800.en.html

Rebased patch 0001 due to upstream commit
https://github.com/Exim/exim/commit/cd43f5ee0f7f76f0d624899f892b10eb5f40a37c

Rebased patch 0004 due to upstream commit
https://github.com/Exim/exim/commit/834dae55650eb31b893242b9d50b477f5a339bf5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/exim/0001-Build-buildconfig-for-the-host.patch | 6 +++---
 package/exim/0004-sieve-fix-build-errors.patch         | 8 ++++----
 package/exim/exim.hash                                 | 4 ++--
 package/exim/exim.mk                                   | 2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/exim/0001-Build-buildconfig-for-the-host.patch b/package/exim/0001-Build-buildconfig-for-the-host.patch
index e9da80765a..6f4351a50f 100644
--- a/package/exim/0001-Build-buildconfig-for-the-host.patch
+++ b/package/exim/0001-Build-buildconfig-for-the-host.patch
@@ -2,7 +2,7 @@ buildconfig is meant to be executed on the host, so it has to be compiled
 using $(HOSTCC), not $(CC).
 
 Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
-[Bernd: rebased for version 4.97.1]
+[Bernd: rebased for version 4.99]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  OS/Makefile-Base |    4 ++--
@@ -12,7 +12,7 @@ diff --git a/OS/Makefile-Base b/OS/Makefile-Base
 index 29a6ad3..420ba60 100644
 --- a/OS/Makefile-Base
 +++ b/OS/Makefile-Base
-@@ -258,8 +258,8 @@ allexim: config.h $(EXIM_MONITOR) exicyclog exinext exiwhat \
+@@ -257,8 +257,8 @@ allexim: config.h $(EXIM_MONITOR) exicyclog exinext exiwhat \
  
  # Targets for special-purpose configuration header builders
  buildconfig: buildconfig.c
@@ -22,4 +22,4 @@ index 29a6ad3..420ba60 100644
 +	$(FE)$(HOSTCC) $(HOSTCFLAGS) $(INCLUDE) -o buildconfig buildconfig.c
  
  
- # Target for the exicyclog utility script
+ util_deps: config ../src/utils/msgid.frag
diff --git a/package/exim/0004-sieve-fix-build-errors.patch b/package/exim/0004-sieve-fix-build-errors.patch
index c1a2c45b8d..e311b6105e 100644
--- a/package/exim/0004-sieve-fix-build-errors.patch
+++ b/package/exim/0004-sieve-fix-build-errors.patch
@@ -21,16 +21,16 @@ buildsystem.
 
 Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
 Upstream: https://bugs.exim.org/show_bug.cgi?id=2523
-[Bernd: rebased for version 4.97.1]
+[Bernd: rebased for version 4.99]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
- src/sieve.c | 2 ++
+ src/miscmods/sieve_filter.c | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/src/sieve.c b/src/sieve.c
 index 5e8d1e6f4776..9632f2d43810 100644
---- a/src/sieve.c
-+++ b/src/sieve.c
+--- a/src/miscmods/sieve_filter.c
++++ b/src/miscmods/sieve_filter.c
 @@ -14,6 +14,8 @@
 
  /* Sieve mail filter. */
diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index 0dd5ac47ae..dd20fb805a 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  88b8e8a67c1db6cc0b1d148161aa36e662f4ca2fef25d5b6f3694d490e42dcae  exim-4.98.2.tar.xz
+sha256  5df38b042ffa9a9c8d31b20bc8481558070e361b06f657608622a62a327adcba  exim-4.99.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  aaa4cfc8aee90818c6d1c2fd0cf64b82668d1a343f462f678b38b2b79e10a467240f2e81786eec7705eec3598d23686a74437c50b68502f29ff67788393c812a  exim-4.98.2.tar.xz
+sha512  06521aff437dfe99c015606d2cdde76eaf6e4d2f03779b07fbc0e7d06fe0584366cae9c3fa7d73a86c348f0d25336acd06c42bd5b8f18e5a969de9849088e3aa  exim-4.99.tar.xz
 # Locally calculated
 sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 3afe553caa..d185571393 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.98.2
+EXIM_VERSION = 4.99
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
