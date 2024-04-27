Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9EEC4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 08:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E1A96062F;
	Sat, 27 Apr 2024 08:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ztq20O4WZuQC; Sat, 27 Apr 2024 08:40:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79AE96076C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79AE96076C;
	Sat, 27 Apr 2024 08:40:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F08E1BF29C
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 08:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85A9D41F2D
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 08:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zbhUIAh0O75x for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 08:40:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 81C7B41F40
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81C7B41F40
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81C7B41F40
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 08:40:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0289.dip0.t-ipconnect.de [91.58.2.137])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B8377A4C3E4C;
 Sat, 27 Apr 2024 10:40:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48374)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1s0dbX-000000007lf-2ewb;
 Sat, 27 Apr 2024 08:40:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 10:40:19 +0200
Message-Id: <20240427084019.13312-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240427084019.13312-1-bernd@kuhls.net>
References: <20240427084019.13312-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1714207219;
 bh=+oKMKxsrnqqoJBZL4pYbKZzoAQE9OVh798DF8QcZekU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vXOVxW144FMBFEjTXE+VuluLtAp2DGe14ipux8ebCySSWyElEnGLGJjpHL4wCGreQ
 tE1xe9xifwt0QaeRfjhzHfICqnDyt5LxZ2SmFMI0z2h4zRtST1ikQ67DwE/j+8Fz8Z
 /nWcUkzTY4SNEjhS/XAGRvDNSbWspuI+AS+DMckcnqkRNOAk7U4JMGBHlSJCupEpU7
 e3o2vZVi/epZqh9izDG0Bgrt65FyV1hAakT88Y/1T+vVQ16isyEX8xwXXgEPHADRf6
 eSlDf3s8oOvtVZhtJR3800jhu9/HCycvdccjiYQO3ezqxYc3fo2G32wpU2dZjO3zEE
 ydOBkhzBpyx7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=vXOVxW14
Subject: [Buildroot] [PATCH 2/2] package/intel-mediadriver: bump version to
 24.2.1
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
index d597d3f32d..fcc7b9dfbb 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5c03bbb9d7ae12b9c7fe2cb3f4c76f8ac796eccfb998422802e40464264de37c  intel-media-24.2.0.tar.gz
+sha256  94dfcc4d2e6f75d0b9b9a5c95c1ff5d69178440888ff2ab98ec095d4adf8e955  intel-media-24.2.1.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 7d9b074dbe..c1a9c54c61 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 24.2.0
+INTEL_MEDIADRIVER_VERSION = 24.2.1
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
