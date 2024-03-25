Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD42C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 13:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99EE740B91;
	Mon, 25 Mar 2024 13:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 02hc5hJEdE7m; Mon, 25 Mar 2024 13:17:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D28D340B87
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D28D340B87;
	Mon, 25 Mar 2024 13:17:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D17191BF358
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 13:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9D344059B
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 13:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ttkdRgAHvR7G for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 13:17:29 +0000 (UTC)
X-Greylist: delayed 2172 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 25 Mar 2024 13:17:25 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 272DA403D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 272DA403D0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 272DA403D0
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 13:17:25 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rojdU-00F3t9-41; Mon, 25 Mar 2024 13:41:08 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 8738301c;
 Mon, 25 Mar 2024 12:41:06 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 14:41:04 +0200
Message-ID: <20240325124106.2347400-1-aperez@igalia.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cEKnJ27WGdNf86oE3OrTW7j27mx1GYJ8yE65xhIe8+o=; b=T3uXGEeaB6zsocH9P1+XkHDOpF
 NZKSSQk0FS+HtlNhPlosrXvgLt6yQmznmOvLr/spel1AwwsCSDh2Tq6Uba8ZhnSom1WCAa+IPDYbO
 OEtTml5O8uvwHu0y5Db6+7tWswAdBCjb5ufvqzqxiuLGzmyOm+xOeHMH1xnd2IfclDhMWrWm953kY
 zJPjSV/2g/OXY2XsnEaj/p38nG9iSNylz6fT7/jXq86Cv44jtaYiGsszlLQ+ALot4CDw2MPYpCqAM
 AA1/nkc4fG/UPdAhY6jxCpW4U3PEhFzzv1UrNhA6hbnpBac0XXH3GVvW4OEQ9RrsTwVvfgm/0pD9W
 GDbaFrbA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=T3uXGEea
Subject: [Buildroot] [PATCH] package/cog: bump to version 0.18.3
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

This is a small bugfix release, with fixes for device scaling handling
(i.e. HiDPI displays), and with support to toggle WebKit runtime
features. Release notes:

  https://wpewebkit.org/release/cog-0.18.3.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/cog/cog.hash | 8 ++++----
 package/cog/cog.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index 387666969a..c0e99e14aa 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.18.2.tar.xz.sums
-md5  7fbfc2e19304132be0d73f5e5512151c  cog-0.18.2.tar.xz
-sha1  045294f7fa878db86e4b8a617ee4ac056a71cb75  cog-0.18.2.tar.xz
-sha256  3c4237cff6323b8c3eaf52c6f3f6415b898a22c0127c6c396c1eaa6eef46c279  cog-0.18.2.tar.xz
+# From https://wpewebkit.org/releases/cog-0.18.3.tar.xz.sums
+md5  e457de5b5ac8994ae9971c0a5a22b8a2  cog-0.18.3.tar.xz
+sha1  21df2a84c651b45e78d08e45e71631250a0078c3  cog-0.18.3.tar.xz
+sha256  cd4ec937175a290ccd7c8ec398e4569aec04084cd94b11b2d83518778ba9d055  cog-0.18.3.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 8fc50de56f..ad6e340cad 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.18.2
+COG_VERSION = 0.18.3
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
