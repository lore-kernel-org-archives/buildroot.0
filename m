Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB42EFD5F98
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 08:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74F2880E5F;
	Wed,  8 Apr 2026 08:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BkG8wg1zOwwA; Wed,  8 Apr 2026 08:56:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6420280C44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775638562;
	bh=PcJkEmFPB8GvRL0kuOiu0j+PEM2xgPfd+efFiqHa0Yg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qfBSp5ULwwCi55P7GVSBfmfVoyZMqAxShXEEFsCCcuiSIAcZrAPxQ1blJww1h0gkJ
	 X2VL7+2mV0jlb1Td/57I/SVT9a7R6bidtQLOB/Pv1AevjUXM2u9m7Ar4CwErUlsndM
	 5VV+JDDla8ksZFrs1xZ9EFycO9srK9ZNqEvBKoiI7j65MjMLXMCVsccQ4198+QegV0
	 LlQUySEW4SsJthcPuTstn0gipUd81q/C3LJJGOoqVvloDcMl+SJj89QDKneY8KQgJI
	 8w7PiErksznMUBMuWyBqKfWxYGMHGQqhecbdO3OneH1TSP97HPLA80xbdrU4RFk8rR
	 22gNHwnt8FCqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6420280C44;
	Wed,  8 Apr 2026 08:56:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 452C01F6
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 08:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B75F80C44
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 08:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5H3j18g3-AJH for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 08:56:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 19E6880BCD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19E6880BCD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19E6880BCD
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 08:56:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4C5F4A4C10EC
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 10:55:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56300)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAOhZ-000000005GE-46fJ
 for buildroot@buildroot.org; Wed, 08 Apr 2026 08:55:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  8 Apr 2026 10:55:57 +0200
Message-ID: <20260408085557.1641890-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775638558;
 bh=3huGYSBMnN273S4tgKirxPXZzao299i2lO7RpynOHDE=;
 h=From:To:Subject:Date:From;
 b=SNAepRrKXLAs+gUNy/w0wtl5dZDMW57uYOvyYRYGEGwku4U10NcSY2+381smxXSIm
 Z44u+wtBZ7yF4OXGS9NAn1YOW3IgBxHJp7rYpXbKlr6s9EDm8J4xc22Da5+U2j/Gz3
 FmGnfbHzlRhYlHGpqpI5LUlFSq8JMn9KiT4IhuI8NEOptWiJObJGeEGDNqZdpNEPEA
 JBZYJIfVM3tYeBmCkaabRKb7d71XZ4D7epR742ghT9/EVLAUJ7d9ngOxWCJagR6QaS
 24jcBntUtrho1p9Q00FUi9mXPxTKeOQZPE1zvVC/RQ5PHDGHF+Xx5dsLOMkL7fqGfa
 f6yxoEZP0bT1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=SNAepRrK
Subject: [Buildroot] [PATCH 1/1] package/pciutils: bump version to 3.15.0
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

https://git.kernel.org/pub/scm/utils/pciutils/pciutils.git/tree/ChangeLog?h=v3.15.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/pciutils/pciutils.hash | 2 +-
 package/pciutils/pciutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pciutils/pciutils.hash b/package/pciutils/pciutils.hash
index 9401d046cb..fc7220f4a8 100644
--- a/package/pciutils/pciutils.hash
+++ b/package/pciutils/pciutils.hash
@@ -1,3 +1,3 @@
 # From https://www.kernel.org/pub/software/utils/pciutils/sha256sums.asc
-sha256  e7713409882813991d2269d125e40dad1f54a019a52b78b3962941c1d4a6f86f  pciutils-3.14.0.tar.xz
+sha256  c02940f430841ecf158d5d9a50007afc4d5353c8678a2455003ca0b2c4e9f5ff  pciutils-3.15.0.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index bd205b1430..ad32713d57 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCIUTILS_VERSION = 3.14.0
+PCIUTILS_VERSION = 3.15.0
 PCIUTILS_SITE = $(BR2_KERNEL_MIRROR)/software/utils/pciutils
 PCIUTILS_SOURCE = pciutils-$(PCIUTILS_VERSION).tar.xz
 PCIUTILS_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
