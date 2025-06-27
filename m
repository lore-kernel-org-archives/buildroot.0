Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C719C77B7F
	for <buildroot@archiver.kernel.org>; Fri, 27 Jun 2025 08:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 142DB605DD;
	Fri, 27 Jun 2025 08:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D9CpfIKkLbFy; Fri, 27 Jun 2025 08:27:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F84D60793
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F84D60793;
	Fri, 27 Jun 2025 08:27:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A5DD154
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 08:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C0FB419F0
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 08:27:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lO-fbdKak9UW for <buildroot@buildroot.org>;
 Fri, 27 Jun 2025 08:27:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D4B4F40B87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4B4F40B87
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4B4F40B87
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 08:27:37 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 5B243586626
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 07:59:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E93994437F;
 Fri, 27 Jun 2025 07:58:57 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 thomas.petazzoni@bootlin.com,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Fri, 27 Jun 2025 09:58:53 +0200
Message-ID: <20250627075855.199254-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvhedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdektddthfdutdeikedufeefgfefvddtkedtueetleelhfevheduieduleduleelnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtnecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghom
 hdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1751011138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=eDWSlOB522nKLHRXv0Z3BtN0+YGLjvwS+BZa+JzZibY=;
 b=A3DM8x9hnR23VM1Fjo7IxRr9BADXIPhAGFup4UkbIMbRERw0hd4GpOYSlQk/Zr345oT3c2
 T/TY6j6Lij4+nECZTtx5eHb77XwbU0CQKVkOHosx1jEYf7wawXVs6sQUJiyOG+dwHybTrf
 NHSAjtdnKEud2Nm6oj4DM/UEjh/DKGn2dgIYQ3p17XoGvOAgwEa3S7T2sUCmy+ZIa7TR8k
 oZuQDpZ6L4RC8sHQFAuUI0FaqsO/n+kHmQZCEB/6A6fWZkID/ZHKgUzSDokEPPR9VKMc8G
 3BqQK3AcGGabDNi49qScBt3bJjiyfjN/xkXbJZJO6NppTaeSgZo+bMAphYeq0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A3DM8x9h
Subject: [Buildroot] [PATCH] package/elfutils: elfutils programs now require
 a c++ toolchain
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
From: Maxime Chevallier via buildroot <buildroot@buildroot.org>
Reply-To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 0.192 release of elfutils introduced the src/srcfiles.cxx program,
that lists all source files of a given ELF binary. As this is a C++
program, we need a toolchain that supports it.

Without it, the build system tries to use "no" as the CXX compiler,
resulting in the following errors :

  /bin/sh: line 1: no: command not found

as can be seen here for example :

https://autobuild.buildroot.net/results/849/849221c794a469a423857a290db775d150b84900

Add a dependency to a CPP toolchain for the elfutils programs.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 package/elfutils/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index c355048c6d..f6f5438fb0 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -24,8 +24,12 @@ if BR2_PACKAGE_ELFUTILS
 config BR2_PACKAGE_ELFUTILS_PROGS
 	bool "Install programs"
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  This option tells elfutils to not only install the libelf
 	  libraries, but also the elfutils programs.
 
+comment "elfutils programs needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 endif
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
