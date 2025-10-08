Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BA9CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 21:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3BA061009;
	Wed,  8 Oct 2025 21:07:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JGRA2p6PBu0W; Wed,  8 Oct 2025 21:07:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0252361003
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0252361003;
	Wed,  8 Oct 2025 21:07:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D1C7119
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 21:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51EB140208
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 21:07:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-SjHcUPQvOT for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 21:07:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 96522400B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96522400B6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96522400B6
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 21:07:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b31b.dip0.t-ipconnect.de [84.161.179.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0D665A4C5FCD
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 23:07:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37828)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v6bNc-0000000018Y-2SMP
 for buildroot@buildroot.org; Wed, 08 Oct 2025 21:07:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  8 Oct 2025 23:07:24 +0200
Message-ID: <20251008210724.987021-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759957645;
 bh=haHT9hnjHlGH+g9y9RjV7HKJ8IX+iI2O/BSDRCYYMVs=;
 h=From:To:Subject:Date:From;
 b=IEAS0k3WgriA9NFOlEmJifq5Mye6vhVtMfhrNB5S2g4TbNvbJGI14TDvzQpWhj8YJ
 opDkHMq8aJFdBrSmCE90gWF5QHqlSw10Zd/Xb9ziZbVmEUgv87QPq2J6fZ7vsa2++d
 CmynWxNlc9iz1oNGrVxQto9F6gHH7d6GppaFDwLK1tOY6Fvt/mDh2lvaNBdEtHFI8E
 8MPYGLQ8sBNLDv6ZGSpvuHPSXQ9p/kjw68GADs1YebeqDjbynQmpiO5cFrAScFl1xj
 PdlOJ1yCb5QDP0OHKIgwYOxs2sHh0ejo5gdTDcpA1kK42ceGVw7eRg1wE4DIZFfHLD
 x7AY2LKDpj77w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=IEAS0k3W
Subject: [Buildroot] [PATCH v2 1/1] package/libsoundtouch: bump version to
 2.4.0
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
v2: removed switch to CMake due to lack of mmx/sse auto-detection
    (Julien)

 package/libsoundtouch/libsoundtouch.hash | 2 +-
 package/libsoundtouch/libsoundtouch.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsoundtouch/libsoundtouch.hash b/package/libsoundtouch/libsoundtouch.hash
index 125bcd47a5..853f3b90bb 100644
--- a/package/libsoundtouch/libsoundtouch.hash
+++ b/package/libsoundtouch/libsoundtouch.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  43b23dfac2f64a3aff55d64be096ffc7b73842c3f5665caff44975633a975a99  soundtouch-2.3.3.tar.gz
+sha256  3dda3c9ab1e287f15028c010a66ab7145fa855dfa62763538f341e70b4d10abd  soundtouch-2.4.0.tar.gz
 sha256  84c6d82dc7de80f5b73f231edfd3ddc5b53513908117452bfa37ea36bb4b7e0a  COPYING.TXT
diff --git a/package/libsoundtouch/libsoundtouch.mk b/package/libsoundtouch/libsoundtouch.mk
index 099539250c..3140d890f5 100644
--- a/package/libsoundtouch/libsoundtouch.mk
+++ b/package/libsoundtouch/libsoundtouch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOUNDTOUCH_VERSION = 2.3.3
+LIBSOUNDTOUCH_VERSION = 2.4.0
 LIBSOUNDTOUCH_SOURCE = soundtouch-$(LIBSOUNDTOUCH_VERSION).tar.gz
 LIBSOUNDTOUCH_SITE = https://www.surina.net/soundtouch
 LIBSOUNDTOUCH_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
