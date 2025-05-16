Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5501C54754
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8462608FA;
	Fri, 16 May 2025 17:12:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8nkBdmwMOQCh; Fri, 16 May 2025 17:12:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E04C6132F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E04C6132F;
	Fri, 16 May 2025 17:12:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 28AF213D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 816BA8118F
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYzLoKNfNxYj for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:12:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D3F083126
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D3F083126
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D3F083126
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:12:27 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-442ccf0e1b3so26461675e9.3
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747415545; x=1748020345;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7OtwNtQx0QQvOme+Yp0c8IobSq7Q9MRMUJdaaFKQdZE=;
 b=BUAxukGKvyjqg7sW5cLf+5hVviO05qBHjeqOUGhvyJsRNfANNhQ3K+fLEDZF/2r43t
 SDChFJaI/GEvLrgBR75IROR+ur67W4Pz3giH7WMcUd4eH7KtGyIT2aMwH4xWukW5kHPo
 QSOtc5o6LNhih9fuVdHs9a4YWi+tPQjicrjexPJh5QnIjZAw8Su/874XmwqBmpUakiqz
 P/sRvaOsU5JKrPAfdVCop7M+QMVacjvPNhz46jIFGEYpHoLBA69+rOs6z6OXB94ZylLh
 clX61PCUd0+wb2dCjwIUqySkvQ0M66IwSm7AA40urF98kjKXYFKghVpO3zCHDM0kYTry
 knaQ==
X-Gm-Message-State: AOJu0YyUrkD8gxr3e8SNizdLFk6VsoCpUU3HySqESI4Y7HH1ChL+zwpV
 UyaHQqbzBfDh7tNPUEuLX7Ets/Afi5kUciAZRqRHh7Nshl4xy1zWIWf9P9hG8m3Tym/BFMajthd
 gZBUE
X-Gm-Gg: ASbGncs0e5PQvKkFFioMnNZLdn5ub0Ovmc7MHvn5Gqsv+vx+EftAuZudsqe6i91cCKv
 8G3LaRsjXfEC0x8unHjApwtqCRC+3lTIIPMyRT40vFT5MsiJ0L23wfYNLgCgTwNIljSor2b6WNH
 BFdiGx5cA1hVJ4kaakgNtWK17c0aa+7Q/jqlRQ+jtxY1OwQ2LmXlq9x5wYt6qU7YyshYnBYQoKU
 nKe4UZcP0bShbhTqvER8QWBdaSWGJzJKErgNzWCia/cAj5EjQcySx3IYEa1hmgksUY+FcvTl/Yh
 BNhHepBuKGJJedkXGuIn+QwBnGRZVgCF+PTwLoN/wa15oz5Mdkeg+sd59eATfapHk0/VZv2Yggw
 bPcFD8qcWH2kEK41sW+FEJLcy0RPyy5UiVT7jhIg=
X-Google-Smtp-Source: AGHT+IG438WslvU5/6PUZvYLsbBlvQTJbjcLSAlG3SqCs1/Tdm/U72kaZjtMApWIp6A6itW1AYhqWg==
X-Received: by 2002:a5d:64cc:0:b0:3a3:5ae4:6e9e with SMTP id
 ffacd0b85a97d-3a35c8092dcmr4789184f8f.1.1747415544755; 
 Fri, 16 May 2025 10:12:24 -0700 (PDT)
Received: from P-NAN-ABRICOT.numericable.fr (185.137.153.77.rev.sfr.net.
 [77.153.137.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f482f1d6sm105479675e9.14.2025.05.16.10.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 10:12:24 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Fri, 16 May 2025 19:11:31 +0200
Message-ID: <20250516171134.1687054-3-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250516171134.1687054-1-elmehdi.younes@smile.fr>
References: <20250516171134.1687054-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1747415545; x=1748020345; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7OtwNtQx0QQvOme+Yp0c8IobSq7Q9MRMUJdaaFKQdZE=;
 b=wDJLsXpS3Ml/8mUfsE4wP/Rn9ptrGZUKu3bX6LE7HbjduOfzkJsIhGrUGzjigZ4Uxl
 jHNzDhlHx0MpihhTZXAYPb448FmQ1cUlWiKVX9pW46dbqD1u8hpRb8ZjOCf0wXilp1ZZ
 tziLGvg2X3iXy67ttW2KrkBNs1X6S3WD4u3/g=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=wDJLsXpS
Subject: [Buildroot] [PATCH 2/5] package/llvm-project: add llvm-runtimes
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
---
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
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
