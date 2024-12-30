Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBD1E77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 09:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC67D80BB4;
	Mon, 30 Dec 2024 09:51:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pmkeyevmDBBH; Mon, 30 Dec 2024 09:51:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C402B80BBB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C402B80BBB;
	Mon, 30 Dec 2024 09:51:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C066C8
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 09:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 261524013F
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 09:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zl3fg_7Y-YJY for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 09:51:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=nicola.dilieto@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE25A400D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE25A400D0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE25A400D0
 for <buildroot@buildroot.net>; Mon, 30 Dec 2024 09:51:23 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aaf6b1a5f2bso42590466b.1
 for <buildroot@buildroot.net>; Mon, 30 Dec 2024 01:51:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735552282; x=1736157082;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jfPQHI4HTcynH7nqLo50gGnagh8Fkoeuyx35X6dGst8=;
 b=eOSgSWmcX4hRUsYXhQGH47XKkvMQD5Pk6l1jZEzS4Yi22I2P08k4mkZ2JQT2nmpmHu
 ZQ5lpU+GcEktxJxi3TVkJhaEZ3Osu7hHmHoJgyFD01Q8xTU9dkDx5xXLo3NJIX0eo4PV
 srpv4X5MmvjTWE0YuDLBfh/tS2mJJIrt5NePlIrwt/HTfp3LtM5CSW2O9MeG5mBAWT4J
 j0QO2vAyWlw5uxFj4AeDGmjJepwOlZVBNeva4GxVy/XvU5BATrdMJf7v/sGctDz3kkt2
 bOocy+OagL2cwJYCmePHc+DPPHcXYjb3GEm+e4GvTMnOCHC5hUO4uNnvXDvtg2FHphJe
 yvmA==
X-Gm-Message-State: AOJu0Yxwdv/h9zQrdiddlG53OTbP9q16vli3/4p1Y960w8GqZDTpHVUk
 zwtZ+nxjtkN0o2Mh7wtBnuIebeaSDgT1ysPByQrVVK8Lef4W4Yh1Ij0+xw==
X-Gm-Gg: ASbGncs10IFQqC7xLI1daGml9dqIVOdLpufi8ppz/jQk1XHFtTm9CJPAEtb086F1v/8
 +byqB/qzyT+OfMTfvqZKPvRqXh6zLiXiG0MFQ2D2P4nvw0SpDyb4kEo8yQAeb7LZPiAIX3eCHMG
 lKyY4YbVLPQXwlQLMonL9OCgnqB6EcOoElyqU96ajEtoOd9p1IuSWvs1R69aCAp44iWlbxAz7jT
 U51nVisRz6fIRjERP4+sQxhVermg9EphM95e2gu8QYypl5N/3nc5Odgqi2z0hmCVytaNQ6kcAip
 aazQv7oW
X-Google-Smtp-Source: AGHT+IHHuB9kEY0BwPp2xG8+Wof1URe2KvFvfAJv8OzI+mK8i/555OwpqCRFPcVCG07PbRv3h+nuKw==
X-Received: by 2002:a17:907:3f27:b0:aae:f6bd:7f5 with SMTP id
 a640c23a62f3a-aaef6bd2071mr1736412466b.16.1735552281422; 
 Mon, 30 Dec 2024 01:51:21 -0800 (PST)
Received: from einstein.dilieto.eu (smtp.dilieto.eu. [188.68.43.228])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e894f22sm1437849266b.50.2024.12.30.01.51.21
 for <buildroot@buildroot.net>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 01:51:21 -0800 (PST)
Date: Mon, 30 Dec 2024 10:51:18 +0100
From: Nicola Di Lieto <nicola.dilieto@gmail.com>
To: buildroot@buildroot.net
Message-ID: <Z3JtFjEAZq8HvhgS@einstein.dilieto.eu>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735552282; x=1736157082; darn=buildroot.net;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jfPQHI4HTcynH7nqLo50gGnagh8Fkoeuyx35X6dGst8=;
 b=A+PRzF/tuJzHZlVD6ibpQ7Y/8kQgIB2QjfWaFEPf/8xnvt+XFXA+ahHoifEheyoFYo
 f2EEMHxx6YbL1ju4IwEGzI5jPmVfQ5fXpP9Lx93ybfMP4gzEmVnZi//tnfWqcAV9xRGO
 nYg07MNtSlSOcgbMopRFHa3KneNdivSlrqm7oENzk6PKzW8FB0REjigq8eE+RU+Cdjlv
 swSQZfbKv5wn/PX1UKVpGT+ypq32/y8wUINpJc+iaBzXNLd8QHYQvDJapbzZvcmqyOge
 aymeBL+/aTcBi1ls4qVBMbJgOX44teqFoLHUrEG6MgsKdfvm3JDwjQxKGD9YMKSLCEDx
 DBKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=A+PRzF/t
Subject: [Buildroot] [PATCH] package/uacme: bump version to 1.7.6
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

Also removed 0001-Fix-cross-compilation.patch which is included in
version 1.7.6

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
---
 .../uacme/0001-Fix-cross-compilation.patch    | 29 -------------------
 package/uacme/uacme.hash                      |  2 +-
 package/uacme/uacme.mk                        |  2 +-
 3 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 package/uacme/0001-Fix-cross-compilation.patch

diff --git a/package/uacme/0001-Fix-cross-compilation.patch b/package/uacme/0001-Fix-cross-compilation.patch
deleted file mode 100644
index cc384f2c36..0000000000
--- a/package/uacme/0001-Fix-cross-compilation.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From cdf63e24dc475a558400c68714e32d32904e4c57 Mon Sep 17 00:00:00 2001
-From: Nicola Di Lieto <nicola.dilieto@gmail.com>
-Date: Tue, 20 Feb 2024 01:05:00 +0100
-Subject: [PATCH] Fix cross compilation
-
-Commit fe826f4b1931ae508047d8b2693b5b6ac2cb21fd broke cross compilation
-
-Closes https://github.com/ndilieto/uacme/issues/79
-
-Upstream: https://github.com/ndilieto/uacme/commit/cdf63e24dc475a558400c68714e32d32904e4c57
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 77d1230..3bec75b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -355,7 +355,8 @@ if test "x$OPT_UALPN" != "xno"; then
-                 AC_DEFINE(HAVE_MAP_DEVZERO, 1, [if mmap("/dev/zero", MAP_SHARED) works])
-                 AC_MSG_RESULT([yes]),
-                 AC_MSG_RESULT([no])
--                AC_MSG_ERROR([ualpn requires MAP_ANON or mmap("/dev/zero", MAP_SHARED)])),
-+                AC_MSG_ERROR([ualpn requires MAP_ANON or mmap("/dev/zero", MAP_SHARED)]))
-+        ], [
-             AC_COMPILE_IFELSE([AC_LANG_SOURCE([#include <sys/mman.h>
-                              int main() {return mmap(0, 4096, PROT_READ|PROT_WRITE,
-                                 MAP_ANON|MAP_SHARED, -1, 0) == MAP_FAILED;}])],
diff --git a/package/uacme/uacme.hash b/package/uacme/uacme.hash
index 9a274bf394..26b73ef950 100644
--- a/package/uacme/uacme.hash
+++ b/package/uacme/uacme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  596b2fba75fedc7a410dd71583c828642ecd486dfdcfde109dfebb82a374abbe  uacme-1.7.5.tar.gz
+sha256  d11a86ac2a0dbf285de27dff4193c65f7f3736da3d0480049af50d305940e0d6  uacme-1.7.6.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 0fcb5c5c34..ec538cec12 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UACME_VERSION = 1.7.5
+UACME_VERSION = 1.7.6
 # Released versions are on branch upstream/latest, tagged as
 # upstream/X.Y.Z Do not use vX.Y.Z tags from master, as they do not
 # include .tarball-version
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
