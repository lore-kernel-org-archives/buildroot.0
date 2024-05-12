Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5D1C10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 10:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 300804209B;
	Sun, 12 May 2024 10:05:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ryTUvJhvperr; Sun, 12 May 2024 10:05:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD9694209D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD9694209D;
	Sun, 12 May 2024 10:05:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0FF431BF27A
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF4044209D
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id neAdBAQjfpG4 for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 10:05:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3B9DC4209B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B9DC4209B
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B9DC4209B
 for <buildroot@buildroot.org>; Sun, 12 May 2024 10:05:36 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-34e667905d2so2245475f8f.1
 for <buildroot@buildroot.org>; Sun, 12 May 2024 03:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715508334; x=1716113134;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qt8xiuglwka8T4FgHd34a5QLIt9yYKFaEa1Ir+1gE6o=;
 b=MOOvaoL1jzve1iYT9QacjTOzoa52HULd2RT833bzbuBJa0St1622KK8KWU8DkVmjpq
 GrH8A9nBmfpEvD2VeZxOfoyc6/uQM/KncRxPkoEqIDe0gjRnJeay/sLEBVZS2ztOgtuy
 uok4XxOVhUFy9oX2JmIQ3+G8nEeuIQY5IJDsWaAbtzLu+JW2jJ6xYF/lC3XJtxme7d1p
 KOjbLMDOFtShgwnKkr5fYcoGVQRh+6EdMNWcs1uGIZ64GSKlZZNKeoaEGLXl2yFmxkP2
 mgRc9aMgrbhwM6fx3lYJQ5uooQnbsda17DMxQkqIO+hO/0U29imZxhmUf+YWeZsN9C8+
 Jjyw==
X-Gm-Message-State: AOJu0YyaXboIHFSftiF8xAGo1TAxx+eudgEW6k9gKk5Rr64CLUQ8KBL6
 /PPqv6j1gv7A7gJwAFHdJuBy1Y02b5w56i4RFKpIGagYzHamwpYhVqKbAA==
X-Google-Smtp-Source: AGHT+IEVciCv5DfNbU6x9DG7ZrspUE7CCoWIiWe1PuKyGPORzq60vtjaaJfRag+/ooxuvBIhYaLoMw==
X-Received: by 2002:a5d:5242:0:b0:343:41ef:ab1e with SMTP id
 ffacd0b85a97d-3504a96a550mr5496045f8f.44.1715508333605; 
 Sun, 12 May 2024 03:05:33 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b896a1dsm8529914f8f.32.2024.05.12.03.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 May 2024 03:05:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 12:05:24 +0200
Message-ID: <20240512100524.15346-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715508334; x=1716113134; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Qt8xiuglwka8T4FgHd34a5QLIt9yYKFaEa1Ir+1gE6o=;
 b=AVVcpyffwTBg/E9lyxkQbyE2gjBepMjJv1WNbsSqKPOCsY3+dgt0YThkQUbAi5g+eT
 Z0KJzQmAG0keFCHk8IWoWsQEzgLi2fbPcLTIJtLe7X6MLwzpxyisKzxF4AjEb0taggbx
 YNaYTJyTp4JC8A30f8ige6INaDNbIA8XipTCw2PJNolN2jB26ucyixHM+jqkrTleGw1v
 pHPEL4nkU0u9WRo1NsGDp4/qqfQuWJq69ocRw7KgP8csDAtTheVWpfkwxZCdAhau17/x
 FxjbISdmWwo8VpFULj9XxTQqe2DDd/fECUkb3d6OFrNKe4q+NdPkWvx+iutfdZY0tmQA
 HexA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AVVcpyff
Subject: [Buildroot] [PATCH v2,
 1/1] toolchain/Config.in: update BR2_TOOLCHAIN_HAS_LIBATOMIC
 dependencies
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update BR2_TOOLCHAIN_HAS_LIBATOMIC dependencies to avoid the following
build failure with libopenssl and
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE:

/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: ./libcrypto.a(libcrypto-lib-threads_pthread.o): in function `CRYPTO_atomic_or':
threads_pthread.c:(.text+0xfa): undefined reference to `__atomic_is_lock_free'

libatomic is available since gcc 4.8, when thread support is enabled.
However, the gcc logic in libatomic/configure.tgt does not recognize
"uclinux" as a valid OS part of the target tuple, and therefore it
does not build libatomic. The "uclinux" part of the tuple is used by
Buildroot when BR2_BINFMT_FLAT=y [1]. This broken logic has only been
fixed for arm since gcc 10.1.0 [2].

Indeed, bootlin armv7m is an uclibc toolchain compiled with atomic
support through libatomic.

[1] https://git.buildroot.net/buildroot/commit/?id=b3d1fb26dcadd8c570e2c415ce05398ecc810b32
[2] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=b1e21e5a5d19b436f948710e09157c5b3244f541

Fixes:
 - http://autobuild.buildroot.org/results/d25e898f9715bf6a21284807361a57735a7a2e1d
 - http://autobuild.buildroot.org/results/e37ed5ad6ba41d610bffe9c234f699e203ef5069

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Update dependencies to enable libatomic with uclibc only on arm with
   gcc 10

 toolchain/Config.in | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 655f1a53dc..ef8a8ba381 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -888,15 +888,19 @@ config BR2_TOOLCHAIN_HAS_SYNC_8
 	default y if BR2_TOOLCHAIN_ARM_HAS_SYNC_8
 	default y if BR2_TOOLCHAIN_X86_HAS_SYNC_8
 
-# libatomic is available since gcc 4.8, when thread support is
-# enabled. Also, libatomic doesn't recognize "uclinux" as a valid OS
-# part of the tuple, and is therefore not build on uclinux targets,
-# which is why BR2_BINFMT_FLAT configurations are excluded.
+# libatomic is available since gcc 4.8, when thread support is enabled.
+# However, the gcc logic in libatomic/configure.tgt does not recognize
+# "uclinux" as a valid OS part of the target tuple, and therefore it
+# does not build libatomic. The "uclinux" part of the tuple is used by
+# Buildroot when BR2_BINFMT_FLAT=y. This broken logic has only been
+# fixed for arm since gcc 10.1.0. 
 config BR2_TOOLCHAIN_HAS_LIBATOMIC
 	bool
-	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 && \
-		BR2_TOOLCHAIN_HAS_THREADS && \
-		!BR2_BINFMT_FLAT
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_BINFMT_ELF || \
+		(BR2_BINFMT_FLAT && BR2_arm && \
+		BR2_TOOLCHAIN_GCC_AT_LEAST_10)
 
 # __atomic intrinsics are available:
 # - with gcc 4.8, either through built-ins or libatomic, on all
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
