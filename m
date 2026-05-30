Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EC7CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E21060F08;
	Sat, 30 May 2026 13:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rb-6Wxld34EX; Sat, 30 May 2026 13:33:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93E2C60F0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780147982;
	bh=1jFrH1txEWY5FQIptwfsObMfr7Ej0wbKiLywifNnfpA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ivpzu8j0IWYqX2nNFcyYz4vCYc0jCTg7t4cKHhnpU3LzDerHVX4yAkm70LpA46fCJ
	 wIC3rgwidizWr/uOPOuZhPIjNOuf7+VHEBCELf+YZNtcFXr94iYAJSvCQOGdrUK/Vo
	 rInjlV3k+i+D97BuzMClKfe8fesTP6O51HQWzcX3fLoTyBl2DGKxWiJsmGhzJbHXBm
	 htbdhwoiTpruMxH8UaGj6SkMd2PsbjmVjNd+CU4tTh0FGLbe7pxbrIa6eFxA4yMlhy
	 2g6My6HbzSOcA5PzAvCkkGxt6xenSgFP/gDNbxQqgzvcN5a2JofpoEAGRhCLna4izS
	 xybu9eBW9FXcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93E2C60F0A;
	Sat, 30 May 2026 13:33:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E7B6F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84A8540608
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F-k4r90OwcG9 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:32:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C35CA4025D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C35CA4025D
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:32:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FAD387506; Sat, 30 May 2026 13:32:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:32:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf2cb9f77408de8c7bbcd9163c68f2589ce453eb
X-Git-Newrev: a01c1258fe3e8d1403a5a8281257edf85123430b
X-Patchwork-Hint: ignore
Message-Id: <20260530133246.9FAD387506@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/babeld: disable for musl toolchains
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a01c1258fe3e8d1403a5a8281257edf85123430b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Building babeld with a musl toolchain fails with:
  ld: read-only segment has dynamic relocations

This happens because babeld uses text relocations (textrels), which
are not supported by the musl dynamic loader and would cause a
runtime crash (segmentation fault).

Since Buildroot passes '-ztext' to detect these unsafe relocations
at build time, disable babeld entirely for musl configurations.

Fixes:
https://autobuild.buildroot.org/results/c75643713fd5f27fe063c226630680d26a8b9487/

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/babeld/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/babeld/Config.in b/package/babeld/Config.in
index 80d2708230..0624621d0a 100644
--- a/package/babeld/Config.in
+++ b/package/babeld/Config.in
@@ -1,8 +1,14 @@
 config BR2_PACKAGE_BABELD
 	bool "babeld"
 	depends on BR2_USE_MMU # fork()
+	# uses textrel
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
 	  Babel is a loop-avoiding distance-vector routing protocol for
 	  IPv6 and IPv4 with fast convergence properties.
 
 	  https://www.irif.fr/~jch/software/babel/
+
+comment "babeld needs a uClibc or glibc toolchain"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_USES_MUSL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
