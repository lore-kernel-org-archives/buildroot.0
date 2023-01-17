Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A047AC63797
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 13:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E987460BCC;
	Tue, 17 Jan 2023 13:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E987460BCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4do4pEJMExt5; Tue, 17 Jan 2023 13:59:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 967B460B65;
	Tue, 17 Jan 2023 13:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 967B460B65
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9476C1BF20D
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 13:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F81060B65
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 13:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F81060B65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PmSDDSet1Zc2 for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 13:59:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97F6B606FF
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97F6B606FF
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 13:59:48 +0000 (UTC)
Received: from 91-153-34-153.elisa-laajakaista.fi ([91.153.34.153] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pHmV6-00Af1r-Fm; Tue, 17 Jan 2023 14:59:44 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 6bb2967c;
 Tue, 17 Jan 2023 13:59:43 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Tue, 17 Jan 2023 15:59:43 +0200
Message-Id: <20230117135943.2893779-1-aperez@igalia.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hB+Gp1iJJ7FBmhC59VCWUT9muWQjs56wY5vOmuCxJic=; b=bSqs8vYPqAyMCODtjao/Vk9dPE
 Qj7/VgBYCtxkYmi1QeX1yz6lTfMHtV4i0vKnxdIgO5EU2thGdaqPsV0n4Uhl0Y8rrTXPd49u9e/BV
 JiFMy9bcN8cxxBiH9JcwLrMjkfkd4Wql/LcYNe53lXofj+lDqWSiqmmTLSvv5IGWxG1XUA7H6v/Zp
 FKJGquHpqxHqsiYmDqE90z2W3JqJ6n15Y3LseABhY1oTOuGkWcUOsVKsC1Xp1wsLtGu7LqRswhIPq
 H5g+Pn0ICTJk+jLbDEa0B3JXeCAOtk1Pj4Kn5sBIdVscu87Rf8FlN1amgdqiynzj0hc2j5vC3l6tl
 I8AaKeKQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=bSqs8vYP
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to version
 2.38.3
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

Bugfix release, with security fixes for CVE-2022-42852, CVE-2022-42856,
CVE-2022-42867, CVE-2022-46691, CVE-2022-46692, CVE-2022-46698,
CVE-2022-46699, CVE-2022-46700, CVE-2022-42823, and CVE-2022-42799.

Release notes:

  https://wpewebkit.org/release/wpewebkit-2.38.3.html
  https://wpewebkit.org/release/wpewebkit-2.38.2.html
  https://wpewebkit.org/release/wpewebkit-2.38.1.html

Accompanying security advisories:

  https://wpewebkit.org/security/WSA-2022-0011.html
  https://wpewebkit.org/security/WSA-2022-0010.html

Additionally, the update brings in important bug fixes for the
Bubblewrap sandbox support, scrolling in certain web sites, multimedia
playback, and build fixes.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 5dd64b34b7..ccd928b3df 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.38.0.tar.xz.sums
-md5  e0e6b98c86351c39e41da475afc50780  wpewebkit-2.38.0.tar.xz
-sha1  66e6dd1c285a21ce50370fb4d60332838d801663  wpewebkit-2.38.0.tar.xz
-sha256  e653e12eca63e6371c06d4cd9efcd5492db67f7d9ef324fd5d8668b1151e72b2  wpewebkit-2.38.0.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.38.3.tar.xz.sums
+md5  60f79ff8dc68280f756963af23b67d6d  wpewebkit-2.38.3.tar.xz
+sha1  de15119a0dc29776d3a11fca1df4238b471f960f  wpewebkit-2.38.3.tar.xz
+sha256  1dd9075eec7253a1b0d038a73f92ddbb9174394e6a7527ec07b4464fa6290498  wpewebkit-2.38.3.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 001c701ee9..b2bbc0301b 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.38.0
+WPEWEBKIT_VERSION = 2.38.3
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
