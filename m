Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F75C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA66D60D94;
	Fri,  4 Sep 2026 12:19:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WCCBEernEMK0; Fri,  4 Sep 2026 12:18:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 034FB60C27
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524331;
	b=gXWrxXmCr32mlMBr8gmddYJ4jDZTtYAWYjtyfGw84kTrIiWRug4Kookh3+Gy07tSyW2Q
	 2woWGRdWsz3QkOXYppYDvGvXKpKZNhN3A7BqB7In54rBbbVPCAWlHgHsexq/2+DkfSWTU
	 dFAcuHBkoNnLX4XINDWrW7dMA80XPVGYMDthNVoDMbTknacHFuTmyX4YMN7Zy2wz5g2vC
	 qYYhzkSss2sKLUuDdRr+VkmETLrI6BYTuhINuDQcYWbNLE3b1gJ5IOLfywqBezoFhiNm9
	 CgyDpAznrz6hcEMWZsPsmt+s3OpOQ7Mf82Zgky03JRP5E3CkVeoEmCodCzyMaC4oXDQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524331;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4lSGTX0CxqJe67cOgtZhXSHOFqy371mGiK6yQF8uBlc=;
	b=svrNW0Fo+xYMYxt3OroL/8qs/4yT7QNrBGTBo2OEy6e5yaj4URxg38QfxyhpmMgmYJr9
	 vVy2FI8kvD4XrUu/w6iWHOp+5YN6s2fe2C1F6u4DYMSc+BxfEzwEl+7v87qyAw7bCEHyd
	 eFnuUJFRRfBffK0mPo5t4MO2VjSm7+OA1sqGO38RSyho/tsv2PR4X4D+kR75fOKDqf8jL
	 nBFw+F0xKqszRnhwOCyvWZ4np1iwoxl6KHKGdw/s4pSc6KTFBk/up7oHWp9NGPJ+BaFy9
	 gzMcMnGQ6e9M795YgM+rA3qeGsWit98cQE43jNveqaURyjy3BiKfEyeOlnIk6GwIogw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524331;
	bh=4lSGTX0CxqJe67cOgtZhXSHOFqy371mGiK6yQF8uBlc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Zqc8FIG7+NoP9wKnu2eUs6V5lmG/ZlF0fA4CaigxlKdsLQYYnXCROmhUt6Hw1uMAV
	 6pIaXii4p0oGXneq4qks6TeibaehTrg7IMEsF3b/KyW44OLZzJqXZNXrBYgppoU6gG
	 VsLRzI782ELwZ/dRBaD9BCwmXKnIpZDBBfXNxFO5t8DG0qaCv0Vg9gsQjnUOoy37s/
	 sCSNjjMHT7cZLt7MAUAbuKiyHbzp0qzihK2NelqMd+pjOzTd0aB6blbGkPyf5zDrGv
	 fPQu+Ujca2P1VyBvkK1sKKkYJZHgor723LXQWcJ1Gjcp8S/enVlUbdGfNpuv4JLn1R
	 mPUO5JRJ6uptA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 034FB60C27;
	Fri,  4 Sep 2026 12:18:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A906F14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CB6340080
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u4FeJCghm648 for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:18:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0B5064031A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524326;
 b=TChm2j7qCA2fsm0Lg66J04LOM/iYd1Ob5hFOvr6+1OfmFYbU1d/OldogsPP7Sb+B1fop
 6QJ40PKDve+/TBV2JjOlmY2wmv2nIM3Z5pGA/L6ORVhd0xFFgb7V/u+GW372ZlRftcPNc
 7vH+9D/XeqF4ZrJUcRYNme9xoeNshKYX7Qw4R6xgGZbiOL3xSa/T+r2oCyxxcT/W30SmH
 yYbyBZxzbzofVHDgzfKfVK6+R22M4o+9mfg/e5m+urPsrfjldLKFl5O64fHJRkuyMRcJk
 Y/siCaowWtK/FzfM43RerbUofvIU8jAqUSTApbDIlRWaleCs8soVn6XYHu5z3kIzrJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524326;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=g6mi9WV1hUf0PgbrjCURsnnioET0QnJxSoQ5so16NB4=;
 b=Vi/lFQwwwXny5LmTGF8vKDzq14XrPgw32mOsVsjwwB5m1ZZ9CF4o3Ak9Cd8KDNrZKtpd
 fg+mVzNeHrsU8WybdVpMfK+clx5tQlbWVOj59YDxhyO2lCg89fDTkCr+uMFYi0HAn934S
 KmlEFxze4645QXjIsDtr3NThuktN2SlvILH8bpIRowUunsscu1dmIw1YPLhn0+0DvrK1w
 jAkjF9NJonQvviXzIQJS815e0iSdcEj7pqP+stzX4MrVOHQyeC/QdNe/64GUo4cF+f+Rl
 bb2ucJtePCfo0FrwbNJXrjtVA8mYV881yTuFHxBZGhXzMpb7biZKmXfyncphg3CKwIA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=E0THhctV; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B5064031A
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:45 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-49556f97a9dso8130005e9.1
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524323; x=1789129123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=g6mi9WV1hUf0PgbrjCURsnnioET0QnJxSoQ5so16NB4=;
 b=tY49+jLpKwLDKt+mrtsikuZCNTALgJfY4uMtdPXG5jc7xLdQXBeO+scMny87SKlNan
 SMY50fetNwBQRp+7RUFwCmGlybkbuSwvu6x16d+kpcg/KIkC3DFGr2GE3Jm0d0U38QbC
 9bKT2pftcNev2Y0hNaKhE3DH/4p6nQnDghGbV36442C3NCupWp/efodMklllU46KlYU/
 loU+8qc9wfX92c0OOAsIMKFHveoBQL08iUuTwwcdL0A2M5VVgmsCzvn0+/d795HNHGY3
 VWVIhmYuHSvnbUvCxgYBFB+0X0WCZZelRLna4ilm2H89k/0wbrzRQwCyE5xPRSDXOKNw
 /ZUw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxEw/iN+5HJIwSc07IJClDpMdfglJFvM1+TANzMsXc683FYHu8HCve8OJt2cvFCemq84UgufDmrzdI=@buildroot.org
X-Gm-Message-State: AFuF++lV+LJFqLdEb9HCg/zvKm6VP3o15QU7EiCVrFrfCf2lOqr/TCvV
 vJvKXwpZWoPmCYjrJEsPHD1fu4deo/b5w2DngIXGhD6Dh5h4Ra40SLPteREiUcOCEXxkFNrGMhP
 lfCHp
X-Gm-Gg: AYBFou1S6TIXzhtnPqe6BHVZVoJkoUsD1sVdG5RXSL7BJUlOlSzz0FAV9uGsobMpGpL
 j1US7NzZmQwPqIkTRIgLDVa/2ne7ta8+Ywa8/vY8eZ+ouVHUvzVR+7OrsKQm6JHp+3QVLvSh3Ku
 xkXCDaOlOhJJiLym6G1Tup0KcQSXo2fOv0rYJfvDal3gToFGEZ6ZLLC96ymEZJYhK3hqmWfrCB+
 +xVPw/0QrFIbtujgybGwbldbDgUjND2VTDnPoh+a7KNjRMBgCfot1uEWeGVTGM2k2E71pzp72QD
 EkZjzDW0tMXAVwFlTgEsYZsHNe+nluowqxEAmW5o6HhTiE8RxmLoxhysgyvZN1pt08M7nGq6FdG
 bz6KionXc/cy9VBeP2G4qiLvrxZ+eGT08lemehOffgJnQ6jO5KH1oPP1Pz7m+7Kn5LqK+qn96ay
 rxnQmSRp0jSZ8dEXN+G4WKP+UFn/6Hg81P/wSL2l2YTGTZSfm8flGK/w==
X-Received: by 2002:a05:600c:6819:b0:49c:de80:b833 with SMTP id
 5b1f17b1804b1-49cf81fb1acmr56676575e9.2.1788524323466; 
 Fri, 04 Sep 2026 05:18:43 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883c81c3sm5705737f8f.26.2026.09.04.05.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:18:43 -0700 (PDT)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:18:42 +0200
Message-ID: <20260904121842.406014-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <ao09nrk6sTpYtRUY@waldemar-brodkorb.de>
References: <ao09nrk6sTpYtRUY@waldemar-brodkorb.de>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/uclibc: fix m68000 toolchain builds
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

In reply of:
> Add a patch from Upstream to fix building of a m68000
> toolchain.
> 
> Fixes:
>  - https://autobuild.buildroot.net/results/4cc/4cc0de3d33339bd50792ca224f10dfd18a636b00/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  ...nel-helper-on-every-core-without-CAS.patch | 116 ++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 package/uclibc/0004-m68k-use-the-kernel-helper-on-every-core-without-CAS.patch
> 
> diff --git a/package/uclibc/0004-m68k-use-the-kernel-helper-on-every-core-without-CAS.patch b/package/uclibc/0004-m68k-use-the-kernel-helper-on-every-core-without-CAS.patch
> new file mode 100644
> index 0000000000..3ac756f4c7
> --- /dev/null
> +++ b/package/uclibc/0004-m68k-use-the-kernel-helper-on-every-core-without-CAS.patch
> @@ -0,0 +1,116 @@
> +From 5222fefffa0270c2f2d50961a4b75ef7f5605c29 Mon Sep 17 00:00:00 2001
> +From: ramin <lordrasmus@gmail.com>
> +Date: Mon, 24 Aug 2026 13:06:02 +0200
> +Subject: [PATCH] m68k: use the kernel helper on every core without CAS, not
> + just ColdFire
> +
> +The atomic header split the world into ColdFire and "the rest", assuming the
> +rest was 68020 and up. That holds for the MMU port, but not for the 68000 and
> +68010, which have no atomic read-modify-write instruction either. Building for
> +one of them stops at the first cas:
> +
> +  Error: invalid instruction for this architecture; needs 68020 or higher
> +         (68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040],
> +          68060 [68ec060]) -- statement `cas.l %d0,%d1,(%a1)' ignored
> +
> +Reported by Waldemar Brodkorb from a Buildroot autobuilder failure; Buildroot
> +supports m68000 and has at least one user on it.
> +
> +Decide by the presence of CAS instead. The instruction came with the 68020, so
> +the test is the list of the 68020-and-up cores: gcc defines a separate macro
> +per core and does not imply __mc68020__ on the later ones, and __mc68000__ is
> +no help because it is defined on every m68k, the 68040 and ColdFire included.
> +
> +Nothing else changes: the kernel's atomic_cmpxchg_32 is syscall 335 "common"
> +in arch/m68k/kernel/syscalls/syscall.tbl and has an implementation for the MMU
> +as well as the noMMU port, so the branch the old cores now take is the one
> +ColdFire has been using all along - including its documented limit that the
> +8- and 16-bit variants stay non-atomic, since the helper is 32-bit only.
> +
> +Checked with a cross gcc over -m68000, -m68010, -m68020, -m68030, -m68040,
> +-m68060, -mcpu=5206 and -mcpu=5208: the three old cores and both ColdFires
> +select the helper, the four others select cas, and each branch assembles for
> +the cores that select it.
> +
> +Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/5222fefffa0270c2f2d50961a4b75ef7f5605c29
> +Signed-off-by: Ramin Moussavi <ramin.moussavi@yacoub.de>
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +---
> + libc/sysdeps/linux/m68k/bits/atomic.h | 32 ++++++++++++++++++---------
> + 1 file changed, 22 insertions(+), 10 deletions(-)
> +
> +diff --git a/libc/sysdeps/linux/m68k/bits/atomic.h b/libc/sysdeps/linux/m68k/bits/atomic.h
> +index cf7fd5f65..6acec1ed8 100644
> +--- a/libc/sysdeps/linux/m68k/bits/atomic.h
> ++++ b/libc/sysdeps/linux/m68k/bits/atomic.h
> +@@ -3,13 +3,15 @@
> + 
> +    Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
> + 
> +-   m68k (68020 and up, which is everything the MMU Linux port runs on) has
> +-   the CAS instruction.  We implement the compare-and-exchange primitive
> +-   with cas.b/cas.w/cas.l; include/atomic.h derives every higher-level
> +-   operation from it.
> ++   The CAS instruction arrived with the 68020.  Where it exists we implement
> ++   the compare-and-exchange primitive with cas.b/cas.w/cas.l and let
> ++   include/atomic.h derive every higher-level operation from it.
> + 
> +-   ColdFire has no CAS at all, so there we use the kernel's
> +-   atomic_cmpxchg_32 helper, which exists for exactly this reason.
> ++   ColdFire, 68000 and 68010 have no atomic read-modify-write instruction at
> ++   all.  There we use the kernel's atomic_cmpxchg_32 helper, which exists for
> ++   exactly this reason and is available on every m68k (syscall 335, "common"
> ++   in arch/m68k/kernel/syscalls/syscall.tbl, with an implementation for both
> ++   the MMU and the noMMU port).
> + 
> +    Without this file m68k fell back to the generic non-atomic
> +    bits/atomic.h, whose "atomic" compare-and-exchange is a plain
> +@@ -22,7 +24,17 @@
> + #define _M68K_BITS_ATOMIC_H	1
> + 
> + #include <stdint.h>
> +-#ifdef __mcoldfire__
> ++
> ++/* CAS came with the 68020.  gcc sets a separate macro per core and does not
> ++   imply __mc68020__ on the later ones, hence the list; __mc68000__ is no help
> ++   here, it is defined on every m68k, the 68040 and ColdFire included.
> ++   Everything without CAS - ColdFire, 68000, 68010 - uses the kernel helper.  */
> ++#if defined __mc68020__ || defined __mc68030__ \
> ++    || defined __mc68040__ || defined __mc68060__
> ++# define __M68K_HAVE_CAS	1
> ++#endif
> ++
> ++#ifndef __M68K_HAVE_CAS
> + # include <sys/syscall.h>
> + #endif
> + 
> +@@ -58,7 +70,7 @@ typedef uintmax_t uatomic_max_t;
> + #define atomic_read_barrier()	atomic_full_barrier ()
> + #define atomic_write_barrier()	atomic_full_barrier ()
> + 
> +-#ifndef __mcoldfire__
> ++#ifdef __M68K_HAVE_CAS
> + 
> + /* cas Dc,Du,<ea>: compare <ea> with Dc; if equal store Du, else load <ea>
> +    into Dc.  Either way Dc ends up holding the original *MEM, which is the
> +@@ -87,7 +99,7 @@ typedef uintmax_t uatomic_max_t;
> + 		       : "memory");					\
> +      __ret; })
> + 
> +-#else /* __mcoldfire__ */
> ++#else /* !__M68K_HAVE_CAS */
> + 
> + /* d0 = syscall number, d1 = newval, d2 = oldval, a0 = mem; the helper
> +    returns the previous value.  The swap happens inside the syscall, so
> +@@ -116,7 +128,7 @@ typedef uintmax_t uatomic_max_t;
> + #define __arch_compare_and_exchange_val_16_acq(mem, newval, oldval) \
> +   __arch_compare_and_exchange_val_8_acq (mem, newval, oldval)
> + 
> +-#endif /* __mcoldfire__ */
> ++#endif /* __M68K_HAVE_CAS */
> + 
> + /* m68k has no 64-bit CAS; NPTL and include/atomic.h only use int- and
> +    pointer-sized objects, so the bysize dispatch never reaches this.  */
> +-- 
> +2.47.3
> +
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
