Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DFAC43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 19:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0622F83267;
	Sun,  5 Jun 2022 19:44:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bbAgRHct849F; Sun,  5 Jun 2022 19:44:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 262C58407F;
	Sun,  5 Jun 2022 19:44:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4946A1BF388
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 19:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 371DD40D24
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 19:43:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bE_uzugz8xt8 for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 19:43:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29EC340D73
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 19:43:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id CBEF9240005;
 Sun,  5 Jun 2022 19:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654458195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+TtILeZO2kJzQ0SZQU1gQfe1A1Zq3Wn7Knv3LeftU8I=;
 b=brBPRkG8+11zyP3D78VoAHQjiRXSINvAbiWLUHLokTDjxdTbPY2z7WhOncgb3pjVE5PwzG
 RGvwUsafPwZ2r4n6JUSmoM3G/lV+VytIEySJDyqGQejfdrGdmATe477Xms79JwE9eKO1as
 1XuM9atlJ1SpipQd9Z6VDGBjLWAUclixXW7uXyzcByiUweuCNXjPOjdBkInQknMrhagq3j
 6A9UGTDVmFXjV2uG+WPnv6OSjKoDwIPQUle6YUGwpyDZ0+emrpH+jdn/SDej/Op61Y5qft
 El4j9JGN5xLuNXr6GdYEK1Ufnr45kTjjQASY1OjtukXXxcu7P0oIxWckBMJj/A==
To: Buildroot List <buildroot@buildroot.org>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sun,  5 Jun 2022 21:42:56 +0200
Message-Id: <20220605194259.2928568-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220605194259.2928568-1-thomas.petazzoni@bootlin.com>
References: <20220605194259.2928568-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/7] Config.in: only allow BR2_STATIC_LIBS on
 supported libc/arch
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
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: James Hilliard <james.hilliard1@gmail.com>

It is currently possible to select BR2_STATIC_LIBS while
BR2_TOOLCHAIN_BUILDROOT is selected even when there are no buildroot
toolchains that support BR2_STATIC_LIBS for the selected architecture.

Add BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_SUPPORTS so that we can
disable the selection of BR2_STATIC_LIBS when using an unsupported
architecture.

Fixes:
 - http://autobuild.buildroot.net/results/4da59af8193376ec893321c4c2aaf1d25598502d
 - http://autobuild.buildroot.net/results/1950348218a4f097f078d158977c13f8b0a97d6e
 - http://autobuild.buildroot.net/results/2f03f2be32ad9898a990f6f0264d8c8d51991eb1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in                               | 2 ++
 toolchain/toolchain-buildroot/Config.in | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/Config.in b/Config.in
index f0cd6f48ed..52c3c4b4c8 100644
--- a/Config.in
+++ b/Config.in
@@ -601,6 +601,8 @@ choice
 
 config BR2_STATIC_LIBS
 	bool "static only"
+	depends on !BR2_TOOLCHAIN_BUILDROOT || \
+		BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_SUPPORTS
 	help
 	  Build and use only static libraries. No shared libraries will
 	  be installed on the target. This potentially increases your
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 0dac816a4d..11566c27ff 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -20,6 +20,11 @@ config BR2_TOOLCHAIN_BUILDROOT_VENDOR
 
 	  If you're not sure, just leave the default "buildroot" value.
 
+config BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_SUPPORTS
+	bool
+	default y if BR2_PACKAGE_UCLIBC_SUPPORTS
+	default y if BR2_PACKAGE_MUSL_SUPPORTS
+
 choice
 	prompt "C library"
 	default BR2_TOOLCHAIN_BUILDROOT_UCLIBC
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
