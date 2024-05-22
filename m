Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64553C25B77
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 09:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1351960585;
	Wed, 22 May 2024 09:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3k6iIDsi2mYv; Wed, 22 May 2024 09:55:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 024BF60A9E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 024BF60A9E;
	Wed, 22 May 2024 09:55:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E4D31C5999
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 09:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AF3081A92
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 09:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qxsiI321H3UI for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 09:55:49 +0000 (UTC)
X-Greylist: delayed 2372 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 22 May 2024 09:55:46 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D1E37817C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1E37817C0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1E37817C0
 for <buildroot@buildroot.org>; Wed, 22 May 2024 09:55:45 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s9i4x-00B1rx-0C; Wed, 22 May 2024 11:16:11 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 7e871fd7;
 Wed, 22 May 2024 09:16:09 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 12:16:04 +0300
Message-ID: <20240522091608.3659847-2-aperez@igalia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240522091608.3659847-1-aperez@igalia.com>
References: <20240522091608.3659847-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZTMY0qeQ18KOkqA5OrI8wzq/r2upRu2NtqAsji2BxrQ=; b=befsJYCmqm4SpLBXPskxV5qxpG
 Ff7x6nTaKPY/49g4CMztaV70E4cUMQ8EmAhM/1Ipkvix7JP1m9b6aAjqgZsYD8pcURZeitit+Iu4N
 MyAY3EcbZaiIYfM9juEhIHG/JbGgNlHhDbFJOC+UzAWPh6i9prhUX03T6rMkqTp7FPm3bq8oR/zP0
 H+/ifJX+Tpdr2oT++ezEHyso3WDBACrP3VLZTKBQZ9S2pRn/ToVfDN0jJhOOtj+/30tuRzbW9zrmT
 11YECgg+TKjGmRLP6skjmTaJA4SeQSRmWHXpvZtFwaYgFD2Lw+IvyIFdxg1jKrfWzEXDjO5h/KlOJ
 WOmKjoIw==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=befsJYCm
Subject: [Buildroot] [PATCH 1/4] package/libwpe: bump to version 1.16.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This new stable series brings in support for pointer lock, customization
of subprocess launching, and a build fix that allows using EGL
implementations that do not ship a pkg-config module. Version 1.16.x is
recommended for WPE WebKit 2.44.x, which will be updated in a follow-up
patch.

Release notes:

  https://wpewebkit.org/release/libwpe-1.16.0.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libwpe/libwpe.hash | 7 ++++---
 package/libwpe/libwpe.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
index 554b1f2b0e..2a2ee3c2e9 100644
--- a/package/libwpe/libwpe.hash
+++ b/package/libwpe/libwpe.hash
@@ -1,6 +1,7 @@
-# From https://wpewebkit.org/releases/libwpe-1.14.2.tar.xz.sums
-sha1  70a2b894af2b50d7082260158a89524974a480f3  libwpe-1.14.2.tar.xz
-sha256  8ae38022c50cb340c96fdbee1217f1e46ab57fbc1c8ba98142565abbedbe22ef  libwpe-1.14.2.tar.xz
+# From https://wpewebkit.org/releases/libwpe-1.16.0.tar.xz.sums
+md5  9779115aaa7e67abe642777394e7bfa2  libwpe-1.16.0.tar.xz
+sha1  ea574e09b5d47461a5579a24006488419474d136  libwpe-1.16.0.tar.xz
+sha256  c7f3a3c6b3d006790d486dc7cceda2b6d2e329de07f33bc47dfc53f00f334b2a  libwpe-1.16.0.tar.xz
 
 # Hashes for license files:
 sha256  35bef295cedbbf179eaee14328002587a0e7dc08ebf3f15ea080a6f2815f0d7b  COPYING
diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
index 1fbdd5fcc3..de49cedfb4 100644
--- a/package/libwpe/libwpe.mk
+++ b/package/libwpe/libwpe.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # The middle number is even for stable releases, odd for development ones.
-LIBWPE_VERSION = 1.14.2
+LIBWPE_VERSION = 1.16.0
 LIBWPE_SITE = https://wpewebkit.org/releases
 LIBWPE_SOURCE = libwpe-$(LIBWPE_VERSION).tar.xz
 LIBWPE_INSTALL_STAGING = YES
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
