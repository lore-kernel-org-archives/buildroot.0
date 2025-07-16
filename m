Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCC5C83F27
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 11:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC3B260B2E;
	Wed, 16 Jul 2025 11:49:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rod-pITMtn5U; Wed, 16 Jul 2025 11:49:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF400613E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF400613E9;
	Wed, 16 Jul 2025 11:49:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FDBB1514
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 11:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0594C83D87
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 11:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P72RC4dtmKtr for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 11:49:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d64; helo=mail-io1-xd64.google.com;
 envelope-from=git@jdknight.me; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4A2A283D93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A2A283D93
Received: from mail-io1-xd64.google.com (mail-io1-xd64.google.com
 [IPv6:2607:f8b0:4864:20::d64])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A2A283D93
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 11:49:55 +0000 (UTC)
Received: by mail-io1-xd64.google.com with SMTP id
 ca18e2360f4ac-879c737bcebso11482239f.0
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 04:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752666595; x=1753271395;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0L5MqFRrb06rnKtq9kv/H3yGUoBS6j0c9b5zjHZUvL4=;
 b=gY3zqz8WvWQbcTv54LWqW1NhSRdJ1ZlqZmla5IkrkW9mQQjekZ+0GaZ0ph30FFoc69
 VfLgyp3JyAG+yqaGBrNZn9lCFF3DkFd5pxjQc7aCxwboA4K57Aq/J/XQp3JUnJe1YTGk
 q5hl/2a3j81eblm884+Z90H1iPDtSpZj944r7quzpmLXl/+h8mSmKGuaHcMdPN8kb1jZ
 11jhpvF6JewKt/RWgTpxQ6PX2F2WyDvYWfpLroCBGz+G1Vt2TPNdECQZD7B6YCzDQnxQ
 APJW5NgA7V0wr72GsAq0Fv1JCQiSh0gaFo1VDjToUNiLjKzMeCLRvCnCQgToCYblaQlO
 reXA==
X-Gm-Message-State: AOJu0YwjeHbXA87/AlCAP/cN3qsOJQ3YAdH2OMl31JBuBMnp6U3x5bZ5
 HjtU0rnJMIMz2+FfIKqbww/+k1hu1FOlOn9k30gFvLN5/yJy094l1n0MxBTY0i6Fywcvmq1NbdB
 uqK0/qf/WLNgi/WX/Bf4BtKrrOOT9kOntV0/UdWCIkl8Uesw=
X-Gm-Gg: ASbGncut3nweF7Pi/enF5ipFqSNmwFCY+RnhjGGIIq0J6DmRPJ1I2wKKSt7D7Oei/Pu
 rGQRdmQehIQ2vT5IpG4Od2Ccj34wnQ3/qcED31pX4pMvd1DsCh3rbADcc5F+90MUDmlMKG8z4U6
 mS/InbYTpF2r4S+u8wZ0rZOo33XL7/RJ9m9PJkp9m+SRCJEjtzFcK1a9pFwF2kqJmuiaFp80GHz
 WAFdQiG9TF07jw4HgQXE1buJkapLrCV8S8T9Qgbv+DUvyzkLXvRmIc3VeD15hNzQmg2LXQJJKm2
 gYNlIb3t4Mamm3p8uij+JNd11K85tvS+wVGIk5pvuBWq1S8tIhK4uxjeUCtiQ9orrSXNis6h1iS
 +PIhU0PEuzZWwxeg3E/3iD7OLQNihZ7h7fAd+nI0r0FbtcSym
X-Google-Smtp-Source: AGHT+IEpoP+GK4lM886Jmq5UfWcBN6qOQAbOV3yN9EaNHfyE/EKvsn7bZnYiCSYez27o+k6Opnv0dcnNLLO/
X-Received: by 2002:a05:6e02:1f81:b0:3dc:7b3d:6a45 with SMTP id
 e9e14a558f8ab-3e281e5188bmr27315985ab.0.1752666594974; 
 Wed, 16 Jul 2025 04:49:54 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-jkvlon0513w-grc-49-184-144-89-37.dsl.bell.ca. [184.144.89.37])
 by smtp-relay.gmail.com with ESMTPS id
 e9e14a558f8ab-3e246112f43sm9211125ab.23.2025.07.16.04.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 04:49:54 -0700 (PDT)
X-Relaying-Domain: jdknight.me
From: James Knight <git@jdknight.me>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
	James Knight <git@jdknight.me>
Date: Wed, 16 Jul 2025 07:49:32 -0400
Message-ID: <20250716114932.436-1-git@jdknight.me>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jdknight-me.20230601.gappssmtp.com; s=20230601; t=1752666595; x=1753271395;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0L5MqFRrb06rnKtq9kv/H3yGUoBS6j0c9b5zjHZUvL4=;
 b=zul0eLvR5bG62bKFXQofqY/2mUoQOfG3DBBPhNma0M+I8DnR0UjbJXV9o7ig4IoNv7
 N9vbaapVgmnM50/GgnWnGRISe7CMGE4GOMj0t1CquPMXii8PReCe/3IT3zHFHMtpgYqc
 ebrM6UnDXmjR7X2BBybQ/efE6u7AH/+HFCMRfYkRgmc7hDTURhd8eTsl5vDyVJQqkcR1
 8idjsT5l3FYjcpvmBlTjnhp0nABDC+bIn5X9k5xnycgJiXXBOETBD7H159oyVt1gAB+O
 HNkZa83c+VmXNQ1UlTTcWY/Kfrmu0Ok2VEEb423cE41ISCV5GyUNHDKuCxWulnsWbTQ/
 fQSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jdknight.me
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=jdknight-me.20230601.gappssmtp.com
 header.i=@jdknight-me.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=zul0eLvR
Subject: [Buildroot] [PATCH 1/1] package/sudo: drop uClibc-exec_ptrace fix
 applied upstream
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

This commit drops a uClibc patch that was included in sudo's 1.9.16p2
release. This was applied on the primary development branch [1];
however, when porting fixes on 2025.05.x, a jump was made from 1.9.15p5
to 1.9.17p1 [2] which did not remove the patch.

[1]: 969bdb9d2e1857589292122adbc75073b1b30cd5
[2]: 07cde1ad1efe24d826ca99166534b3f0212cb5f7

Signed-off-by: James Knight <git@jdknight.me>
---
This patch is for 2025.05.x.
---
 ...e-fix-build-without-precess_vm_readv.patch | 41 -------------------
 1 file changed, 41 deletions(-)
 delete mode 100644 package/sudo/0001-src-exec_ptrace-fix-build-without-precess_vm_readv.patch

diff --git a/package/sudo/0001-src-exec_ptrace-fix-build-without-precess_vm_readv.patch b/package/sudo/0001-src-exec_ptrace-fix-build-without-precess_vm_readv.patch
deleted file mode 100644
index 446f1d1797..0000000000
--- a/package/sudo/0001-src-exec_ptrace-fix-build-without-precess_vm_readv.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 5bbfaa8e68b5ee6f27d4fbfa3c4e789341724f9c Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sat, 17 Feb 2024 17:52:45 +0100
-Subject: [PATCH] src/exec_ptrace: fix build without precess_vm_readv()
-
-Commit 32f4b98f6b4a (sudo frontend: silence most -Wconversion warnings.)
-broke the build on C libraries that miss process_vm_readv(), like
-uClibc-ng.
-
-Indeed, the ssize_t nwritten is declared guarded by HAVE_PROCESS_VM_READV,
-but is then re-assigned and used a few lines below, outside any guard.
-
-Fix that by always declaring the object, as it is always needed.
-
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
-Upstream: https://github.com/sudo-project/sudo/commit/5bbfaa8e68b5ee6f27d4fbfa3c4e789341724f9c
----
- src/exec_ptrace.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/exec_ptrace.c b/src/exec_ptrace.c
-index 9dd36c275..3d44b82e2 100644
---- a/src/exec_ptrace.c
-+++ b/src/exec_ptrace.c
-@@ -878,11 +878,12 @@ ptrace_write_vec(pid_t pid, struct sudo_ptrace_regs *regs, char **vec,
-     unsigned long addr, unsigned long strtab)
- {
-     const unsigned long strtab0 = strtab;
-+    ssize_t nwritten;
-     size_t i;
-     debug_decl(ptrace_write_vec, SUDO_DEBUG_EXEC);
-
- #ifdef HAVE_PROCESS_VM_READV
--    ssize_t nwritten = ptrace_writev_vec(pid, regs, vec, addr, strtab);
-+    nwritten = ptrace_writev_vec(pid, regs, vec, addr, strtab);
-     if (nwritten != -1 || errno != ENOSYS)
- 	debug_return_ssize_t(nwritten);
- #endif /* HAVE_PROCESS_VM_READV */
---
-2.43.0
-
-- 
2.49.0.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
