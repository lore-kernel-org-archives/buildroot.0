Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA06EA852E
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 15:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8472340C1D;
	Sun,  8 Mar 2026 15:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G8kzveivQEjk; Sun,  8 Mar 2026 15:54:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 935CF40BEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772985242;
	bh=DnVExGV9FPDZ4hO7oJnBVR/OOVC+zRbzaATAHCzWqO8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=huk8uVMohiUoryTH0S1GEoyTMrhzHSnCht7JfYT6iC0ZPdLVTbZQTA5yq4Vk0WnG5
	 o037TM5Qi8KoEZ7pKc0UV56DqQIBYGd3e+RtsQaVLKHyTiIo2dVReHOJWLz6jpp7EA
	 NOLT6hylYrQOticN29mTjpmqerxBHoi05uKrjherP4cfi0ir0rBSm0n3re20jXmtho
	 H7x3bmksEPDw4JSPIwPBnwll2NfEdbTisYNsEcU9rtviIB5+ZQmdBFXISiNX5xLKtr
	 7YkBt5CNag9yI0qENSCK+TAWB3qVsHoUqL3NBuy9JTF8PQIPnIFuLrYXr69aIVUoR5
	 DduoOT74ik80Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 935CF40BEC;
	Sun,  8 Mar 2026 15:54:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7670B223
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 15:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6477760EE4
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 15:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vld8sBRx_OFx for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 15:54:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ED4F660DB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED4F660DB9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED4F660DB9
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 15:53:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c66e.dip0.t-ipconnect.de [79.214.198.110])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4B87CA4C3831
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:53:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59814)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vzGS3-000000000Jf-3J8I
 for buildroot@buildroot.org; Sun, 08 Mar 2026 15:53:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  8 Mar 2026 16:53:55 +0100
Message-ID: <20260308155355.2566264-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772985236;
 bh=9unYJPlnOcMyQDMHr558Z7FV1/u3/Pl/91ct2geQpwo=;
 h=From:To:Subject:Date:From;
 b=oPjOKXCET6eKZ8B1rvZM65Av0PgkwQ8JAFwzbD0CxONQcISJbd7tRots4ZP0KFluH
 0tBJKBvOLCNd1lWu9f01UjniE2EoqybecoVr4hZpJuPzE1EWqxi3DaKdmPEEfur1Qj
 HlPV4c4CfpIEBQrG2so0CGLCeUbRbAO9NVLTPPKCFCNurekK5cz1Uu7vDw8DXdPRjm
 6fnhJX0K4JDnLGif/A65bFts+ZxipN6S6TAsBQ/2hZCKG2NKAHBFhUyRkq/o5xtjzU
 234dNuJXnAkTewR/Eg/frEoXgMVeC3pRrht/9AAvxx0DdtRW1dm88MrZ0J4Kt9cTRU
 SDZCduI4BcNCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=oPjOKXCE
Subject: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.405
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

https://github.com/vcrhonek/hwdata/releases/tag/v0.405
https://github.com/vcrhonek/hwdata/releases/tag/v0.404

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index eee3eaa555..5d0014d4eb 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  77d0a69e5558d16d33bbb510a09093deaf11c882baf9ef6ec5f18a8ef96e2c13  hwdata-0.403.tar.gz
+sha256  13605519e72e46aa13d5eede1901a07a6c83cd25ef866a86e7458047b5c81ce5  hwdata-0.405.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index c185358bf6..879eb51322 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.403
+HWDATA_VERSION = 0.405
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
