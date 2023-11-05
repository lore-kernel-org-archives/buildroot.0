Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36452C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 19:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6DC481DFA;
	Sun,  5 Nov 2023 19:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6DC481DFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q9x4aoDpLrHd; Sun,  5 Nov 2023 19:40:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14DBC81DEC;
	Sun,  5 Nov 2023 19:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14DBC81DEC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41C141BF48D
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 19:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14C67404A8
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 19:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14C67404A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r4gWNcyZwTtC for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 19:40:18 +0000 (UTC)
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E80C40345
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 19:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E80C40345
ARC-Seal: i=1; a=rsa-sha256; t=1699213216; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BTLPE7rCHnSsSMGPr34xScPnaTfefVpR9eMpzpz9qOMbNGPn94umPScvt+ioZ1C3EuS0nIz1NANmFDmHz/QGJecJnBlQIBQryFjd2HE4PW0z0Zwvnn1aWlywkLWovPFflhwhxL6v+pxOpKGanUgbEpQxXx16IMS+U/acB5mjRcs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1699213216;
 h=Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=JWNhF+BTwSLQNWchdPwl9Y3o4e22LeQhCT0D6/7ugzk=; 
 b=A0h4f39rFo+57ssk0+E+hQqmm3NKYJouguYUBoIXfMv/Jo66ax2Eo1l91Y15XU2qpsNerDPas+mmj1Uv/y68OmTi/B6cT6o1v8EqfqEcb5Ar2DvtkD8TjzwIKwyLkZrfh6eEY9RLsQSK8U1MyVbbj3O+b7yhPQZFqGECZ2s/eCc=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=fsck.pl;
 spf=pass  smtp.mailfrom=enki@fsck.pl;
 dmarc=pass header.from=<enki@fsck.pl>
Received: from newton.shill.gq (193.93.205.86 [193.93.205.86]) by
 mx.zohomail.com with SMTPS id 1699213213893585.3791588036866;
 Sun, 5 Nov 2023 11:40:13 -0800 (PST)
From: Maciej Grela <enki@fsck.pl>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 20:40:02 +0100
Message-Id: <20231105194003.98240-1-enki@fsck.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231104143527.075bd95d@windsurf>
References: <20231104143527.075bd95d@windsurf>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1699213216; 
 s=zoho; d=fsck.pl; i=enki@fsck.pl;
 h=From:From:To:To:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To:Cc;
 bh=JWNhF+BTwSLQNWchdPwl9Y3o4e22LeQhCT0D6/7ugzk=;
 b=WmNRmEJ7rjKrxJP3mMX6EFTIKy4ooJghGTfmE+m2RfK+oX5dwu3tmWqXnAptjsGz
 o+pFy/gAyARw504gc3dIi8XhlVUIDeO+RkBJQDYF+U6MOxOonglIH6uFt8ipq0A8L+e
 SwF29SSiyV23C/e/tXnvtJ5MEJ9bOmAfaxuwTPRQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=fsck.pl header.i=enki@fsck.pl
 header.a=rsa-sha256 header.s=zoho header.b=WmNRmEJ7
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
