Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24AE10706F2
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 18:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B23E360F1C;
	Sat, 14 Mar 2026 18:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvpshPINiacm; Sat, 14 Mar 2026 18:44:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F0E460A82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773513899;
	bh=nYSZDfdKzPLJGfPrPFCmmR08gkrD2XNKhKVxSmqTAHU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cgp3TDoZAa91djJ1KZsO9/p6vpdP+H8Vmv1ZMDK7HpiYtHw3/PiPIvcbWCqj91zmr
	 A1FHJaOfoVaAV/AWVt7CjYlposAoTFok0Iab4O34wlKdAqWV+7GXuq9POVFWGaDerP
	 n7O5+dn2prz5E85tiESRECXwXEqq863zfa6znwoblWfe3UK7jqZd0VYqJzN5MWDKSv
	 nCB/6tl/VI/EY2gLJ5Epz9q0KODeYtSQJEYxWUeGP+bghSd4ZIpx/0JmXlq5/TEDg2
	 mL66S0taydZTYIcv+SJ6111Ub9qHAHKxP22/J68VrGkWiNqXVcuA9ybrNWPhuISWmL
	 j00PGcN5rGqOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F0E460A82;
	Sat, 14 Mar 2026 18:44:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 78EC71B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 18:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 581B2815DD
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 18:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qTMFJ4PZVone for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 18:44:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 154AD812DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 154AD812DF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 154AD812DF
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 18:44:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F2EB9A4C0A61;
 Sat, 14 Mar 2026 19:44:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48792)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1Tyn-000000003K8-2ibu;
 Sat, 14 Mar 2026 18:44:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2026 19:44:53 +0100
Message-ID: <20260314184453.3197206-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773513894;
 bh=taJcncjcKQPrw/YbCBOhJTsIrV+qHqZYiejCDhWAJ1o=;
 h=From:To:Cc:Subject:Date:From;
 b=PUIq+f4jky89u1L4UKldHpvVjbckENa0FnKv3SlHWPcFvy8swTd5q1PN3OMu0jLer
 WjINAG7LziwzqhD6lvmYWX304ef5/HEtzjGU7xIHLbSuIjTsfNSlU3Dn8Q4Yqicl9j
 tfnTBI4TBxa7TLIdyD8kPIjkqCQPdS8eKhY1j3BhiAPfOplhpRkxnFTV5bjAKdsZ0Z
 Y8NGMVP8jzuSMFifrgZ0XWBqcvzCzTkPgDBgL3k6O5HTLk9CVvueDeVPWllBfTtzLR
 zoqjO5zYmJkD+V0e1JItlnOkwsxOR9K5Gw9MXxvAMxG58088y1v/qo8ULY4bIEo2xB
 Oc3o1cE4zmPuw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=PUIq+f4j
Subject: [Buildroot] [PATCH 1/1] package/flashrom: bump version to 1.7.0
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

https://github.com/flashrom/flashrom/blob/v1.7.0/doc/release_notes/v_1_6.rst
https://github.com/flashrom/flashrom/blob/v1.7.0/doc/release_notes/v_1_7.rst

Renamed license file and updated license hash due to upstream commit:
https://github.com/flashrom/flashrom/commit/4b370bebb7bcd45274d5734e736a2e2c90d4d307

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/flashrom/flashrom.hash | 4 ++--
 package/flashrom/flashrom.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/flashrom/flashrom.hash b/package/flashrom/flashrom.hash
index 0e1faf34e7..4ffb34720d 100644
--- a/package/flashrom/flashrom.hash
+++ b/package/flashrom/flashrom.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3f4dc7878e962e165b7eba73104d4e61231f9d4e838eb47df6ca3d87060a2aa5  flashrom-1.5.1.tar.gz
-sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  c5a8892158bd749aadfee6e114eec268130cdd8c2027fd1ddf44273755b07b59  flashrom-1.7.0.tar.gz
+sha256  e51c99ee054c216999e7a8db04a2e7a6b39915dccc8a58e54b48a720e0c4158a  COPYING.rst
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index f253c5f9d8..8e1fb47905 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-FLASHROM_VERSION = 1.5.1
+FLASHROM_VERSION = 1.7.0
 FLASHROM_SITE = $(call github,flashrom,flashrom,v$(FLASHROM_VERSION))
 FLASHROM_LICENSE = GPL-2.0+
-FLASHROM_LICENSE_FILES = COPYING
+FLASHROM_LICENSE_FILES = COPYING.rst
 FLASHROM_INSTALL_STAGING = YES
 FLASHROM_CONF_OPTS = \
 	-Dclassic_cli=enabled \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
