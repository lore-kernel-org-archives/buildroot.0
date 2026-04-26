Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD69FF885C
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 10:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9A9E61AE1;
	Sun, 26 Apr 2026 10:28:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1LOLi_VYvK_c; Sun, 26 Apr 2026 10:28:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9F8C61AEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777199329;
	bh=wOwAHQLH+x0fQniVybR5zZssQhRoKOHr+AgYdhtGn4E=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=D0OY37iSuRrTyZN6AT5CtFphJdvD0nAOyYiFIX2fzH5HIsshfjCREZMZKh/mZPZtY
	 A0LznNraXPaYh7vNJvsHwAAY/JkoiD/GVLYNhGc2xOOsY4Tmk7krqKx+83kObjh//Q
	 r7SN/5VY1ddKieugR2azO29aMbNoteW6Z5OS5b+zmlTVtnhi0z3/gtpL6NxFAbfj03
	 BXDXzK/F2KFbSKySUPX2xK+H4hvTrQZfaGvrbRUvtTTcQuPxDmRDCP2YoLW8hrUMzu
	 j0rUJnWE+4iEyRte1MdUCYanbUW1kDO2aYtkauI/bB8lqgXJeCrkX2ftNO65JFcJJr
	 RcwTcVtPvwMBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9F8C61AEB;
	Sun, 26 Apr 2026 10:28:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A86D1369
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 10:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E97E42848
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 10:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dSlOpIN8EziV for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 10:28:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7E8A54282E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E8A54282E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E8A54282E
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 10:28:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7853DA4C08E5
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 12:28:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55228)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGwjE-000000005IZ-39Kr
 for buildroot@buildroot.org; Sun, 26 Apr 2026 10:28:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 26 Apr 2026 12:28:45 +0200
Message-ID: <20260426102845.3104064-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777199325;
 bh=TsHYnK6AwYIHP677K0OGNhKQbnze/BSDHQPZxK51vgc=;
 h=From:To:Subject:Date:From;
 b=cw8SHVtUsiwAa7FufmzcWHh73hkCyyOzEUAbCIX/PlqfBCqvbH5tvlciKsAI0Z3t+
 muGGkZ4xTBhCMukHTPhwmQQNbpINaqiucV/Bw40fsa92QzpYNlQtRGqQpoo/eavwm8
 NE85ux7ezhLxyw8iAL/Wvclv7j9ZkI5FVqdD5xdvviMAJMHGaFNJyGr1Uq55MMFzvj
 NHtNcgn1S9eN/zPERoQrzuWWtZiv4iZ6ZtLfk9ZG1fNWCyXattHDdsxUmr0alUOLr2
 +HLPY0loMtBcwA5davmfhPGj2KOLM6K8Dgwmj1FGi+P/BLx9zFh9p/7denix2Whn2g
 7DzzgepLZ0/sQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=cw8SHVtU
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-mythtv: bump version to
 21.3.6
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

https://github.com/janbar/pvr.mythtv/blob/21.3.6-Omega/pvr.mythtv/changelog.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index 004ad86448..4e170fc10f 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  37e7ffd44707d135fd5512d560fce34ad02880410142df1b3b607a834634bc99  kodi-pvr-mythtv-21.3.5-Omega.tar.gz
+sha256  3ca903e325edd82d86ece135f2d669562c7bbeb9399c6605c91e920c32975512  kodi-pvr-mythtv-21.3.6-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 063b39f582..a37328fedf 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 21.3.5-Omega
+KODI_PVR_MYTHTV_VERSION = 21.3.6-Omega
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
