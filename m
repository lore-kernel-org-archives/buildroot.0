Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C734CD13DB
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 19:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53B1D41984;
	Fri, 15 Sep 2023 19:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53B1D41984
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LgFkFTgS-OIe; Fri, 15 Sep 2023 19:34:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7611E41979;
	Fri, 15 Sep 2023 19:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7611E41979
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB4311BF5D7
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 19:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0B9240911
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 19:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0B9240911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zhYE188V7Fer for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 19:34:05 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F901408F9
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 19:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F901408F9
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 647E313F86E;
 Fri, 15 Sep 2023 21:34:01 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 21:33:44 +0200
Message-ID: <20230915193344.1434907-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694806442;
 bh=rZnYzuxo23kQSUZ/5EF4zi5R/nQqAcgz96dBM/HrPg0=;
 h=From:To:Cc:Subject:Date:From;
 b=F7RjIV6DRog2AuQy4GrmFeEK+HKDqnBR1tH5iDtb1aDPrYQ9eArRNrmjO7ZdT2JSi
 /TJQS4HadnfmlMPzE5+NkMJWVSQVwK+j258lq7XfOD7G3sjcq/uRmxSL8Z9exzoFqM
 ZONptgWK+oLUvgXOX2iWOFcYqhCTtyUGpeH37pAFbaJK3mWFypaIQf+LX1LHBM91uy
 b6leDXRWIQi8o1sP/13PaZTs4qXhbvLlgd8T7nDhnPnr9QcqnYamvtIiFWjw2Bhx+y
 AaDeZF2brPzY52c8nPgZIT/MQ9M5TjYFwxf8Qh2aMh2BN563JJ/4uAcT+aMc7wdhQR
 avFzmMRPbx20w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=F7RjIV6D
Subject: [Buildroot] [PATCH 1/1] package/openblas: fix some x86 32bit builds
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

OpenBLAS Makefile normally needs to explicitly define the CPU
architecture size (32 or 64bit) in the BINARY macro. See [1].

When an architecture supports both 64 and 32bit, the 32bit support
is sometimes implemented in OpenBLAS by overriding a fallback to an
anterior architecture. For example, if the build target architecture
is x86 Haswell 32bit, OpenBLAS build will override the arch to
Nehalem. See [2].

If the BINARY macro is undefined, the 32bit fallback will not happen,
sometimes leading to a link failure, with output:

    i686-buildroot-linux-gnu/bin/ar: strmm_kernel_LN.o: No such file or directory

This commit fixes those issues by explicitly defining the BINARY
macro. This issue has also been discussed upstream in [3] and [4].

Note: this issue was not introduced recently ([3] dates back from 2015),
and was also see in previous package version, for example in [5].

Fixes:
http://autobuild.buildroot.net/results/e1e/e1e2034a78799abe1bd28b036fa6f7d13322e42f

[1] https://github.com/xianyi/OpenBLAS/blob/v0.3.24/Makefile.rule#L50
[2] https://github.com/xianyi/OpenBLAS/blob/v0.3.24/Makefile.system#L113
[3] https://github.com/xianyi/OpenBLAS/issues/657
[4] https://github.com/xianyi/OpenBLAS/issues/1106
[5] http://autobuild.buildroot.net/results/5cd/5cdccd106b1de275ac75c39783e536107a31651f

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 3557a7b with commands:

    make check-package
    ...
    0 warnings generated

    utils/test-pkg -a -p openblas
    ...
    45 builds, 25 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_openblas
    ...
    OK
---
 package/openblas/openblas.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 0d0e8e56dd..aacfc74b53 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -49,6 +49,12 @@ ifeq ($(BR2_STATIC_LIBS),y)
 OPENBLAS_MAKE_OPTS += NO_SHARED=1
 endif
 
+ifeq ($(BR2_ARCH_IS_64),y)
+OPENBLAS_MAKE_OPTS += BINARY=64
+else
+OPENBLAS_MAKE_OPTS += BINARY=32
+endif
+
 # binutils version <= 2.23.2 has a bug
 # (https://sourceware.org/bugzilla/show_bug.cgi?id=14887) where
 # whitespaces in ARM register specifications such as [ r1, #12 ] or [
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
