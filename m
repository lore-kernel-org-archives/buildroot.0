Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8327AC27C53
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 08:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33B72405AC;
	Sat, 22 Jun 2024 08:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QLYJIKc0R5w1; Sat, 22 Jun 2024 08:42:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC097405BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC097405BA;
	Sat, 22 Jun 2024 08:42:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2570C1BF27A
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 08:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11F9B40799
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 08:42:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PBOqJMH9npGV for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 08:42:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DBBE540727
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBBE540727
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBBE540727
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 08:42:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf60.dip0.t-ipconnect.de [79.214.207.96])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6137FA4C0BE1;
 Sat, 22 Jun 2024 10:42:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43162)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sKwK9-000000001ar-3oxQ;
 Sat, 22 Jun 2024 08:42:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 22 Jun 2024 10:42:16 +0200
Message-Id: <20240622084217.10423-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240622084217.10423-1-bernd@kuhls.net>
References: <20240622084217.10423-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719045738;
 bh=VN9bQDV0H1MIVoqCnHMylc14HY5xC3hL+H6wU/CKjTI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wqxwn2qEkturAw1llR4/ZSDiSFhdcPJcLspiIYvhlqoKI+kH2hS/KcuB5OsrKZepY
 AGHDQPRN2PO2eULQkRqm4GuCpVLLMTGLEurCyoyH5wSYn5WR1gYJdccK+UMWen5E5s
 9cImFn70ft6nLUxbTVtYDqxjREfVlAV3ZR+mOuSPSJ4Hah9KRKzKahZmdlPSYNsNLP
 Tb5hUn0kbw/35U/pqKYCY2Oz/mNoeVfr/oBAkTjL5TsE0JWd/t5Ske/38rkfmonRp5
 dc+Y9YUynKNRzUsL6UoqOXbpfa86dkV9q2/kyb6cj0G8yVxh//PQjp0LV7lO4eQ4f7
 IPcGHWJr4uwsg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=Wqxwn2qE
Subject: [Buildroot] [PATCH 3/4] package/intel-mediadriver: bump version to
 24.2.5
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>,
 Samuel Martin <s.martin49@gmail.com>
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
index 8a23f9cd7e..89aaab8721 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7d0d43e201706ab2dc62741b7873d52dc3779a7b1187b5a321cd0a37223b2b8c  intel-media-24.2.2.tar.gz
+sha256  dec2210c1f824a721e4ea6f66f5899e300801b3e7fae232d3f8a94db38c2edd1  intel-media-24.2.5.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 2bbe4a7a08..943956ec50 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 24.2.2
+INTEL_MEDIADRIVER_VERSION = 24.2.5
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
