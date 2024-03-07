Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31FEC54798
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 17:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8138540121;
	Thu,  7 Mar 2024 17:43:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WWyBi3tDK5by; Thu,  7 Mar 2024 17:43:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34D1841B42
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34D1841B42;
	Thu,  7 Mar 2024 17:43:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 63EC51BF396
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 17:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 504A3830C1
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 17:43:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hL6jtuT9ygQh for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 17:43:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 40E9D830C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40E9D830C2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40E9D830C2
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 17:43:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd61.dip0.t-ipconnect.de [84.161.189.97])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5479DA4C0B02;
 Thu,  7 Mar 2024 18:43:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50290)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1riHlu-000000004Od-0I0x;
 Thu, 07 Mar 2024 18:43:10 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  7 Mar 2024 18:43:07 +0100
Message-Id: <20240307174309.36603-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1709833390;
 bh=xy4ijbnSJaysTUfydFH7ECq/OH3J85KWB/BVPIzKfRg=;
 h=From:To:Cc:Subject:Date:From;
 b=xZh+uKSXXrem74XYnJmC1/a2klo/wCaREgBMws4lHxOur741wM84qTSJuD4pwXqbO
 lKmfGv8LgwtymyYG6refh4v4nJBw6W/Hfy7GM2UkOf0i6H0vgQc245uZliBSZSbGz+
 /t4nhx7veHnh+K1Gc4r1KFx16VIide31XNZouJMiP7tdFFn3dfU9yxuBIqyV58EFZg
 GCdctgtifWhCyBbqdBIK5xgZKcuk/++Z5q8/n6UZEmkuQRxAQQAqzTGZRodk7EBJm8
 x8WJbdVe2a83Qy/OkHFx0AkPiF1U1KQZ3rX4TQvYzwrdcVpeTtn7VFdLp88L+6rWO3
 ZuqeoAcwM3d8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=xZh+uKSX
Subject: [Buildroot] [PATCH 1/3] package/intel-mediadriver: bump version to
 24.1.4
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index a1b098094b..4b410fb961 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a024e96abd662193e4295f427a76c5894087503df46bd82c0e5bea103e44b171  intel-media-24.1.3.tar.gz
+sha256  7ea727b3e2890cf8f50307a3910664209bcbae1ce0d3d8f81bb9f522b0f66d59  intel-media-24.1.4.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index efedf407e5..814175867f 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 24.1.3
+INTEL_MEDIADRIVER_VERSION = 24.1.4
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
