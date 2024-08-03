Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E01C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 10:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41EF34023F;
	Sat,  3 Aug 2024 10:49:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BErMJmI3uWbY; Sat,  3 Aug 2024 10:49:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02F6D404EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02F6D404EF;
	Sat,  3 Aug 2024 10:49:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 722231BF37A
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A13081ECF
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:48:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkjfCW6l28Z6 for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 10:48:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AF83581EC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF83581EC8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF83581EC8
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 10:48:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfa9.dip0.t-ipconnect.de [79.214.207.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3DDB3A4C0327
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 12:46:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48726)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1saCHo-000000003Oc-3V6O
 for buildroot@buildroot.org; Sat, 03 Aug 2024 10:46:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Aug 2024 12:46:49 +0200
Message-Id: <20240803104656.2574228-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240803104656.2574228-1-bernd@kuhls.net>
References: <20240803104656.2574228-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722682017;
 bh=tTbBqbKMtSu+5bNp8e7R+lg5NpG11tMO1WD6ZV9/WkI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=m4zfl85DBR+ky3V+4ct9hCTLslnWN3ACCKsUShGS0sHNGL8EDpypZG+WtzoyxOFn8
 e8H1CaMQzPUmeWmHLVWzDoNaJxhUNqEFZyMqRT1BNe0GvUMrMu3UjmBYMSfiLRXeJv
 W/YQLUuzfMhzqOYLHp0pvJMEwxH7Apu2KFIba/QyQTAzGRfWuoqQDVDP3R1dxQGrQ4
 G3L1mpVxDT/weWHeigruYKRTtxY71paqj7tyKJWN2Kcjn3LlZKJ5ZDpviYbpfhxqne
 iDlgPSuGm4XjUzKfreRAisOJlFoWseofr+lea6OKBE9MiCzZBb6WorUHNoq0xAxApa
 3nKvFmBkBURNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=m4zfl85D
Subject: [Buildroot] [PATCH 08/15] package/kodi-pvr-plutotv: bump version to
 21.3.1-Omega
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
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash | 2 +-
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
index bb4826ba66..75f9ed0398 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fb026664222af3415bb805c4b2c19d1893f9e05a7d089c2d720a495131d1460d  kodi-pvr-plutotv-21.3.0-Omega.tar.gz
+sha256  468d5ad4703c36d73dc8d08008d19c0e9b44474b86b4d5e618b97c3003214b6e  kodi-pvr-plutotv-21.3.1-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
index 885ef03e0d..d363f206d7 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_PLUTOTV_VERSION = 21.3.0-Omega
+KODI_PVR_PLUTOTV_VERSION = 21.3.1-Omega
 KODI_PVR_PLUTOTV_SITE = $(call github,kodi-pvr,pvr.plutotv,$(KODI_PVR_PLUTOTV_VERSION))
 KODI_PVR_PLUTOTV_LICENSE = GPL-2.0+
 KODI_PVR_PLUTOTV_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
