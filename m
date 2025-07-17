Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF55BC83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 08:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E53B41548;
	Thu, 17 Jul 2025 08:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxYPj3tGar_F; Thu, 17 Jul 2025 08:52:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96E9C41437
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96E9C41437;
	Thu, 17 Jul 2025 08:52:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 14D8395B
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 08:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFA5F402D7
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 08:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vFBE2XyZsLS8 for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 08:52:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 81D544000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81D544000B
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81D544000B
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 08:52:17 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso598703f8f.1
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 01:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752742335; x=1753347135;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kxCMZYz7NtfTTarB2exSSGzLh1s0ub7FYubFvtD7kGM=;
 b=fQTAodsXsoj12ASLWgIsD9EIW78G3pr0Sds+yqcrAjCUF6rEJK0ChOIiRlF+Wv+MKQ
 Ckga9URQ+Pjv3nkBseblSxH9TwxcbVU0B2h81W9IhAOq32nZDKGoJZDUm5jPsFjeGQVN
 533gvkGZpifMqgg0FHaiBvWWHR3iQG7IUo4uYXmrFSX/jBfUGFUmmzU/IPbXrW3W4K8m
 lDVn6pTtr/s5LF3gaRejV49oZvLPBb/KzvyFMqQDCnlAi5liQN0TS3+RSjGvoODZuH5W
 ikCEpJ/Xnnz0An9nuYQI6CbLK0IUbKu2pvnmQ6KcW+mvW9fpqteUy0Ig/tvne/8CBFvG
 Agvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXh2amtNyee+ZLZZqwDbeLTgK3R9AQQZ8qR5RVgAFxMZtGVBdQDYtGkFc2+pCYdloQMS0tVLFD03YU=@buildroot.org
X-Gm-Message-State: AOJu0YwPnftRlEBB4w1U/LCm8ovdSqB9rGGXgCQSgHrOJV5IpGFos5wV
 YymzKPY68dB4kprSlPip19p2yOfnBVaP2jOE0Dq22GsS0dEd8p2limGoerq1InGUd6TVx3v3p22
 CmhCM
X-Gm-Gg: ASbGncsx53I9Gvg7NhUuvJSRso9EsQu0xL8cEbR9p966WZIEssZ+71aqABwDAXaco9s
 ayunGO+jgXRZ9t01DWq7cYmvzlhEY4X6kUHG+O65wJz8ZEca350Nimveu1poKMtpcbj8KiBLJBn
 gaKaOed1chi26+f/UBZILDrhbqVFnZdR163FiDCGDUjFXLRoHizZnXTkxc1JlazHqNV5lqvV1sD
 EThxXpv9YnXiYImJVrk2rzTU4TJBJdFMfOylVL8z3tPeq/xqmZdG15Ab/5Uk9rlZPErMw/3kUVH
 vaVBPUfGWIM9j3tJOhTVbFzfV/y/+H+kCduPeH73Uzrg0iQ2qGob61SqwCdXNrVlw884K3yHxpT
 2oLU2V4QBm3z/IPzi60tLSFCS+1S0xMExeW6NRwtPMl6r9zEBHtqgbHw02eOneV9rRmM8mB9TYq
 MDn7B5wg==
X-Google-Smtp-Source: AGHT+IEqDptkwi+KyOhPM2lDX4sCHxzl8+VRLMPY5hq1AbSMgpy/+unVbEe9i3Q16qRWo46e8mmVIg==
X-Received: by 2002:a05:6000:2308:b0:3a5:88cf:479e with SMTP id
 ffacd0b85a97d-3b60e524377mr4799089f8f.48.1752742334918; 
 Thu, 17 Jul 2025 01:52:14 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:639d:e501:5db7:a3a4:443e:4828?
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e818525sm44021175e9.16.2025.07.17.01.52.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 01:52:14 -0700 (PDT)
Message-ID: <29821816-7374-4e70-8dfc-d11177a1d0ab@mind.be>
Date: Thu, 17 Jul 2025 10:52:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Knight <git@jdknight.me>, buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
References: <20250716114932.436-1-git@jdknight.me>
Content-Language: en-US
In-Reply-To: <20250716114932.436-1-git@jdknight.me>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752742335; x=1753347135; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kxCMZYz7NtfTTarB2exSSGzLh1s0ub7FYubFvtD7kGM=;
 b=TvsqM6y870St1FZGqYNC3wQ+zpVsrH00FwLNtjImG4MhKW2h00k/Yc8znaU6qpk1AH
 ecCLPRYvMX2mUoRrI+MuP/H1l1EbceOlQaX0v42wq7ntXSaLwoGg1mDstOoX4bYQgvex
 +GGgDrFqM5QZdYbF0j1Xu0JMbAABTtad5XGkBTOR+yJv4nd4kMOx6Ixq8jzKYdOxKOSG
 Q+K4KZbQaOVXlwrwt06LCnTt18Tpw4+Q7QN043qax/4vbckmXoVbwES/cVNw2RarhoPd
 72GPw9m/9a5LIGoL2FQc+6zT4aURuI2RFJBMb6EX/A9fSI0hfpZflSLZbVdZdu5DNSd2
 ooAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TvsqM6y8
Subject: Re: [Buildroot] [PATCH 1/1] package/sudo: drop uClibc-exec_ptrace
 fix applied upstream
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James, Thomas, and all,

Thank you for submitting this patch, although we already committed a 
similar one on the .pre branch (ie. what is going to become 2025.05.x as 
soon as Arnout officially pushes to the main Buildroot repository); see 
https://gitlab.com/essensium-mind/buildroot/-/commit/2b23a3bc199ca3156713530d0a108b27bd11977b

Have a nice day,
Titouan

On 16/07/25 13:49, James Knight wrote:
> This commit drops a uClibc patch that was included in sudo's 1.9.16p2
> release. This was applied on the primary development branch [1];
> however, when porting fixes on 2025.05.x, a jump was made from 1.9.15p5
> to 1.9.17p1 [2] which did not remove the patch.
>
> [1]: 969bdb9d2e1857589292122adbc75073b1b30cd5
> [2]: 07cde1ad1efe24d826ca99166534b3f0212cb5f7
>
> Signed-off-by: James Knight <git@jdknight.me>
> ---
> This patch is for 2025.05.x.
> ---
>   ...e-fix-build-without-precess_vm_readv.patch | 41 -------------------
>   1 file changed, 41 deletions(-)
>   delete mode 100644 package/sudo/0001-src-exec_ptrace-fix-build-without-precess_vm_readv.patch
>
> diff --git a/package/sudo/0001-src-exec_ptrace-fix-build-without-precess_vm_readv.patch b/package/sudo/0001-src-exec_ptrace-fix-build-without-precess_vm_readv.patch
> deleted file mode 100644
> index 446f1d1797..0000000000
> --- a/package/sudo/0001-src-exec_ptrace-fix-build-without-precess_vm_readv.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 5bbfaa8e68b5ee6f27d4fbfa3c4e789341724f9c Mon Sep 17 00:00:00 2001
> -From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -Date: Sat, 17 Feb 2024 17:52:45 +0100
> -Subject: [PATCH] src/exec_ptrace: fix build without precess_vm_readv()
> -
> -Commit 32f4b98f6b4a (sudo frontend: silence most -Wconversion warnings.)
> -broke the build on C libraries that miss process_vm_readv(), like
> -uClibc-ng.
> -
> -Indeed, the ssize_t nwritten is declared guarded by HAVE_PROCESS_VM_READV,
> -but is then re-assigned and used a few lines below, outside any guard.
> -
> -Fix that by always declaring the object, as it is always needed.
> -
> -Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> -Upstream: https://github.com/sudo-project/sudo/commit/5bbfaa8e68b5ee6f27d4fbfa3c4e789341724f9c
> ----
> - src/exec_ptrace.c | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/exec_ptrace.c b/src/exec_ptrace.c
> -index 9dd36c275..3d44b82e2 100644
> ---- a/src/exec_ptrace.c
> -+++ b/src/exec_ptrace.c
> -@@ -878,11 +878,12 @@ ptrace_write_vec(pid_t pid, struct sudo_ptrace_regs *regs, char **vec,
> -     unsigned long addr, unsigned long strtab)
> - {
> -     const unsigned long strtab0 = strtab;
> -+    ssize_t nwritten;
> -     size_t i;
> -     debug_decl(ptrace_write_vec, SUDO_DEBUG_EXEC);
> -
> - #ifdef HAVE_PROCESS_VM_READV
> --    ssize_t nwritten = ptrace_writev_vec(pid, regs, vec, addr, strtab);
> -+    nwritten = ptrace_writev_vec(pid, regs, vec, addr, strtab);
> -     if (nwritten != -1 || errno != ENOSYS)
> - 	debug_return_ssize_t(nwritten);
> - #endif /* HAVE_PROCESS_VM_READV */
> ---
> -2.43.0
> -

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
