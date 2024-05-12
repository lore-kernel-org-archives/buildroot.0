Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685BEC25B4F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 18:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 399776083D;
	Sun, 12 May 2024 18:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RLgQ5N8wnR5i; Sun, 12 May 2024 18:15:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4082C60862
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4082C60862;
	Sun, 12 May 2024 18:15:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7AFDC1BF2F3
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 18:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74D6A836FE
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 18:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zV0ZOlcy1mGw for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 18:15:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B8EE783696
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8EE783696
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8EE783696
 for <buildroot@buildroot.org>; Sun, 12 May 2024 18:15:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c36b.dip0.t-ipconnect.de [79.214.195.107])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 22B37A4C48BC
 for <buildroot@buildroot.org>; Sun, 12 May 2024 20:13:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48974)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1s6Dhs-000000005zr-1h4d
 for buildroot@buildroot.org; Sun, 12 May 2024 18:13:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 20:13:43 +0200
Message-Id: <20240512181356.2106142-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240512181356.2106142-1-bernd@kuhls.net>
References: <20240512181356.2106142-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1715537637;
 bh=EtvQ2rGzriK4o86RfcW8EMjKSIvcVdGdP1/SGECJCeg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ulcVlsPC30CIwGWFKksknlwpp23ClwwBcEymDjdokkNjKszotuKmcUCxySwL/oD03
 FutUfLnjzJxq6WZ2BbvGWMgmOB1xb/B+WVQ1lDlhpeQ2PhRcFoVfzZwgQQBKK5rB3v
 lGbu5i1S61a5fi6wBY7SYxlXENvL/N+NS6LyDKcKsIOLJz01bslhTEDIkbbZA49frd
 3P418wNLgE/QKr9i0r5s849Csq7tfSPe2b76y5dv6Z8euR59XabQ7nChX7eLwDY9bZ
 TeEGaaJOUsumKO7dBOi0UrlC1K7qZ1K79tHXrjJO8qn0BaK88xjsfx4DIxmndXrad5
 /TCqFnFIN0JWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=ulcVlsPC
Subject: [Buildroot] [PATCH 09/22] package/kodi-pvr-iptvsimple: bump version
 to 21.8.4-Omega
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
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
index 784775388d..872efba754 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  52108d15f8eaa58d7cd6d87947615758ffebcbf87a00090e71384cff4e59d25d  kodi-pvr-iptvsimple-21.8.3-Omega.tar.gz
+sha256  287d9fe5ca348f70b7fae96be7de0e0f092e9a00a3e8043c67ad24bd77a9a82d  kodi-pvr-iptvsimple-21.8.4-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index 5726ba66ed..67db5793d0 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_IPTVSIMPLE_VERSION = 21.8.3-Omega
+KODI_PVR_IPTVSIMPLE_VERSION = 21.8.4-Omega
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
