Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EACC71141
	for <buildroot@archiver.kernel.org>; Sat, 14 Jun 2025 11:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EED4407A0;
	Sat, 14 Jun 2025 11:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JnlIePc4Z2_j; Sat, 14 Jun 2025 11:37:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D776D407F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D776D407F8;
	Sat, 14 Jun 2025 11:37:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D9B13151
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 11:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C056C4078D
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 11:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_AGs9udPxC2 for <buildroot@buildroot.org>;
 Sat, 14 Jun 2025 11:37:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3026C407A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3026C407A0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3026C407A0
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 11:37:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cb5b.dip0.t-ipconnect.de [79.214.203.91])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 565ADA4C01D4
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:36:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57438)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uQPBz-000000004Pn-1jHh
 for buildroot@buildroot.org; Sat, 14 Jun 2025 11:36:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Jun 2025 13:36:58 +0200
Message-Id: <20250614113658.80648-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1749901019;
 bh=kXlZpox4BMZzvrWsAGR183PFiP0j+UmIWzddO3Fd4W8=;
 h=From:To:Subject:Date:From;
 b=vt5v4dnKcgD5EQhWT8qhDg9wlnor4kssbKskrAQfjyK8B7Vxs6Anav4zSe62objh2
 9CDOZYLPI/isWJ0QDvt7TiFXb8t7jYbvNDU5TnqBoyd59BY5rDe0S3alqdP/Yg5Twb
 6yy9deTrlsB5wWx/AiFEaXJVeXPZuFfwG/5hjzuapik1LxuaKbbAjP5coYsGvkPXfO
 w4cWUtuQDBCscypxq8PQmffzzV7d0QbZ4dBcOnMZE0s2esxkkpSe/X3for9uyAkgxL
 Ru2Sd2w6wBq+Ns+l4XqoT3WFP7PbkCl+suizYNOMXtFVw+bAmSRNRYAoflHVntsIrB
 kSjp7L8KXRyig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=vt5v4dnK
Subject: [Buildroot] [PATCH 1/1] package/kodi: bump version to 21.11.2-Omega
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
index 4e02aee58c..c24c90541e 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bbf7fed04150f2e680eeb6e51ab5cdc52b4381702fbe0643fc1f107739f0e2fa  kodi-pvr-waipu-21.10.3-Omega.tar.gz
+sha256  d9b3c79931647b4eac59193583533347500c3c1d9e3becd06a43056c7809a762  kodi-pvr-waipu-21.11.2-Omega.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index b83f6eb3f9..1d1592159a 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 21.10.3-Omega
+KODI_PVR_WAIPU_VERSION = 21.11.2-Omega
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
