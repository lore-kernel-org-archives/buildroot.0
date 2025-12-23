Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC3BE6F086
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 19:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCD60404BB;
	Tue, 23 Dec 2025 19:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L4FXfjsKgWXj; Tue, 23 Dec 2025 19:54:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD2B9404E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766519644;
	bh=2oCq07xI/YEckz7Aj2jxatuGaa6FHe+s426WQTjLDBc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eLCCNb6bNDGkYu1onv8XioLybeoI5NiV5/rLi9imwhZ6QsDQdZO31RkqJmuvHXuFc
	 u1OU5RQj1TJ/VE6ptcoADLRYXtiUjQ9xEGfkrCkvjuYiHAacxNyg2G6B1cF5wx3K2U
	 fU/vyofuHzes24c+Rm7z57PLf2hSsBEjsrhdlZE3MBbHYvV5EEtVOUmFE/+ejx0kFF
	 9CkltEtSwMrxhngGKAQiq7bT0towi9bQ2s8TJACszZulr3jHurdtPPiTN+vjCMS15u
	 Yll/eK9SuShW1qDGrrmOYp7qR47rr3SG3MZYF6YUkZVUIyU0jBG9ZYptNDGuUjr5AB
	 WMQa36O/Y/d5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD2B9404E8;
	Tue, 23 Dec 2025 19:54:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D0FA0119
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 19:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B719960E63
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 19:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wfYlZdjurfo6 for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 19:54:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.117;
 helo=smtpcmd11117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 60B0260DA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60B0260DA5
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60B0260DA5
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 19:53:58 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id Y8SCvuOLgfibdY8SCvUD8D; Tue, 23 Dec 2025 20:53:56 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 23 Dec 2025 20:46:52 +0100
Message-ID: <20251223194653.3036119-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKqseIsc0zMvW7qehblANvBFe4nOtl1o51mcGrzsl2XvZr680Fs/dNAmH1VN4MMPtwIVWYRoUxD0HL1fHINqSd5ivHphuom+YMUrKXioM9K1bCBGqWLp
 k71F2oYxuFiwbNjCP1b/yPRlDPBmCOBesOtrqfXESRZIMdg4VMXOBk61ZLw4JASKYAohfdm9LWi7BtU/PHTKvMoI+mfExxqI/z2EJYZySqgWUH1cfi6a9krQ
 2rBJh+OSkj8cqibxgxkMh5VOtQPQu4Noc/dh16qWAss=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1766519636; bh=8PFC34TJTiAfI7RyJOB1HpYWtzVdZSf0wEeBZ4+TvTM=;
 h=From:To:Subject:Date:MIME-Version;
 b=fpXJeT21yCpGYVUUn3XIoy1Z18cLICPdDfhZ48DtcWaItLsHImCKWd8y/qKYFyW2D
 N2OIlxzqmCz9drO+mOW1QMnoY/hrWl5P+u3u72Uj9L2o8Np3rkdvzjv6LN6u1tUz5P
 BFiyRkysltY0lOXza6rhk0kBDnBLT8ja+twBNY5De3FXyu+JMo2wlu4Ba7K6qS4yd5
 nW4zZMYkw0QAeHFXrxNnuhXZaRS3IyW1FTRj7RdK1k2bC7VPgxdds3sPB+31Sq/07+
 EY9HkNPQ0r4ToIMcBfEP9DPhI+Cu2Mh7UfssCZNgaG1nBxzf4ANTB4KnJDleFMD2bi
 IJBMIXP/7GxPw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=fpXJeT21
Subject: [Buildroot] [PATCH] package/dash: bump to version 0.5.13
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

https://git.kernel.org/pub/scm/utils/dash/dash.git/tree/ChangeLog?h=v0.5.13

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...-configure.ac-drop-Wl-fatal-warnings.patch | 45 -------------------
 package/dash/dash.hash                        |  4 +-
 package/dash/dash.mk                          |  2 +-
 3 files changed, 3 insertions(+), 48 deletions(-)
 delete mode 100644 package/dash/0001-configure.ac-drop-Wl-fatal-warnings.patch

diff --git a/package/dash/0001-configure.ac-drop-Wl-fatal-warnings.patch b/package/dash/0001-configure.ac-drop-Wl-fatal-warnings.patch
deleted file mode 100644
index eaa5d6cc60..0000000000
--- a/package/dash/0001-configure.ac-drop-Wl-fatal-warnings.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 7d07f683b83ef9fbdf258ce61b022b32f06f253a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 16 Feb 2024 17:26:28 +0100
-Subject: [PATCH] configure.ac: drop -Wl,--fatal-warnings
-
-Drop -Wl,--fatal-warnings with --enable-static to avoid the following
-static build failure:
-
-configure:4778: checking for strtod
-configure:4778: /home/autobuild/autobuild/instance-8/output-1/host/bin/powerpc-buildroot-linux-uclibcspe-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mabi=spe -mfloat-gprs=single -Wa,-me500 -Os -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -static -Wl,--fatal-warnings conftest.c  >&5
-/home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibcspe/8.4.0/../../../../powerpc-buildroot-linux-uclibcspe/bin/ld: warning: conftest has a LOAD segment with RWX permissions
-collect2: error: ld returned 1 exit status
-
-[...]
-
-In file included from arith_yylex.c:44:
-system.h:74:22: error: static declaration of 'strtod' follows non-static declaration
- static inline double strtod(const char *nptr, char **endptr)
-                      ^~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/a54fdc7d1b94beb47203373ae35b08d9cea8d42c
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://lore.kernel.org/dash/20240216163319.860768-1-fontaine.fabrice@gmail.com
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5524650..6993364 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -34,7 +34,7 @@ fi
- AC_ARG_ENABLE(static, AS_HELP_STRING(--enable-static, \
- 				     [Build statical linked program]))
- if test "$enable_static" = "yes"; then
--	export LDFLAGS="-static -Wl,--fatal-warnings"
-+	export LDFLAGS="-static"
- fi
- 
- AC_ARG_ENABLE(fnmatch, AS_HELP_STRING(--disable-fnmatch, \
--- 
-2.43.0
-
diff --git a/package/dash/dash.hash b/package/dash/dash.hash
index 8ae8a77177..536b22c984 100644
--- a/package/dash/dash.hash
+++ b/package/dash/dash.hash
@@ -1,4 +1,4 @@
-# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.12.tar.gz.sha512sum
-sha512  13bd262be0089260cbd13530a9cf34690c0abeb2f1920eb5e61be7951b716f9f335b86279d425dbfae56cbd49231a8fdffdff70601a5177da3d543be6fc5eb17  dash-0.5.12.tar.gz
+# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.tar.gz.sha512sum
+sha256  fd8da121e306b27f59330613417b182b8844f11e269531cc4720bf523e3e06d7  dash-0.5.13.tar.gz
 # Locally calculated
 sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index f030e4ec91..eb646e1a4f 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DASH_VERSION = 0.5.12
+DASH_VERSION = 0.5.13
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
