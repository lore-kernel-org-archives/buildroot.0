Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259DBC25B4F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 18:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF1166080B;
	Sun, 12 May 2024 18:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5KICouXNi3he; Sun, 12 May 2024 18:16:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE5B26083D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE5B26083D;
	Sun, 12 May 2024 18:16:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8398B1BF2F3
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 18:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F6664170B
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 18:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 69mkTFZ3YUWS for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 18:16:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6EF4041705
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EF4041705
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EF4041705
 for <buildroot@buildroot.org>; Sun, 12 May 2024 18:16:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c36b.dip0.t-ipconnect.de [79.214.195.107])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8442AA4C48C2
 for <buildroot@buildroot.org>; Sun, 12 May 2024 20:13:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48974)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1s6Dhs-000000005zr-3Eqr
 for buildroot@buildroot.org; Sun, 12 May 2024 18:13:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 20:13:48 +0200
Message-Id: <20240512181356.2106142-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240512181356.2106142-1-bernd@kuhls.net>
References: <20240512181356.2106142-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1715537637;
 bh=K+OWmZwXiLbCZRhwdNPKhMSl7gIJ/bqEl3VGfACOHko=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LnYApI46pU3lGEkmsRZgBe+seldtvxTASc66+NqVnfdtXEc1XsSL4Rx/4zxXZGuK9
 CmM2o1mhlFNfmZElXLvDa3DQ+YXVAPhWt84VS0UqqgrJoF3+yz5+FQAiOUeaxjVy6F
 SVxcLgoYefrjI6deY3SxvV8OSnm2/DlZ6oM9x59ml7NJWJnNFJ9XQbsHNc3pLqu1mA
 8ZwXN/y4VSN+5FkqMB+z9GCK6Uk4nz/8rgEWF7+cWn5d2TO/GIAHK4cR33NwAMZmbm
 VI71ZtJ3IWLNZgpADSQZhTLF9PnFZQ2Icyk9WDaSM+730zhvVnzoZfz5WaBM/Yp7mW
 KJQCGiQaUBZVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=LnYApI46
Subject: [Buildroot] [PATCH 14/22] package/kodi-pvr-pctv: bump version to
 21.0.1-Omega
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
 package/kodi-pvr-pctv/kodi-pvr-pctv.hash | 2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
index a0c6a49e73..bc79a194de 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  671dc89b33d4be8b895d44f74856f8ec49cf8cd174f9f7e502b5a5a6951658d6  kodi-pvr-pctv-21.0.0-Omega.tar.gz
+sha256  d695032343a096c214a767f8c13d072035dc38cbda2a3305a91bc40ee7cb7770  kodi-pvr-pctv-21.0.1-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
index 82da3a70f8..d7b7b59b4c 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_PCTV_VERSION = 21.0.0-Omega
+KODI_PVR_PCTV_VERSION = 21.0.1-Omega
 KODI_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI_PVR_PCTV_VERSION))
 KODI_PVR_PCTV_LICENSE = GPL-2.0+
 KODI_PVR_PCTV_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
