Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91146CE8D49
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 04:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57935849A8;
	Thu, 19 Sep 2024 04:00:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lv3RAMl6DSqO; Thu, 19 Sep 2024 04:00:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 915E5849AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 915E5849AA;
	Thu, 19 Sep 2024 04:00:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 285481BF215
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 03:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10C9C42749
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 03:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1RW5yBB5RQ7 for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 03:59:50 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@helium.openadk.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 29ECD4278D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29ECD4278D
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29ECD4278D
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 03:59:49 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id E69823537470; Thu, 19 Sep 2024 05:53:36 +0200 (CEST)
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 05:53:02 +0200
Message-Id: <20240919035308.2622723-4-wbx@openadk.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240919035308.2622723-1-wbx@openadk.org>
References: <20240919035308.2622723-1-wbx@openadk.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1726718017; bh=82RI4o/eWEqkOvl1NthsLyDZhbC5li1C8naUSu6y+CU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XeKzgaoXYO2Rrp3SPjsaA9BBOrTDh4tXF55oQuAvjNCfdxTi/LAZvgo5tG9pepdjg
 IgIovcxKQVdKOg6DwIy5Z6uVVFVqtCn9yB9Htmw0b/zEJwFpRUizAWKpNEPAuRkCxG
 y33/1G41VSDf21JZkUvNy/3GlA5gHsMc0FXE/B9OuO49UHGi3XxlSilLY5VJa5wTRL
 GMNtyBdpTBCgIYyA2wwOr1pB5IRFPxDhpI8RlbPFd2nWgMiu9USE3iS2ZSB+CbUqvf
 u2Nza4whkSBoL0E0oFcQ3olIY0dWtPj5pA+OvpjwYCXkiZ0Q89SqvGavJN+sfRyOvu
 HuJ7zWkhlGE1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=XeKzgaoX
Subject: [Buildroot] [PATCH 3/9] arch: make FDPIC dependent on toolchain
 support
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
Cc: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Ben Wolsieffer <ben.wolsieffer@hefring.com>

FDPIC support on ARM requires a certain target name, and therefore is
only currently available with the Buildroot toolchain. In addition,
only uClibc-ng supports FDPIC on ARM at the moment.

This may need to become more complicated if we end up in a situation
where each libc supports FDPIC on a different set of architectures.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 arch/Config.in      | 1 +
 toolchain/Config.in | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index e57f4b2baa..52efe3aabd 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -447,6 +447,7 @@ config BR2_BINFMT_ELF
 config BR2_BINFMT_FDPIC
 	bool "FDPIC"
 	depends on BR2_ARCH_HAS_FDPIC_SUPPORT
+	depends on BR2_TOOLCHAIN_SUPPORTS_FDPIC
 	select BR2_BINFMT_SUPPORTS_SHARED
 	help
 	  ELF FDPIC binaries are based on ELF, but allow the individual
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 6e91ab756c..0dd4bb5d9b 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -48,6 +48,7 @@ choice
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
 	depends on BR2_ARCH_HAS_TOOLCHAIN_BUILDROOT
+	select BR2_TOOLCHAIN_SUPPORTS_FDPIC if BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_TOOLCHAIN_EXTERNAL
 	bool "External toolchain"
@@ -307,6 +308,9 @@ config BR2_TOOLCHAIN_HAS_OPENMP
 config BR2_TOOLCHAIN_SUPPORTS_PIE
 	bool
 
+config BR2_TOOLCHAIN_SUPPORTS_FDPIC
+	bool
+
 config BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY
 	bool "Copy gconv libraries"
 	depends on BR2_TOOLCHAIN_USES_GLIBC
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
