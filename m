Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C71DC982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 23:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A05E340543;
	Wed, 16 Sep 2026 23:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 530yTHNuP0RW; Wed, 16 Sep 2026 23:12:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5E91B40508
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789600363;
	b=d0tIty+Hgs3CBrqtml+3z/pn/ZZJ8U3d6k4U9k+ZwM6ucqJJviedKXgiNhVqpHDcIHdS
	 Omw69JMnwlKdwGS7PH0jFmKzHD9XkZuAEIBNkACsyAr1O76J4f/GrmVAL4cuSbGR9PNib
	 VBBFEClmRPlbLkEn067xI3Z/k6IhRf0yckd92qfZHwmW06Kw94F8MFAPEcNqjzke76rMa
	 h+WZadEnI5BgJeqpHOZV7jpjPVQrOCbP5rNA/Xh/IdDEP7slApQdEtwHTSc6xKGZe38tQ
	 OyUYeJNo/IP1bWq54Spewg3DbkdWXLZaXb+bHc7FVy6WURePm9GPMGDCJyTsghRZUgQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789600363;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CEeLr89duykFu4WRkXngWpl2Giyn7Bm3toLLf/mKSZs=;
	b=gpZNU3jEb3R/9t38VvUliTyR65J0ixjbuxRjeUmkD71YlUjiydsZjpeOsBbyp5y+l5pK
	 iZ/98I7ZH/OMauyNW4rhDN9zmi66oJFU2aOdQstzl/GNI+ueQshgTsqSAKBN2bWs/Av8c
	 JAgWkfeBSozQPo4bpIGjag5oOy3cYcicLkwNMsY3JeYJMFQ9GsBiGs6Mhf8ZRwAZFk9ak
	 5TRWRracmWWH7nl1KhArhcI2yxW/IZemdA0ieJ6bQEVAGxaD22Oj30Rvled6OAyP3rpjB
	 Cw+M7uUH7/6h+tANGD3DcC/RxFJbkJdstYhO5dNzQ3MpB3RkuE/erdxE2K5BsW6roZw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=C+jjCyw9;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789600363;
	bh=CEeLr89duykFu4WRkXngWpl2Giyn7Bm3toLLf/mKSZs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Pc7Rh239iHZGMEAaUZz6V2elhwsIOOL5H7ToDMClnqwO0s3G1OSsUP5MXa3wAcGgo
	 bl39Q+Rc84BsfkZPpGMmcZoqQZr5I8fJS0CgdAqbRIOs6i0/yS+GDVi+ZHF8AAg3XJ
	 pMrrYylrrHqPM6O/dMEA1o1oH02M3O/lF5mtTMmW53khULK1dJZa11zGpb+19/jiam
	 NY0bcq5Yg9R5StIx7bF2YyIcjTAHHLNydo5yYOmzkiNt2alH3Wi2+ydAYcNRG3Jll+
	 dFXsS6sNvd+hfmebNSm6TjOzAW4pfjVtdiKeAy2i2QSNi91kfg97L773uPH0cQ45VL
	 th0V3zd2iAMlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E91B40508;
	Wed, 16 Sep 2026 23:12:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D084B43A
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 23:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C23E040508
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 23:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ah8tcOO-Ue1W for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 23:12:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 51B32404F4
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789600360;
 b=QLWLCA2174z8sW35P1Uvjij+xnwTvBZi13MuD4qItWfDBze9/ZaM3Xrp3o70nKhIz1tx
 n96tcA5jfWj+MXOYMg5+ZO65UZ2ENnI1bc6r/YuP6TKhTeUwpiKxjn0EL1tOpkXqLemqb
 NlwoSNXTPRZYOP4rT0bJ6ozMYfITxuiFivVUFuJX0YQUxBMQ3vZPmT4+3XOR7vExnh0kj
 PON+wioFRHHl/quCmgxIjvXJQDngUblGnuGXu4X7HrHcBWwhImpgZ2gYS+8ADEEMvQX5b
 /nk2mDpV1hCYXjKbCEWypFzjKbBNicdj/X+MX0pdTUE4FS5ltmR98Q/fhVJ2Qnw24yw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789600360;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=+J6XTHZYxQoM2bSY0ymKmyKbe0rD+LgJ1SPFNI5MhbM=;
 b=sPdkWt+JjTqMd9IDm9KV6BQzBjn/XrICpPrF4aOmL1ND0C50hwXK+NM1GOVJEqwrGQwn
 vBW4/IrVMLQehgSllfo9QRuS6K/0Ay3rAkT9090CnMBG39cnjw9VTlHgO40uBMcB0P4n8
 qtThVQA0yiDsBD6dX4FXOGkD5bGahgGP+HW6ZgKTGa1xj9h9syMeuCf9DYYQX3eHpPpuM
 8Q/UmM7SOfWQGOcS83zv0ekqt5sgpYoiCxEPGFEnQMBBDxbKsYi6iM02UGTKOUwdr6+js
 OvL0oQKh/PV6w7RSauFEcrU4BpoY0OJP5K8JZVZT6S/KelSvpWIRz0BHNgA+2dyllsQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=C+jjCyw9; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=C+jjCyw9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51B32404F4
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 23:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789600355;
 bh=+J6XTHZYxQoM2bSY0ymKmyKbe0rD+LgJ1SPFNI5MhbM=;
 h=From:To:Cc:Subject:Date:From;
 b=C+jjCyw9jFP72mtM82d7CcBbE5OruoGQi/5LxlZm+9FVZVJ7Bsw9fpzum0expP36T
 uk1yv3VunPkIYRM5GZmi1cqScUWtg993t6kUyu74zzD6XMz2gqSnVUIQJV1OmSMdjf
 0M/HqNrhLg5AZpe7RS6SKMCj6sP6lvpOgTgfUlSOs3QaLVyKchLty9qwgRi9bT7nlx
 O9wwm/LYKUwU9ab3LV3eMlcM4tAA4GfZfal0uW+2PJcpKp9KXP/L81nRsgkIwamOut
 LHajBLFxHWOcDO+tAZbE6oBcNdJKeCJp9J2tc7fa1gjH/eC5z+GPnJyNe8j5nTKw+w
 yMxV+GuMIUtqg==
X-KAS-Sym: v3:f51bdf72230551df:UEhWy7A2/KaI3RVLT5Q8jHS56Qz0fpqlNUrTj+KmVUrvh0HxBlZuyUSXeUyi6GT/8pqRmdlARByadPWVOLlyjL6r2oSGXy3Y8hQKaoUvDYadZ44K849YdlGv1uJDX04NBXcmCclQuVtCGOE6vFMFfKQZ/OthdxXJ1/DWGLbO8XE6gP7kCXcyTvzQYRSoEpiCfmQgf2AkCWQ6T4Gj1NneOWTr0bkYscxWFHYe5et3tER2zpVrCgUJU8rFHHKyp3vHpSWuHXLzgqCIk9UE7CyhLSRU4AuDLaOtP857qox9scLNpyxsxHCP5frbV81vf/k15Wq/LwTqg8QAtLK3j/wUCQ==:1kBI4aNDCx1mr/D5w0xXdw169MWz1rapG7r+Zez3Ey2VgZuo+VU2FclHoYlHmrha9Bg/r85l46ttJyqJO2+GjojzYk6F44BmqvipXFeNaHnacrp9qBVqx9vYuBh5SsRrWI2R8fuJqUO17ORaixaLlSq93AtYokKIP3H5kiD1E1aHaMsBXIDt6AGNm0SKKvSR3MSReLhgfTxkszhorfpublHgoZiOSP0mGr3uG+9YtxbuEjxLXM1fw/w29Rdweg9thJx7ljsnUAbftblJeXg1oZNLzHSGTK3HuxQOnYa/qeQwblXWE5YI7Y0f57M9xuDi0hn8fgGxMX2uUCHRvUnMIj9MlsDLlyGk5UKq0XohZO0J7OftXvHXByYa9Phk9v6+2rHViE+ALapUrG6Kwn95X3aG2Gu+t7+VZ6pVbmVwqWMBnNGjsUUcYgMtWHr5JJhpVhpPKFn4iWW6juRtFVGzhA+Cf3BZAfX3CQgBdW0LwyCniALWdbScrzanOkEh6Ug68m3N+kYXTltyMsbqA5ffhcOQi+NuxEMKcsV82lf6mPVWapw5WNrXWHbiFd4IJtIpm7O+jRBadcE1TFeWNchJfx5fLz9IOA==
Received: from fli4l.lan.fli4l (p5b3a0ed0.dip0.t-ipconnect.de [91.58.14.208])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6752BA4C430C;
 Thu, 17 Sep 2026 01:12:35 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37542)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x6ynq-000000002V0-2lrS;
 Wed, 16 Sep 2026 23:12:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Philippe Reynes <philippe.reynes@softathome.com>
Date: Thu, 17 Sep 2026 01:12:35 +0200
Message-ID: <20260916231235.2635069-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/ibm-sw-tpm2: fix build with gcc-15.x
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
---
 ...15-stringop-overflow-error-in-MakeIv.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/ibm-sw-tpm2/0003-tpm2-fix-GCC-15-stringop-overflow-error-in-MakeIv.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
