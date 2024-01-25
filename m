Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFBEC47258
	for <buildroot@archiver.kernel.org>; Thu, 25 Jan 2024 14:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 712D94179F;
	Thu, 25 Jan 2024 14:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 712D94179F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FBrphC-hA9Ig; Thu, 25 Jan 2024 14:41:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B16B7415DD;
	Thu, 25 Jan 2024 14:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B16B7415DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFCC01BF3C0
 for <buildroot@lists.busybox.net>; Thu, 25 Jan 2024 14:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A60EC60784
 for <buildroot@lists.busybox.net>; Thu, 25 Jan 2024 14:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A60EC60784
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 26pGm2uRHfU8 for <buildroot@lists.busybox.net>;
 Thu, 25 Jan 2024 14:41:29 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCB24600CA
 for <buildroot@buildroot.org>; Thu, 25 Jan 2024 14:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCB24600CA
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rT0uw-00A1X3-Jc; Thu, 25 Jan 2024 15:41:22 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id cd049c2e;
 Thu, 25 Jan 2024 14:41:21 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Thu, 25 Jan 2024 16:41:17 +0200
Message-ID: <20240125144121.1534299-1-aperez@igalia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s05Q1BYUNuL4ApGyKCvaDHsc6f0wmnrv5v/V+d7gHcs=; b=imobvYtoGLXceRIKO9/Gl5CZ1R
 GTkCyggR8wumSsnfWnAfHHFArvUqX/L1AtqzldWRuo1Cpl6e3FcbXvuQn5OZuhKUVbr5zUaDCA25v
 3gVDGS1og+Hmf1gbP98fJdKcjZkPWCVVz7pG7suL6RXPVkfABy+YRya2KU+x9wahNK9F+S+lngNOm
 0HGzi9JBEeGIftOFtRSYWAT6o+M5eHGuq6M/fqIxRChAXQC53P3hSCZMlxhIsMStKkTllsXx2M4Sd
 +HNuBYuopk2d0CE+Xq6ArvrEsYhJeCj3Z3hZTZBGvYlMSs2q/0i6Ork52sm3cZJoBlmmh9wwCBlcM
 Xx4yVv1w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=imobvYto
Subject: [Buildroot] [PATCH] package/libwpe: switch back to version 1.14.2
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

The versioning scheme for libwpe uses the middle version number to
indicate stability: an even number for stable releases, odd for
development preview releases. As such, Buildroot should be using
version 1.14.2, which is the most recent of the stable releases.
While at it, add a note in the .mk file about the versioning scheme.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libwpe/libwpe.hash | 6 +++---
 package/libwpe/libwpe.mk   | 3 ++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
index 226b4f3295..554b1f2b0e 100644
--- a/package/libwpe/libwpe.hash
+++ b/package/libwpe/libwpe.hash
@@ -1,6 +1,6 @@
-# From https://wpewebkit.org/releases/libwpe-1.15.1.tar.xz.sums
-sha1  0082ceb475175bfecd1172f2c0b292824d31561b  libwpe-1.15.1.tar.xz
-sha256  14d36a93a05ab7ada9bec581720b8057336fe681bbbe59bda7d50cb8f3eba3a6  libwpe-1.15.1.tar.xz
+# From https://wpewebkit.org/releases/libwpe-1.14.2.tar.xz.sums
+sha1  70a2b894af2b50d7082260158a89524974a480f3  libwpe-1.14.2.tar.xz
+sha256  8ae38022c50cb340c96fdbee1217f1e46ab57fbc1c8ba98142565abbedbe22ef  libwpe-1.14.2.tar.xz
 
 # Hashes for license files:
 sha256  35bef295cedbbf179eaee14328002587a0e7dc08ebf3f15ea080a6f2815f0d7b  COPYING
diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
index f8c6b0fc76..1fbdd5fcc3 100644
--- a/package/libwpe/libwpe.mk
+++ b/package/libwpe/libwpe.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-LIBWPE_VERSION = 1.15.1
+# The middle number is even for stable releases, odd for development ones.
+LIBWPE_VERSION = 1.14.2
 LIBWPE_SITE = https://wpewebkit.org/releases
 LIBWPE_SOURCE = libwpe-$(LIBWPE_VERSION).tar.xz
 LIBWPE_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
