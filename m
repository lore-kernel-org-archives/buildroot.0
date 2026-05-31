Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03EFCD6E5D
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 13:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE9B760F36;
	Sun, 31 May 2026 13:43:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kq9qo9LLqtH9; Sun, 31 May 2026 13:43:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF0F760F3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780235028;
	bh=NAKjsSZjapkUOoU22jQ0wMWOoQeCaoJHa8sQVM45PIM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fXIHXPYtHaIr0d8mzT8R27lryE0jAXE0AYUVLi16v9uIhgmupzIhftYlMjoIHI5IK
	 lExIJLZemNLBXrN+DZQlbq/5SZf3cmUdjIHbIRRPi0fT6qC+vycC4YF3GEY9iCraY7
	 xlNxlnfvGe3ijon2JxvRSPagEoprgDNFwXImv+mGMk0mFHl6YUaoeYpOu0nGAtBFoW
	 z0u/W/mTiNF580yJf5a6pO31yBQ08iihdpen0tCRSFn07Snl0HkgOTxlKoVeUujqET
	 uwZ/lTkArn98YfojezWAzyGYmq087VSbhKpNjkis4tcFQYdMlpF9D1dHrm/NDnzx1f
	 5qNQ+bw1edD/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF0F760F3F;
	Sun, 31 May 2026 13:43:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ECC1C2AA
 for <buildroot@buildroot.org>; Sun, 31 May 2026 13:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE49340183
 for <buildroot@buildroot.org>; Sun, 31 May 2026 13:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wtGewc7nq2qR for <buildroot@buildroot.org>;
 Sun, 31 May 2026 13:43:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 74678400C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74678400C4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74678400C4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 13:43:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EF8EBA4C34EE
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:43:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37094)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTgS7-000000007yl-051y
 for buildroot@buildroot.org; Sun, 31 May 2026 13:43:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 15:43:42 +0200
Message-ID: <20260531134342.2889504-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780235023;
 bh=yFMAbINAj+YygQ84MZwqG03Dpqcv1Sb2GQHu/ZnRK90=;
 h=From:To:Subject:Date:From;
 b=KuiZMFz5Btgwf2g5W4Zs/Ed5RXY72tSZJoWjEme+Ki+U8kwUyQXQYK+4D0CiNRtmN
 9AmENfB2+a6EGoyyNWoiJifAxegwM3yw0uLo1QgMYMaIZO3mg9jQ9a2ycPvkgvt+Hw
 xhCEHPSE7KMdbt9Gq/D4SbSD1NvY4tL0QkCeHkB+BbydiO2Np1ygGoHSZyMnc8T6uV
 EQunpNsrPJhFNO8zSRXjFtFVcMqeAi5Cn6YjFCBgj+RpD3OTy5hJROYwqg8YWM2sFy
 IHZLDmF0NdErBn7N/hO0A4zDU0yCw0BM1wZud4D/r/XxQjKDJa1vdU34rIh9fgyiW9
 HdCTjZ2+1iRTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=KuiZMFz5
Subject: [Buildroot] [PATCH 1/1] package/sshfs: security bump version to
 3.7.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/libfuse/sshfs/blob/sshfs-3.7.6/ChangeLog.rst

Fixes CVE-2026-47187 & CVE-2026-48711.

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/07cc0d4bd91ba47ee9e28949fc01a52a13d195ea

with the exception of an unrelated build error of the openssh package
with the bootlin-powerpc64le-power8-glibc defconfig.

 package/sshfs/sshfs.hash | 5 +++--
 package/sshfs/sshfs.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/sshfs/sshfs.hash b/package/sshfs/sshfs.hash
index 9372e471c2..57698aeace 100644
--- a/package/sshfs/sshfs.hash
+++ b/package/sshfs/sshfs.hash
@@ -1,3 +1,4 @@
-# Locally calculated after checking pgp signature
-sha256  5218ce7bdd2ce0a34137a0d7798e0f6d09f0e6d21b1e98ee730a18b0699c2e99  sshfs-3.7.3.tar.xz
+# From https://github.com/libfuse/sshfs/releases/tag/sshfs-3.7.6
+sha256  6a1bcb31450a077e9cb1b7ff158c71de34db697c3c0da6cb362502131e495893  sshfs-3.7.6.tar.xz
+# Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index 61f11af55f..8557b98353 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSHFS_VERSION = 3.7.3
+SSHFS_VERSION = 3.7.6
 SSHFS_SOURCE = sshfs-$(SSHFS_VERSION).tar.xz
 SSHFS_SITE = https://github.com/libfuse/sshfs/releases/download/sshfs-$(SSHFS_VERSION)
 SSHFS_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
