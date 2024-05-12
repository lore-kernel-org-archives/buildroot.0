Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C96C10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 07:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCF034010C;
	Sun, 12 May 2024 07:48:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2bnBomCznI6B; Sun, 12 May 2024 07:48:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D045440156
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D045440156;
	Sun, 12 May 2024 07:48:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 174C11BF473
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0451040156
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKEtkR8OGnpZ for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 07:48:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9E7124010C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E7124010C
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E7124010C
 for <buildroot@buildroot.org>; Sun, 12 May 2024 07:47:59 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41b79451153so22721345e9.2
 for <buildroot@buildroot.org>; Sun, 12 May 2024 00:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715500076; x=1716104876;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0WYXiiuVpYF/HI+6E/zFctDyJGQ6gjisruUQ/Z4Vxv0=;
 b=Cj0tLBePvlFOYInsdv3SIMTzFS12JIVYd91aViKiMnvHFoaMGbeA5/ZpGrrW9I5UQE
 7fqio9+x0hjqwTwZOWGqDRVaUghmGNefr4pJiclaDl0n/h2BbIRdeAWP4ohYimQemgPT
 41AfwxKufsJGBJCkpfcVImXItCsczf/KJuQT4mT4pnBA/NVTfATsP8dOgygHwUuieq7K
 BzYqXoPDroHMmQ+hah3cG9FtGAbGuYK8k+IWnG1OejGN+f7JNICdPp6bNoZe3LAAI+RG
 9IY3lz8m2G+AZJIxfYU8Bv65zsTCjsM2mV7i4rr6Hyvll/DkDEqb//CXhTzJ0NU1FnEu
 BNIw==
X-Gm-Message-State: AOJu0YxokzXGzTe6U0VGzQSSnmjo4OS6s+vO4qoZUHQEOD4bXPLNMAd5
 jnxsc3lsfltr7f+ic4sTRnBaZlbsnQeFg9LIjwwGRl/ZX/z9H6r+iDorlQ==
X-Google-Smtp-Source: AGHT+IFLMpG++9ySns+thKCGBor9pmM9gMBA/jTx7cHlovz406TM3ONbI108o8gRRldZlP7+jFhB8w==
X-Received: by 2002:a05:600c:1d0a:b0:41a:ff7d:2473 with SMTP id
 5b1f17b1804b1-41feaa2f414mr56730655e9.4.1715500076410; 
 Sun, 12 May 2024 00:47:56 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b8a788fsm8309500f8f.55.2024.05.12.00.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 May 2024 00:47:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 09:47:53 +0200
Message-ID: <20240512074753.251535-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715500076; x=1716104876; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0WYXiiuVpYF/HI+6E/zFctDyJGQ6gjisruUQ/Z4Vxv0=;
 b=iGQjxWoY6LtJdtG+j08SakcSfgoBYiZ5Av8NkbxJokLpuN0GgrVK4B+0GB5ShneXY5
 jVmRBTTVRCsW7NJqpQgRX532nSZR72lJA76cwXajvbZcT+Kpl0PhvHsvMrDrxdn69L8M
 /M/tWqD7Il3W0AnT8ekPkYDK3dCK6OMIfuzK+dkZBwnfpX7Ako3BytsJq8WMCcXdtz0w
 Fum6EzcTA0Ukur/CDaW/VQUYx532Y8JvJDWGDtjZTPs517fjDx31tiUn9stsbKdaT75w
 OaZxdVMU9Fv/7cEFEGzfiqxd7MiaFu+FOPLk/a1wyN0sPI+3xoOMBVFAYEEUapewNBuE
 faNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iGQjxWoY
Subject: [Buildroot] [PATCH 1/1] package/tbtools: add hashes
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
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8d5b3aac435880333833d4a3909b1818fe8af045 forgot to add a hash
file. Moreover, also update TBTOOLS_VERSION to match what is returned by
https://release-monitoring.org/project/372327

Fixes: 8d5b3aac435880333833d4a3909b1818fe8af045

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tbtools/tbtools.hash | 3 +++
 package/tbtools/tbtools.mk   | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)
 create mode 100644 package/tbtools/tbtools.hash

diff --git a/package/tbtools/tbtools.hash b/package/tbtools/tbtools.hash
new file mode 100644
index 0000000000..ebd838ebe1
--- /dev/null
+++ b/package/tbtools/tbtools.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  e5ddbcb3dcf6315a1fe6fe2d4846b5208e75f24e626d43a0ea68358e8b15dba7  tbtools-0.3.2-cargo2.tar.gz
+sha256  9b16a3add311d607af8d9b348a842a37840d0f47dfcc6cf2a7756ee02c24ed69  LICENSE
diff --git a/package/tbtools/tbtools.mk b/package/tbtools/tbtools.mk
index 94340616db..36bfcd7f49 100644
--- a/package/tbtools/tbtools.mk
+++ b/package/tbtools/tbtools.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-TBTOOLS_VERSION = v0.3.2
-TBTOOLS_SITE = $(call github,intel,tbtools,$(TBTOOLS_VERSION))
+TBTOOLS_VERSION = 0.3.2
+TBTOOLS_SITE = $(call github,intel,tbtools,v$(TBTOOLS_VERSION))
 TBTOOLS_LICENSE = MIT
 TBTOOLS_LICENSE_FILES = LICENSE
 TBTOOLS_DEPENDENCIES = udev
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
