Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422F8C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 13:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5E4941B54;
	Mon,  6 Nov 2023 13:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5E4941B54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VScgI39uhAsa; Mon,  6 Nov 2023 13:09:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFE7041BE6;
	Mon,  6 Nov 2023 13:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFE7041BE6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1926A1BF2EA
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 13:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5FD582045
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 13:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5FD582045
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t-yr0FJVOol4 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 13:08:59 +0000 (UTC)
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EAED8202D
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 13:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EAED8202D
ARC-Seal: i=1; a=rsa-sha256; t=1699276136; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=S5Q4nBxg6eCFDZIG6AQOLAlZccICdhv4eD31w1HuC1U/uXsiu/4WE45a/88W3kRShEVkBu2KO5yWdYtkbDX/mlWX/ZOhrupdYKqTviY8zYTRZspqd3MEakVPuyMP89iOxoZMObpNSihZOlOXJkdFTBxBGN1wk+acoidgNo/wKMs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1699276136;
 h=Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=JWNhF+BTwSLQNWchdPwl9Y3o4e22LeQhCT0D6/7ugzk=; 
 b=HGPOI53mN0CnhswhzVja2f/eV9A2fDqADLZw0liNdSItsUe8hvigZno3lsyKopQm3xLHt9Swtk1d93RF0VNlHNBqbe6RIvtCOmWbRO862Avu+x7oSNWGaUDgOYa0x24kEzdS4qJEpNUbWyzim6sKFDGNH/OitIAW5DzQQwv2fu4=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=fsck.pl;
 spf=pass  smtp.mailfrom=enki@fsck.pl;
 dmarc=pass header.from=<enki@fsck.pl>
Received: from newton.shill.gq (193.93.205.86 [193.93.205.86]) by
 mx.zohomail.com with SMTPS id 1699276122252878.3972588852206;
 Mon, 6 Nov 2023 05:08:42 -0800 (PST)
From: Maciej Grela <enki@fsck.pl>
To: buildroot@buildroot.org
Date: Mon,  6 Nov 2023 14:08:34 +0100
Message-Id: <20231106130835.116844-1-enki@fsck.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106084850.1d0f01ce@windsurf>
References: <20231106084850.1d0f01ce@windsurf>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1699276136; 
 s=zoho; d=fsck.pl; i=enki@fsck.pl;
 h=From:From:To:To:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To:Cc;
 bh=JWNhF+BTwSLQNWchdPwl9Y3o4e22LeQhCT0D6/7ugzk=;
 b=dB2gpwcicemLWGeNnSPJuw2NEWPLjsRjHfDc7muvuC2TOG8+OQRREgvO9K9mFXef
 71GutR4vTKiBewiGsWv8sPk7vtm8kZE0KF1f7PTZxXTZIAVVLqPPwR8nmhpuBCnZI4d
 I+nhsWb69680x4HX5INnNbeMeJbC/xZljIEhr4pw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=fsck.pl header.i=enki@fsck.pl
 header.a=rsa-sha256 header.s=zoho header.b=dB2gpwci
Subject: [Buildroot] [PATCH v4 1/1] package/spirv-tools: fix build issue
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

spirv-tools requires a toolchain w/ shared libs, add flag dependency and comment.

Fixes: http://autobuild.buildroot.net/results/a1f615d2410bffb6fdacc8586761c9def05aafa9
Fixes: http://autobuild.buildroot.net/results/294ade8c9aa3d650fa5ab6cc34701c4176bc197f
Signed-off-by: Maciej Grela <enki@fsck.pl>
---
 package/spirv-tools/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/spirv-tools/Config.in b/package/spirv-tools/Config.in
index 39fdb80b86..c1d3a4f9bc 100644
--- a/package/spirv-tools/Config.in
+++ b/package/spirv-tools/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_SPIRV_TOOLS
 	bool "spirv-tools"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_SPIRV_HEADERS
 	help
 	  The SPIR-V Tools project provides an API and commands for
@@ -9,6 +10,8 @@ config BR2_PACKAGE_SPIRV_TOOLS
 
 	  https://github.com/KhronosGroup/SPIRV-Tools
 
-comment "spirv-tools needs a toolchain w/ C++, gcc >= 7"
+comment "spirv-tools needs a toolchain w/ C++, gcc >= 7, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		BR2_STATIC_LIBS
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
