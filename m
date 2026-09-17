Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245FAC88E72
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 07:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6AA480EDE;
	Thu, 17 Sep 2026 07:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJgkzoMT0uWX; Thu, 17 Sep 2026 07:40:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E6C0280EDA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789630833;
	b=TU9L2ma0i0RY02U3Aa04nLsBiymgpJrEAnQjBUwlRVeAWSPBObCH8Li8fN0KzSfV2Wah
	 fcN++YgW2o91lh7hOt8EnXrD18mdRBYI822vmEiKPoAmFNPVdHwBV+TPAhMSF+kwD/Rk1
	 1HuynjdhT2i4/bCbvoSv4BRaeHRe/tXLHbFtzpu41Mm/eoNjKBMyRMznyyiJPbbrI0ksI
	 wywgFN8N5dTxpvN9fcUtN8Rew/nXv6zhduK63ZP2A2NoBCN/+O1Qod1OwLSa5n2TO6Jm3
	 XwZnQLOT0k8Um6GIKTgEwWdzyTN8amoP3kLUIO4HfZ4hA+u3cGQwUw9qlyiGRU8dX1A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789630833;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=6pgqcD0KRSn6AGweF8y7Legcex8uy0cIn9yBX0gjjmE=;
	b=I+Dva7FfGMGBA4SMX1bq9+GLtWoXlufF56McNbyiSatsf1s0aTz7jy126aLqhAYGq+2f
	 Y9G4Y+4aMZ+lcdNwPKfsTvbDGprxHiQKzhWvgcltcDI1un9c4zUfxl+l+qgrO31kumePx
	 7tl9gy/TH7NuiZ7/TpyWZQwcp48HtKTYHn/1vAy/KyFp4XJ1fVzoC1/0cf24QZtrywlb+
	 28G0t/uWfjLbnLf886aajtB4OQjWaZqyuWCjFMDimSliwZmg+LWUoXRp45DjFWYCtn+O0
	 N9CV5Ap07Smo7symaRIymCYg53nnrQZCEkk9fvwK0ne3+h/GrfDrvYLz7Ecw1PQJsxw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789630833;
	bh=6pgqcD0KRSn6AGweF8y7Legcex8uy0cIn9yBX0gjjmE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HEFROVS0dNF0UYsxS4H9Brvvgo45OGwDyk/MlC1J3Tkt5LBfrdAKe+zQdVHLqIL0e
	 P2JzRH0EhG4xheY+A7twKyk9fE6qMUK2eZktbcEZhTa8H6yIlz1aGUzRjt9ypI9rEd
	 McpWqYAfxsCZPr7vwpBEeEh/XTA4hwWYET/K7EiE6MWzv3rkBqSfRpdZCnhThGQ2Jp
	 d2Vo9gPad+enmJCU7+bMJQPW+7ERHQ9xXXLvKbUxPGekiek3ta/7ICNDkQSXlSxvk9
	 5nI1tpsLAwoppkGwtYcMpFe7sSWKMiUzdf5bfUZwTdW1DMV+/+ubieCh3RzyiFIweH
	 x4y+E7zcHSYeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6C0280EDA;
	Thu, 17 Sep 2026 07:40:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B526422
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F123F80EDA
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Jq6dDVGCSWp for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 07:40:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 18E5B80ED8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789630829;
 b=NP9G8NsFSRFPqKpcaCrQW9ujI99/aFtBPstBVDtzxDo6q5nmaGi6uEmJ2jLyWI+O2hNp
 Kjo7bc5igNEWQxo/0pPHT/aXZdRdWVnKvxqb/i/+74zZV7w892zXo3x4/Kwu1p5mg2eiv
 khe9BCB6cLxu5o2KkiydQYLblv1fe1rrfZpwNkd6CAolyZ7vTz6pIkZk6aqsi14Bh+QNa
 X7QVxIDe2ionrodVDY19+Ss1rGdPAM3IhV1pGLA/dTuHjy1CK7ayjuf3iBn5bZxu5lwt5
 VFtiRGaJjhomfT7j51bafyFMD2lxXG4vCJC4OkK5qVjLa6U3BsGnLcvAHle9ypNkl7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789630829;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Z3TPC+gu14dYwQfLDfrfla4pflep65sKATPCFPs1IEI=;
 b=FN4qf/Bs9p4n18jjqf8Rh2VvTK4DueVcZboPqchiNkMGMMvBcRcnIZ4RH8ze9aByn1VG
 l8DLCYvJRL7aVtHBfiHpeDp1fj28dzFnidJqiJt2gaY6dwDYjqynz9d5Ov/QFtRfqJzKY
 en51bPaefjoIIykZcdzKz1zlj0u/FW04SS6ZSGt3MrHZPvTkgqGx9nuyI7QTamZFS7lAz
 bNqOCrbx3bUw0bHy648TnRW/iYZOVqp4Nx03JuSlEBNsBvWtc7/tClEWaFVJQ3EL6XCpc
 Y573KM71b2aK/S2M/QqpwP8lhEfPKaPZ3APIBKUqiOlcYDqzNnrvc/HjWjqTSizSDfw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18E5B80ED8
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:40:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51A348CA04; Thu, 17 Sep 2026 07:39:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Sep 2026 08:36:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea18394dd71f2deb21792918500b1928e96177b0
X-Git-Newrev: b016989c61340b528a09599694b86000b98efc56
X-Patchwork-Hint: ignore
Message-Id: <20260917073922.51A348CA04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ibm-sw-tpm2: fix build with
 gcc-15.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b016989c61340b528a09599694b86000b98efc56
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
