Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451ABE7BD88
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 10:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D970A40907;
	Mon, 16 Feb 2026 10:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fWiTDLjDV_gJ; Mon, 16 Feb 2026 10:33:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E50D640931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771238013;
	bh=FCjuW/gGtl0BcAGO04LzcId21d20TppVL358D3kjsd4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o/pYEEzgKQMxwovJWnv8BBEVW8MM8MJ2VEB1rpAa+kG/fmeQsdoEOET0LV1RPtBic
	 mkA8S4zluSRSwoy0MBEgCN6adiPeu/Ff5Gu7XvcyR2E0qM21Ofx6ccAC1Z8XEgFtc3
	 dEqtMbGgf0UdTKfYTU36iX125z+oY6cDY8XqtPG1E63qD95KFSFdxbG2EoD7BR5KND
	 01QKO/iDXgWZkCmra24pfxq6Jl0rz3IXgylScNn+qCS3E3ieRkw4g8b7mtq7iQtb2R
	 RMsL95I8Oqr9j+g2/9/brZb0Fq1HJc5QGhpJsDCFGoiE6jhTcc6vmbHRReOxuuw270
	 XsIYOTSipBVog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E50D640931;
	Mon, 16 Feb 2026 10:33:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9707D35B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 10:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 795B340931
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 10:33:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zFgKTOLEmKFk for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 10:33:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D1FAB40907
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1FAB40907
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1FAB40907
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 10:33:29 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id CE2252C836C1
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 11:33:26 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 16 Feb 2026 11:33:39 +0100
Message-ID: <20260216103341.801112-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1771238006; bh=Xha8juASUzhuFvN7WQA4YhhA3zJAtlaTcb4BkmJAcJE=;
 h=From:To:Subject:Date;
 b=dbTZv79fG4wEBwCsnWXc5kKuOtkeiumfcVXJn81Nf64mNbHKNJ4qanvYapRrrfC3P
 lmhHRCZIYZ45fiOw0FnaSFCvtjP4oJPtxQqJX9Y4XdOEwukhiXf0PcJnYYcL+IwdMV
 F1gsOS69UwTBk/oYiVWRrQzqcbXgf5PfVLlsrbh2/Z6viBPovv85V9eOpUrmvVamWt
 uxNLHAMJYgf/2WzQkxMZvBJV9JeIOgii2Wk8xqK8dR4s5bM4ChD1n6Umu3F7GQEsSs
 oz6KxykSBB4F2exLZlTRKBJzF2NrZcl25crIpfVVg6JNTV2xT/r5YaGiR4noDyKfBA
 /zXlzkuxFetrg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=dbTZv79f
Subject: [Buildroot] [PATCH 1/2] package/network-manager: bump to 1.52.2
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Overview of changes since NetworkManager-1.52.1[1]

* Support reapplying the "sriov.vfs" property as long as
  "sriov.total-vfs" is not changed.
* For private connections (the ones that specify a user in the
  "connection.permissions" property), verify that the user can access
  the 802.1X certificates and keys set in the connection.
* Introduce a libnm function that can be used by VPN plugins to check
  user permissions on certificate and keys.

[1] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.52.2/NEWS

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/network-manager/network-manager.hash | 2 +-
 package/network-manager/network-manager.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 780d1205cb..4d9a6b8051 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,5 @@
 # From https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/1.52.1/downloads/NetworkManager-1.52.1.tar.xz.sha256sum
-sha256  8b122c73493a72f2bae527c125cebd87711671b90352dbe2b1788aba9575ac6f  NetworkManager-1.52.1.tar.xz
+sha256  3658640e788bbcb6a000c29a95f0dccc4dfebba41c6e5e9a90ad1e6daacb512c  NetworkManager-1.52.2.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 76f4b09fbe..66549fcf0f 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NETWORK_MANAGER_VERSION_MAJOR = 1.52
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).1
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/$(NETWORK_MANAGER_VERSION)/downloads
 NETWORK_MANAGER_INSTALL_STAGING = YES
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
