Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1305BC4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:54:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 895D160551
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 895D160551
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C4B640227;
	Sat, 24 Jul 2021 20:54:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9TtFEzj6Ufno; Sat, 24 Jul 2021 20:54:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87C73401B3;
	Sat, 24 Jul 2021 20:54:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08BDE1BF27E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7431831EF
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:54:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jd5HTE5kyhMO for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:54:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB4498316F
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=uyjII4cs2GPZSHcn2IkLFPbFXY+aZhc6PXlAIFhpdlk=; 
 b=hDVSP+y+TP12uOmhGAsetRnVMtS/kNw1YAtlt+6vshPPKYqEe92ykkEv0pehbZJHypKIoomqge6rR/CW7oYeoNk4dUsToMKah41jJwSvC44Uo6XaOJ276mUIIwJ1KCyMLttk8HskMaiXpdgXUcaqH3/r1TNKCaMVNapDrJhtlyjE0Mhv2FxENsbaM0hWnlE99kHQTE2m3Y4OmdaOKj7LrQXjkVGAHnJQZBvny0BbCleozly6Z3djPKcGjFNrtH08Z6xUIA1kFNmNCrAq8nXTuUETSQtnMrkkyUmqghbRHAbZHUHcBul+taLoAdXRkm+8HCfFoWWNJ9Hl6Evgjohs5Q==;
Received: from 91-153-34-142.elisa-laajakaista.fi ([91.153.34.142] helo=kodama)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1m7OfG-0002Rx-Sw; Sat, 24 Jul 2021 22:54:30 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 6d9df1ed;
 Sat, 24 Jul 2021 20:54:18 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 23:54:18 +0300
Message-Id: <20210724205418.137180-1-aperez@igalia.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to version
 2.32.3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This is a minor release which provides fixes for CVE-2021-21775,
CVE-2021-21779, CVE-2021-30663, CVE-2021-30665, CVE-2021-30689,
CVE-2021-30720, CVE-2021-30734, CVE-2021-30744, CVE-2021-30749,
CVE-2021-30795, CVE-2021-30797, and CVE-2021-30799.

Full release notes can be found at:

  https://wpewebkit.org/release/wpewebkit-2.32.3.html

An accompanying security advisory has been published at:

  https://wpewebkit.org/security/WSA-2021-0004.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/wpewebkit.hash | 9 +++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 28e3feae90..39bf8829d0 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,8 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.32.2.tar.xz.sums
-md5  a6624736150045a54037457416820b19  wpewebkit-2.32.2.tar.xz
-sha1  7b41a49f97b4cb458b6896623a02f4861cbcf728  wpewebkit-2.32.2.tar.xz
-sha256  2f0ebef0395a5a9e37a8609093f86140f74504f9954f97799b95f5dfbe186739  wpewebkit-2.32.2.tar.xz
+
+# From https://wpewebkit.org/releases/wpewebkit-2.32.3.tar.xz.sums
+md5  1e34412c50fe8d1ff084738477ecad7e  wpewebkit-2.32.3.tar.xz
+sha1  157344d8febfc89d6731404c30857f122f220d6e  wpewebkit-2.32.3.tar.xz
+sha256  859bd1bbe51026aecfb2b6f5c8c024d88fb69ac6fcdc74c788c9fbe9499d740d  wpewebkit-2.32.3.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index c04342c9c3..42bea291e6 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.32.2
+WPEWEBKIT_VERSION = 2.32.3
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
