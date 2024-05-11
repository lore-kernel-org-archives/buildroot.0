Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0354C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 13:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39FA08438E;
	Sat, 11 May 2024 13:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7WMitoEIZEuP; Sat, 11 May 2024 13:41:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31BBE84390
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31BBE84390;
	Sat, 11 May 2024 13:41:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4803A1BF868
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 13:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41FBE40141
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 13:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NKB1xinXQArq for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 13:41:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A8DC9400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8DC9400B5
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8DC9400B5
 for <buildroot@buildroot.org>; Sat, 11 May 2024 13:40:58 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 146B3352111B; Sat, 11 May 2024 15:40:56 +0200 (CEST)
Date: Sat, 11 May 2024 15:40:55 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zj91Z07zMX8i02Ut@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1715434856; bh=6xYhQZtI5Cz6iffkUbIZg1L5Uy/NOvW/Ax5UcK2cQaM=;
 h=Date:From:To:Subject:From;
 b=hpETqnAZaJM9Om6W2ek05Gh5mKDX1E2qfwU26bO/qCcWgugWyR7CspXc9IvR1QKSo
 mDAf9RznNX3TTPaKtVnP3sfKg4U6IaaogC8jH+F6tHC41u4JrlJQmMI2E2nDz3VYjd
 52ErxgrFGsnJyvt6BNI/A2JUTdkH8M3RaVI6xBgFQiMeGFxe8qCo0bWj8lOx+UR/JL
 RDzwCxclLwIyOrUocH6wGVzyi95EgaGyp0VhHf0M1QX94g6VzMBDOszt3dplpv8FQU
 N4F93NNPRp3I8q6uXTEpHbDcf3diwOLVHX7uK8LVH2pvkGbs54ugp/QBajJfZTOrxF
 bF/wXphhOpSMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=hpETqnAZ
Subject: [Buildroot] [PATCH] package/uclibc: enable Linuxthreads for riscv64
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit:
https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=1640c262dc63e2f8f43c0728dbe867c8fffe3e9d

Linuxthreads support for riscv64 was added to uClibc-ng.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 9fd07400de..73ddd5ef58 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -85,7 +85,6 @@ config BR2_PTHREADS_NATIVE
 config BR2_PTHREADS
 	bool "linuxthreads"
 	depends on !BR2_aarch64 && !BR2_aarch64_be
-	depends on !BR2_RISCV_64
 	select BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PTHREADS_NONE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
