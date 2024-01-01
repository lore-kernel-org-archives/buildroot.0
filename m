Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41556C47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 22:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6E884090D;
	Mon,  1 Jan 2024 22:03:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6E884090D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rTOR38_YTvtj; Mon,  1 Jan 2024 22:03:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0740D40A50;
	Mon,  1 Jan 2024 22:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0740D40A50
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A50A51BF3ED
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 22:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 866F340A50
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 22:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 866F340A50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZbrObY30T0d6 for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 22:03:53 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4857D4090D
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 22:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4857D4090D
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3366e78d872so8662300f8f.3
 for <buildroot@buildroot.org>; Mon, 01 Jan 2024 14:03:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704146630; x=1704751430;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wth3oWRENBr0YeJMuRWoFEbiMTjldv1CFMFo7fCzYKY=;
 b=Y3Svz7Lk7rn8v0ZlYkee4vdYnYtSNa9rBwWzXW8NFq0IlPUSuFaUIR8Omx805qxJFf
 58uWJhjbfs28nLmrkl+YZVZL1EhAU3ttssJToNevihJAc1/hiR5vcUlbFwyiUEYC49gs
 47G8FMTYRk/dDx+vh/kasHShIpI1lT8ewTQzn6pM+4/hlwTZhYXZDmd5EmiJPZ6WxMYq
 Rg6Fv3yFBtH/snG0/N+AiomPSqCX6juUIymo9XwObwb0eYzdpLl5b2w8EnF5Om2E8x3F
 sAmefwdwZR2qBVMc7S8Lx9oPvQW9odRtlYP0oTGoPF3D4JRpAjWn3t9iTJJ5QhW/xz3L
 gAKg==
X-Gm-Message-State: AOJu0YzXae5i8AgTbuOS5+1Qzv5HEcOKSnntxQw0liyswhFhxG7Kt65w
 muchU4Xbc5siC4GaLWnKRBs8JszNWCA=
X-Google-Smtp-Source: AGHT+IEBlPnOz/2H5Rjw83ckdLORKbwKU0chrd1TPM9M0cUrfF/qTSe4QLApRnAIx11F0cukVSX2dA==
X-Received: by 2002:a5d:69cc:0:b0:336:6e55:2350 with SMTP id
 s12-20020a5d69cc000000b003366e552350mr3987855wrw.200.1704146630452; 
 Mon, 01 Jan 2024 14:03:50 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t13-20020adfe10d000000b00336c9ad1173sm17534755wrz.26.2024.01.01.14.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jan 2024 14:03:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jan 2024 23:03:45 +0100
Message-ID: <20240101220345.7259-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704146630; x=1704751430; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wth3oWRENBr0YeJMuRWoFEbiMTjldv1CFMFo7fCzYKY=;
 b=dNzQvGa3jt0tFJe5PS3EXu85gRG5tvVHunkdEe7Cn+y+qAW2O4QdUFV3AJq+XRDiMq
 a+NA8XGC1daW7EDTbGV+STwc+zK5hx24UwYvTNcuhE1nNkw70Oju9Y6EY4+LMEtLBMa6
 u74rn5GSsNh8j5cY7IT2SD7hGhiHDFDDju5SmfPo0bi3wbTQDjUmUHRyVN6hWdWCTVHR
 L37hFFimqItpLHI/gX9RwRcNQCL+SroFzEnCCFnfOY9BKLnOqWdZO5UtSWLqARkbtQ82
 uq24M382gV9thH2sH7rLfW+2GvayUfZAtbH8RAXSMg8y18axnZE+fuoWw7WzelcXvbA5
 o7UA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dNzQvGa3
Subject: [Buildroot] [PATCH 1/1] package/proftpd: security bump to version
 1.3.8b
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

1.3.8b - Released 19-Dec-2023
--------------------------------
- Issue 1735 - Compiling ProFTPD 1.3.8a mod_sftp, mod_tls using libressl 3.7.3
  fails.
- Issue 1756 - Build system fails for specific module names.
- Issue 1760 - mod_sftp is affected by "Terrapin" Prefix Truncation Attacks in
  SSH Specification (CVE-2023-48795).

https://github.com/proftpd/proftpd/blob/1.3.8/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/proftpd/proftpd.hash | 2 +-
 package/proftpd/proftpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/proftpd/proftpd.hash b/package/proftpd/proftpd.hash
index f950f26b86..5a7d153a31 100644
--- a/package/proftpd/proftpd.hash
+++ b/package/proftpd/proftpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f7139e7377a2cb059b8b9b14d76a6df5f440e3181cb15ae890d43bbcae574748  proftpd-1.3.8.tar.gz
+sha256  183ab7c6107de271a2959ff268f55c9b6c76b2cf0029e6584fccc019686601e0  proftpd-1.3.8b.tar.gz
 sha256  391a473d755c29b5326fb726326ff3c37e42512f53a8f5789fc310232150bf80  COPYING
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 398155222d..0820822e17 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROFTPD_VERSION = 1.3.8
+PROFTPD_VERSION = 1.3.8b
 PROFTPD_SITE = ftp://ftp.proftpd.org/distrib/source
 PROFTPD_LICENSE = GPL-2.0+
 PROFTPD_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
