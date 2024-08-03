Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEC1C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 10:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F9CA406E9;
	Sat,  3 Aug 2024 10:49:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrqH84P5rBp8; Sat,  3 Aug 2024 10:49:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F32D0404BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F32D0404BE;
	Sat,  3 Aug 2024 10:49:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 476C51BF37A
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3504340118
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZKo_simua9g for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 10:49:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2670A40198
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2670A40198
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2670A40198
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 10:49:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfa9.dip0.t-ipconnect.de [79.214.207.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B5027A4C0336
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 12:46:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48726)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1saCHp-000000003Oc-1zzv
 for buildroot@buildroot.org; Sat, 03 Aug 2024 10:46:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Aug 2024 12:46:56 +0200
Message-Id: <20240803104656.2574228-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240803104656.2574228-1-bernd@kuhls.net>
References: <20240803104656.2574228-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722682017;
 bh=zTx4Y1DNCWDMj7kKomVmQFHJU5R4TA4Z3B5rMIYM3RU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kQSApp1Qq3bsAGuBo1uSRJoUx2ggXREdziyn30R0FYG3YXV4Vdra2ACmajdcq+lRU
 4DQxGrnRrP/Iuxij5/W2k/fq6XDISgxdcFDnj0fXcB9Y2wRXr7IrsxGsmnvbGy795E
 tCRdKZfcDg5mijaR5f8KA46RoKqfkbI3MqIBPRRwvMgVfkhm/eUJRThJzF3MMsVyTc
 Q7Wq3thStjTsPIwox89lU1hxgAA58YaqZFOcgeMPcxeDAG6Mhvt/oDL83xMD0gW9cW
 V+6oAwOeNxhLoFphhOpzH/uHUuKl2Wp6raeatLP40fhL7kceQBR405oFtJh2KU2HjN
 +qAhuWDDOuMvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=kQSApp1Q
Subject: [Buildroot] [PATCH 15/15] package/kodi-skin-confluence: bump version
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-skin-confluence/kodi-skin-confluence.hash | 2 +-
 package/kodi-skin-confluence/kodi-skin-confluence.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.hash b/package/kodi-skin-confluence/kodi-skin-confluence.hash
index 482da25cf2..ed53dd5015 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.hash
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d66fe75a261c6c2b9ac2923dc51d469ccc1df45a2462188e6a024a87bbe27311  kodi-skin-confluence-7bd4a396c492adb2d424d7f51d415fb565cda358.tar.gz
+sha256  85550f949598d3904bcb77e3d2e6b7fa2d0d9334a7939b964a94d98ffe0e36ea  kodi-skin-confluence-b2f2fe26ab47ca3c317d5d7927687e41584e46ed.tar.gz
 sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.txt
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
index 03aa4261cd..2898c04539 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.mk
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SKIN_CONFLUENCE_VERSION = 7bd4a396c492adb2d424d7f51d415fb565cda358
+KODI_SKIN_CONFLUENCE_VERSION = b2f2fe26ab47ca3c317d5d7927687e41584e46ed
 KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
 KODI_SKIN_CONFLUENCE_LICENSE = GPL-2.0
 KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
