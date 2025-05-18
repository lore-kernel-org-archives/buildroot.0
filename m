Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1227EC3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 11:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D38F0409FF;
	Sun, 18 May 2025 11:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U90UUOR_7Iiq; Sun, 18 May 2025 11:55:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09C1C4097B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09C1C4097B;
	Sun, 18 May 2025 11:55:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 66E561BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 11:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D13040ACE
 for <buildroot@buildroot.org>; Sun, 18 May 2025 11:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d1dpqbhDilCN for <buildroot@buildroot.org>;
 Sun, 18 May 2025 11:55:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5EC2E40146
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EC2E40146
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EC2E40146
 for <buildroot@buildroot.org>; Sun, 18 May 2025 11:55:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a067b.dip0.t-ipconnect.de [91.58.6.123])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 81DF7A4C2046;
 Sun, 18 May 2025 13:55:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51560)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uGcby-0000000008Y-2k2H;
 Sun, 18 May 2025 11:55:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Sun, 18 May 2025 13:55:16 +0200
Message-Id: <20250518115519.3649662-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250518115519.3649662-1-bernd@kuhls.net>
References: <20250518115519.3649662-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747569323;
 bh=Yp+cuM8+OwUq2n5nWaYzpet2sVouN/gKJtBEGblqxwg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hsw3TXJuPJFuMjI0sSu3YmOM80bXdVEMOy3KS34H/ymd8xnsccSunREI8zTl3fvoA
 QcfY4fSA41zzCKsaRgdeAF0nFE0SJnBsnq8Os98Whw3lH9P0ng2akXyHEo9RShU8Re
 tzZYhL56HMm5P62vY6Iy8XhWNzHzkXLGe+N8eZ8bigYxchomaSE4jGC9rrV7bzgOu4
 MbBWCYbE0v4h5aevKL+h5Uqp3gz+Ndzey70KMg+EBxfcM/5kHZjWWqe7hKZs9aVfTF
 rEEdTOjUyuaJN5SSX1ayFEfJ/3BcSEFIp83Wo79OYLdAL6OC+kAfFP3ifL0SzXl1ZZ
 Fk9mtxq7CWwEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=hsw3TXJu
Subject: [Buildroot] [PATCH v2 2/5] package/llvm-project: add llvm-runtimes
 package
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

From: El Mehdi YOUNES <elmehdi.younes@smile.fr>

Add a new host package to install the CMake modules provided by the
runtimes archive of LLVM. These modules are required to build components
like libunwind since upstream refactored the common flag-handling logic
into a shared file: `HandleFlags.cmake`.

This package extracts and installs the relevant files to
`$(HOST_DIR)/lib/cmake/llvm`, where other components like libunwind
will look for them.

see https://github.com/llvm/llvm-project/commit/0af67d167d6c811abf12ad6c27ee34ec1365e5fb

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

 .../llvm-runtimes/llvm-runtimes.hash            |  1 +
 .../llvm-project/llvm-runtimes/llvm-runtimes.mk | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/llvm-project/llvm-runtimes/llvm-runtimes.hash
 create mode 100644 package/llvm-project/llvm-runtimes/llvm-runtimes.mk

diff --git a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
new file mode 100644
index 0000000000..492050e8ac
--- /dev/null
+++ b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
@@ -0,0 +1 @@
+sha256  6394d8f111288c918421756037c10c4f8471325992e37c44cf8811b4e3dde00b  runtimes-20.1.3.src.tar.xz
diff --git a/package/llvm-project/llvm-runtimes/llvm-runtimes.mk b/package/llvm-project/llvm-runtimes/llvm-runtimes.mk
new file mode 100644
index 0000000000..88f1421f08
--- /dev/null
+++ b/package/llvm-project/llvm-runtimes/llvm-runtimes.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# llvm-runtimes
+#
+################################################################################
+
+LLVM_RUNTIMES_VERSION = $(LLVM_PROJECT_VERSION)
+LLVM_RUNTIMES_SITE = $(LLVM_PROJECT_SITE)
+LLVM_RUNTIMES_SOURCE = runtimes-$(LLVM_RUNTIMES_VERSION).src.tar.xz
+LLVM_RUNTIMES_LICENSE = Apache-2.0 with exceptions
+
+define HOST_LLVM_RUNTIMES_INSTALL_CMDS
+        mkdir -p $(HOST_DIR)/lib/cmake/llvm/Modules
+        cp -Rv $(@D)/cmake/Modules/* $(HOST_DIR)/lib/cmake/llvm
+endef
+
+$(eval $(host-generic-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
