Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1474C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 13:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B3B140B7B;
	Wed, 24 Aug 2022 13:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B3B140B7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ca4wX48fPrxh; Wed, 24 Aug 2022 13:18:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E50940B55;
	Wed, 24 Aug 2022 13:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E50940B55
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 22D2D1BF995
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 13:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09898408ED
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 13:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09898408ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Red4pqFF53-2 for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 13:18:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D645408C2
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D645408C2
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 13:18:40 +0000 (UTC)
Received: from 91-153-34-64.elisa-laajakaista.fi ([91.153.34.64] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1oQqHF-00HFO9-1F; Wed, 24 Aug 2022 15:18:37 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 3d857ef0;
 Wed, 24 Aug 2022 13:18:27 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 16:18:26 +0300
Message-Id: <20220824131826.345495-1-aperez@igalia.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yMXwbCDCy9oxc+mYk6kdOmJnH4IBmGqs+AFF+bpMfMY=; b=mFYDV4nUwpZlKah5R2W5ZPb/OJ
 rWzzNwrvkfH6xU2N/YytZCjHahY17wHaemt/yYWjtT9/EtQzyxjLyP6czSC6Fixpf1hsrGsARSXwO
 xS9dnTNyY7Zno/Ctnbt/00jZO0np3OejKec+gJqhPIJOEgUBp4Kf48+cqu4FjAAUlOMhDloO+VlKy
 +osz9GnhF2B0Stwbfk51s4mjy7J8ruNbNnzyZrWoUAjobBURuDpVGYH2FcyW6KSydmkCmB2iVZM24
 NOvT8SoDUyhLCChCkbSVqOq6rCV6SvIxSCVwKlzwd4Qzm6eUlekM0p+oTAPNYdtw2Z78UZR3z0W03
 c2iMbLJA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=mFYDV4nU
Subject: [Buildroot] [PATCH 1/1] package/cog: bump to version 0.14.0
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

This new version includes many improvements. Release notes:

  https://wpewebkit.org/release/cog-0.14.0.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/cog/cog.hash | 8 ++++----
 package/cog/cog.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index 00d3a4e191..3fd480c2a8 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.12.4.tar.xz.sums
-md5  cdb8acdc3acc9b5082e7db9c279155c3  cog-0.12.4.tar.xz
-sha1  600b30efadf55bf94ea5062a0a1b2ea0b74053e5  cog-0.12.4.tar.xz
-sha256  9983c621c8e14fca3792ff566cb6b86d6a1f17446eb4c083af4a5a749112982f  cog-0.12.4.tar.xz
+# From https://wpewebkit.org/releases/cog-0.14.0.tar.xz.sums
+md5  2352aaba1a4ff31b1d1fb559c4941a01  cog-0.14.0.tar.xz
+sha1  2da37ea6c25e45425aa80de4a129484ee226dd96  cog-0.14.0.tar.xz
+sha256  e23936f1ce350ea5ea6fa0709b63d34776b05709388aed9c6cf3fdc41299de9f  cog-0.14.0.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 95b6220629..348c17c336 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.12.4
+COG_VERSION = 0.14.0
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
