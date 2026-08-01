Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECE0C54FCD
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 07:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57A0F60B08;
	Sat,  1 Aug 2026 07:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mDWZaQE_lGpa; Sat,  1 Aug 2026 07:47:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 585F660B8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785570424;
	bh=kyO6IkRezKxT1uF/ojF+eo0b8tu58hqbGRSdiP0gfzk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z7ICG+AHqzJzebAUxbvQ090Ui9B+tKx2Z5FXOOA76redoftYmGrZsRxIVATfeKj4R
	 MeLuUqc18I0dmCA5UOgpAtHRp/fyBnqO4Z5Os2xuExV6ZJtNMyB4TCTahn/l/XxMn0
	 HDt1RYoM1ONkuXyOp94Bo3MSCuKrOGRRTEwlSRmACsA1r75yLFORIAR1xvVAXqG1t1
	 N22s71YjBqa5sgtANatpSxe/jOp9zbsgzEwYqnk0Wmv+sIDraTR11RbxLt73iP0e5k
	 abwN+HBkdYxv/imA0scGfsla/Q13AB1WtVoD/yhzbon57oS3HBwyTPCE12dN327cPA
	 XNCchRhy9o1Cw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 585F660B8F;
	Sat,  1 Aug 2026 07:47:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30F59138A
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 07:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22F3E80E75
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 07:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F7WHaHPnDUra for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 07:47:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 360E680E73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 360E680E73
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 360E680E73
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 07:47:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ddb.dip0.t-ipconnect.de [91.58.13.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A461FA4C45C3
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 09:46:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33948)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wq4Qq-0000000036W-2or2
 for buildroot@buildroot.org; Sat, 01 Aug 2026 07:46:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  1 Aug 2026 09:46:55 +0200
Message-ID: <20260801074656.34834-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1785570417;
 bh=3xevWut3ZN9UAd/20cgdkUZvELlm7AIYe3ZtzsMXBao=;
 h=From:To:Subject:Date:From;
 b=HJ5opJ56AzBR6PT14h85ba0xPEtjYJXe1DEI3zMOugoYh9Mdt3Y24ESxEnqtSYjfB
 MhROiKtxxtMvUAin7kjkOqikDGtuWzk/eF1GBix3p7ui499NxFfsiUDKvltL1Hhrmq
 W1Dv8g4yjhVP3nWhni9vzSSkKyHYltcPnTRTDlVUaUbCzICZ/K7VWgLH+UFLGV9+6k
 0+Phcpc4u2lDL0CYDQsR7PZnBQ9URi5tge5tIjI0sIJ0kEwCame5zolENnpa0d3Nrs
 AbkAQHqNqnmVCOsrTGEUo7G5fPHOHn1riUY0LGEdUsaKTCxTwlNE4E/sGVLQnbiaSN
 aagy2AzTzkBWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=HJ5opJ56
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 26.3.1
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

https://github.com/intel/media-driver/releases/tag/intel-media-26.3.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/ab45336cf45b323ccd333339d629d8b81552258a

 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index e3e28b9917..0392a45a2a 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ceeb7a5914953bc03c93daa1251ab41f1e5706bfc272dac3d4d4443a20689002  intel-media-26.3.0.tar.gz
+sha256  eb8351e2ac9c1007a6489f3ef53907a464bec5e4fb2a1030f5b2b8fad81cc01a  intel-media-26.3.1.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index aee7d1fd9a..4810bb6ebc 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.3.0
+INTEL_MEDIADRIVER_VERSION = 26.3.1
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
