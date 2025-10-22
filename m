Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919E9CCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 18:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CAE340C64;
	Wed, 22 Oct 2025 18:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4VlGS4YO9K1v; Wed, 22 Oct 2025 18:29:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AB8140C65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AB8140C65;
	Wed, 22 Oct 2025 18:29:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EB5EDE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 18:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 555F940C70
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 18:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UWp6RLObi8tR for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 18:29:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 139E040C65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 139E040C65
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 139E040C65
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 18:29:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a021f.dip0.t-ipconnect.de [91.58.2.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1F5D9A4C372D
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 20:29:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60482)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vBda2-00000000077-0n3o
 for buildroot@buildroot.org; Wed, 22 Oct 2025 18:29:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 22 Oct 2025 20:29:00 +0200
Message-ID: <20251022182901.95792-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761157742;
 bh=1/08//IU7t5C1lp1BddNzzLwS0vCTbtPHLQoOVV6zm8=;
 h=From:To:Subject:Date:From;
 b=JVViMvu4C8lkp2aJxkl903SxbqSI0AKnMwJIjNU2Y32o9sEBnSKhY0HNZ9GmvAvw3
 YnZVIAx7i2IRuV4E6c2HtGZrYETCCNIzNaPWRjcCfFvxvDgH2b0sWEPZUyGNKga8N+
 20gr+lhcXgUZuCEU5Yld7EfvtsKHlaq+jC2LG6/7PS8E5LPPlUUk5NxZANuV/J6DMZ
 MPW9YO3z9qBo/+s5mql6a4els49O2vTU5lYLeTQyxKsVYAmpZ77uqwvXFphi0MePID
 ICxinpzldKXp/L5lrD0y6p+6Sz+ystrtA3PBqXMxh4k+QEtB8yVNqqpK5uSH+LVE5y
 De+5uS8geS2EA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=JVViMvu4
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 25.4.2
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
index e574293fdd..700411b036 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b81afbeea7ee94115ecdae9b687aaacda2f8adf9de48f4ed4c1237d910954bf3  intel-media-25.4.1.tar.gz
+sha256  1f04e3b6c9d53b8e3e4f1762191ee60bfd12ffece5a541295fe2ee244b776c1e  intel-media-25.4.2.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 2e855994bf..347a37de32 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 25.4.1
+INTEL_MEDIADRIVER_VERSION = 25.4.2
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
