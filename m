Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC23C7EE39
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 16:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F1E081FAF;
	Sat, 28 Jun 2025 16:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uSUpskVWjrjq; Sat, 28 Jun 2025 16:16:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 408E781EEF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 408E781EEF;
	Sat, 28 Jun 2025 16:16:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19EB9AF7
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 16:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 003B8409C2
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 16:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1s8AlEpOCkE for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 16:16:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1C705409A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C705409A9
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C705409A9
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 16:16:39 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0AB4DB0057C;
 Sat, 28 Jun 2025 18:16:30 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sat, 28 Jun 2025 18:16:20 +0200
Message-ID: <20250628161620.1866792-1-ju.o@free.fr>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751127396;
 bh=FW2eS+tfuXXhNc7557pukeRc+11Hc9QrI1zxz75roc0=;
 h=From:To:Cc:Subject:Date:From;
 b=uUB3O55i7LCGzfFGKdL8WT/JBK70A25OST4xVbuXjQgUetJqBiaMYqA1yfT8YK9Gn
 ipYBujhzyiiHXAa0nlesPsPYQmVq2RE79EAI4x6xdzBRWcGRc3HXFjp+iK0Yg1PONQ
 h5kQ14SgRa0P19mtUk5KtrW8q5C/e6x+Jox+YzX53FEW7/+loa8HP7Gvr/yH66CzEv
 3Pyj5m5g8cU1RaBA8JzmJLcHphBVKOsqDYHlgkLt9upHSuE7++l2gPjyJL5oSEjTC7
 x5cHaWk1zFOA3IdkPOFwTmYumARhcnfI7T7R5nZJONqqMtdNm9RhLebNf0pswd0mgI
 tFaMx5I+yr/cw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uUB3O55i
Subject: [Buildroot] [PATCH 1/1] package/gcc/Config.in.host: hide gcc
 version for unsupported CPUs
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When a new gcc version is introduced, for example gcc 15 in
commit [1], it should have also added a "depends on
!BR2_ARCH_NEEDS_GCC_AT_LEAST_15" to the previous gcc version.

This logic is described for external toolchains in commit [2],
for example. The internal Buildroot toolchains should have the
same logic. This logic existed for previous gcc version. See for
example the removal of gcc 12 in commit [3].

There is ususally no problem, because all the three latest active gcc
versions supports all CPUs present in Buildroot.

However, the commit [4] recently added the support for the Arm
Cortex-A720 CPU, which needs at least gcc 14. Since there is no
logic preventing the selection of the gcc version, it is possible
to select an unsupported gcc version (i.e. gcc 13).

In such a case, the host-gcc-initial package configuration fails
with output:

    Unknown cpu used in --with-cpu=cortex-a720

This commit fixes the issue by adding those missing dependencies.

Fixes:
https://autobuild.buildroot.org/results/918b90aee0b65f01efc241622015cb847b4e23a8/

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/75891397abe60dbe3d82a1ec39654ff81d1b1406
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/f577d8218f3f18016aa084255e337a7f589eeed1
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/58cf7c51da3ae4804332f68ee934e153d695d047#66f7e875db173e5538d3511c8297acc1ba30da33_27_25
[4] https://gitlab.com/buildroot.org/buildroot/-/commit/de374e06d856dd5079fc792c883b06563af950b0

Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
When authoring this patch, I was wondering if when adding a new
gcc version X, we should also introduce the Kconfig symbol
BR2_ARCH_NEEDS_GCC_AT_LEAST_(X+1) to make sure all the gcc versions
have their dependencies. What do you think?
---
 package/gcc/Config.in.host | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 5e4da0aa85..8640280fdf 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -24,6 +24,7 @@ config BR2_GCC_VERSION_POWERPC_SPE
 
 config BR2_GCC_VERSION_13_X
 	bool "gcc 13.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_POWERPC_CPU_HAS_SPE
@@ -31,6 +32,7 @@ config BR2_GCC_VERSION_13_X
 
 config BR2_GCC_VERSION_14_X
 	bool "gcc 14.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_POWERPC_CPU_HAS_SPE
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
