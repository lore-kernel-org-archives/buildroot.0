Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A79C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 15:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D843240414;
	Sun, 11 Feb 2024 15:14:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ib_oGSWO2CkY; Sun, 11 Feb 2024 15:14:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9570F40492
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9570F40492;
	Sun, 11 Feb 2024 15:14:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B46601BF403
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB99140414
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:14:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lhxLqRJhqYXM for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 15:14:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3D95640492
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D95640492
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D95640492
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 15:14:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0D930A4C0132
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 16:14:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52392)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rZBX8-000000005CX-3RNa
 for buildroot@buildroot.org; Sun, 11 Feb 2024 16:14:18 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 16:14:18 +0100
Message-Id: <20240211151418.1615015-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1707664459;
 bh=MOqJkPDeeyEHIbR6HFsgJdjYDFH5GJJazNu3wATwzjE=;
 h=From:To:Subject:Date:From;
 b=N0/pz3pzHV/BSdVAbM9MOlPZxiucEQ47jdyvKZlufn3DET2y4FO/C9rUucpPHNCUW
 oD8QWyMzEewitJTQ2TPDF9GEDn/o/7RMQbFQThWQwSBfRqwqmj9pUEYkc9nUb1+pM9
 cM7ySUTHDQvJP7hbggTJWjvg5vv8liQYNUXgEklsppwEdgnv9Ls37cQ8cOuc8ZwgIS
 Nb8rh2V8Ueh/4wV6gK5EOhKghEsXbsBbLBqF9c8nTKvyTv58VFA1tnFf8N5cCOdYEu
 EfZEXCLuYSJ2DhoGsPP13XGTp0W3MS1UukwFORpHCK8tGJWkT6EehxOZsBACnGu79d
 oKCbG+NevaZ7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=N0/pz3pz
Subject: [Buildroot] [PATCH 1/1] package/clamav: security bump version to
 1.0.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://blog.clamav.net/2023/11/clamav-130-122-105-released.html

Fixes CVE-2024-20290 & CVE-2024-20328.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index cb4f67156c..cd03a11840 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  3d6b99644874558b7de5faf9b340737a9bbc1083878fcd95a49f989c7c980146  clamav-1.0.4.tar.gz
+sha256  aa67ee9679f747af3c492353d768464c27d614b3fed62eb7f988b6776d4aedbb  clamav-1.0.5.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index c9012261fa..7c6dfce6f2 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 1.0.4
+CLAMAV_VERSION = 1.0.5
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
