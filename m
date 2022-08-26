Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1592EECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 11:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 921F2409FF;
	Fri, 26 Aug 2022 11:16:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 921F2409FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s222NgYOK1jj; Fri, 26 Aug 2022 11:16:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A603140DA0;
	Fri, 26 Aug 2022 11:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A603140DA0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF6C11BF289
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 11:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A973404C4
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 11:16:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A973404C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cQQ8QFlgb-ij for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 11:16:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BC5140192
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BC5140192
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 11:16:40 +0000 (UTC)
Received: from 91-153-34-64.elisa-laajakaista.fi ([91.153.34.64] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1oRXKI-000z6c-Tt; Fri, 26 Aug 2022 13:16:38 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id f9cda05d;
 Fri, 26 Aug 2022 11:16:29 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:16:28 +0300
Message-Id: <20220826111628.501636-1-aperez@igalia.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9TQD6LK9Jq5lnT8HxnBu2BrcWLITHPH2VyMjKWgv5+g=; b=O+YAPum+v21/kdFy1q71l1+2PR
 IY3bgk3v0ewD5Q9SP9bqjnnZSqnFg1RYnv0ykeilSqhbZoPorSoKIAnX7JT3oxWWnsC83fe+d3PC6
 ixt2KcV5ojyg6BR7h7lFo2jKzJsGkhmJZP8R5ZaRWSWScU0KW7thRuUeZ0bF+56VzrZ3jKpiCuruQ
 +pfGy6FGpn1OR9KpX6CZ2uKV0Ez6dhYCxv6lmRhKfeePGYKfVC9fw1xkUE3pyX52bbypmv1B76pDj
 jbbdxWYxwUknqayuO7WFt4HEN8pKSR1f8bSNr5Q8oAY8zP6UZPd7Xc7OHmZf5GlJTmKkMuO+sAwsD
 fyID8ucg==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=O+YAPum+
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: security bump to version
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

 https://webkitgtk.org/2022/08/07/webkitgtk2.36.6-released.html
 https://webkitgtk.org/2022/08/24/webkitgtk2.36.7-released.html

Accompanying security advisory:

  https://webkitgtk.org/security/WSA-2022-0008.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index ae86c97c0a..7c6d7d65b5 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.36.5.tar.xz.sums
-md5  a876da9d8906468f4e1e3d08729cdeec  webkitgtk-2.36.5.tar.xz
-sha1  49ff8873500a2ce82bad8879095277bb4dfd21de  webkitgtk-2.36.5.tar.xz
-sha256  d5532fa884c943dc48f1911473dd663aba407a3b35caa7b04bac1419b41e5908  webkitgtk-2.36.5.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.36.7.tar.xz.sums
+md5  466351cf35e4f742590919380b5dee93  webkitgtk-2.36.7.tar.xz
+sha1  36078148b6e0ef002f0279b25b1caf173f851ac8  webkitgtk-2.36.7.tar.xz
+sha256  0c260cf2b32f0481d017670dfed1b61e554967cd067195606c9f9eb5fe731743  webkitgtk-2.36.7.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index b098bccd2f..014d92bb41 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.36.5
+WEBKITGTK_VERSION = 2.36.7
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
