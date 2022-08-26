Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106A3ECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 11:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66536610F3;
	Fri, 26 Aug 2022 11:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66536610F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id de7zWJ7pkzc6; Fri, 26 Aug 2022 11:11:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 669B4610EE;
	Fri, 26 Aug 2022 11:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 669B4610EE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A6EC01BF289
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 11:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 810F1419F0
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 11:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 810F1419F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y-hTsqEvPoE9 for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 11:11:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B51D419E3
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B51D419E3
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 11:11:11 +0000 (UTC)
Received: from 91-153-34-64.elisa-laajakaista.fi ([91.153.34.64] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1oRXEy-000yv0-Dn; Fri, 26 Aug 2022 13:11:08 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id ece1f19d;
 Fri, 26 Aug 2022 11:10:54 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 13:49:18 +0300
Message-Id: <20220826104918.489523-1-aperez@igalia.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uOG5f7UMbUKjVU4pOvSTIyOPxC5fRvAC0rEltLMV9GA=; b=U5RuVKFH2Vw/8FoRG3bf8TXk0w
 G+NCticJEmju138cS3t/27uZvxxm7xRY/NMdc4Kddz/8ZaLP/6wja8G8Vr5G3QuWJnfYvkOYk4/Wf
 tlDPpTZkGe3ABNbI+PREUdY8ER8wwZqv/LIyNtp4Vu8T2Ac3W86NWpiutoQcwoK9wij6HC7qQomWq
 IyhV5SaGH7tasteDSsRZnl5r8WmIWw2YwQfG522GFuXgZeRub0uniJnDFqEGM8d+t/NBTN7j+C6f5
 uETt7u0lXAM0PSiXiLbVv3qA61HmgnOn8di1PCuB8qw0hyPI91p/kHxancsZ9zybWAyLGTi8VZMlB
 X1FiefGQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=U5RuVKFH
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to version
 2.36.7
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

Bugfix release, with a security patch for CVE-2022-32893.
Release notes:

  https://wpewebkit.org/release/wpewebkit-2.36.6.html
  https://wpewebkit.org/release/wpewebkit-2.36.7.html

Accompanying security advisory:

  https://wpewebkit.org/security/WSA-2022-0008.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/wpewebkit.hash | 9 ++++-----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 827df1e89a..6881deb8fc 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,8 +1,7 @@
-
-# From https://wpewebkit.org/releases/wpewebkit-2.36.5.tar.xz.sums
-md5  99b9b0c3c8757edf03ddf550bea448e2  wpewebkit-2.36.5.tar.xz
-sha1  d7deb766d1ff48b7f9d685fcd67ccc23e2962288  wpewebkit-2.36.5.tar.xz
-sha256  f2461d533cd3820ea1855e2c8b0b0624b39add1389dc3ac09c2f27891a7a8caa  wpewebkit-2.36.5.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.36.7.tar.xz.sums
+md5  a9f8d521d8171292aab842d3e8ba227e  wpewebkit-2.36.7.tar.xz
+sha1  e9255b3592bbaac8b20af03cafa31cedfb0b4898  wpewebkit-2.36.7.tar.xz
+sha256  f3747d72ffc562ad0cfb6218fdf6d897c78c4bdbf5618e0fa26906fba52b95c9  wpewebkit-2.36.7.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index a28c8321e1..62a7be11f2 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.36.5
+WPEWEBKIT_VERSION = 2.36.7
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
