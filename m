Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019CDC38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 18:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EBC4405F7;
	Wed, 26 Oct 2022 18:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EBC4405F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RiCS02M6T2G8; Wed, 26 Oct 2022 18:34:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 854EF405E8;
	Wed, 26 Oct 2022 18:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 854EF405E8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A39981BF279
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 18:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F54060D78
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 18:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F54060D78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ITqmabj0rhDs for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 18:34:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B1F260D7B
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B1F260D7B
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 18:34:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 5AD03E000A;
 Wed, 26 Oct 2022 18:34:33 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Wed, 26 Oct 2022 20:34:27 +0200
Message-Id: <20221026183427.3933387-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026183427.3933387-1-thomas.petazzoni@bootlin.com>
References: <20221026183427.3933387-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666809274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LkZ+lXtt+hDJfhNQAYNw1/MaLTO4e5jzHirjvq1I09w=;
 b=Yyxdmwl1QVr+wKxEby2RKwSYbwwong1MZRRT2p869b1pGt+FIl0Pslop3/M/qWSdr5Kg0Q
 yON5hpY89T73SPigT1364Z7isbUUB2OvyQj79o4qWadWHDQUjIDXKOr7RXQCnzFsuav4eh
 WOQMQ/dSKF+wNOdKbfqIL96RsHWOoiRmyfHRiCFmJNrD2dVN8O+TXcGLRKNH6XGLqYgSSG
 SczGg5TfoGz9UPBWPUg8XMeIIcqmNgrOJebQYnt8CXmQM+ZWfltKvKBOTC+DVou7Bi6BuU
 LYB6ljZ+cGEv6rQ+h0SaFDOBne9rgtjerVgdWnDnOJ4JldKSSIvpiViWhVsHxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Yyxdmwl1
Subject: [Buildroot] [PATCH 2/2] package/glibc: headers >= 5.4 needed on
 RISC-V 32-bit
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since glibc 2.33 (upstream commit
7a55dd3fb6d2c307a002a16776be84310b9c8989), headers >= 5.4.0 are needed
to build glibc for RISC-V 32-bit. Indeed
sysdeps/unix/sysv/linux/riscv/configure.ac contains:

if test $libc_cv_riscv_int_abi = ilp32; then
  arch_minimum_kernel=5.4.0
fi

In order to take into account this dependency, we add the appropriate
logic in package/glibc/Config.in and
toolchain/toolchain-buildroot/Config.in.

This change means that if headers < 5.4.0 are selected, then no C
library at all will be available for RISC-V 32-bit, as glibc is the
only C library supporting RISC-V 32-bit currently. However, thanks to
the recent addition of BR2_TOOLCHAIN_BUILDROOT_NONE, the
choice...endchoice for the C library selection will not be empty,
allowing the user to see the Config.in comment explaining why glibc
can't be selected.

Therefore, technically this commit does prevent from creating a
configuration with RISC-V 32-bit and headers < 5.4.0, but it will have
BR2_TOOLCHAIN_BUILDROOT_NONE=y, which is catched by
package/Makefile.in, which aborts the build early on pointing out that
the configuration is invalid.

Fixes:

  http://autobuild.buildroot.net/results/5ca49b2732f68eccb5276e7112f7f496dcc514ee/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/Config.in                 | 1 +
 toolchain/toolchain-buildroot/Config.in | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index b63f99b0b4..71c50504ac 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -34,6 +34,7 @@ config BR2_PACKAGE_GLIBC_SUPPORTS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 || !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 || !BR2_or1k
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 26d731d976..64f7892f98 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -62,6 +62,10 @@ comment "glibc on RISC-V 64-bit needs a toolchain w/ headers >= 5.0"
 	depends on BR2_RISCV_64
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
 
+comment "glibc on RISC-V 32-bit needs a toolchain w/ headers >= 5.4"
+	depends on BR2_RISCV_32
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+
 comment "glibc on ARC needs a toolchain w/ headers >= 5.1"
 	depends on BR2_arc
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
