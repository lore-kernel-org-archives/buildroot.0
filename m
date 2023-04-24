Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16CDC7618E
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 12:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A5A84174C;
	Mon, 24 Apr 2023 12:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A5A84174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F6TBBYax_7Wg; Mon, 24 Apr 2023 12:49:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F7BF4174F;
	Mon, 24 Apr 2023 12:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F7BF4174F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2AF9D1C2AA3
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 12:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00A714174C
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 12:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00A714174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BHsQi0DW80au for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 12:49:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE55740884
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE55740884
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 12:49:22 +0000 (UTC)
Received: from 91-153-34-68.elisa-laajakaista.fi ([91.153.34.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pqvd6-00AsZU-ID; Mon, 24 Apr 2023 14:49:16 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id dde2ee56;
 Mon, 24 Apr 2023 12:49:15 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Mon, 24 Apr 2023 15:49:15 +0300
Message-Id: <20230424124915.76058-1-aperez@igalia.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H0tZnLLEQwNFS5wCqCoAx0Lq7gp67cnZBq2ur8ZnvXU=; b=E9d0r6XpvCX8hck9e97uvwVefg
 rUi0fDpzIlg6vjBTcn4oky5A/gc3QbEk0PCrOqBukUWRuvTvp8FhGdWahVJ2/5kv1QPFX9EgkGx9E
 Gi4NartUt7p/z78l8mzqeM9NeJvjpgH7fNfBkKNbI3rM8GKWyScEmiFrmtrJaR2YcWM9lLdp1s1eC
 z4a1ACU3B75iPBkhEcsVJWFN8MDtf1TpysgKZICGuFlcHNvHNvB4eT4/tEFW2RSB3xVkYUv5ohgbf
 2ceigHt1AeUQMgiPkTcwvfsw2ySNBvBRQp2h2ODJ7rMuBq77gL7mD1+k072snMfrvcOOWPEcEI53/
 r1BGraTg==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=E9d0r6Xp
Subject: [Buildroot] [PATCH] package/wpewebkit: security bump to version
 2.38.6
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

Bugfix release with many security fixes, including (but not limited to)
patches for CVE-2023-25358, CVE-2022-0108, CVE-2022-32885,
CVE-2023-27932, CVE-2023-27954, and CVE-2023-28205.

Release notes:

  https://wpewebkit.org/release/wpewebkit-2.38.6.html

Accompanying security advisory:

  https://wpewebkit.org/security/WSA-2023-0003.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 0fa1018721..d5f628e1ee 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.38.5.tar.xz.sums
-md5  73f7abd0c1cc808032869f72602166e3  wpewebkit-2.38.5.tar.xz
-sha1  3f10a04758eeb349f63f841aff765dae25bcde1b  wpewebkit-2.38.5.tar.xz
-sha256  ff00fd3d0a4c6d551850a78a7dfe4883b6b7ebd93c5549e1121b2f43d3ac1661  wpewebkit-2.38.5.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.38.6.tar.xz.sums
+md5  eb44d3132208218f3752170cae3220b8  wpewebkit-2.38.6.tar.xz
+sha1  5c541a10e216d8d9ca48572b3dc0f82bfb2236c5  wpewebkit-2.38.6.tar.xz
+sha256  dcb6591456393c5366ad9abc62a808137d4fea039cbc7ef4c8d64ead506d035b  wpewebkit-2.38.6.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 48e5c2f8cd..7b8ac67d92 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.38.5
+WPEWEBKIT_VERSION = 2.38.6
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
