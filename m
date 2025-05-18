Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8AAC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 17:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BFD881E8C;
	Sun, 18 May 2025 17:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tdolv1hYL_sF; Sun, 18 May 2025 17:45:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7325981C56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7325981C56;
	Sun, 18 May 2025 17:45:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C1792204
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB9CA60B4B
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DzcQyqn3231D for <buildroot@buildroot.org>;
 Sun, 18 May 2025 17:45:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C9713606D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9713606D9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9713606D9
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:45:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a067b.dip0.t-ipconnect.de [91.58.6.123])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C2FD9A4C2059
 for <buildroot@buildroot.org>; Sun, 18 May 2025 19:45:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60108)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uGi4L-000000003dE-0HVG
 for buildroot@buildroot.org; Sun, 18 May 2025 17:45:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 19:45:01 +0200
Message-Id: <20250518174501.2148919-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747590301;
 bh=2/A658TQBtDTEDMB693pmcU6gV82oHeocA0T3Lq9kdo=;
 h=From:To:Subject:Date:From;
 b=DWAtW3pbIE1lZXTiliXijO9ZwVx//fUNy1JlBT/oAydN05GTrQogJB4YRj6T9jLno
 tC0ig4c04//UGd8mGPwMtAtQmN1PJl1EUeSLQaYbls3wWhYLZd+QM20axgjXUiiu6s
 KNFi+wS45fo4iFlsLnf0eBSG7w6P8+cunTVlEQcOr7EW1SfTtdQC706Up6UTBlPipn
 1HjEVkBneiNyoo4I2zS1xulCoDM+LPgviH+KYWziBb3kIPguIA9mgRfQnaTQ3r/iGo
 KirVFXW5bgDBZKrcS68UUyt9/B49EdzNHT6GNUnEcdul1nYkNPwZDzYCzUOY5ok6Qj
 AwsEi+m7pHiSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=DWAtW3pb
Subject: [Buildroot] [PATCH 1/1] package/gkrellm: bump version to 2.4.0
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

Changelog:
https://git.srcbox.net/gkrellm/gkrellm/releases/tag/gkrellm-2.4.0

Updated license hash due to copyright year bump:
https://git.srcbox.net/gkrellm/gkrellm/commit/b6bc5b379564a5df72d3b047df655652976937fb

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gkrellm/gkrellm.hash | 4 ++--
 package/gkrellm/gkrellm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gkrellm/gkrellm.hash b/package/gkrellm/gkrellm.hash
index 88624c3366..27ba276efa 100644
--- a/package/gkrellm/gkrellm.hash
+++ b/package/gkrellm/gkrellm.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  1ee0643ed9ed99f88c1504c89d9ccb20780cf29319c904b68e80a8e7c8678c06  gkrellm-2.3.11.tar.bz2
+sha256  6f83665760b936ad4b55f9182b1ec7601faf38a0f25ea1e4bddc9965088f032d  gkrellm-2.4.0.tar.bz2
 sha256  691de85c3c6eeda5b6982c751548575344739ce4b4418d78905e599359f6c435  COPYING
-sha256  b81e0c0c3fb2a58f25377388484a1f729abb367f5f2b43e335a6ed3272ce8536  COPYRIGHT
+sha256  a4bb0b604fe7d40ca4469ffd5e2e2de70ff8ece43e47980ab2c8962d5e913330  COPYRIGHT
diff --git a/package/gkrellm/gkrellm.mk b/package/gkrellm/gkrellm.mk
index 27a87be190..165b71c7c8 100644
--- a/package/gkrellm/gkrellm.mk
+++ b/package/gkrellm/gkrellm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GKRELLM_VERSION = 2.3.11
+GKRELLM_VERSION = 2.4.0
 GKRELLM_SITE = http://gkrellm.srcbox.net/releases
 GKRELLM_SOURCE = gkrellm-$(GKRELLM_VERSION).tar.bz2
 GKRELLM_LICENSE = GPL-3.0+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
