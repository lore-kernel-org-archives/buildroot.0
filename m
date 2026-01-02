Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D398FC6165
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 23:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF3C882060;
	Fri,  2 Jan 2026 23:40:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cj4To1KNFX7u; Fri,  2 Jan 2026 23:40:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 941B981EBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767397210;
	bh=2GJi/LymQ5nKbvzhiu8WmdteJJa7jBe9b0Gt/yW9ZRI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FoteQgKe2RyhEoBszz28GHaw3uR8YHppUJv7sBY9IN5nw50SdoXouPwHKXuD4nnIt
	 dr22vJi0UKV8jQFb9kfVahKOaaWnz2ZihgDlRu924wk8xaBStv0k2zqAFJKsprGjDD
	 f/iSvaFAws9bk1+GMlUB9HXmUhaLbGH7L8f/zyn/aqDaWoPrFzD/Bdv1vFjSSc62tb
	 WKShBm7/GX+3NsbGvqXUHqIjzVFPi4FXFlFf5HLicZRtcPUVPEr9pMa0a5uQ5wAO7G
	 yHOoC9OBffU/zeCZ8Yjl4pEfaldmxsfrhbupDvbwhRURCcEi1rQZnsYUwUz2u/OLMJ
	 /jpNYEKPRzOZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 941B981EBE;
	Fri,  2 Jan 2026 23:40:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D1096249
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 23:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4FAB40723
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 23:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5EjIW8c99E7 for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 23:40:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 05EBA40721
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05EBA40721
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05EBA40721
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 23:40:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 10222A4C2CFD
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 00:40:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56700)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbokX-0000000088p-2yFM
 for buildroot@buildroot.org; Fri, 02 Jan 2026 23:40:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Jan 2026 00:40:05 +0100
Message-ID: <20260102234005.324849-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767397206;
 bh=UTfEMFr6gRiv6deR4arpTs+EzfXh7seSzyedpFUG0bQ=;
 h=From:To:Subject:Date:From;
 b=kZyGsLPtiEZGa7nouKqwyjU3OZAT3RXSGDUVD265CjqL4Ts5Vkb+hxOcbqenOn8//
 9bB2cX+xdzuWRQ7MixXLjoqyapf9XtgnI4cyH2bavWfQ7O01Yz2QFUpCuQ0turLqvE
 l+ZYrw5C4n4vFBUYIbskBtb/WdHSHGWE797sX5xoXk+BHuk5js7MQQwOd+iO739kDw
 oV4QIZbsd8Pvtiq6FrDr1sraq4RYIKPX3Ww43H5T+XTO54QKMwxKID+0vbaHHdWAN8
 jgpJEXMWLd1B8iFBjWwfykvy7sUbVeVc8a4JEjLiDL4eCgvkJ/FYxidgiMDBZZi+YZ
 tk/MD8++fmhnA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=kZyGsLPt
Subject: [Buildroot] [PATCH 1/1] package/igt-gpu-tools: depends on little
 endian
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

Buildroot commit f9a91bf60e35617157b950eea05fc6f6144d650c bumped igt-gpu-
tools to 2.3 including upstream commit
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/b542242f5b116e3b554b4068ef5dfa4451075b2b
which limits the package to little endian archs causing build errors on
big endian archs:

In file included from ../lib/igt_panthor.c:5:
../lib/igt_panthor.h:61:2: error: #error "big endian not supported"
   61 | #error "big endian not supported"

Fixes:
https://autobuild.buildroot.org/results/e3faeba1bff3d0e781032ddc9a760f34a9bf5714/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/igt-gpu-tools/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/igt-gpu-tools/Config.in b/package/igt-gpu-tools/Config.in
index 184acb4cf1..87268969a1 100644
--- a/package/igt-gpu-tools/Config.in
+++ b/package/igt-gpu-tools/Config.in
@@ -1,5 +1,10 @@
+config BR2_PACKAGE_IGT_GPU_TOOLS_ARCH_SUPPORTS
+	bool
+	default y if BR2_ENDIAN = "LITTLE"
+
 config BR2_PACKAGE_IGT_GPU_TOOLS
 	bool "igt-gpu-tools"
+	depends on BR2_PACKAGE_IGT_GPU_TOOLS_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_ENABLE_LOCALE
 	depends on !BR2_STATIC_LIBS
@@ -35,6 +40,7 @@ config BR2_PACKAGE_IGT_GPU_TOOLS_TESTS
 endif
 
 comment "igt-gpu-tools needs udev /dev management and toolchain w/ NPTL, wchar, dynamic library, locale, headers >= 4.11"
+	depends on BR2_PACKAGE_IGT_GPU_TOOLS_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR || \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
