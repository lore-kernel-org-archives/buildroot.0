Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F55CFC518
	for <buildroot@archiver.kernel.org>; Sun, 23 Nov 2025 17:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F9058223F;
	Sun, 23 Nov 2025 17:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WU0fDCl4Yox2; Sun, 23 Nov 2025 17:14:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86B2182254
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86B2182254;
	Sun, 23 Nov 2025 17:14:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11CB6E4
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 17:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03E4782254
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 17:14:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ghtb4LlXmAnk for <buildroot@buildroot.org>;
 Sun, 23 Nov 2025 17:14:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E76978223F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E76978223F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E76978223F
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 17:14:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bcad.dip0.t-ipconnect.de [84.161.188.173])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2352AA4C7594;
 Sun, 23 Nov 2025 18:14:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vNDez-000000002gW-3IQF;
 Sun, 23 Nov 2025 17:14:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 23 Nov 2025 18:14:00 +0100
Message-ID: <20251123171401.933757-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251123171401.933757-1-bernd@kuhls.net>
References: <20251123171401.933757-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763918042;
 bh=u0j8m8qjGeCa03R9OLXlOjrRW1gn5Yu6drfG+Z91WGc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ju/w49TaF9xganqEztyAY1pwEYv7uxRBHNQ1EMI0c/f6Q2UESvuLvolfaOTL4GgMF
 zee18oQPNWwkDr+9akJXe6EuQ/uLKkW5R+Nwqk0Q8+32MlwbH3HyIvmEzykl8y/LG8
 2sZOscsWtdqHAynZicWXU3rAcs+UqysaIwJh/3WoWeLaBDRw7bBQnF/0KHh87E0r0U
 l4dwuMPWiqX9LK9HtT1jVx9IxhvJMPF9yHnA54v5ZNiLaH7mOo6HsHD/E2ipA8XlTO
 GMwyAXL11IOSjJWyrdOPoyxaswkML/4jYf0Xgeeevf2QfOBOM9n+cTcTDKz4iduV6h
 /aSLKpnQ1u1Sg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=ju/w49Ta
Subject: [Buildroot] [PATCH/next 2/3] package/xfsprogs: bump version to
 6.17.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/tree/doc/CHANGES?h=v6.17.0

Upstream commit
https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=0b3e7284c7fa20dd27f8a584f8db417d1d6fa27b
which is included in version 6.14.0 fixes a build error with icu >= 76.

Fixes:
https://autobuild.buildroot.net/results/a30/a30bf79be2102f3a77e4a78a488fb3b6a5b63bbb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xfsprogs/xfsprogs.hash | 2 +-
 package/xfsprogs/xfsprogs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xfsprogs/xfsprogs.hash b/package/xfsprogs/xfsprogs.hash
index a86693419d..4cded62de1 100644
--- a/package/xfsprogs/xfsprogs.hash
+++ b/package/xfsprogs/xfsprogs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/sha256sums.asc
-sha256  dae3bb432196f7b183b2e6bd5dc44bf33edbd7d0e85bd37d25c235df81b8100a  xfsprogs-6.11.0.tar.xz
+sha256  5b0f56a81f641326266f762ae8a563b29d95cdbcda83bc7938f68ce122f1edd9  xfsprogs-6.17.0.tar.xz
 
 # Hash for license files
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 0234b91d09..05fc053ffc 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFSPROGS_VERSION = 6.11.0
+XFSPROGS_VERSION = 6.17.0
 XFSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/fs/xfs/xfsprogs
 XFSPROGS_SOURCE = xfsprogs-$(XFSPROGS_VERSION).tar.xz
 XFSPROGS_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1 (libhandle, few headers)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
