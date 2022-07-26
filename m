Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2791C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 16:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 394AF610FD;
	Tue, 26 Jul 2022 16:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 394AF610FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xs4_2FvDj1tY; Tue, 26 Jul 2022 16:40:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2295460EB4;
	Tue, 26 Jul 2022 16:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2295460EB4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C71A01BF3D9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADDAE40621
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADDAE40621
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SolDfbXwWkEj for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 16:40:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9181B4014B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9181B4014B
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 16:40:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id D31871BF20A;
 Tue, 26 Jul 2022 16:39:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 18:39:50 +0200
Message-Id: <20220726163951.2111731-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220726163951.2111731-1-thomas.petazzoni@bootlin.com>
References: <20220726163951.2111731-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658853600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yNqdXOdzknt7Al6HprqB/Yn7g+GNVheBlyWWYNlJP18=;
 b=jnx7QPyp5Z9DAVVeftFTkgnA6C5f4Yp6SRUqDoS1ljed86CZLgr/ktomaqui6JZOZvtXjR
 hXKscgtL8myvYSxd8VBKA6UaLGzToyVeIxbTyBXA/OcaQuHtMqT9RpiC6iyGxXyiIqFKRO
 NcvMci3jvLUi70WpFwE1f5o2t+awwq86SlrhZuu+j9ifxhSD9w/olFCr3S9S3Nhez+9a5L
 gyWpCqHFcqCp7xIowaD1dmOpta0P8RucWmxYpywdI4prvjyWa5frWiiFgpRzrcydHi4lUW
 lUoSskiix3JVPxy/wXXDh61zXK3j96FIcCtgWV6rpuUgSFtko09GB+GSpV4qMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jnx7QPyp
Subject: [Buildroot] [PATCH v2 3/4] arch/Config.in: move the binary format
 selection further down
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Right now the "Target options" menu looks like this:

 Target architecture (....)
 ... options related to the binary format selection ...
 ... options related to the architecture variant selection ...

This doesn't make much sense: the architecture variant selection
should be just below the target architecture selection. With this
commit, things will now be presented this way:

 Target architecture (....)
 ... options related to the architecture variant selection ...
 ... options related to the binary format selection ...

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in | 100 ++++++++++++++++++++++++-------------------------
 1 file changed, 50 insertions(+), 50 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 9135df9def..095036f1aa 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -371,56 +371,6 @@ config BR2_BINFMT_SUPPORTS_SHARED
 config BR2_READELF_ARCH_NAME
 	string
 
-# Set up target binary format
-choice
-	prompt "Target Binary Format"
-	default BR2_BINFMT_ELF if BR2_USE_MMU
-	default BR2_BINFMT_FLAT
-
-config BR2_BINFMT_ELF
-	bool "ELF"
-	depends on BR2_USE_MMU
-	select BR2_BINFMT_SUPPORTS_SHARED
-	help
-	  ELF (Executable and Linkable Format) is a format for libraries
-	  and executables used across different architectures and
-	  operating systems.
-
-config BR2_BINFMT_FLAT
-	bool "FLAT"
-	depends on !BR2_USE_MMU
-	help
-	  FLAT binary is a relatively simple and lightweight executable
-	  format based on the original a.out format. It is widely used
-	  in environment where no MMU is available.
-
-endchoice
-
-# Set up flat binary type
-choice
-	prompt "FLAT Binary type"
-	default BR2_BINFMT_FLAT_ONE
-	depends on BR2_BINFMT_FLAT
-
-config BR2_BINFMT_FLAT_ONE
-	bool "One memory region"
-	help
-	  All segments are linked into one memory region.
-
-config BR2_BINFMT_FLAT_SHARED
-	bool "Shared binary"
-	depends on BR2_m68k
-	# Even though this really generates shared binaries, there is no libdl
-	# and dlopen() cannot be used. So packages that require shared
-	# libraries cannot be built. Therefore, we don't select
-	# BR2_BINFMT_SUPPORTS_SHARED and therefore force BR2_STATIC_LIBS.
-	# Although this adds -static to the compilation, that's not a problem
-	# because the -mid-shared-library option overrides it.
-	help
-	  Allow to load and link indiviual FLAT binaries at run time.
-
-endchoice
-
 if BR2_arcle || BR2_arceb
 source "arch/Config.in.arc"
 endif
@@ -481,4 +431,54 @@ if BR2_xtensa
 source "arch/Config.in.xtensa"
 endif
 
+# Set up target binary format
+choice
+	prompt "Target Binary Format"
+	default BR2_BINFMT_ELF if BR2_USE_MMU
+	default BR2_BINFMT_FLAT
+
+config BR2_BINFMT_ELF
+	bool "ELF"
+	depends on BR2_USE_MMU
+	select BR2_BINFMT_SUPPORTS_SHARED
+	help
+	  ELF (Executable and Linkable Format) is a format for libraries
+	  and executables used across different architectures and
+	  operating systems.
+
+config BR2_BINFMT_FLAT
+	bool "FLAT"
+	depends on !BR2_USE_MMU
+	help
+	  FLAT binary is a relatively simple and lightweight executable
+	  format based on the original a.out format. It is widely used
+	  in environment where no MMU is available.
+
+endchoice
+
+# Set up flat binary type
+choice
+	prompt "FLAT Binary type"
+	default BR2_BINFMT_FLAT_ONE
+	depends on BR2_BINFMT_FLAT
+
+config BR2_BINFMT_FLAT_ONE
+	bool "One memory region"
+	help
+	  All segments are linked into one memory region.
+
+config BR2_BINFMT_FLAT_SHARED
+	bool "Shared binary"
+	depends on BR2_m68k
+	# Even though this really generates shared binaries, there is no libdl
+	# and dlopen() cannot be used. So packages that require shared
+	# libraries cannot be built. Therefore, we don't select
+	# BR2_BINFMT_SUPPORTS_SHARED and therefore force BR2_STATIC_LIBS.
+	# Although this adds -static to the compilation, that's not a problem
+	# because the -mid-shared-library option overrides it.
+	help
+	  Allow to load and link indiviual FLAT binaries at run time.
+
+endchoice
+
 endmenu # Target options
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
