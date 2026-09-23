Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A396C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBEB141141;
	Thu, 24 Sep 2026 18:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zj8U04r9RaK2; Thu, 24 Sep 2026 18:59:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 26B7B40E6F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276357;
	b=qIlj+HlgzaPXWokHHNGRkJ+ExgcfUhu9/uio8qQNgSPx9zESQf2Egv56ZsGHUrBHlUJo
	 Y2Z1bmxgGy5She+xjKF8D4Sm7P3YZZxiWMh+tVF1NxPzisd3ZdjkziR2keQu021NDPwOU
	 HeXywy+tGOJcryomuev9jX0sfdU1g6P6Tcun6eMssY40B7M8aZ+LpvZI+19nSFuWzNQuH
	 MdCVfpDJ+Win3ep+rExSIUSJlZ15fSIl9KkX47URq/iu6ONWlneabMjuy2He3qqqQqMo9
	 6Qu/zSpSXGlMb/AebUS/L7g5qNyk2uaItIPB/H1cg3EQvSqeZZBfLv956v8vy2D7Lsw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276357;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=2XAtc9mWPDwKVMiahWJh4AGgGHlbMZhtaGg5vRaZUVQ=;
	b=H8HQ1tjoEjOFVgFLUpuhE65wZGRIoGBvwp4YH9s54V56PPtYTAoqDRpyw/NT1zP9lRZY
	 5Wb+tOUe/vKJLaRgZOF7ptRtp5cyFssdOXdY5pNIvFJbnwlYaFpqy1uGlvE/iHMyM2mtD
	 LZtsZvW4c/94v0UBSERqZISes0/Sf3rGF8pAxLQrR76BGA+fhl0ERJbvbgVsaqxgRj6XI
	 9MliQNukB+ytxs/Dpmi9ZfpirmJpunB7PupLL1pzhfFHfLHLQayw3u9hvtmFE0yDstBhN
	 VouVK9e6bHLz4/FdfBFT09JST1nh/U0s0SdH0xWpK/O2untaPS4uWWphRS79C6Wv3Dw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276357;
	bh=2XAtc9mWPDwKVMiahWJh4AGgGHlbMZhtaGg5vRaZUVQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LQwbvx9XRIsvcqCaV43ylNR2uR+SoAWliHOW/bjjFLkjlF15G5i6/rxhEFXkUEETT
	 pt5AEnWMx/vwG+kvN/fLmF9uJniUPyQZUbZ13+HzoAJjZF6iw+QqyGE6NU5aALsggY
	 rYCh7/rmhNSK1fva2YOmffNQi/bBSx0ShpN61kanDpjouUtu7lf0CUZMt/rVmeX5FY
	 Q30+MZimj/myJz8wcMrcdttBw8q+U4Mv6njxt0ZceD45TgL5BP6I+UkzvYDWWn7/2X
	 l//zKr+5zaO48mwwM4UF4i6fOa7vfahCAb5R7YLAtLmh0Io2CP7ZXQbEJlqZwf9uEs
	 MHlhHZZwwUDCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26B7B40E6F;
	Thu, 24 Sep 2026 18:59:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 99E18328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E3A9404CD
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xPFallf7d1NF for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org ACD83404D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276212;
 b=RIrTsyl2CSsn6mMESVSiV6CWhSvmKSwhaiEWnFFS3OjDloNIfqpINK654sWXjUxJ+q3G
 TlakrnKP8hw+3bnDQnYu5TZ2Gd2/np04WzuVW5BBJ0hRQ89D1dVnaoMQYRmQXzg5/iONN
 EbTQXQ7pRB3MKPDFHHogX92vG10CSKfMXWwzgAePfTzEHlIb6SxJdvmEZKMXGn4oWnwZY
 zW3fKUvy9nqQ9GETFO/INff3ow592EWel+/3aK4xnmiRmlF5V+wUU2Y12jehRjQqpd0hW
 KoUkFudY4Tld6IOoQiLKUxlk/yKRNq77YzzO8J89Us7tdPwsJNlv1fSgpecej/lHJUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276212;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/Aoq+1ySqe+XCj+aLCi667UkfxaOzaAgmhBVrgevG8k=;
 b=DGhalJxL/HtuSwbSJa0QmxHEQ2h9hM1Uu5djgMV0hxYEJvIVfGnQ8r3GhQdtrqZn9m2W
 8uqR7gSKDsSUA9fQ5KsjHTZlnxDF6wrIr5ENZi+T7zp3ROt0kloaTkRp92Qpjorrd9oSz
 o1v+dSpoCXkOlA5sWqVnYb7oAewe7MFMmDaFo5xLt0DG+mW3jvvPEabu3Fta5JiVDWXhx
 FrdB8zr26I551EV/DQgYY6tlaNpel3+EwHEbY6StTv0hmXYRmXOOaHiEB99I/YCS0upOw
 oL4KYV3YDK4Lw7wt7yJRSHlWivg7/5asHjMx+jz+kovAAuEXUCupVf4REgLDB3FgGWw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACD83404D5
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 506EB982D9; Thu, 24 Sep 2026 18:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:18:17 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 4c96ea868e3191e9bea84554b800d62678e65d66
X-Git-Newrev: 651efc907fc8d9ed1bc283f029f9e6b54fd50159
X-Patchwork-Hint: ignore
Message-Id: <20260924185542.506EB982D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/ibm-sw-tpm2: fix
 build with gcc-15.x
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4201979926642649800=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4201979926642649800==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/651efc907fc8d9ed1bc283f029f9e6b54fd50159
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Fixes:
https://autobuild.buildroot.net/results/d43/d4364f6e3636c696471bf8cba6d308439130e53a/

In function 'MakeIv',
    inlined from 'TestSymmetricAlgorithm' at AlgorithmTests.c:197:25:
AlgorithmTests.c:181:23: error: writing 32 bytes into a region of size
 16 [-Werror=stringop-overflow=]

The build error occurs with gcc 15.x on some platforms, gcc 14.x is not
affected.

These defconfigs build without this patch:

BR2_x86_64=y
BR2_GCC_VERSION_14_X=y
BR2_PACKAGE_IBM_SW_TPM2=y

BR2_x86_64=y
BR2_x86_x86_64_v4=y
BR2_GCC_VERSION_14_X=y
BR2_PACKAGE_IBM_SW_TPM2=y

BR2_x86_64=y
BR2_PACKAGE_IBM_SW_TPM2=y

This gcc-15 based defconfig is broken:

BR2_x86_64=y
BR2_x86_x86_64_v4=y
BR2_PACKAGE_IBM_SW_TPM2=y

The build error is not related to the recent bump of the package from
rev183-2024-03-27 to rev183-2026-08-26 because no changes were committed
upstream to AlgorithmTests.c since rev183-2024-03-27:
https://github.com/kgoldman/ibmswtpm2/commits/master/src/AlgorithmTests.c

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b016989c61340b528a09599694b86000b98efc56)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...-GCC-15-stringop-overflow-error-in-MakeIv.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/ibm-sw-tpm2/0003-tpm2-fix-GCC-15-stringop-overflow-error-in-MakeIv.patch b/package/ibm-sw-tpm2/0003-tpm2-fix-GCC-15-stringop-overflow-error-in-MakeIv.patch
new file mode 100644
index 0000000000..9b22522b36
--- /dev/null
+++ b/package/ibm-sw-tpm2/0003-tpm2-fix-GCC-15-stringop-overflow-error-in-MakeIv.patch
@@ -0,0 +1,45 @@
+From b35faee1224f5bccf759464e69f724a03421c8a9 Mon Sep 17 00:00:00 2001
+From: Arthur Gautier <arthur.gautier@arista.com>
+Date: Tue, 9 Jun 2026 21:52:07 -0700
+Subject: [PATCH] tpm2: fix GCC 15 stringop-overflow error in MakeIv
+
+When compiling with GCC 15 using `CFLAGS=-march=x86-64-v4`, the compiler's
+aggressively optimized vectorizer triggers a false-positive
+-Wstringop-overflow error. Because x86-64-v4 enables wide AVX-512 registers,
+the compiler misinterprets the loop unrolling and warns that a 64-byte
+vector write is overflowing the destination buffer:
+```
+  tpm2/TPMCmd/tpm/src/crypt/AlgorithmTests.c:158:17: error:
+  writing 64 bytes into a region of size 15 [-Werror=stringop-overflow=]
+    158 |             *iv = i;
+```
+
+This fixes the warning by marking the `iv` output pointer parameter as
+`volatile`. This inhibits the over-aggressive loop vectorization on this
+specific buffer, silencing the compiler error without changing the
+underlying logic.
+
+Signed-off-by: Arthur Gautier <arthur.gautier@arista.com>
+
+Source: https://github.com/stefanberger/libtpms/commit/2d9b00c4e42677cd0a9b67344f4d873ddc409a21
+Upstream: https://github.com/kgoldman/ibmswtpm2/pull/25
+
+[Bernd: rebased for ibm-sw-tpm2 package]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/AlgorithmTests.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/AlgorithmTests.c b/src/AlgorithmTests.c
+index e8549adca..28d8e780a 100644
+--- a/src/AlgorithmTests.c
++++ b/src/AlgorithmTests.c
+@@ -162,7 +162,7 @@
+ // Internal function to make the appropriate IV depending on the mode.
+ static UINT32 MakeIv(TPM_ALG_ID mode,  // IN: symmetric mode
+ 		     UINT32     size,  // IN: block size of the algorithm
+-		     BYTE*      iv     // OUT: IV to fill in
++		     volatile BYTE*      iv     // OUT: IV to fill in
+ 		     )
+ {
+     BYTE i;

--===============4201979926642649800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4201979926642649800==--
