Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66BE2C433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 16:57:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE0F760F93
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 16:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE0F760F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FFD4402F2;
	Sun, 17 Oct 2021 16:57:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ncrLlWldb1CS; Sun, 17 Oct 2021 16:57:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A614B402EA;
	Sun, 17 Oct 2021 16:57:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D70391BF404
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 16:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4AEA402EA
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 16:57:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tTn4J6Y8BDzg for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 16:57:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C95AE402E9
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 16:57:01 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id n7so4380500ljp.5
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 09:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B3PjUsgJVb8kkiG58M5wQGMK+tWLO/EyAJ8k9Uudvq8=;
 b=QPvW74//kcwUtkVWI7l4HJ7NO2Fa0VNbdb8j9RnJjmo+DBQOshaytbfcSfMBOWhYWz
 r95Z25GuUsEFI0anmzduOgBreYfCXUv+naVmYt8B0zCGioK0vZvgMv21Mf1mlR0quv5o
 7OTvWK+hSZtEYm+OGUd+77cGCRO9MHSWlU59U7nfZqL42WLMhtSAjNDlYVINo3+aWHLP
 AvhWt2iPo3q6lbv9zXk4qK/90DB7WxLAWzeb4GTVHRnbZ2DBzjzAfEoQhb7hvb0sh5TJ
 U6WW1M9Wy0q1U7n3Tp9Au5OuP2Efyw070a+quHgXsR4tK2hyu+HH8rm5Obxv6qMJp14x
 iZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B3PjUsgJVb8kkiG58M5wQGMK+tWLO/EyAJ8k9Uudvq8=;
 b=S5I+TaMaHDENUFhxc+lz+UNTID1RYx5hnAtNg3BBFDpkdBZ+lSyG6IDO5NnCmcTFSh
 k5uCtXUFYa6TlP11a0q+z1Ha7yPxoGPcC6RHJ2iIsHw6zEhtDEnfE25Z3ezmiyP28S0M
 7z3OYKVi8135qykvdy19Yb6obDJMaiFMkIbRGY5rP/kTenryx7F9a7DXcnj2plDyf0cr
 ncqVoDv8HA55wSwAnHHVnh4R72fFd8C3ClCK/Op1HlpwmDMA0RRF9oJq+e51har3deWx
 QwbMhODaEtQZhGJKp5tpMRIPjoueth9J8FOBdz3RZtTWvTxZU+p6dTo3sX+JIgBB4boU
 1xuQ==
X-Gm-Message-State: AOAM532oFbqsGwOHd8DicIaELtGnZ/MJto9QWV+U+Y1ctUXQkTKdqHCt
 rz78xG390Z9h/w2ME/F42UxVsLf//6Fx8Q==
X-Google-Smtp-Source: ABdhPJxeT30IcD7BYCJEgXYk5mrv/XAH8lC6GGBU+IkFwtDFjj+Yal5TJpD8IXhhCBWqED39tcrTbA==
X-Received: by 2002:a05:651c:2128:: with SMTP id
 a40mr17979732ljq.148.1634489819329; 
 Sun, 17 Oct 2021 09:56:59 -0700 (PDT)
Received: from localhost.localdomain ([94.254.51.203])
 by smtp.gmail.com with ESMTPSA id p15sm1188616lfe.1.2021.10.17.09.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 09:56:58 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 18:56:46 +0200
Message-Id: <20211017165646.3286083-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mg: bump version to v3.5,
 drop backported patch
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

 - Drop backported patch for GCC 10 build problem, part of release
 - Use upstream sha256 instead of locally computed

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 ...0001-src-def.h-fix-build-with-gcc-10.patch | 38 -------------------
 package/mg/mg.hash                            |  5 +--
 package/mg/mg.mk                              |  2 +-
 3 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 package/mg/0001-src-def.h-fix-build-with-gcc-10.patch

diff --git a/package/mg/0001-src-def.h-fix-build-with-gcc-10.patch b/package/mg/0001-src-def.h-fix-build-with-gcc-10.patch
deleted file mode 100644
index d88e2f44f0..0000000000
--- a/package/mg/0001-src-def.h-fix-build-with-gcc-10.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 29c83c917bd4f5d0c37ff0ab5da1a85762bd5530 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 5 Sep 2020 14:50:20 +0200
-Subject: [PATCH] src/def.h: fix build with gcc 10
-
-Define hlp as extern to avoid the following build failure with gcc 10
-(which defaults to -fno-common):
-
-  CCLD     mg
-/home/buildroot/autobuild/run/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: mg-bell.o:(.bss+0x0): multiple definition of `hlp'; mg-basic.o:(.bss+0x0): first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/aacc02abf41e120e0d0b22faa38642e6d149d73f
-
-[backport of upstream 29c83c917bd4f5d0c37ff0ab5da1a85762bd5530]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[yann.morin.1998@free.fr: backport actual patch after MR was accepted]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- src/def.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/def.h b/src/def.h
-index e4c049c..cd59725 100644
---- a/src/def.h
-+++ b/src/def.h
-@@ -650,7 +650,7 @@ int		 excline(char *);
- char		*skipwhite(char *);
- 
- /* help.c X */
--const char	*hlp;
-+extern const char	*hlp;
- int		 desckey(int, int);
- int		 wallchart(int, int);
- int		 help_help(int, int);
--- 
-2.28.0
-
diff --git a/package/mg/mg.hash b/package/mg/mg.hash
index 758a5232d4..9257daf5ac 100644
--- a/package/mg/mg.hash
+++ b/package/mg/mg.hash
@@ -1,5 +1,4 @@
-# From https://github.com/troglobit/mg/releases/tag/v3.4
-md5 6b79855d54770bcb23e5457ebde8296c  mg-3.4.tar.gz
+# From https://github.com/troglobit/mg/releases/tag/v3.5
+sha256 a906eab9370c0f24a5fa25923561ad933b74ad339d0b2851d2067badf0d7e4ce  mg-3.5.tar.gz
 # Locally computed:
-sha256 1a620cf5b2dd4b00006d6c929ac8e2a70eeab5f807a0d6e5334b878aa182b713  mg-3.4.tar.gz
 sha256 7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
diff --git a/package/mg/mg.mk b/package/mg/mg.mk
index e3b79da006..bb3f59a14d 100644
--- a/package/mg/mg.mk
+++ b/package/mg/mg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MG_VERSION = 3.4
+MG_VERSION = 3.5
 MG_SITE = https://github.com/troglobit/mg/releases/download/v$(MG_VERSION)
 MG_LICENSE = Public Domain
 MG_LICENSE_FILES = UNLICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
