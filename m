Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5910D6B6B4
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 23:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A2F780D62;
	Wed, 30 Oct 2024 23:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZAWRqFaiMvuZ; Wed, 30 Oct 2024 23:54:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B10681123
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B10681123;
	Wed, 30 Oct 2024 23:54:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 349085E4F
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 23:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 227C9400C7
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 23:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xnzHAZaD0YPv for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 23:54:37 +0000 (UTC)
X-Greylist: delayed 425 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 30 Oct 2024 23:54:36 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B20B4015A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B20B4015A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.42;
 helo=esa4.hgst.iphmx.com; envelope-from=prvs=026018d96=wilfred.mallawa@wdc.com;
 receiver=<UNKNOWN> 
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B20B4015A
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 23:54:36 +0000 (UTC)
X-CSE-ConnectionGUID: EBXqG8NkT0mWj1Wt05w/iQ==
X-CSE-MsgGUID: MFHBcm0hS26tqS6/jsruFQ==
X-IronPort-AV: E=Sophos;i="6.11,246,1725292800"; d="scan'208";a="29673883"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 31 Oct 2024 07:47:30 +0800
IronPort-SDR: 6722b863_MSnRbsdvm7vU/F2FKVJxbYJtbpYrTaD7YyhEmG78t7ciyfW
 X1SxHjaGNm/piNv9ffgmXlySI8ow6BUR5sKUSDQ==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Oct 2024 15:51:15 -0700
WDCIronportException: Internal
Received: from unknown (HELO fedora.wdc.com) ([10.225.165.72])
 by uls-op-cesaip01.wdc.com with ESMTP; 30 Oct 2024 16:47:30 -0700
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Date: Thu, 31 Oct 2024 09:46:37 +1000
Message-ID: <20241030234636.1990180-2-wilfred.mallawa@wdc.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1730332477; x=1761868477;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u2HiX+1LwLpYXtTYahrQlbaCa5+zgV5QxbyjZTH5Ies=;
 b=TqHWYXnpYRSTzD+rUfr+7v+unWLtwYLudozVIVP+sXZ3lXP4OoAPh/lX
 fFABfjO8goz/YdNGz/CSl+bqpRLvAI2J1iKOycjueXTCcA+VdMmt0RrUQ
 LahqepSuYucyBjpOsN36Zb5XoFwJ+Nqud/7Wvg1zJdbsgVOe2DwbAQgfy
 h/42ItHxZaKii7zXacgkbJOLwBunM8wkYMmWz//TXcVHuX/nOri0c0ShT
 YNFm5eZ5517WHjV6WkdEP6lDi4/5gaSsdfEzPa7w/ajbvGZWTWmipdxBr
 A2VrbtybZey+LfPVKj6D5GIImVXkE+91/GYO6XSeSazEj7xY/FoSU31oy
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=TqHWYXnp
Subject: [Buildroot] [PATCH 1/1] package/libspdm: bump version to 3.5.0
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
From: Wilfred Mallawa via buildroot <buildroot@buildroot.org>
Reply-To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bumps to the latest `libspdm 3.5.0` release, this release introduces the
optional SPDM 1.3 `GET/SET_KEY_PAIR` support. Which requires an integrator
to support additional functionality implemented at link time. Leave this
disabled by default as it is optional and so that it does not break build
compatibility with integrators.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 package/libspdm/libspdm.hash | 2 +-
 package/libspdm/libspdm.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libspdm/libspdm.hash b/package/libspdm/libspdm.hash
index 93a8d933cc..e29c5994a3 100644
--- a/package/libspdm/libspdm.hash
+++ b/package/libspdm/libspdm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  44f967aeb0c481676affe59069615252854bc0c072368ce4b26b6809a54daff5  libspdm-3.4.0.tar.gz
+sha256  7b8a556be64120bab9c321964e67b90f5e6adb59abf3992c5c7937f37a4e7c8f  libspdm-3.5.0.tar.gz
 sha256  c6ffa7e6889e63893078cb21b89594070183f7e2cf5b4ea01a4fb23eac59ed32  LICENSE.md
diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
index e86a79ed67..081bffb9c1 100644
--- a/package/libspdm/libspdm.mk
+++ b/package/libspdm/libspdm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSPDM_VERSION = 3.4.0
+LIBSPDM_VERSION = 3.5.0
 LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
 LIBSPDM_LICENSE = BSD-3-Clause
 LIBSPDM_LICENSE_FILES = LICENSE.md
@@ -20,7 +20,9 @@ LIBSPDM_TARGET_CPU_FAMILY = $(call qstrip,$(BR2_PACKAGE_LIBSPDM_CPU_FAMILY))
 LIBSPDM_CFLAGS = \
 	$(TARGET_CFLAGS) \
 	-DLIBSPDM_ENABLE_CAPABILITY_EVENT_CAP=0 \
-	-DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP=0
+	-DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP= \
+	-DLIBSPDM_ENABLE_CAPABILITY_GET_KEY_PAIR_INFO_CAP=0 \
+	-DLIBSPDM_ENABLE_CAPABILITY_SET_KEY_PAIR_INFO_CAP=0
 
 LIBSPDM_CONF_OPTS = \
 	-DARCH=$(LIBSPDM_TARGET_CPU_FAMILY) \
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
