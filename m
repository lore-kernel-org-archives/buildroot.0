Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AF4C87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 21:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E8B660D9B;
	Sat,  9 Aug 2025 21:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a-4O0l_1E6Ts; Sat,  9 Aug 2025 21:09:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF4B160BE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF4B160BE7;
	Sat,  9 Aug 2025 21:09:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17EE9154
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F25EC40B8F
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:08:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E9a8J6TQzOlR for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 21:08:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DFB8140B8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFB8140B8B
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFB8140B8B
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:08:57 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3b7823559a5so1520011f8f.0
 for <buildroot@buildroot.org>; Sat, 09 Aug 2025 14:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754773736; x=1755378536;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jSCRUR5uL9NmeVKsiBLUFiNRL4RkdEBKxRa75Unz3Uk=;
 b=n/oTrl+xYNy0yWzL7UpdB3bDH/Qf8Id9uH4ThdbOa2fIzc4CzDhMsibMza0QA0Vh1Z
 0XChOuVpMigFuru8A1SbL23Ap5EGrBa+RGVhJLVWU7eRyywNxPZCwBcFwH2DFhbZ0SAv
 MCjgqG4LjO4ZJ6Uc94s0BfMq1MUMFdcaZBkzqMIrQkOGzvYCdwecNXH8GAyx1E+AQdCe
 jnqPK+AKgkRJwr1DSy711Bvyk8NFtEz8qaZ+vI1Ko7JI0rFAdwVeZYPayg4ZvoQ0SuNL
 6752H+OQgPVu7qHRXZrWWm4Qm6xbwGUEbo/f8J3ge6xgvPa1HANU7zVYQ+2MgZBqbuCi
 Hl5w==
X-Gm-Message-State: AOJu0Yw9FG97UfymM8xskKK7nl90rLU4+5LEFhi7atajlZaxnHigtsQd
 tb2+N45KErH//a83lwc3vQWJYZWgslQX9CHXEhhBw/0/JdcA9kBI8cfeko+pqesv1uqg9Zuz16f
 knKF5
X-Gm-Gg: ASbGnctz4Tztbw6hK9ukDT92jziSay/fA1/Li4QVbeoOeasoYQy+5B4jwLIlDEh0r5m
 thgWrr7otaggx9dMm7nhAiNVqoJxtLkMIYcgDLzw25oIfUIXFfla7ARAGKjOYI5sYcnHlcLRBoo
 0wd7O4i8bPASrGg6aVo7K/eV0Wp+c7fbMxE9pNwQjgTaALiVMOnd37V0kqTmrQSgn5GnqSuuw1a
 8CVnfWBPV9MH8oOsEaTRy0t27gcznmjdDtcAPSdHfC70Db3wpWIn2wgsQ9nKwEiRw2YqZnGHor+
 AW/zEO4vvgHlnHcIgWzxgoy3KsIBVKa5/rSoQbLdAH5GquxcUipuSV971aSae3lSJK0QYFWj+qA
 Ywz+jF+BJIbUXug==
X-Google-Smtp-Source: AGHT+IGxAQhDSHVzNRWkD7ALktE9l/Ma2o+1ykqnLaz9fdNiQ2gMzjj7yWFvU/F9m3OrTkAoL2w68A==
X-Received: by 2002:a05:6000:240b:b0:3b8:d360:336f with SMTP id
 ffacd0b85a97d-3b900b4d2d7mr6467022f8f.28.1754773735833; 
 Sat, 09 Aug 2025 14:08:55 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e587e154sm206908115e9.27.2025.08.09.14.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 14:08:55 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>
Date: Sat,  9 Aug 2025 23:08:54 +0200
Message-ID: <20250809210855.354805-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754773736; x=1755378536; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jSCRUR5uL9NmeVKsiBLUFiNRL4RkdEBKxRa75Unz3Uk=;
 b=WsR5E/gKN4vYNYuUslIztNI4OtaWzxs77Bv/Ou6aLKvmBvbdGN7K3X2j+wQSMPFXX9
 qdeZTDvmvjGDMljzXe4d5/JpNo6rn8WVuG/LTSE9ilrDVAX4uEev7M/7cZuh1h51wVAw
 Lx/smwvezeVy0spy04uOt1QzSvIKmOwYkgTk9zoTCq16RjgCZ3VgiyJfvZbvrnQrR05z
 OlNkefHDnj+pHb00BVF/cyPQhOCmfMBFHZr0pcDFYDpP8MSYhkyb4EdQnKMifbgW+SbO
 9owsz0BhfBxKfxJ41yQjj59gLfJZt+hfpFZRTkC6A+GGeLfTTxoxlJVTyAGejPdVKNIg
 bkWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WsR5E/gK
Subject: [Buildroot] [PATCH v2 1/2] package/pthreadpool: fix thread
 dependency
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On autobuilder config with BR2_TOOLCHAIN_HAS_THREADS not set the
following error happens when building the pthreadpool package:

```
-- Looking for pthread_create in pthreads
-- Looking for pthread_create in pthreads - not found
-- Looking for pthread_create in pthread
-- Looking for pthread_create in pthread - not found
-- Check if compiler accepts -pthread
-- Check if compiler accepts -pthread - no
CMake Error at /home/buildroot/instance-0/output-1/host/share/cmake-3.31/Modules/FindPackageHandleStandardArgs.cmake:233 (message):
  Could NOT find Threads (missing: Threads_FOUND)
Call Stack (most recent call first):
  /home/buildroot/instance-0/output-1/host/share/cmake-3.31/Modules/FindPackageHandleStandardArgs.cmake:603 (_FPHSA_FAILURE_MESSAGE)
  /home/buildroot/instance-0/output-1/host/share/cmake-3.31/Modules/FindThreads.cmake:226 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
  CMakeLists.txt:143 (FIND_PACKAGE)

-- Configuring incomplete, errors occurred!
```

This can be reproduced with:

```
cat >.config <<EOF
BR2_armeb=y
BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_PTHREADS_NONE=y
BR2_PACKAGE_PTHREADPOOL=y
EOF
make olddefconfig
make pthreadpool
```

Since the introduction of this package in [1], the dependency was not
included. Since this package was part of the tensorflow-lite
dependencies that required thread it was not an issue.

This patch adds BR2_TOOLCHAIN_HAS_THREADS in the dependency to avoid
errors when built as a standalone package.

[1] f2486a6cf9 package/pthreadpool: new package

Fixes: https://autobuild.buildroot.org/results/35a/35aa100d72c6875350ad10c57f028f04052cbf79
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pthreadpool/Config.in | 4 ++++
 package/xnnpack/Config.in     | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/pthreadpool/Config.in b/package/pthreadpool/Config.in
index 194ae33f85..8d163b16de 100644
--- a/package/pthreadpool/Config.in
+++ b/package/pthreadpool/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_PTHREADPOOL
 	bool "pthreadpool"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_FXDIV
 	help
 	  Pthreadpool is a portable and efficient thread pool
 	  implementation.
 
 	  https://github.com/Maratyszcza/pthreadpool
+
+comment "pthreadpool needs a toolchain w/ threads"
+	  depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/xnnpack/Config.in b/package/xnnpack/Config.in
index e4b92f61e8..794c5c47d2 100644
--- a/package/xnnpack/Config.in
+++ b/package/xnnpack/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_XNNPACK
 	depends on BR2_PACKAGE_XNNPACK_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
-	depends on BR2_TOOLCHAIN_HAS_THREADS # cpuinfo
+	depends on BR2_TOOLCHAIN_HAS_THREADS # cpuinfo, pthreadpool
 	select BR2_PACKAGE_CPUINFO
 	select BR2_PACKAGE_FP16
 	select BR2_PACKAGE_FXDIV
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
