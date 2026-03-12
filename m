Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02486106ACCB
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 16:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7A0E84AC0;
	Thu, 12 Mar 2026 16:37:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GEYtpxB5rU7l; Thu, 12 Mar 2026 16:37:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBF6084D5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773333477;
	bh=q4hvgAuwS/B4IxsNeEdO8WSd+hbERM7Mvyoxcr9CfNQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=T8Vbzj/uT7dBGWHXzim2GfPl9qZDNBKUoRcatQZFsmBd3Pqumq/e4n83crjuPhY+h
	 52JjCRnKSaKsVS1cZwfGKyxOfwWcnCo6cyzai5p04N1RIxfaSGodvhUO2EzbJyjX0z
	 i62YiyMWbQU7d40WyQ4AkgJKtyZdzJe2Qb+Q0beAgNSWr7v/4kX/NJf3LDrOezls2X
	 kgX165MQe1OZWrhzDaA+OyyXJ96ky51sZTW45GX5I4XS5l7q13lolCIG5gvSyR3Lzm
	 JwdR8iDVUSu0dZV+dZtkgvi9ris3tZgqIHGRG5zw4YHqCWYD0Ms33LQPuc/xfUqF1q
	 lLPkh6cDRz6DA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBF6084D5B;
	Thu, 12 Mar 2026 16:37:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E1F9201
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33DB7616C8
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHp2IR9n-8HT for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 16:37:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EDE2C60FBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDE2C60FBB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDE2C60FBB
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:37:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0199.dip0.t-ipconnect.de [91.58.1.153])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B8C7FA4C066D
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 17:37:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37448)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w0j2X-000000002wq-36pW
 for buildroot@buildroot.org; Thu, 12 Mar 2026 16:37:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 12 Mar 2026 17:37:36 +0100
Message-ID: <20260312163737.3178306-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773333457;
 bh=9eLY7EvsY60Yiy+eE4TsVFrutgZL+JO3LtiBIvFkS/8=;
 h=From:To:Subject:Date:From;
 b=QsDIMyUaHzGqyA2wm3w0+HY6tz/aDensjpM7e9Q/5dcM4rotFSfiv379sVXzVZVuk
 9kZwmgtmweNjW6DmhAKuTeK+DY6F1P2fvNXWW+AUlIYs+Lk7OzwQO9PcF3v/OLntA7
 AEL0Ebgn0VJDtyPEFlaO6E+GegPVz245KUBOp9zwB/yYMPanEtqU3K3se51dGjMRma
 m9yBQASYzl49JkCNC75i2qrYXSU9URfSCkqx4uu7/YeeyeiwnW2pNUyvlE+gjyu/zk
 jPBExBEn9jIED2IafEl4HzNOl0AD0HV4MmaXg0X0Kqz//A88/odq5MII4Hjq4f6BhS
 EUUG1LBjTsoLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=QsDIMyUa
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 26.1.4
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

https://github.com/intel/media-driver/releases/tag/intel-media-26.1.4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index d4cb4dac07..350a3c8761 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6e0483625eec81aad52984cc08cc2cb38ee571ab2efd93b0d33b0c31611b0a13  intel-media-26.1.3.tar.gz
+sha256  dd9132c69d68702b87520d9f4a4ee51796d67cb164e8befbcd024257369edba7  intel-media-26.1.4.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 6fe62ca8cd..a3f64d0542 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.1.3
+INTEL_MEDIADRIVER_VERSION = 26.1.4
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
