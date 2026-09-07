Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FFCC79FA1
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 15:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52DE86061E;
	Mon,  7 Sep 2026 15:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHksr83Hvt4C; Mon,  7 Sep 2026 15:54:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 42DEA6066C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788796458;
	b=YjM8DNwd6wmVkL0wxfUwFgBVEWotIvINBfAxVjmJDSQwfLamXlUp0l6Shh8yfBVMoMVX
	 LPiS4b4aFEhIizcgZMtz4Ge/B5rFPs7QCyvKnqINFrs7ErVS0yEOKc7hDHrxF3hg1bMOd
	 gmZyq9JGmuaXGQ06KL84+Qspi4dKwmnP0H9l4TD0jyU4wiCA9sVVpwRp6Q94Akgzi1Ki8
	 LnzTuEhGP5+SbrvsLKhaNKxcQ8XGuKQohtJAhDOh7T7kO6ikEUIc06v+X+ScsCwxhb5kg
	 gtmULlh4mWOlt64/z0Vu+ogz8dtrjpEqNUBTty+DFpHKGdenIE9S3QrKP2ucNTuAk5A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788796458;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tFRYPtjgAPe2PahRVXcMrn+PmCT5qZLnGYuI97T4DkE=;
	b=RENP0drNmkb+y3IQl3flWfKxEGEdCn4h6SfSDTYQdCn7/LDZg8yw/XpXSFVVRPlDgWc/
	 ZYIPidtJ4SLif8CR/4VxDuyip4z4Ll2ELqGHLmrjtX7DAZXWLPXBxdfzm4JPKlhfV2l5Y
	 Ooh9KL253ZQ/CHLzcc4nnt+9c3yu/4Ic0p2DGxjkbC1i7vJjBYINVzcJ6TEnXoJmOkVpz
	 BkHk0ccWt/OkBykzEeU8hdXX9AZw/bkHkCEEG3u5DQWPd4Q1rHKD0QcKqVCyy2AUt60R4
	 WN06xKpsQ4NG5sNszJZnbDv7q/1zhJ6humQTOxh1r3N4MF8LcUz73w7M4YUvI3vyxqQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=CCo+Z1tS;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788796458;
	bh=tFRYPtjgAPe2PahRVXcMrn+PmCT5qZLnGYuI97T4DkE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DW/Ac05K1EpxK/smEqRVAM9JlAjZiKUI7UmHFEpF1uShY84yegXMR0UQKjfxMw8uo
	 WiBfnqU9/saZVvSjOuA+amND+kC64JFEtrbMXHAVfe1zVAsy4ZB/O1T4oAK41LpVye
	 iuuFQZRoSvL+BVJQG+DyJdM/QF3KNoeq3AzCjJiI0avS4uywV+IGmaZVwY5FLZnMqa
	 WvMuEDG16zeT/fNGZQeiQV0OKY5KefAMlOdv48QU5P8mJMskjI29oi/ytuLuzR23S2
	 weuIHrnHYNeXPCKUHT/Dchl5aSZfJ51NrfosGmmOCvZK9pkb/yUk5tyjOKqBsXY2Re
	 uqgqt3ZP8dLSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42DEA6066C;
	Mon,  7 Sep 2026 15:54:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C5CBA48
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 15:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A0626066C
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 15:54:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0eXDYuEjXDnr for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 15:54:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 883206061E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788796455;
 b=PnhA4DDKYK2zfgzTSPFP4FH/lt8WFopChzEcGBBAQlxmCI+Vq4frs78th/dHEPtwp0o3
 zHf48egDD5VjGatmTmlfl4CsfzI498/3oiQutHyiB7kNdVba7kkLiR3ZxXaiKlr7sFWga
 pvO9/UfOHXElAIZomgGAtPgaodl6KcNA7cEISW4DBCgoReA6yJcgToeXy4MZB8K/XqUfS
 VQvIP3PqZTQx8bQfjKLJiaunIGAzBMh3Y0fE9sHo5FTN6P8RiLY76Z5h4nSCzlWHDCPVA
 UdkilvSnGGvVdvrW5urm6pj9AB6KZMaB/Rmpw+wQjhtJ5mDKE68Xw4/jYWnwTmUeQhA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788796455;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=d7Nw3fV/1IqgWVfarDsKc4ABUjCoC1jpqeaD9Zb/4SU=;
 b=ji1KR54stj9TkTeNyW+dPb4VjEamx54T+bPXiICMfpcjp/nC/H7Y6Ocp3IaRadgX2loc
 7fP1ZYEGeav8YBsGN7KQgnNsxpjW9TnBqYnQfzgF1yQA59PlQ1g9n9Cu9qvw86gYS8mdz
 EJJet6IrGxYHd/oEAQQNl68gp8PGTpzDYgoFnxdBFa6VJhSPLDIDMoJH0ilZYzoztQ1D3
 rFTmjDfsQjav3TCe55sq/athArUTmT6H9r9cTgJHH1xRp950a7bRLoexhFSwwAxhq5Dzh
 mIriwCm38KlS9SnwzTTO5cX9omISCZ/41kMw5mpQvH07CbXuryqhfgD93mjr1nj3KZA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=CCo+Z1tS; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=CCo+Z1tS
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 883206061E
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 15:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788796425;
 bh=d7Nw3fV/1IqgWVfarDsKc4ABUjCoC1jpqeaD9Zb/4SU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=CCo+Z1tSESN0a+c+MmWyaeBGfUHHY6WyFOw9bP67ROl6yftqMRLhmb6ntRLfySkW4
 j6iCKBJR8HUw3MOGqTrEHtGaGUnjuZSs3Hse/XSggj23FVDOT3z0JhiEgDyNMoiDLn
 mrs2ZiHfoX7UQpamBf51/DGB3C5dUsgnJhRalJP1JU0YIpiw2maOBBD5gtIONIeIPp
 Dp0Ui/YrfC2JWaRf0iY3lUg8MEX/axJW88L+MoYK9DKCtMdFfxLFysSCMAVrNyWgbE
 j2L7S82pz8RlvORpxOP+YnmfFeu4BWPDc6c2fDnuDO4t0Ahsu7ns/Q5MZjZWVEZXzz
 WiMmNx5d7b1Zw==
Received: from fli4l.lan.fli4l (p54a1bccf.dip0.t-ipconnect.de [84.161.188.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 497C7A4C39A6;
 Mon,  7 Sep 2026 17:53:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49438)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3bfF-000000001FY-0VDm;
 Mon, 07 Sep 2026 15:53:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>
Date: Mon,  7 Sep 2026 17:53:44 +0200
Message-ID: <20260907155344.3755749-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907155344.3755749-1-bernd@kuhls.net>
References: <20260907155344.3755749-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 3/3] package/llvm-project: bump version to 23.1.0
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

https://discourse.llvm.org/t/llvm-23-1-0-released/91654

Removed compiler-rt patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...0001-libc-Fix-detection-of-cfloat128.patch | 70 -------------------
 package/llvm-project/llvm-project.hash        |  4 +-
 package/llvm-project/llvm-project.mk          |  4 +-
 3 files changed, 4 insertions(+), 74 deletions(-)
 delete mode 100644 package/llvm-project/compiler-rt/0001-libc-Fix-detection-of-cfloat128.patch

diff --git a/package/llvm-project/compiler-rt/0001-libc-Fix-detection-of-cfloat128.patch b/package/llvm-project/compiler-rt/0001-libc-Fix-detection-of-cfloat128.patch
deleted file mode 100644
index 4587dbfd7d..0000000000
--- a/package/llvm-project/compiler-rt/0001-libc-Fix-detection-of-cfloat128.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 4e1af872f819782bd233ab21953ab92cf36ff9c3 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Mon, 9 Mar 2026 19:07:10 +0100
-Subject: [PATCH] [libc] Fix detection of cfloat128
-
-Building compiler-rt with aarch64-buildroot-linux-gnu-gcc 15.2 causes a
-build error:
-
-compiler-rt-22.1.0/cmake/Modules/../../libc/src/__support/CPP/type_traits/is_complex.h:44:31:
- error: 'cfloat128' was not declared in this scope; did you mean 'float128'? [-Wtemplate-body]
-
-According to https://gcc.gnu.org/onlinedocs/gcc-15.2.0/gcc/Floating-Types.html
-__float128 is not available on aarch64.
-
-Analyzing the gcc defines for aarch64 seems to prove it:
-
-$ aarch64-buildroot-linux-gnu-gcc -v
-Target: aarch64-buildroot-linux-gnu
-gcc version 15.2.0 (Buildroot 2026.02-114-gdadec9da56)
-
-$ echo | aarch64-buildroot-linux-gnu-gcc -dM -E - | grep __GCC_IEC_559_COMPLEX
-  #define __GCC_IEC_559_COMPLEX 2
-
-$ echo | aarch64-buildroot-linux-gnu-gcc -dM -E - | grep __STDC_IEC_60559_COMPLEX__
-  #define __STDC_IEC_60559_COMPLEX__ 201404L
-
-$ echo | aarch64-buildroot-linux-gnu-gcc -dM -E - | grep -i float128
-$
-
-In contrast gcc for x86_64:
-
-$ x86_64-buildroot-linux-gnu-gcc -v
-Target: x86_64-buildroot-linux-gnu
-gcc version 15.2.0 (Buildroot 2026.02-112-gd12ac02486)
-
-$ echo | x86_64-buildroot-linux-gnu-gcc -dM -E - | grep __GCC_IEC_559_COMPLEX
-  #define __GCC_IEC_559_COMPLEX 2
-
-$ echo | x86_64-buildroot-linux-gnu-gcc -dM -E - | grep __STDC_IEC_60559_COMPLEX__
-  #define __STDC_IEC_60559_COMPLEX__ 201404L
-
-$ echo | x86_64-buildroot-linux-gnu-gcc -dM -E - | grep -i float128
-  #define __SIZEOF_FLOAT128__ 16
-
-This patch changes the or-condition to an and-condition for
-__STDC_IEC_60559_COMPLEX__ and __SIZEOF_FLOAT128__.
-
-Upstream: https://github.com/llvm/llvm-project/pull/185486
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- libc/include/llvm-libc-macros/cfloat128-macros.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libc/include/llvm-libc-macros/cfloat128-macros.h b/libc/include/llvm-libc-macros/cfloat128-macros.h
-index 5f28cfa21aae..ff4aa530685d 100644
---- a/libc/include/llvm-libc-macros/cfloat128-macros.h
-+++ b/libc/include/llvm-libc-macros/cfloat128-macros.h
-@@ -27,7 +27,7 @@
- #define LIBC_TYPES_HAS_CFLOAT128
- #endif
- #elif defined(__GNUC__)
--#if (defined(__STDC_IEC_60559_COMPLEX__) || defined(__SIZEOF_FLOAT128__)) &&   \
-+#if (defined(__STDC_IEC_60559_COMPLEX__) && defined(__SIZEOF_FLOAT128__)) &&   \
-     (__GNUC__ >= 13 || (!defined(__cplusplus)))
- #define LIBC_TYPES_HAS_CFLOAT128
- #endif
--- 
-2.47.3
-
diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index 96cdd76c92..35aa544014 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.8
-sha256  922f1817a0df7b1489272d18134ee0087a8b068828f87ac63b9861b1a9965888  llvm-project-22.1.8.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.0
+sha256  ab1f0e3ec52448c33e8782eaf0422504b87c7b016b22514653ee0d8fcee479ff  llvm-project-23.1.0.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 5cbbda6e06..31b2a4dae7 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LLVM_PROJECT_VERSION_MAJOR = 22
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.8
+LLVM_PROJECT_VERSION_MAJOR = 23
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.0
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
