Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660D1C25B47
	for <buildroot@archiver.kernel.org>; Fri, 27 Oct 2023 09:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2A4841779;
	Fri, 27 Oct 2023 09:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2A4841779
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jW0OAOefvUgO; Fri, 27 Oct 2023 09:15:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 010F04333E;
	Fri, 27 Oct 2023 09:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 010F04333E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EBEC51BF2F0
 for <buildroot@lists.busybox.net>; Fri, 27 Oct 2023 09:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2238703AC
 for <buildroot@lists.busybox.net>; Fri, 27 Oct 2023 09:15:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2238703AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ceHJTyKsIZ-3 for <buildroot@lists.busybox.net>;
 Fri, 27 Oct 2023 09:15:51 +0000 (UTC)
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B14676F620
 for <buildroot@buildroot.org>; Fri, 27 Oct 2023 09:15:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B14676F620
ARC-Seal: i=1; a=rsa-sha256; t=1698398149; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OYuSKF1RtRkMuMq0naJaDGyliEJ+s1o3G0ZrXqHSFO9bMgIw7gq60bYpsKnMzCuoo1H/S0nxyMtKDcQzIdOHjs3nx0/LWwAN0XmGlgXYMoZ2+nufvtW3aL0oQ540xq1DltmhhdHNAs288wywZTIM2zOMK+DtkjbDguM/1qnvJp0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1698398149;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=jS2uIBNZ+kNUylDeaVSCpuleff1skD9LSKpij5gn8Xs=; 
 b=XRngAEwYa1lpyiXsDsGLPX03jWvAQ2UwsXmOhYvHiWwa2JkHDeOizD2XLdYXVLCf9FtRmlALits4o9wztFb69WRbSajm8UZflPWoNVBQu/SV0JsxflswHLKwmBZ5atPgo2mKC9mwsJMhz3wfhn11NrvcPsYkloFlt1/X/xv7Qs4=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=fsck.pl;
 spf=pass  smtp.mailfrom=enki@fsck.pl;
 dmarc=pass header.from=<enki@fsck.pl>
Received: from newton.shill.gq (193.93.205.86 [193.93.205.86]) by
 mx.zohomail.com with SMTPS id 1698398148077231.3389087188359;
 Fri, 27 Oct 2023 02:15:48 -0700 (PDT)
From: Maciej Grela <enki@fsck.pl>
To: buildroot@buildroot.org
Date: Fri, 27 Oct 2023 11:15:26 +0200
Message-Id: <20231027091526.2224829-1-enki@fsck.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1698398149; 
 s=zoho; d=fsck.pl; i=enki@fsck.pl;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
 bh=jS2uIBNZ+kNUylDeaVSCpuleff1skD9LSKpij5gn8Xs=;
 b=BAV4JIXgx8pBt/2tspwvyQehr6bad66YgAaFjCoPH1QHUUH8LmFtP71iTW7c3RHN
 Kciy9Ubq3x1OGtmXHc54p8qh6zCObR43imQzljhHCU3/mIDovXK006BzfEQUv0h0O4h
 JnzUdTpGNFzRLbsMntqcQpp3qzlZXLaUzlYqztq8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=fsck.pl header.i=enki@fsck.pl
 header.a=rsa-sha256 header.s=zoho header.b=BAV4JIXg
Subject: [Buildroot] [PATCH v2 1/1] package/spirv-tools: fix build issue
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
Cc: Maciej Grela <enki@fsck.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

spirv-tools requires a C++ toolchain with shared libs, add flag dependency and comment.

Fixes: http://autobuild.buildroot.net/results/53b3cf124d6c299398e620120465eca396ddcdff
Fixes: http://autobuild.buildroot.net/results/a1f615d2410bffb6fdacc8586761c9def05aafa9
Fixes: http://autobuild.buildroot.net/results/294ade8c9aa3d650fa5ab6cc34701c4176bc197f
Fixes: http://autobuild.buildroot.net/results/40e8f50eb7e82ca42f84fa5f4336cefb51204a28
Fixes: http://autobuild.buildroot.net/results/3c3be2c454863709d0db896bafbe11cd9df092a3
Fixes: http://autobuild.buildroot.net/results/8df8de1aeaf1317f6ba43f6752502da2eedcdea1
Fixes: http://autobuild.buildroot.net/results/ea2c1f97e82efcd867c79f05ab02f5f099140379
Fixes: http://autobuild.buildroot.net/results/fa4e39d1e78e885d20851201ed8a6fcf9d48d7d6
Fixes: http://autobuild.buildroot.net/results/4ed3f13b3ce178f8fe87de7aee86acb9642e3434
Fixes: http://autobuild.buildroot.net/results/e1b4853a7e8714fd2af8f8677681c9895034b3e8
Signed-off-by: Maciej Grela <enki@fsck.pl>
---
 package/spirv-tools/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/spirv-tools/Config.in b/package/spirv-tools/Config.in
index e2f46253a9..f1ae11bd09 100644
--- a/package/spirv-tools/Config.in
+++ b/package/spirv-tools/Config.in
@@ -1,6 +1,11 @@
+comment "spirv-tools needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || ( !BR2_SHARED_LIBS && !BR2_SHARED_STATIC_LIBS )
+
 config BR2_PACKAGE_SPIRV_TOOLS
 	bool "spirv-tools"
 	select BR2_PACKAGE_SPIRV_HEADERS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_SHARED_LIBS || BR2_SHARED_STATIC_LIBS
 	help
 	  The SPIR-V Tools project provides an API and commands for
 	  processing SPIR-V modules.
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
