Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA71C282EC
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 16:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6349640109;
	Tue, 18 Mar 2025 16:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OWbjDshW3EID; Tue, 18 Mar 2025 16:07:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3846640113
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3846640113;
	Tue, 18 Mar 2025 16:07:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C698D8C
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 16:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B754408CF
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 16:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CAYLMwVjWlkB for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 16:07:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A60C64058E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A60C64058E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A60C64058E
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 16:07:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b8f2.dip0.t-ipconnect.de [84.161.184.242])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 37ABCA4C334D
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 17:07:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48368)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.1)
 (envelope-from <bernd@kuhls.net>) id 1tuZT4-0000000012I-1al2
 for buildroot@buildroot.org; Tue, 18 Mar 2025 16:07:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 18 Mar 2025 17:07:00 +0100
Message-Id: <20250318160701.25265-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250318160701.25265-1-bernd@kuhls.net>
References: <20250318160701.25265-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1742314022;
 bh=8/ywkcvvjkTt/FwwxFFHs8KM70PUXL/nCKj7F+W9xgQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=F4c8NYqwS14Ja8qbKt2DdUZ0czgo40cmjjMaUiSZ9XwUZpVfEXUijT9du3S3uNcWs
 nF7sBRQ5CPVrwozqFkpnh3K4o2c4gMX1MNktHt2QkH2vThwOT3Ys7h+IrP1OLoP1X+
 qUG+bi9ppE/MGTmwIwgDTpUg1PEb7C0Zdua8nycQwRkO1icDBsTAVh0LVE3/8A1kbS
 wO9tUx5EeYwyaIaIysyjIFrueKUuZe8Bb1XXmQfjvhPcbPMAnslf6fbyAvMB310gmK
 TM+VnIjLCOKsBjrOnw8cTP5RbHnMWKsc2VPsTPzIeSuaDbJmmTQNTbNqFqZi3KYlVC
 dE2OdjQulZUgg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=F4c8NYqw
Subject: [Buildroot] [PATCH 2/3] package/intel-mediadriver: bump version to
 25.1.3
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 862d01669c..0be7c0bf6d 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6c11cfe1b9012011d0354b010d191a527fa3a4086152726ba642ca51808029bb  intel-media-25.1.2.tar.gz
+sha256  35f645b3da152a703f52071b125ea3e0b193fe3b1d6a20aad313b3c33a593128  intel-media-25.1.3.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 215f5ae39c..1466e9b986 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 25.1.2
+INTEL_MEDIADRIVER_VERSION = 25.1.3
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
