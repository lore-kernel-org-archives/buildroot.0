Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78075C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 12:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3806940465;
	Sat, 13 Jul 2024 12:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7bpvJCsW8Bu; Sat, 13 Jul 2024 12:09:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB20940473
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB20940473;
	Sat, 13 Jul 2024 12:09:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 413AD1BF309
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EEA181285
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:09:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D9BuVkFfB-wG for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 12:09:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A8E868126C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8E868126C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8E868126C
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 12:09:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 52831240002;
 Sat, 13 Jul 2024 12:09:33 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sat, 13 Jul 2024 14:09:26 +0200
Message-ID: <20240713120927.2620819-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720872573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=CMCBXibY23ESe7oedsH5KwiysoWskRdzrGergZu2oIc=;
 b=mzXXy3sDS4Sb0foa0x+uS5xrAWNTXron9VpjMuVpr5EoPE+ujYqaC4il+6BfE6QVQWu6h2
 +xdTLkdVl1ls7xFrgMgYXaVM6N1Gwcu5xofpKTT/E7voQmCsPLR1x4ZDURA64o7GV2DTmf
 YOcZeTkwfQL8AQ0/d8NDpxI6s/LiNfHuTqPP5WcLtOvduol/lnJmc1AzZnWcKwpuYbl17p
 C9v/w+MO1Aw7b01pMpaoseBD8BLuWiujVznINwcCx+wzqpNKouPJ+FYmNeBBqXD+YAAwOD
 KiayzVa3eP8xMPm3A1wW/ZXRHV6vkp1cBpxUjlJMq1lGQG6oVnnvo70myLCpfA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mzXXy3sD
Subject: [Buildroot] [PATCH] package/gcc: disallow Fortran on gcc 12/13 on
 Microblaze
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The build of gcc with Fortran support is broken on gcc 12.x and gcc
13.x, it fails with:

../../../libgfortran/generated/bessel_r8.c: In function 'bessel_yn_r8':
../../../libgfortran/generated/bessel_r8.c:178:1: internal compiler error: in gen_reg_rtx, at emit-rtl.cc:1167

This issue has been fixed in gcc 14.x, which builds a Microblaze
Fortran-capable toolchain successfully.

Since we're not really interested in figuring out the commit that
fixed the problem, let's simply disallow the selection of Fortran with
gcc12/13 on Microblaze.

Fixes:

  http://autobuild.buildroot.net/results/5b4eee1d9b119c9f923f9518618f45a6482ddc85/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 969702b707..013527c34e 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -103,6 +103,10 @@ config BR2_TOOLCHAIN_BUILDROOT_FORTRAN
 	# on architecture building libquadmath, wchar is required
 	depends on !BR2_TOOLCHAIN_HAS_LIBQUADMATH || \
 		(BR2_TOOLCHAIN_HAS_LIBQUADMATH && BR2_USE_WCHAR)
+	# internal compiler error: in gen_reg_rtx, at emit-rtl.cc:1167
+	# fixed in gcc 14.x, so disable gcc 12.x/13.x
+	depends on !(BR2_microblaze && \
+		(BR2_GCC_VERSION_12_X || BR2_GCC_VERSION_13_X))
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
 	  Enable this option if you want your toolchain to support the
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
