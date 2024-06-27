Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64980C2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 21:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08FB360E82;
	Thu, 27 Jun 2024 21:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fwCa6G4HF1U2; Thu, 27 Jun 2024 21:00:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A5CA60E7C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A5CA60E7C;
	Thu, 27 Jun 2024 21:00:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D2611BF2B9
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 21:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3835F40465
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 21:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LCjlRIEkUnqj for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 21:00:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B6625400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6625400B9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6625400B9
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 21:00:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb6a.dip0.t-ipconnect.de [84.161.187.106])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D1A51A4C0618
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 23:00:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58820)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sMwE3-000000008N3-0bNn
 for buildroot@buildroot.org; Thu, 27 Jun 2024 21:00:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 23:00:14 +0200
Message-Id: <20240627210014.1458512-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719522015;
 bh=RNIkssNUQ2Ki2qzbb14WXkoYpnwEhUF/QLY+mg96fRM=;
 h=From:To:Subject:Date:From;
 b=WMf6vDROT+508XQJQECDagzNCNXaIxKGqx3cmLCdtGrJLNWcYRQqo2WrwUaNDFUHv
 v/gXc3Yq9ZLwKVVGMWRMw4oP9kUvdrA3eLYGpjKlXqpKeIcvK1pc5VVfF5DTj4+JXo
 WZJnLNoOYizOxB0WcZKFxEzlfIhexVzBPbSye3qaYsc9zitTnT2X0xDkO8IeTiABnG
 nRq/chrLXeF1NQY2dkg8pOMEjHLzzCkbz9aVJ/jGOEBzi5yxpw2SchpyiIaW2/9rED
 IIbvhIOZxfQt7rWLdledYoMXwEQeX0wOESa+Z3Rl/GlGfliXQmJntBuYng26zM18yK
 rikHvcqe10ziQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=WMf6vDRO
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.122
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
https://lists.x.org/archives/xorg-announce/2024-June/003518.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 8b0f7c0d74..9d78d5e437 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2024-June/003516.html
-sha256  909084a505d7638887f590b70791b3bbd9069c710c948f5d1f1ce6d080cdfcab  libdrm-2.4.121.tar.xz
-sha512  cc8816d61884caa0e404348d1caeb0b2952fb50e1dc401716adfe08121096e2a67826db0bda0d8b163d67c5ee048870177670d5eac28a5abe5792d09ba77ab2e  libdrm-2.4.121.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-June/003518.html
+sha256  d9f5079b777dffca9300ccc56b10a93588cdfbc9dde2fae111940dfb6292f251  libdrm-2.4.122.tar.xz
+sha512  ea6bac94416d4ba0e9805e142ae62904236bc49f803d4fc10c92968a4df64c818dd42524ad7a4e988062836783a148e27094050bb2754f751a368627f794ad13  libdrm-2.4.122.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index c87a225515..ea956de15b 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.121
+LIBDRM_VERSION = 2.4.122
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
