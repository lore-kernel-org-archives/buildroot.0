Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD96C5DF6A
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 19:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51AFC608AD;
	Fri, 14 Aug 2026 19:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h8Sx04u4Nz_Z; Fri, 14 Aug 2026 19:59:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70923608B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786737565;
	bh=uELoxhTbkJj9mO7M8etKFCNTEtaxHRi/B5hA6Bdb6lY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YDvp5mj6tJFSCcd4DjoAThNUS5sRT/fP3vdHr3grsWFlogSppeduOygBD0Zl/OquC
	 +kMNIyj8mmiO+hZGLxNotgeyk65ExNM23BHhZeJ2AGKjgbuRcspakdboNsMxTcJYcK
	 D+iURjLq37lLFK7O8j3mWReh/EXbe8IKyWwW/De3K8RJoRyixkRpwi2XApBMagijMu
	 J2yRObPSDpeIKnuUqb0FIx5T6g2e14wb3Ppu/jFHUtaD+kNuaSA2WfvrM9oMwm546H
	 YBgP2bewYIsH9lajbU9xznvqcE1eztMJCl8vzJCiomuWhdgRPSuiowOBxqAHVJKOTL
	 HD0MK96Pr+7Xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70923608B0;
	Fri, 14 Aug 2026 19:59:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DFDB223F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C652E40064
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SmXuKzP8Ns9n for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 19:59:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 730AE400D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 730AE400D5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 730AE400D5
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:20 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mgeo8-1xMbAk2Z8m-00jUY0; Fri, 14
 Aug 2026 21:59:14 +0200
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Nathaniel Roach <nroach44@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Fiona Klute <fiona.klute@gmx.de>
Date: Fri, 14 Aug 2026 21:58:50 +0200
Message-ID: <20260814195856.3295644-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814195856.3295644-1-fiona.klute@gmx.de>
References: <20260814195856.3295644-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:jwJgLNeUm4RQ1S/cn03bpKYIlACkAOQ7LaarTLuBesVW933Q7dI
 HQ02WjcC7TcCTPwhW3ZbA9H9ZNbuOO3+XnaTBb3LbPPWrsBc7JbRpss3kD/3HNf9yKZgDxp
 HShXp6iTl8ePgezk4T05igCuL4NKXDH8K1hbVnsg9XfNygKpdQX4kUqpQR4qKRmn6d0jKSJ
 m6qpwvOqC3JA/+FutuQXA==
UI-OutboundReport: notjunk:1;M01:P0:6cscjHsGgSY=;YNKTkdHQeubc6J8qYYVLRia7tVJ
 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
 83yWOOKQuoHDhggg==
Subject: [Buildroot] [PATCH 04/10] package/libgudev: update project URL
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
project repository instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/libgudev/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgudev/Config.in b/package/libgudev/Config.in
index 21606ac4cc..46fe0bad97 100644
--- a/package/libgudev/Config.in
+++ b/package/libgudev/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_LIBGUDEV
 	  It's now a project on its own. Required for building some
 	  programs that use udev, when using systemd.
 
-	  https://wiki.gnome.org/Projects/libgudev
+	  https://gitlab.gnome.org/GNOME/libgudev
 
 comment "libgudev needs udev /dev handling and a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
