Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E654C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 22:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9B3940994;
	Tue,  9 Jul 2024 22:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QA4Ljs1LOWHe; Tue,  9 Jul 2024 22:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A57554137B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A57554137B;
	Tue,  9 Jul 2024 22:01:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 43F421BF41D
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 22:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D3434137B
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 22:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4i3OUBz-_qx7 for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 22:01:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A42740994
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A42740994
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A42740994
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 22:01:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b57c.dip0.t-ipconnect.de [84.161.181.124])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 35A02A4C0BF7
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 00:01:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35344)
 by fli4l.lan.fli4l with esmtp (Exim 4.98-RC3)
 (envelope-from <bernd@kuhls.net>) id 1sRItR-000000004Pj-0fI0
 for buildroot@buildroot.org; Tue, 09 Jul 2024 22:01:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 00:01:01 +0200
Message-Id: <20240709220101.3597236-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1720562462;
 bh=twcuCG+g1oQtmc3AOcY4W0ykm3BUeYjoeVu4q4QoyzA=;
 h=From:To:Subject:Date:From;
 b=eVVaOA5+Kl77lwKD4DqyuFYgYAO6QxWxD0BIHCZ3Yj42KJf9zpYXyrr7ZcKsfU9OZ
 xrLVXqj4h221kOIFQ/mSKVImzQmPTtptHGMxjdR2GWwUXxoWbFmXcMzEfdW02QVFCz
 9J9UVabLr0ZUlkdlGHlr9lpJ4g8Bnqm8CLnmuQYaGzUCsZfCi1Ag1WU+9xUSlh7kRq
 NFHUJOJl7JxsYGmPhx1Ah79vqxETurO2/6qVBOEgyjONj/1FEM/TySHmUkwkD2aggp
 NvEx60d6aTSYKDVmQv5GySlEqiSZDt2qtalUfJnCMieLDgNKIbIN9QSd4UOwsX3CCy
 2Fcg5a4r7a7OQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=eVVaOA5+
Subject: [Buildroot] [PATCH 1/1] package/stellarium: bump version to 24.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
http://stellarium.org/release/2024/03/26/stellarium-24.1.html
http://stellarium.org/release/2024/06/23/stellarium-24.2.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/stellarium/stellarium.hash | 2 +-
 package/stellarium/stellarium.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index a2f511a283..6f831f2919 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,4 +1,4 @@
 # From https://github.com/Stellarium/stellarium/releases
-sha256  179420e9e9f11278b78dc54e14458452c92055cc8923538748c8a0f961714fc2  stellarium-23.3.tar.xz
+sha256  f9e8e114e34265194ffff0c2a2806a6fdc998449192749c4ef60b0a5302101af  stellarium-24.2.tar.xz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 94ad4e1352..abbfe72aad 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 23.3
+STELLARIUM_VERSION = 24.2
 STELLARIUM_SOURCE = stellarium-$(STELLARIUM_VERSION).tar.xz
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
