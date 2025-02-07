Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C84BC0219D
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 21:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DA9284971;
	Fri,  7 Feb 2025 21:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ao9wYzBu48h; Fri,  7 Feb 2025 21:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26CA784989
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26CA784989;
	Fri,  7 Feb 2025 21:48:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 05945CF
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 013E16071B
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xHzEoTLsAHs4 for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 21:48:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7F80C61288
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F80C61288
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F80C61288
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:48:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C556CA4C4962;
 Fri,  7 Feb 2025 22:47:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47948)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tgWCc-000000005xA-3hhM;
 Fri, 07 Feb 2025 21:47:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  7 Feb 2025 22:47:58 +0100
Message-Id: <20250207214758.625294-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1738964879;
 bh=MiW+FP4Kwhdrb4/CvwcIwLGcPwZrzeV2F9lZxHdSQ68=;
 h=From:To:Cc:Subject:Date:From;
 b=Jp3Zvfb+YfOyGT4fZqGurT3+31IF5V8PBBYuTMxaoKSU2RUZYThLYyAbLhx/VOsps
 I+zT9LUEFui/bRTiAr+JhC+hXnepOlMQ+YLmXH+cHDI7N7fpvYbdL9e70fQ5dmUw+0
 Z6jlehY+i7XSDmqnRNHwvrYLRSrkxywCLLUAndQAoIbJzkKJS9UzuM/FLrTRapg18W
 10Cfcav1O4zi5Txdr7noWTJDsI1rZR4Nwof0Y3W4x9+B3hwG89dFjvUXMT0/4fjtMF
 REnvU931jIfa+VXKoEvemvU29bOFnklwvKxRWS2qZwtvs7gx/ajdCU0rCWi7qcmKe/
 aPZf8qfvzSUTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=Jp3Zvfb+
Subject: [Buildroot] [PATCH RESEND 1/1] package/freetype: bump to 2.13.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Francois Perrad <francois.perrad@gadz.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Re-send https://patchwork.ozlabs.org/project/buildroot/patch/20240925133512.3899750-1-francois.perrad@gadz.org/

Download mirrors are working:
https://lists.buildroot.org/pipermail/buildroot/2024-October/764862.html

 package/freetype/freetype.hash | 6 +++---
 package/freetype/freetype.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index e7331d5ba0..fcd99319cd 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.13.2/
-sha1  2d8d5917a1983ebd04921f2993a88858d6f72dec  freetype-2.13.2.tar.xz
-sha256  12991c4e55c506dd7f9b765933e62fd2be2e06d421505d7950a132e4f1bb484d  freetype-2.13.2.tar.xz
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.13.3/
+sha1  2437819d11c1205e81141735dcb0a36c0d541e96  freetype-2.13.3.tar.xz
+sha256  0550350666d427c74daeb85d5ac7bb353acba5f76956395995311a9c6f063289  freetype-2.13.3.tar.xz
 
 # Locally calculated
 sha256  2e3bbb7d7c5c396368dd0853a790ec29ce5b8647163dde42a0493fb0d6556b2b  LICENSE.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 5032414d63..ad8cd00ec8 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.13.2
+FREETYPE_VERSION = 2.13.3
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
