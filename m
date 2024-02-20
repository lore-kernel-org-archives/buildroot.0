Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567C2C48BC3
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 18:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1877C40012;
	Tue, 20 Feb 2024 18:07:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xe7C2woNj0M1; Tue, 20 Feb 2024 18:07:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF850414C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF850414C1;
	Tue, 20 Feb 2024 18:07:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 059321BF475
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 18:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00847608BF
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 18:07:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t0DyfioGnmys for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 18:07:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CE3D560717
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE3D560717
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE3D560717
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 18:07:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 06288A4C028C;
 Tue, 20 Feb 2024 19:07:09 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50678)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rcUWK-000000004xf-3GEV;
 Tue, 20 Feb 2024 19:07:08 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 20 Feb 2024 19:07:08 +0100
Message-Id: <20240220180708.55442-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1708452429;
 bh=vJLOINT5fODmdN6APl2qcl+MMI+riQscHMbsykTiuAg=;
 h=From:To:Cc:Subject:Date:From;
 b=M/51aiGncjhMdOOVn+AkbCeyGE7b2z4aXUU7rwVAbbDUu9YFkNSV7cXjSgDFuL+rb
 R5rc/x4PY3J2T6OVO9cu2gJcQa+jvdtbuOaOcDGd5W+JT9oSKpyMdixqZk5luiKRwI
 Zh6vQWvKzFTTH0VALDPRnPbVV65+aU9ulMpaM2Fcr/jhugdAg3fbKutSF0HTRXmyMM
 Yfafrjn7XYy0d3FqUF8X9ISf9JsEm6uaKY5AcgGn+gGQ3VLdlyNW3870cgIOFU78P8
 xTHiMRWqBBtnTwgtx/HhAgL62KXg1K92PV1A78XRb3ULqni+lItqToHdJVbzLdH4Tn
 bkkSvDPI7mKOw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=M/51aiGn
Subject: [Buildroot] [PATCH 1/1] package/unbound: security bump version to
 1.19.1
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
Cc: Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://nlnetlabs.nl/news/2024/Feb/13/unbound-1.19.1-released/

Fixes CVE-2023-50387 & CVE-2023-50868.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/unbound/unbound.hash | 4 ++--
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 91e1d82dd2..843026abc7 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,5 +1,5 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.17.1.tar.gz.sha256
-sha256  ee4085cecce12584e600f3d814a28fa822dfaacec1f94c84bfd67f8a5571a5f4  unbound-1.17.1.tar.gz
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.19.1.tar.gz.sha256
+sha256  bc1d576f3dd846a0739adc41ffaa702404c6767d2b6082deb9f2f97cbb24a3a9  unbound-1.19.1.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index fa7884e937..5128d0e420 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.17.1
+UNBOUND_VERSION = 1.19.1
 UNBOUND_SITE = https://www.unbound.net/downloads
 UNBOUND_INSTALL_STAGING = YES
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
