Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46BBC61DA4
	for <buildroot@archiver.kernel.org>; Fri,  3 Feb 2023 21:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C95F429F7;
	Fri,  3 Feb 2023 21:24:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C95F429F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vKZAlv2HiUpy; Fri,  3 Feb 2023 21:24:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB7F142A18;
	Fri,  3 Feb 2023 21:24:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB7F142A18
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F04711BF5B4
 for <buildroot@lists.busybox.net>; Fri,  3 Feb 2023 21:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C32A16131F
 for <buildroot@lists.busybox.net>; Fri,  3 Feb 2023 21:24:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C32A16131F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YCNHH8tI0k4k for <buildroot@lists.busybox.net>;
 Fri,  3 Feb 2023 21:24:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B243F61317
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B243F61317
 for <buildroot@buildroot.org>; Fri,  3 Feb 2023 21:24:24 +0000 (UTC)
Received: from 91-153-34-153.elisa-laajakaista.fi ([91.153.34.153] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pO3Xf-008ZMX-5C; Fri, 03 Feb 2023 22:24:19 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 4f00e013;
 Fri, 3 Feb 2023 21:24:17 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri,  3 Feb 2023 23:24:17 +0200
Message-Id: <20230203212417.874198-1-aperez@igalia.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bv+sp6+yFFTcqaSgNBZGe+r1jPB7IT0bAPuuJbr7m7U=; b=SbHADumnFGKdra8fjm74OBbUd6
 FnEuMh8taIewN1Q5eDX1fwt0BcbtFBC77RC+ttRNifeQmCnAKGncd0LtqG4xM1tGlnE0Kf9/s/LbS
 LMMolLz9CUf3xSeFo0+PdNfJiDNtfzWTMacK4vb1ZO7spm/r8GRc8rQxsWDCpc9FUhp/XEnsyGI57
 Ja8BdF4k5KeZGZGnLHc/3Cwml7brFAV589Vi49IwIfBiSFHs85Kw7uUjT9Qcj2MuaJnYIP33yxZb4
 ZUAHTtWuANWoatmpTpnNI1SYli05pRXuIsL5Hycdb83yhk0NcM9RsFnDhRWdMsJlYD+UCbAsM7fCs
 5Jmj7GXQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=SbHADumn
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: security bump to version
 2.38.4
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bugfix release, with many security fixes, including (but not limited to)
patches for CVE-2023-23517, CVE-2023-23518, and CVE-2022-42826.

Release notes:

  https://webkitgtk.org/2023/02/02/webkitgtk2.38.4-released.html

Accompanying security advisory:

  https://webkitgtk.org/security/WSA-2023-0001.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index eff7f5c18f..34fd19d3de 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.38.3.tar.xz.sums
-md5  1c1cc5eb59273091e228406937b23947  webkitgtk-2.38.3.tar.xz
-sha1  04cb5923d8ac6f435424b74115c3219ec597e9ad  webkitgtk-2.38.3.tar.xz
-sha256  41f001d1ed448c6936b394a9f20e4640eebf83a7f08262df28504f7410604a5a  webkitgtk-2.38.3.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.38.4.tar.xz.sums
+md5  1c9ca83a0ad7e4ca9e933094572cb7d9  webkitgtk-2.38.4.tar.xz
+sha1  38b47df2be9bfb97d68fce8c7fa2819966a79036  webkitgtk-2.38.4.tar.xz
+sha256  4f47ea29a2d4d5f15eef3dc9e2d6c6f067e8de863a3f64455e1ccf9693cc1d36  webkitgtk-2.38.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index b1bca7b88a..b42ac3b644 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.38.3
+WEBKITGTK_VERSION = 2.38.4
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
