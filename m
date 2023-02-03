Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819F6C05027
	for <buildroot@archiver.kernel.org>; Fri,  3 Feb 2023 23:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C8D261327;
	Fri,  3 Feb 2023 23:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C8D261327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nyNJDQVNwvse; Fri,  3 Feb 2023 23:05:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53AFF6132D;
	Fri,  3 Feb 2023 23:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53AFF6132D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A24C31BF280
 for <buildroot@lists.busybox.net>; Fri,  3 Feb 2023 23:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76BDF82236
 for <buildroot@lists.busybox.net>; Fri,  3 Feb 2023 23:05:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76BDF82236
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pEc-d1fGy9k0 for <buildroot@lists.busybox.net>;
 Fri,  3 Feb 2023 23:05:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4D7F821EF
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4D7F821EF
 for <buildroot@buildroot.org>; Fri,  3 Feb 2023 23:05:00 +0000 (UTC)
Received: from 91-153-34-153.elisa-laajakaista.fi ([91.153.34.153] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pO572-008ciF-NI; Sat, 04 Feb 2023 00:04:56 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 3ca0d38c;
 Fri, 3 Feb 2023 23:04:55 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Sat,  4 Feb 2023 01:04:55 +0200
Message-Id: <20230203230455.1566166-1-aperez@igalia.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nhpac3ZVgRnXsbMWrdzmCvea1JUpkXVeFGC13vxsIWI=; b=rhthJlOikeeWnYNhg84iNQzNJ7
 b3s6OV+g5bWA3g/dd5NSh0pDFH1ohHrDyP6UTU4g0rRFQ7pIR3gWL1ftZ5oPsvTNjEQN8j2bIEoHs
 k7F5e7d1RlZbEpxcA0i/uIJfig3I0Uck1ZVX4FYiZFXJkjUFXSFehZayeHECAPUTOTfHORrukr/SM
 9QhwFfHHfE+kO9inLN4E5qLLVPaBNEaZOQAiOdT2N9j5UzyZnXWHuYFMhAZYbNSOLms1Gh6NHRaOj
 mIg+M6BcxNEoxGk7bCwdLd2AOVsouXVffkUrgkJ3irj4Bt+UotTZHSsgprMnvPzaJsNf/fJHUblE9
 l2kmnGTg==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=rhthJlOi
Subject: [Buildroot] [PATCH] package/wpewebkit: security bump to version
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

  https://wpewebkit.org/release/wpewebkit-2.38.4.html

Accompanying security advisory:

  https://wpewebkit.org/security/WSA-2023-0001.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index ccd928b3df..dcd082e045 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.38.3.tar.xz.sums
-md5  60f79ff8dc68280f756963af23b67d6d  wpewebkit-2.38.3.tar.xz
-sha1  de15119a0dc29776d3a11fca1df4238b471f960f  wpewebkit-2.38.3.tar.xz
-sha256  1dd9075eec7253a1b0d038a73f92ddbb9174394e6a7527ec07b4464fa6290498  wpewebkit-2.38.3.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.38.4.tar.xz.sums
+md5  1c947ef5b73049fc6c102c92013009bf  wpewebkit-2.38.4.tar.xz
+sha1  7fe9a7d98401256b0c9872f1c2b702e56840cbd3  wpewebkit-2.38.4.tar.xz
+sha256  8c1bc113ef151fb0be2640824d323bc755dc97295ab7a1bc05e7ec589937a07b  wpewebkit-2.38.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 4c50ed9955..34ee405de1 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.38.3
+WPEWEBKIT_VERSION = 2.38.4
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
