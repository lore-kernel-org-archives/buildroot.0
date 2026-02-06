Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89611EB28D2
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 06:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36F6183D4B;
	Fri,  6 Feb 2026 06:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-qOuSlRqYKZ; Fri,  6 Feb 2026 06:52:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 052AC83837
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770360777;
	bh=nBd7iAc3FkMjg/0b1s8YhEgLmD4AG3dD+mrp7bUbbQQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=INxyNVc8Ttw9NC7TAt2oNkZeNWpFkxHUDD7qayPc4W1Z2yYIVOpQhsmPY/fBI2K6u
	 gNL/tArDqkil+/qxrSuT+n7ES1+FP85jofvo2LiEGPWnlbxc5DfGOsAguj20SiL3uB
	 K2HWPV9siA2SL020WSkfqCJVlvXEw/EzTFRetSjENs+pj45dwW/5ueILFeAtgRXev9
	 Eq8bV2GVJ2BqHOMI5R8h3guWDyw3lloTbbtwQT34t8kv6ZzUzEfyX5+rfXRWFvskcA
	 gwxkMOd3RJHybuN642LV8X9sE2iCDUMRbMq9vZ/dhWfeHecVAXjAvYITqr/CCS666W
	 eYgdzMUE7M6/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 052AC83837;
	Fri,  6 Feb 2026 06:52:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 15B7E2EB
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 06:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1199860ECA
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 06:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1tJbayqwjU_g for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 06:52:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 67C9060A43
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67C9060A43
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67C9060A43
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 06:52:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 061B8A4C5689
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 07:52:50 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46016)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1voFhr-000000004oG-2sQQ
 for buildroot@buildroot.org; Fri, 06 Feb 2026 06:52:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  6 Feb 2026 07:52:43 +0100
Message-ID: <20260206065243.62246-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770360770;
 bh=Re5NlZS7b6tsDJ23+1I8jlBSWQ5d1FQT15xHk6AomQ0=;
 h=From:To:Subject:Date:From;
 b=ELTYzo0PIeIgf0bXexsr3Tp2oYtaJAKmQXvwkzzBjru60bKaub51ZCecYQr+sNXOA
 zs1wbZd1Zz+RhME/01gw296ci/ych16rZMdS1BKZP5h3eEqRgwBONpbXhXHkcLfsUZ
 M5hNTmhNfB6UoKltiBeai8FcLomzzw8f61WsQQztcgVNzmY6v22w82bgM0BSBVMBtj
 lQjtQ2+DamPKiYQaWnOAdX4HmJFtANaMicinlliANST6i+km+ovBUCqoj3w0yJz2lC
 5Pz2638BhrPBUZAYuzkUTTarfZufNKW3cIX4ul1f4yt5YPMXzHnzXZeZ8v23fedRZV
 b9QhB62rcrJuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=ELTYzo0P
Subject: [Buildroot] [PATCH 1/1] package/uhttpd: bump version,
 fix cmake 4 compatibility
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

This bump includes upstream commit
https://git.openwrt.org/?p=project/uhttpd.git;a=commitdiff;h=ebb92e6b339b88bbc6b76501b6603c52d4887ba1
which fixes cmake 4 builds. No backports necessary because the cmake 4
bump commit e46695bbe4ab583f39f9448f3ef3e044efa28808 is not present in
any older branches.

Updated hash of header file which is used as license file due to
upstream commits:
https://github.com/openwrt/uhttpd/commits/master/uhttpd.h

Disabled new configure option UCODE_SUPPORT which was added by upstream
commit:
https://git.openwrt.org/?p=project/uhttpd.git;a=commitdiff;h=3ceccd02d86bf4d6609f46d8b30963cc52034cc2

Fixes:
https://autobuild.buildroot.net/results/cc2/cc265d34aed684b88032edd04ca0fc88186ec676/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/uhttpd/uhttpd.hash | 4 ++--
 package/uhttpd/uhttpd.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/uhttpd/uhttpd.hash b/package/uhttpd/uhttpd.hash
index e84d2dc3ed..015a04af5a 100644
--- a/package/uhttpd/uhttpd.hash
+++ b/package/uhttpd/uhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  397aa4bccc4acb06031270d4a549fb266fec3950a88fe3523f0d7de74caff010  uhttpd-15346de8d3ba422002496526ee24c62a3601ab8c-git4.tar.gz
-sha256  ce1803f83f776cc88661e303fede0e5ff52faf1d9f74508fadbecf7705b4c84d  uhttpd.h
+sha256  5835ced5fd67358b95c07d41a3e2a5991719048f99b5d43bf191287524d8fabe  uhttpd-506e24987b97fbc866005bfb71316bd63601a1ef-git4.tar.gz
+sha256  b98de120bce554de7d205fbc5734c2b72973e55ce36ef6403510c4583cbe2e14  uhttpd.h
diff --git a/package/uhttpd/uhttpd.mk b/package/uhttpd/uhttpd.mk
index f4fcccfa67..2adf409487 100644
--- a/package/uhttpd/uhttpd.mk
+++ b/package/uhttpd/uhttpd.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-UHTTPD_VERSION = 15346de8d3ba422002496526ee24c62a3601ab8c
+UHTTPD_VERSION = 506e24987b97fbc866005bfb71316bd63601a1ef
 UHTTPD_SITE = https://git.openwrt.org/project/uhttpd.git
 UHTTPD_SITE_METHOD = git
 UHTTPD_LICENSE = ISC
 UHTTPD_LICENSE_FILES = uhttpd.h
 UHTTPD_DEPENDENCIES = libubox json-c
+UHTTPD_CONF_OPTS += -DUCODE_SUPPORT=OFF
 
 ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
 UHTTPD_DEPENDENCIES += libxcrypt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
