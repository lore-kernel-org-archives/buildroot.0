Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60757CAC5B8
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 17:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0185561BA9;
	Fri, 26 Sep 2025 17:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dxpx5fdU4v5G; Fri, 26 Sep 2025 17:44:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E6A861C93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E6A861C93;
	Fri, 26 Sep 2025 17:44:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C9DAF198
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 17:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5B8B41F63
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 17:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IIbpEuK5Au8j for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 17:44:25 +0000 (UTC)
X-Greylist: delayed 532 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 26 Sep 2025 17:44:25 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 66AFE40147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66AFE40147
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=208.88.110.44;
 helo=mail.savoirfairelinux.com;
 envelope-from=serosh.deljam@savoirfairelinux.com; receiver=<UNKNOWN> 
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66AFE40147
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 17:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id BC82C3D82FDC
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 13:35:32 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id tbOZAQjyp97t; Fri, 26 Sep 2025 13:35:32 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id 0FF6B3D85382;
 Fri, 26 Sep 2025 13:35:32 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 0FF6B3D85382
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 5LO2dU8w9as4; Fri, 26 Sep 2025 13:35:31 -0400 (EDT)
Received: from localhost.localdomain (unknown [192.168.51.254])
 by mail.savoirfairelinux.com (Postfix) with ESMTPSA id D30193D82FDC;
 Fri, 26 Sep 2025 13:35:31 -0400 (EDT)
From: Serosh Deljam <serosh.deljam@savoirfairelinux.com>
To: buildroot@buildroot.org
Cc: Serosh Deljam <serosh.deljam@savoirfairelinux.com>
Date: Fri, 26 Sep 2025 13:35:29 -0400
Message-ID: <20250926173529.348090-1-serosh.deljam@savoirfairelinux.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
 t=1758908132; bh=XJO9N+Kwv7XogW6PxsRsnCx5vFAmxBOEBO9i38iQUzE=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=f7D3SH0+7TpSa9ZuC+CUYcUaXmB1E+tEYh5NW8PBX/V29KocyWNfNxwcDLqzf/OFz
 drfG1Stq9UoprTAsgOCi8JpneFi/04RYM5fRgUInt1yztxqc7ZEYMIaG8wXYQB5ZoZ
 oRy7vUoXEiArbUQzwB5Yi0X5h7QPQeyKEw5SWnaqjhTHiebCHKO0yxcvdDJzikB+gj
 K1KO3w5ZOnITTDfeW301ILw6Pu2TkSSxyd3I1YoRJkku26MRQ/eY/u5dYRAWjCvFJQ
 NlQEhoJA/DjUgMw3QB/8U5J4GBXEvJSLxjGfqZfKPx0DLnlJy7uYqPBt07okOQcz9S
 apnqPDCiFudVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=savoirfairelinux.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=f7D3SH0+
Subject: [Buildroot] [PATCH 1/1] package/cukinia: bump version to 0.9.0
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

Signed-off-by: Serosh Deljam <serosh.deljam@savoirfairelinux.com>
---
 package/cukinia/cukinia.hash | 2 +-
 package/cukinia/cukinia.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cukinia/cukinia.hash b/package/cukinia/cukinia.hash
index cc0393aff9..6957c0e1b5 100644
--- a/package/cukinia/cukinia.hash
+++ b/package/cukinia/cukinia.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  8f608571354d87f7ec2949bd335c616881c05f66fc60d7a2fc7488369c9d307d  cukinia-0.8.0.tar.gz
+sha256  fec5f1d06ed4072b32fff8c7b1e9784aa1d2923d501c4066d47ac792c28e11b0  cukinia-0.9.0.tar.gz
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/cukinia/cukinia.mk b/package/cukinia/cukinia.mk
index a4e3658ede..f5eccdeb63 100644
--- a/package/cukinia/cukinia.mk
+++ b/package/cukinia/cukinia.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUKINIA_VERSION = 0.8.0
+CUKINIA_VERSION = 0.9.0
 CUKINIA_SITE = $(call github,savoirfairelinux,cukinia,v$(CUKINIA_VERSION))
 CUKINIA_LICENSE = Apache-2.0
 CUKINIA_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
