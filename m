Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FDDC54E65
	for <buildroot@archiver.kernel.org>; Thu, 22 May 2025 07:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0411A83CFE;
	Thu, 22 May 2025 07:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ToUBTUYitOb6; Thu, 22 May 2025 07:18:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B035483CFB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B035483CFB;
	Thu, 22 May 2025 07:18:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BB83D69
 for <buildroot@buildroot.org>; Thu, 22 May 2025 07:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1FD5613A9
 for <buildroot@buildroot.org>; Thu, 22 May 2025 07:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkrNXtMkl6wx for <buildroot@buildroot.org>;
 Thu, 22 May 2025 07:18:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 949F661389
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 949F661389
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 949F661389
 for <buildroot@buildroot.org>; Thu, 22 May 2025 07:18:48 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a36748920cso4844272f8f.2
 for <buildroot@buildroot.org>; Thu, 22 May 2025 00:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747898326; x=1748503126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TcbN5YDNLe/yCNITOW2SsR6LAfCU/eZvsL+MgRpFAxk=;
 b=JixKJ9W+Jilnx2xG8fiWsOabKvNm2aHf5NJ6fbDUrkKkgcCK4BqsRhNMqYpUVB12zf
 iDjXGv/OxMPJD1iA+lmJEh5G6dvs49nWpZM+0vht/hB9irBUlg9bMvWV8h5eHbXWLVfm
 aR0fHX1FEiDjyGcnSdUfA9LR6sedt6lkQfht0V6FIYFjn+wsQEETbktQg7XuRcMGYbz4
 +ugUoJWXcjH6PqMx0MPtyid1oRmFRumLPf9Hi+PpPYPHkUMSzzi96vcLuxfqdewXunHE
 YxNXKc685aBog/jFsQF42PKqQEerrggzOF5Q8JAYxgYx+kZMcxPYP+A4YIirkwyC9x/y
 QUfA==
X-Gm-Message-State: AOJu0YzTj4q7AHT6M25Zr3KJwU7RGevuha6jWOpL5efAsbAx5xzBrbCN
 Jqapv7Bc9kXB+RfCwK0tvKfBsfR32O0E0KEwkX6w1iIpOGqu5AuxbnmAwssZXksvRsOy7wlxGuU
 TTBDb
X-Gm-Gg: ASbGncuQW8zyMyXc63R5j12N7CntTT9rxJSB5j9X5kqudg8ggYLLweG35Y6x3fexkNy
 ZHt5EL1avZCtC0YVOmeqX/3CZb3B5N/8RA81/cRNcccXjaiX543T6rip1EATq8G6a95Wf9+TVXI
 F+IYZNFYVGUWVSaBTwxhWf9n9pTQt7OFWjaFHTk1SILxn0ReEEi0Zw1rAT1B2EB+kcxyHK+rMpQ
 kKUtl1dSXRD3L7jSDar5mNXfRRMGvhIyMrerZGuKjeXu03nE+frxXRBCb2cEQrPQAE6lmo50mDy
 TTG8AkYsf2s16oFcwOd/qyZUaq760APxoOHjkoQxkQQNenHobAgSOeWHZf8fhNjAkU6KTjFXJdd
 L6UZImKc7wmHHwRiOG50Y0yeSQVV6/1sR4Rj1T2eoENKkxQ==
X-Google-Smtp-Source: AGHT+IHQq1ym1cFkW9s0YroPGXXqG3YeXp9V3+D80NwEmYzMl6VpilkvBA0yTHgE1xWgNE9w0vOTlA==
X-Received: by 2002:a05:6000:400f:b0:3a0:b4f1:8bd5 with SMTP id
 ffacd0b85a97d-3a35fe67aa7mr18870564f8f.18.1747898326068; 
 Thu, 22 May 2025 00:18:46 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f38142f1sm93835655e9.31.2025.05.22.00.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 00:18:45 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>, El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Thu, 22 May 2025 09:18:14 +0200
Message-ID: <20250522071816.1948188-3-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522071816.1948188-1-elmehdi.younes@smile.fr>
References: <20250522071816.1948188-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1747898326; x=1748503126; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TcbN5YDNLe/yCNITOW2SsR6LAfCU/eZvsL+MgRpFAxk=;
 b=DXM2+rXYgwO5fDXyEGR9QWONBGIyvGok6nTtfoZ+STM9BzHBKFbYEQ1cXU1E7oy4TY
 fqns9Lhw+LPA2Ds0Mj8fJ1teUJGplk9RzUZ6+ZwIxtCnlHFWl0ngBlcmWIh6QTpquFEw
 ausu+Xxm0er002/oMSdChIIQysjoDBf6gKICc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=DXM2+rXY
Subject: [Buildroot] [PATCH v3 2/4] package/llvm-project: add llvm-runtimes
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
[Mehdi v3: explicitly set version to 20.1.3 for now, it will
	   be changed in llvm-project bump commit]
---
 .../llvm-runtimes/llvm-runtimes.hash            |  2 ++
 .../llvm-project/llvm-runtimes/llvm-runtimes.mk | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/llvm-project/llvm-runtimes/llvm-runtimes.hash
 create mode 100644 package/llvm-project/llvm-runtimes/llvm-runtimes.mk

diff --git a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
new file mode 100644
index 0000000000..66d9e1f336
--- /dev/null
+++ b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
@@ -0,0 +1,2 @@
+# locally calculated
+sha256  6394d8f111288c918421756037c10c4f8471325992e37c44cf8811b4e3dde00b  runtimes-20.1.3.src.tar.xz
diff --git a/package/llvm-project/llvm-runtimes/llvm-runtimes.mk b/package/llvm-project/llvm-runtimes/llvm-runtimes.mk
new file mode 100644
index 0000000000..34ac9ece31
--- /dev/null
+++ b/package/llvm-project/llvm-runtimes/llvm-runtimes.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# llvm-runtimes
+#
+################################################################################
+
+LLVM_RUNTIMES_VERSION = 20.1.3
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
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
