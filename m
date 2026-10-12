Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DA3CA9ED0
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 10:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F30680C50;
	Mon, 12 Oct 2026 10:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gqdzoQZ1FX3s; Mon, 12 Oct 2026 10:22:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B655F80B7D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791800538;
	b=cOUi3lVUm9heRDW27IUa9u67FG93gyiQDuz9C2tHLxvWDybaULdZoN2pms87qyqxUrr0
	 7bDv7HkxPgcG70nqVmKia0Go/YmkRGkRoFiJjw/gVCPN1DjJu/5be0/qrGe0c9CWfF1ca
	 hc+oFrFivnfbLOx2bDLnPsDl+iCJKqRwU7TuWf2r5NWnm1+wv9VT9Mi6qZKWbhlcgSEOi
	 oyxURnduFK1nsSq2h8ecB+sAtzLyvuxE0DBhrz3fdi3emEFEcGeiH7sYdM0lXSSIhj5Uh
	 S503atHkPPa0q8SDZefiyk/37maGs6xQLSjiQcWdU3s3AbEZetOYIFKlfIctzKdFGPw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791800538;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/E2ihoTiXAzKgp32ExXwLurecgxIYKYndPDVUOmvgSA=;
	b=ouPVIMCyrkRikdlGn+hxN9QWVoLv0f2jY8DnjSI+LxuM+AxZL/npQjlzn8B7zZPRfG5F
	 FvHbzy57JMGPXRmPq6iJkaaDIaDEfjtyeD4OkWOE3C2yJPoZLfaYHXa9R2boPAae1CrYH
	 1O6iJ6Lehm3ulNEbLduFRYKV3gB75MMwYpl9VVLUEHs/aStRCso40iQr6hhj5UgsmiViv
	 2QlmtFX7EFKweCV5coY6+/iv7g08rPUXr6omuq8GrEGzH0VLpus/gINVhjP6S5nydCKqL
	 kt6KFommgVQAjk+y6+kiDq1lGHqELSa6MKKN7kWq2uaoAICUhYJ5w8qH+cHkTkS+A0g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791800538;
	bh=/E2ihoTiXAzKgp32ExXwLurecgxIYKYndPDVUOmvgSA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VZ7uKx6UPiC8X9N1uJQky0A9uP/26XANXwVW7LPVCPIav4n8P8IyH1QRqhKDRSGJg
	 07h/Mgv6F7iQnCVX8cO5x2ogV/JNXl4G08WcstZdOrMOxD2socJb3J1NUgAme4YRQh
	 cr8Z2XUYkJIJhfpnm/fhPaqM/79A6kGrftxB6QJP1RKkE7nLGp28ZH6mgqiuG5KyBQ
	 CWTA/4SxNu+aqWw4Lu74o+/cRO+p2Ufv2MUWrDz6Tuf9/KH8NeDh3LAEEmYO8v8fY8
	 a7zBpDTRJvdKQW6cW7jGY2mRIz64QYMamz/XaOT67FWhhM56soO3HvhyIBtt4cqsUT
	 RgfLxX8zpo3/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B655F80B7D;
	Mon, 12 Oct 2026 10:22:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E5159DF
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13E0A40182
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DSV6IfHg-68R for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 10:22:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4E7BA400E9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791800534;
 b=hQAoqW4trkjMnfgzIXjJCHly9BUvF1RkiOFvZE955/kVE05crxpi2+yWVNzDH+3ph2i9
 kSxFb0Ns3+GHi6CzK4fmBzOn0NiM8ZP1DZPyDnUXQ//j4wml6nDrvcUf0F5pIdsODgqy6
 Dna+B+KthXqbEhMNUgXaAH3E0XT8JaxZrwoBAx06flGpQHCo/709CMQuXUm+DjfTSAFv/
 +Sxh4fc8SS/6oNwhciSwIACwj0+4WuQHdfhDQyEFbsdtuJ1czebappW7PmrJ94t/9X89X
 WPyRJcdhRiiIJQgDosXpf/AEDzlM1wpB22NvB9dwFLGScdBmFAZH7yRAN46gRWICUBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791800534;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pPdhFtKd1WJBNxbJ89R8nxTYhlUF1g7S0NxJSW1BVAo=;
 b=n3rIr14GoisZxDBI0WJG0WIusjn78myLoI/sClMjmbAAo02h1srDMTJZ+ohhxoMnpi8w
 yCiMvTzhj6NiiNE94DM5Bt5BaWcav2Rgw8ImvhZUeT26gnXjmYK4A9qACNaVyVFFO4Hse
 OQdzh2KKXQcczxO/+/dj+F52ZEcYQV62Y96tuBu7YQlAIdes2h/aXUcTellM5lQ2YigDs
 40lBbzu8RMED4W074HLGX/bqG6haQu4rAJ4GLJPVUekycptg5uu28NIsT6XJjIJGocQG+
 39myTxkOCXkTkkIpzpDZILemPPCvW74qvem48p07uBxL0fLDKblQiYugLW1rckD6kcA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E7BA400E9
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:22:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E16D9349E; Mon, 12 Oct 2026 10:20:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Oct 2026 12:19:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d759d9cd485c9983f8fd9a33ce34b16f9b392950
X-Git-Newrev: 58019aa10c624e5d8191f2741927370bf0265082
X-Patchwork-Hint: ignore
Message-Id: <20261012102055.2E16D9349E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qwt: enable build with Qt6
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/58019aa10c624e5d8191f2741927370bf0265082
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Version 6.3.0 added support for Qt6, so enable building Qwt with Qt6 as
well.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/qwt/Config.in | 22 ++++++++++++++--------
 package/qwt/qwt.mk    |  4 ++++
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/package/qwt/Config.in b/package/qwt/Config.in
index 736ccc2a5e..7b0e068ad1 100644
--- a/package/qwt/Config.in
+++ b/package/qwt/Config.in
@@ -1,9 +1,13 @@
 config BR2_PACKAGE_QWT
 	bool "qwt"
-	depends on BR2_PACKAGE_QT5
-	select BR2_PACKAGE_QT5BASE_GUI
-	select BR2_PACKAGE_QT5BASE_WIDGETS # printsupport
-	select BR2_PACKAGE_QT5BASE_CONCURRENT
+	depends on BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5 # printsupport
+	select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6BASE_GUI if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_WIDGETS if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_PRINTSUPPORT if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_CONCURRENT if BR2_PACKAGE_QT6
 	help
 	  Qwt is a graphics extension to the Qt GUI application
 	  framework. It provides a 2D plotting widget and more.
@@ -14,15 +18,17 @@ if BR2_PACKAGE_QWT
 
 config BR2_PACKAGE_QWT_SVG
 	bool "SVG support"
-	select BR2_PACKAGE_QT5SVG
+	select BR2_PACKAGE_QT5SVG if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6SVG if BR2_PACKAGE_QT6
 
 config BR2_PACKAGE_QWT_MATHML
 	bool "MathML support"
 
 config BR2_PACKAGE_QWT_OPENGL
 	bool "OpenGL support"
-	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
-	select BR2_PACKAGE_QT5BASE_OPENGL
-	select BR2_PACKAGE_QT5BASE_OPENGL_LIB
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT6_GL_SUPPORTS
+	select BR2_PACKAGE_QT5BASE_OPENGL if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_OPENGL_LIB if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6BASE_OPENGL if BR2_PACKAGE_QT6
 
 endif
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 67292ee025..0e835c700e 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -18,8 +18,12 @@ QWT_CONFIG += -e 's%/features%/mkspecs/features%'
 
 ifeq ($(BR2_PACKAGE_QWT_SVG),y)
 QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtSvg.*$$/QWT_CONFIG += QwtSvg/'
+ifeq ($(BR2_PACKAGE_QT5),y)
 QWT_DEPENDENCIES += qt5svg
 else
+QWT_DEPENDENCIES += qt6svg
+endif
+else
 QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtSvg.*$$/\# QWT_CONFIG += QwtSvg/'
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
