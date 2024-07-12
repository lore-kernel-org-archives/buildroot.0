Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B64EC3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 11:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFB34606AA;
	Fri, 12 Jul 2024 11:59:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VbbR2u_iufqM; Fri, 12 Jul 2024 11:59:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC676606EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC676606EE;
	Fri, 12 Jul 2024 11:59:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3513C1BF232
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 11:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 223A34029F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 11:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7rq_vETEYePB for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 11:59:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.146;
 helo=smtpcmd13146.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 59950400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59950400FE
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59950400FE
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 11:59:40 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id SEw5s0QBE8U42SEw5sWq51; Fri, 12 Jul 2024 13:59:37 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 13:59:36 +0200
Message-Id: <20240712115936.493650-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDSTfq4NJDXM/8D2NaUZXRdScjKkGB10D9RzynqxiDwxxQ20/EDpD7itTEwSwi7QAOkuYXfxyoTW1qTZGVlHEL13bbJR7drbcLtyVbNbWvIZFdexd2Er
 5G3U7ebcyJLPnyZMRuxptWDzLreNmMe6w1J6+DPH0MdHIg1KTrD1n7HFggWaWhAI4QgojrxZz7DRWqWh8tBVayGbDgo1z4eOwWaINis6QjxsNflJEyxxO1Bm
 i1dhSrDJdlXLPzT5PE6SscEvoC1LMbRUZS7i809vS+o=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1720785577; bh=iUzdaUDotte6VGlYYtycB3zxUM9EzTnsWyhOn9cAw58=;
 h=From:To:Subject:Date:MIME-Version;
 b=RcWzV6AhlJTHLE8sWigPVt4S3L+5jpd8IjKUw31InOxQF5z9DNaSQnHF+9OK7y6wI
 C0aPlXbWzDjC8dx6h6s9izsRXfeeG4GX9ltuNvg9G+aGJKlnE2LKTmMH8E+bAUWk+i
 qH7MuPy/D0cRI1qfqtU08J/W6cgzoKAEw7nBrOrSBTMbbYFuUyZgi1PstVXseDm7Kq
 rP7PbQ7JK8eqIQ1Lp3EwYmlYg8SdWg5bEpLGgbki72k3A5ufXJci+mHT9WQNvTIaaK
 pQMKQmpJbhtB4H6qatEJE55P2dAmm4QE0KU4Gcl8iTdUiMw8jd8StkpQN89gL1nXa6
 T/rCljriKYyPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=RcWzV6Ah
Subject: [Buildroot] [PATCH] package/esp-hosted: bump version to 2024-07-12
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/esp-hosted/esp-hosted.hash | 2 +-
 package/esp-hosted/esp-hosted.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
index 3afee5aef4..ea18c243d1 100644
--- a/package/esp-hosted/esp-hosted.hash
+++ b/package/esp-hosted/esp-hosted.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2c87d68c2b74dd000b128696abc0cdc76d22abfefb6581ff61b7d7bcdaab51f5  esp-hosted-b1422afc4fe0a2ea1ffd6b5459edddc4d968ee71.tar.gz
+sha256  78ab4f10ddce76749d36511591a0a7bb2a982db96ac1ea1b02b5c35dab725d8c  esp-hosted-91b093365cc58214532b976dd8749f65523d1e6d.tar.gz
 sha256  ed57d96d27be775b22f9571d3724ef84e0d0b8f24b805ec7f87a32189de19a9c  LICENSE
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index 70ca7bf572..4efefc3023 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ESP_HOSTED_VERSION = b1422afc4fe0a2ea1ffd6b5459edddc4d968ee71
+ESP_HOSTED_VERSION = 91b093365cc58214532b976dd8749f65523d1e6d
 ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,$(ESP_HOSTED_VERSION))
 ESP_HOSTED_DEPENDENCIES = linux
 ESP_HOSTED_LICENSE = GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
