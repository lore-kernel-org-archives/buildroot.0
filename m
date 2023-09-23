Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E55CE7A88
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 20:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74EF6414CB;
	Sat, 23 Sep 2023 20:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74EF6414CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c5MDV0Mh34NS; Sat, 23 Sep 2023 20:34:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA517414BF;
	Sat, 23 Sep 2023 20:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA517414BF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4DAD51BF292
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 20:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 249D9414BF
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 20:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 249D9414BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m2WAuXCOHfVH for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 20:34:05 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B992414BA
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 20:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B992414BA
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4053c6f1087so31253005e9.0
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 13:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695501243; x=1696106043;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hLM2iwjTIXnpuGrjD3Sx7vfU7RQS7OQJMGkGSmjCYQE=;
 b=xAPjktrb2GOqVLlnRYkL65b2iwDgCKh8f+p4yNQOf9TSwHzC9YssmNqnY24urs6blM
 G/0n15hEyBvsx9seAN+3poFZ6kUsDQHcaby7T4cWF/+V0oVXLkad7CvKdAVPM1QRR88w
 2jbXngJItzTtJWyYnU5ClLmyF9haKq9bh/5dDHNhfS6/NfxFrK2KDuLGZd5aQkfQVi2r
 Xc/Lno/s4uEQY1NVoPsB650NCN1kJtJ5d9BYMVF6aR6kbfMEC+t9r1EziFoUWdiU/8ZI
 IeHxZ3A1lrGljrZ8OHq+2QEnhno6ZbAzoG6Z1zGWIefx7ct4SufTc0roZj8M5LRQQY/v
 MKxg==
X-Gm-Message-State: AOJu0YzQlbB0NWocpVFAG/nfZFqAM3l0U31VNzaAJRDKl3JGwCyfGZKV
 JO48mIAgutn6G4FdocmWzwpw1oekrJ8=
X-Google-Smtp-Source: AGHT+IETkTva7WcC8b1FqbQbZCBZX62YnvodzoLa/eYAq93gpoL30SaFPNpiU1crmIdRXLde5bzX4g==
X-Received: by 2002:a1c:4c18:0:b0:3fe:fc0f:52e2 with SMTP id
 z24-20020a1c4c18000000b003fefc0f52e2mr2185157wmf.37.1695501242622; 
 Sat, 23 Sep 2023 13:34:02 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e20-20020a05600c219400b003fe1c332810sm10841365wme.33.2023.09.23.13.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 13:34:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Sep 2023 22:33:59 +0200
Message-Id: <20230923203359.16430-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695501243; x=1696106043; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hLM2iwjTIXnpuGrjD3Sx7vfU7RQS7OQJMGkGSmjCYQE=;
 b=DqPhTsJ+BqZymQwQ75J1im9YNkO20C7Er5RLdx6NR5pSVNvAZ3RumbFuQwOMKFm+J/
 pVc3Y6w5ySMZxKxW2ke7giXPzEEruuv43vQNAiAPE6BglpGWtbaFFt/+yNOYMsCJ8uwa
 vMBPNSJ5w5X4vACjF2KZ+8FGVaJDZEFGz4e9bwObMRdfkforGzsUYz8hRAbD+Cy0yTWq
 A/InxG3U38RpS254RraQyiZQA6md4ycs8rOBt4OeIzdxiulFTD9eoJ23yjRzkMdhqAeN
 SNeWvsUjr1jlWvHit9+w7d0Azs5/0+m3OPA+vFWeAZzU364GvsoNtpyCo9E7rrEpf7k7
 Eryw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DqPhTsJ+
Subject: [Buildroot] [PATCH 1/1] package/libostree: needs headers >= 5.4
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

linux/fsverity.h is only available since kernel 5.4 and
https://github.com/torvalds/linux/commit/085771ec14b9bdb843fe9283d4703ced395d1b0b
resulting in the following build failure since bump to version 2023.5 in
commit c64a3e9767757f6bab0ecf2df35871508003f39e and
https://github.com/containers/composefs/commit/d3b4b1a2599e74757a3ada47a88645b363067a0a:

composefs/libcomposefs/lcfs-writer-erofs.c:37:10: fatal error: linux/fsverity.h: No such file or directory
   37 | #include <linux/fsverity.h>
      |          ^~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/045987a09cf9061dae80db6ada1f912b2867db26

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libostree/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libostree/Config.in b/package/libostree/Config.in
index 696e8e1d6c..9c59413eb1 100644
--- a/package/libostree/Config.in
+++ b/package/libostree/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBOSTREE
 	depends on BR2_USE_MMU # e2fsprogs, libglib2, libgpgme
 	# doesn't build with musl due to lack of TEMP_FAILURE_RETRY()
 	depends on !BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 # linux/fsverity.h
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_LIBARCHIVE if BR2_s390x
 	select BR2_PACKAGE_LIBGLIB2
@@ -18,8 +19,9 @@ config BR2_PACKAGE_LIBOSTREE
 
 	  https://ostree.readthedocs.io/en/latest/
 
-comment "libostree needs a uClibc or glibc toolchain w/ threads, dynamic library, wchar"
+comment "libostree needs a uClibc or glibc toolchain w/ threads, dynamic library, wchar, headers >= 5.4"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
-		|| !BR2_USE_WCHAR || BR2_TOOLCHAIN_USES_MUSL
+		|| !BR2_USE_WCHAR || BR2_TOOLCHAIN_USES_MUSL || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
