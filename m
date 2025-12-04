Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B735CD216AE
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 16:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43C378478D;
	Thu,  4 Dec 2025 16:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8BuYhQGm2W3S; Thu,  4 Dec 2025 16:33:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C02B980D04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764866017;
	bh=Ac+pZhLDeA9Zqf+vG1AsxnLq1P3TucYnXCICYNEOHEw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZZvWWFdrlFebSgmnksxDmnggBGOlaLNo5bDdWkSet1lVroUdvoInF+5cTyOh8b0BM
	 SU7BFazRuSQ0pWdImVoRDnseMm2+JFndUCkUir09ZyRMMl0h1jPwH8TQNr7J2tOkMp
	 pVJizQ0GCScQTcfKvU8GkM4ekzZnehNwvYbCXGc/sj1eAnlsR+RXqGUPycncVJeQDO
	 z6O+CkW/IwiwRl9twfMfODStqP2kEusDE5/zTKh8Qv+J1v9cl5t7pbVf7li+d/B5Nn
	 tYgjDLuwomScGo7xg6o67tza16FuMgO0EIJKBLoBaaGQAE8TbnHLeRbQfpdgVsWwJC
	 oLbo+MqsLagmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C02B980D04;
	Thu,  4 Dec 2025 16:33:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C10DD3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 16:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E62EF60AE1
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 16:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5cNRqm4Y8rCb for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 16:33:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B9E560887
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B9E560887
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B9E560887
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 16:33:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0A7D3A4C1175
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 17:33:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47642)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRCGm-000000008Sp-3lC7
 for buildroot@buildroot.org; Thu, 04 Dec 2025 16:33:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  4 Dec 2025 17:33:28 +0100
Message-ID: <20251204163329.1313311-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764866010;
 bh=/Up1QX/pQw9cRKMESb6gLt+LzAIt3qOSBZr5s9kuUqQ=;
 h=From:To:Subject:Date:From;
 b=d+ZAt0x8GsXaOqyUCQWjZLY+zcD/g547vyMQLDF48r4P/CyXGQweJwkYlXlLZjeo3
 Dp/EAh+xnvlAvY9oxikmSWOR6L1MR7uhSqR1hgjnCH5mYyo6dj9M32oVrtmUM6M0DM
 2q/9lt3Vh/hg8GgTj59K/knM1V8o4SqTDhd56nbFld0GkkNOnV0Jcpeuve3si/r+++
 IouBdS1gY+PuE0j/aJzDrjkZLkXR052UjDsfl55aW0ZCfGi0zCHvFlPmEgU+5XKv3R
 UTpVAXHCDBDyGESXfE11YjNfdzAlYGboMZziEu793EymU1htm+Ofdz+TxBjv4IgCIA
 lhhGtMkOJxVZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=d+ZAt0x8
Subject: [Buildroot] [PATCH/next 1/2] package/intel-mediadriver: bump
 version to 25.4.5
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

For release notes, see:
https://github.com/intel/media-driver/releases/tag/intel-media-25.4.5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index a6bae999f9..af27309bab 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2e034525b508aa85914736ef9b9c59b6ab51ae9008c9c815e3ee354a5ada76b4  intel-media-25.4.4.tar.gz
+sha256  7ba3b1d72286053e0785b7975e7ed2001ba3f6e00a8541aff0c61a6495ef5138  intel-media-25.4.5.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 41dfcd9a93..d8dd5d0c1f 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 25.4.4
+INTEL_MEDIADRIVER_VERSION = 25.4.5
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
