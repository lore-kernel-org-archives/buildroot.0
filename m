Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624ECCDB466
	for <buildroot@archiver.kernel.org>; Mon, 22 Jun 2026 18:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 136EC404C8;
	Mon, 22 Jun 2026 18:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p2YyF896RIr1; Mon, 22 Jun 2026 18:57:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29B3F4048D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782154665;
	bh=Y+hBe7mxD6OabTvFvI9Qjnc6phGLmBkh9DStbkwOqn8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=njV30cajA6FOwyupf7SaOkXs/x+abcqKDZspT/P+JnLmwTeZlqyPSqxFm3qBkA1aN
	 j/VWmR8bPNGzJraaI50BZrVcjRbs+PYcaxNvki9WMXH3D81DNNhDPxmeKmGlau/GGQ
	 +wiUjZIdWspbMS+eLCUuN6scJpiQUVWzg8c9nUmlX/iYWN6KRlFWJeFc9Mmd5/IV3w
	 43s4AtUv4Z6L9IKJLUSp5j2q5WQHAvyeFoovRBeqJbJXZjx2w4TF+6NpByoIQoPVRb
	 EXk1hffeNqvDlkm5UDdqFlfxKcrPsxVHZhzh1YkPzYoPncgEFQ4ZVZU9AwL6eh1gMk
	 dMjs5QFKui8Jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29B3F4048D;
	Mon, 22 Jun 2026 18:57:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B78A0256
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 18:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DB324048B
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 18:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZoeksOYOAg6 for <buildroot@buildroot.org>;
 Mon, 22 Jun 2026 18:57:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.148;
 helo=smtpdh19-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7BEC54048D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BEC54048D
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BEC54048D
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 18:57:40 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id bjpwwXvFaclBZbjpxwSA1u; Mon, 22 Jun 2026 20:57:37 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 22 Jun 2026 20:57:36 +0200
Message-ID: <20260622185736.1439823-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIB0RG3Fkq6W/NsYOx7OkkmgVvZOQLq9TQRO15bIexf2tK9uhYp4e4psVTOLip6eCMbA65Hbkg4TipxLUBpJjwpA6agrNmKllj6pGUlOv/3BfL9CqsMO
 lxYMTkAeg6b5QmvtMokY4DH5oPtiD8Vd7+d2b0oZiV223hXE1xjSbmAIrfJGsQPnuBurmPYV+r7B6eexS3Ko+Wsqgfa/fupQQcrNkSuvvId6bGFdDQtmGxMV
 QiKpBuK7mdRdkIB+jnC22k5NmWiazBtq26IT4bKwJYY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1782154657; bh=U2F35QJj6it+NYW0+e6xugb0bFU4B7No1g5zmQy+XMU=;
 h=From:To:Subject:Date:MIME-Version;
 b=YVP1SxZDTHXEcxNlKwGP16yS8wSh9a3Qy0UHIznj+DxmqHXwU4DE4m+YEdF8VvdKX
 FqfqK72qTt77iW30gMoBUeR8QtNrMEReQ4LlSfUe/28SPsrmO4tSO6klqXBrZ8adFX
 2G4aCkysX6yBNGrzQnvmWdle0X3k3Y/4P6Aibxe3Npt0ahy8q2MlE/h8SV9Ma9Jmcs
 LVKMe8KOE1OqPTaKVsC3Wy03oQvLQDCDr5q/G9K3PLBSQkRYGWz9TVEQu78ENo0cds
 6E/oGr4kdZ5TgAOcXyTo8AuymtnVHCLHxPoFQuoN7PFCFA0HoYGaE+OjXZEDThsrgE
 8p0gdKW9MkUtw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=YVP1SxZD
Subject: [Buildroot] [PATCH] package/liblo: bump to version 0.36
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

Release Notes:
https://sourceforge.net/p/liblo/git/ci/master/tree/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/liblo/liblo.hash | 8 ++++----
 package/liblo/liblo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/liblo/liblo.hash b/package/liblo/liblo.hash
index 8a317cff73..fcbbaf2c47 100644
--- a/package/liblo/liblo.hash
+++ b/package/liblo/liblo.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/liblo/files/liblo/0.35/
-md5  fbe37b3e35f9dcdc4f90acfe513cc679  liblo-0.35.tar.gz
-sha1  1a17c007d9cc5e7a3333420c5d11479ffe0cbe0b  liblo-0.35.tar.gz
+# From http://sourceforge.net/projects/liblo/files/liblo/0.36/
+md5  bc160dfb3d114beba548e30da4db9317  liblo-0.36.tar.gz
+sha1  9874d287d040e6fa838f795afc22bbb9753dfecd  liblo-0.36.tar.gz
 
 # Locally computed
-sha256  9acc4f7e5a24f33472e9acd7e409b7bd6810a46f0a1f3cfeecea22d60f3aae13  liblo-0.35.tar.gz
+sha256  c08d14832e8dcf8f06840405824a4f9611a0cb3daed0198946326c740941c8b6  liblo-0.36.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
index 2717022d58..17c40cbf6d 100644
--- a/package/liblo/liblo.mk
+++ b/package/liblo/liblo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLO_VERSION = 0.35
+LIBLO_VERSION = 0.36
 LIBLO_SITE = http://downloads.sourceforge.net/project/liblo/liblo/$(LIBLO_VERSION)
 
 LIBLO_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
