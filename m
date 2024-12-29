Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D153E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 20:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAE2B6087D;
	Sun, 29 Dec 2024 20:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLWtPe0tnsfA; Sun, 29 Dec 2024 20:22:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BE6B6065F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BE6B6065F;
	Sun, 29 Dec 2024 20:22:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D4670C8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B41936065F
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OHPuhpMS66jA for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 20:22:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6357C605A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6357C605A5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6357C605A5
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:22:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b064.dip0.t-ipconnect.de [84.161.176.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B308EA4C418A;
 Sun, 29 Dec 2024 21:22:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34718)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tRznb-000000000Ed-0D5N;
 Sun, 29 Dec 2024 20:22:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Dec 2024 21:22:06 +0100
Message-Id: <20241229202206.1664828-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1735503727;
 bh=BEsDLx3bUUxyq/avVRyY+djwgno0R5dWd1z8Nz+mjko=;
 h=From:To:Cc:Subject:Date:From;
 b=jO0XLl/YtS48oS/vg2hfEtYTrVYEcGeN6jJOiWEUGdR2DG9auQQAFnuErWLD3Uyra
 izRKVhvDRDfi/V+9h9YkVyrFZ7ey0/dpTysNPp6Bh3QiR6ywHFlzwfvyTIn07xlNOl
 +OjIs3cfLr7CQvAV7IUcPg5FT5bUwJQemO4ZGPTYh+8HYjS2dD9fUNHLlxTajLiY36
 HPiHiAheVBh9RJoX0Ps4Kae9xhRsv5+jsq1SBcLOK0SLcTtFS9/9u/tgP3WvsJUicD
 /uot+R5q9TCil0IcpP29EiGc0oRB93MvcXskBjmIhT8g6WUgH2juxVjD3hIfkMfn9i
 myl1oAUWRhagg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=jO0XLl/Y
Subject: [Buildroot] [PATCH 1/1] package/flatbuffers: bump version to
 24.12.23
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

Release notes:
https://github.com/google/flatbuffers/releases/tag/v24.12.23

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/flatbuffers/flatbuffers.hash | 2 +-
 package/flatbuffers/flatbuffers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flatbuffers/flatbuffers.hash b/package/flatbuffers/flatbuffers.hash
index ac2c9fc63a..be605f50ad 100644
--- a/package/flatbuffers/flatbuffers.hash
+++ b/package/flatbuffers/flatbuffers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  4157c5cacdb59737c5d627e47ac26b140e9ee28b1102f812b36068aab728c1ed  flatbuffers-24.3.25.tar.gz
+sha256  7e2ef35f1af9e2aa0c6a7d0a09298c2cb86caf3d4f58c0658b306256e5bcab10  flatbuffers-24.12.23.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index 33481eabf8..f526d57ab4 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLATBUFFERS_VERSION = 24.3.25
+FLATBUFFERS_VERSION = 24.12.23
 FLATBUFFERS_SITE = $(call github,google,flatbuffers,v$(FLATBUFFERS_VERSION))
 FLATBUFFERS_LICENSE = Apache-2.0
 FLATBUFFERS_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
