Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A81DCD4F26
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 14:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00F68854FD;
	Fri, 19 Jun 2026 14:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9KBKTFeSomwh; Fri, 19 Jun 2026 14:30:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D55B85325
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781879429;
	bh=H6LR7dnoUIffJ+KVF6dYMmS75VRt57BGe+TqZPUTWuw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FSLhBlLO4CyPVDhzJS5N+J/D8g808xsmuV81oagxQN9z4WZeO1M52nyofKroRIfYT
	 MYJzDsd1kcCiUoCSKixg9q0vG6nC9YWZh+c6yO4AEHN9t+CEBx01cEAvLWkucPsqJw
	 E92RZ3JHRZwI20IZJ9Wz1rXRwAUQEeR/q+oeO14HJchamfjRj7N1jAMpjYBrRid3vb
	 kvN0jkr7qc6ebZArnpOJiV+n1Q1p6dFOIFRWj8apvBdKjtoCKn5HqgnnPCMkpgQ+jM
	 EOZivOoHl4GrnZSljcp8rwXGB1IvzwyO3WnsHvhTSx52I9KJtk2gpVacJKlETqgGEK
	 nkQo281ZU5mbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D55B85325;
	Fri, 19 Jun 2026 14:30:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 51312367
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 14:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 373026F645
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 14:30:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ywlCZuNEFca1 for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 14:30:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 08DAF6F622
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08DAF6F622
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08DAF6F622
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 14:30:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a031f.dip0.t-ipconnect.de [91.58.3.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A41CEA4C0F1F
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 16:30:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49364)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1waaEh-000000001db-496v
 for buildroot@buildroot.org; Fri, 19 Jun 2026 14:30:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 16:30:24 +0200
Message-ID: <20260619143024.3664850-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781879424;
 bh=CTA2uoquiDhCu/FjySuOJKcoKs0hznIfDZEzJRJJXQI=;
 h=From:To:Subject:Date:From;
 b=hjFCrKjGyBExfcc+x/hu2bwDPjkgyYS52q5GDw4fie8c2GMC7Ui7zirhhnHIErk5j
 aoGiK/2fvVVMIIivo+QxmidFIwA9tw0V9DvOQk9kupyMU5fklrrMJc5H+GgS4OSHpm
 1oFQrk10Y6yYxLKjF959GaI9idLx6sEiKM859WotTLt9y7d8di3jJQqViLCAQ8SFDF
 Lv3tn0GUk1nsjXApSGlgTmDEm6c0CNkV4TCO7Ritbxdnu7N15HbFtsa2Wp/4nRZnZA
 K2EYeGat2Lz8qHZWE38go+DuGNfNCy0h8sG5Kzk1FdKO1bmKtJ1SwVzssHYQ2+DDGJ
 VisPzEEimu2Rw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=hjFCrKjG
Subject: [Buildroot] [PATCH 1/1] package/alsa-lib: bump version to 1.2.16.1
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

https://www.alsa-project.org/wiki/Changes_v1.2.16_v1.2.16.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/0115e3c2ef3952dba6db5367ec30514c0831e6af

 package/alsa-lib/alsa-lib.hash | 2 +-
 package/alsa-lib/alsa-lib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index 9544f1cafa..9bb686583a 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  122b1e3166d55fe19bcde656535d7a36f2ab10e66c72c6ad2f43f20ffded0a96  alsa-lib-1.2.16.tar.bz2
+sha256  f740db7f488255944ffd4428416ee3390a96742856916433df468c281436480e  alsa-lib-1.2.16.1.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 2530dae9db..b6000b3cf3 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.2.16
+ALSA_LIB_VERSION = 1.2.16.1
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
