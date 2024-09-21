Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3334DCF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 19:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86EA24071E;
	Sat, 21 Sep 2024 19:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gtoCvMqlw652; Sat, 21 Sep 2024 19:03:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5574D40720
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5574D40720;
	Sat, 21 Sep 2024 19:03:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC88A1BF59E
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 19:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC9C68129D
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 19:03:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qafsQfAZIBSq for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 19:03:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0FDD682060
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FDD682060
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FDD682060
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 19:03:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cae1.dip0.t-ipconnect.de [79.214.202.225])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 29D88A4C2423
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 21:02:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45678)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1ss5Ni-000000005ko-2AVI
 for buildroot@buildroot.org; Sat, 21 Sep 2024 19:02:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 21:02:58 +0200
Message-Id: <20240921190258.3650726-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1726945379;
 bh=F7f+NyxK5h+b0IR8hlzFxlYTaq5R5t3W/f2T2gR1Dn8=;
 h=From:To:Subject:Date:From;
 b=qTQJYfXxwii9K5i7OqLYU0gZ36TNDA9r06zp67h2XAWftPGwUNM79XGI+Cx9rBGvo
 pe5DgBP3fVsj0cUx5ps1eu588GsYa8ddKEgb9Iitedv52cbYAkX9zJa9Qs5cYhdQFX
 NBr3bGP4C4N2Qk0sqHZ4SoTNLukAesnuxXPKW/y09QmdSUcXkX0e7U9zo64EdEZe0n
 YB6eYPf5fEKFao7LRTh9SgH7vNcp3pujFA844VmU/tYRRJLqHZ81LXgVQCEbjm5fXq
 vn8oI2io878vqYdl3TdKIE3unIdzOMZVIPXcidj7rHoL5m7NOPXGB+DN4hqemD3CQ9
 +mZFiR1K48UiQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=qTQJYfXx
Subject: [Buildroot] [PATCH v2 1/1] package/kodi-skin-confluence: bump
 version
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
v2: bumped to current commit, fixes teletext button broken in v1

 package/kodi-skin-confluence/kodi-skin-confluence.hash | 2 +-
 package/kodi-skin-confluence/kodi-skin-confluence.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.hash b/package/kodi-skin-confluence/kodi-skin-confluence.hash
index 487aa7e5f1..3cf17c5e13 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.hash
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  816010973378faf7ad45e8b7fb97e190500fd5f8a6adaaea032f8c877424113c  kodi-skin-confluence-ae94e6e92c1c67861701e6e8a70f9ccc4dca9f13.tar.gz
+sha256  61bded39800f751f4285c2e5bca26d4a4064fbeb3f90c253697b5aef07b1b328  kodi-skin-confluence-34e77d0122eab8c6e3fb502c623ba29749b19031.tar.gz
 sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.txt
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
index 59e5f10875..dcff19793c 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.mk
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SKIN_CONFLUENCE_VERSION = ae94e6e92c1c67861701e6e8a70f9ccc4dca9f13
+KODI_SKIN_CONFLUENCE_VERSION = 34e77d0122eab8c6e3fb502c623ba29749b19031
 KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
 KODI_SKIN_CONFLUENCE_LICENSE = GPL-2.0
 KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
