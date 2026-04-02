Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6016D6AAF7
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 17:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DEA981B52;
	Thu,  2 Apr 2026 17:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3_ARz2_HAO2o; Thu,  2 Apr 2026 17:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3F2D81E1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775152733;
	bh=yWt/B7k0lmFTaLUBQzPtHbOGx4XVb9eSetRljAq3jG4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ndZsTaCTP2F0yAmttVy+3labjw7zlj0qOMz4pKZRMvv3KO+eaAA/5bw7TTQP1yOIT
	 YWWqra++G1aMCqhdGVoXJyLnEqGpGi4xGPgA4+kdqibgjBTtPB2+6sOnpupEQOINXn
	 aO0rEbYTcp5lkZOkp7Fh1zrGZuaxYInIaS9J16aq7R87NmG8FwbEPC/MUC9guuRaoD
	 R6slDs6UC6x1Dr5VD7993HaUYDC300gkg9J/X2327tm9NZUkZfRAGVR0RPX2xxHphX
	 QV/M60CiMqk6OPYws2GDgv3t5L/kjW0vSDxSiXEUQUe3Y/uuZTy9XDYmLXlDP8sG0u
	 Trml2w4qII0KQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3F2D81E1F;
	Thu,  2 Apr 2026 17:58:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DACA42D3
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 17:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCDE381E1F
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 17:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YKqmAfKvmEh8 for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 17:58:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8393281B52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8393281B52
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8393281B52
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 17:58:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08f0.dip0.t-ipconnect.de [91.58.8.240])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ADE44A4C1889
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:58:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34242)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w8MJc-000000007b5-0byB
 for buildroot@buildroot.org; Thu, 02 Apr 2026 17:58:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  2 Apr 2026 19:58:48 +0200
Message-ID: <20260402175848.2779597-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775152728;
 bh=l1shzSajm819qpgwjH8M9/bunPtmDQWoeRkXZ8BOaFM=;
 h=From:To:Subject:Date:From;
 b=cRzPFbMfMLwNohEiW3owgaYdx/eDbJ+FaO247WLsBD7zhMeK9qcLkC8QWZXSRStYD
 HADfr2AlegDoEOr8mhi6l6diBMNDcVVQ7IksXzAh6B/xyt412IXDlc3HJOO6v3wseM
 zFKwBKFWLN28eqUQIHeMMARDIvT9DwImL+Xp0ypxvDFXTsG3VmEwYUxJJZJONi13o5
 CAMokeVb0xYCx5kSIAxcUYibRpwz5V1vmYQEjIXu1dA8LVzj7PJrsosQJ29YW92vx7
 c3sr55B+IVf2ikiYw8tCVtJ/SW3GY/8OZASBqWKZuEjoVc59ZfWmwUrWcsOQH3VxiY
 Ec8me+ISLE6Ww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=cRzPFbMf
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-mythtv: bump version to
 21.3.3
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

https://github.com/janbar/pvr.mythtv/blob/21.3.3-Omega/pvr.mythtv/changelog.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index c187fb0054..dde8406aae 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  47d058a9bd960ccdc3352b2fac6f4aeb7587bad50cf1daee20d643c5e64deeb2  kodi-pvr-mythtv-21.2.15-Omega.tar.gz
+sha256  8dbbc12e5b95adeda229a572e24202abda52284f59a96c30798d7d3a855f6a42  kodi-pvr-mythtv-21.3.3-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 9b1b336dfd..9ab39ac092 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 21.2.15-Omega
+KODI_PVR_MYTHTV_VERSION = 21.3.3-Omega
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
