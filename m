Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7817FCC05A
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 18:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 907BE613B1;
	Fri,  6 Mar 2026 18:40:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oafizTsMyInY; Fri,  6 Mar 2026 18:40:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0109613B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772822440;
	bh=PI3j2yJYxEUOVCzJA1yyvJQjtuYJTZx64vXiUXzJyl4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NeLcc91AIE1+wv00/9RnoMsmUTMkbUTmf9kmd9WpOtRM4LZiGOPGn7Z8t0TjeGAOx
	 5IZNHlZsCRZCmaGUzjRbNPBvKG68rKbXBdyZasiVmdicLz3tkv2iCD7XCs0tkuhg88
	 uQRKoZNG8kkwGz0oSJgvd5G0pls/779GRGj6zGJdSm0qMjL6l3DzyVMS2V/BIWlDQH
	 KGBEUzF7BvxMqFV90L1UbPF+JtpCCEBoMEdTvKh0PrLbeYG3pwZF48f4lzlRXlZdVV
	 jLbLokE/RC4ZXLAK1bMPiUgJ5DxWDjxlbJCNcHISgRn34MKNbVwPr2HzvT8Gpr+dMq
	 PSaus956kSkrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0109613B2;
	Fri,  6 Mar 2026 18:40:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70E35339
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4800940147
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hOxnUv1s_RoL for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AEB2401D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AEB2401D6
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A11D584148; Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 19:39:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f6adca8e0fc2f42a0ac05d52b525711f1054119
X-Git-Newrev: 2d41d0d980691af8187d301f371b4b46fca54a7c
X-Patchwork-Hint: ignore
Message-Id: <20260306184030.A11D584148@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvips: fix build with glibc 2.43
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2d41d0d980691af8187d301f371b4b46fca54a7c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...fix-VIPS_FREEF-for-expression-like-macros.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/libvips/0001-memory-fix-VIPS_FREEF-for-expression-like-macros.patch b/package/libvips/0001-memory-fix-VIPS_FREEF-for-expression-like-macros.patch
new file mode 100644
index 0000000000..cee35415c6
--- /dev/null
+++ b/package/libvips/0001-memory-fix-VIPS_FREEF-for-expression-like-macros.patch
@@ -0,0 +1,33 @@
+From abb4dfad9e446e77396de9e93003af5be7aa18da Mon Sep 17 00:00:00 2001
+From: Kleis Auke Wolthuizen <github@kleisauke.nl>
+Date: Sun, 18 Jan 2026 12:15:33 +0100
+Subject: [PATCH] memory: fix `VIPS_FREEF` for expression-like macros (#4836)
+
+Ensure the macro works correctly when F expands to an expression,
+such as `g_free()` using `free_sized()` (as available in the
+upcoming glibc 2.43).
+
+Resolves: #4835.
+
+Upstream: https://github.com/libvips/libvips/commit/abb4dfad9e446e77396de9e93003af5be7aa18da
+
+[Bernd: dropped ChangeLog from patch]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ChangeLog                     | 1 +
+ libvips/include/vips/memory.h | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libvips/include/vips/memory.h b/libvips/include/vips/memory.h
+index 93e669340b..7073d1ea6a 100644
+--- a/libvips/include/vips/memory.h
++++ b/libvips/include/vips/memory.h
+@@ -41,7 +41,7 @@ extern "C" {
+ 	G_STMT_START \
+ 	{ \
+ 		if (S) { \
+-			(void) F((S)); \
++			(void) (F((S))); \
+ 			(S) = 0; \
+ 		} \
+ 	} \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
