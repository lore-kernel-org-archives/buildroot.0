Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1D6C28B30
	for <buildroot@archiver.kernel.org>; Sun, 23 Mar 2025 19:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF6C84074F;
	Sun, 23 Mar 2025 19:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ia9nfGMtVoOp; Sun, 23 Mar 2025 19:05:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D7B6407C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D7B6407C0;
	Sun, 23 Mar 2025 19:05:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 52A061C9
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 19:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3906481285
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 19:05:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vcznSLwdrZ05 for <buildroot@buildroot.org>;
 Sun, 23 Mar 2025 19:05:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 155E181287
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 155E181287
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 155E181287
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 19:05:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c591.dip0.t-ipconnect.de [79.214.197.145])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DF231A4C35DF
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 20:05:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33796)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.1)
 (envelope-from <bernd@kuhls.net>) id 1twQde-000000000ci-27BU
 for buildroot@buildroot.org; Sun, 23 Mar 2025 19:05:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 23 Mar 2025 20:05:38 +0100
Message-Id: <20250323190538.3336153-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1742756738;
 bh=J1xcLTFSMKSrjNArpYU+oeWdzYOHaxCoIDiigvubdpk=;
 h=From:To:Subject:Date:From;
 b=R+pI6cgsSonk2JpSJhJplCD24E1jNt0ZeP4oP1q0khYVEey+XYBntyxXSyyt16pNg
 lkI5M4/4zDqQ3sklXFCOEBJT6o7rj92/XfcjgbffuSeRRefYKkH7nwiMP/OkuVisP9
 c06jSkusMh4MX9OxUfi8nCOUEIG3Ok7DL/XAARr8Cs53eYLXjhE5raYBGqKUJl1hNx
 cAimzKArqDT0ADRPfxPaIsE2okOCy98tBEz4q+lqvSs/UAnWjPMs57qlGbaF2rCwCq
 mlJ8cf4OpD6Lq8zZowgdUrLY4X4fcvjLFpSciT2e9dPXK0lDtlDBDwWhN5OFCEb8Wf
 te0d73Zo6pPtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=R+pI6cgs
Subject: [Buildroot] [PATCH] package/ccache: bump version to 4.11.2
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

Updated license hash due to copyright year and version bumps:
https://github.com/ccache/ccache/commits/v4.11.2/LICENSE.adoc

Follow upstream rename of Config.cpp to config.cpp:
https://github.com/ccache/ccache/commit/d805b66b0f1ffdfc7035537fbca677d7463d2782

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ccache/ccache.hash |  4 ++--
 package/ccache/ccache.mk   | 14 +++++++-------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 6624fdef65..259041d2e9 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
-sha256  c0b85ddfc1a3e77b105ec9ada2d24aad617fa0b447c6a94d55890972810f0f5a  ccache-4.10.2.tar.xz
+sha256  319390f276123968cfa565acc3da0b1e18414374b40ff25274230e6860352125  ccache-4.11.2.tar.xz
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
-sha256  de4684f5251a0a2c58f3a7ab94d6a8d3443822cbd01abcdadd9250d3d1e0bfe1  LICENSE.adoc
+sha256  115fd61246934e8581b1ef9263017cae89e61b5f11599d7f7d6b98f69a700e66  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index f3f675586d..f452bb40af 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.10.2
+CCACHE_VERSION = 4.11.2
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
@@ -43,12 +43,12 @@ HOST_CCACHE_CONF_OPTS += \
 HOST_CCACHE_DEFAULT_CCACHE_DIR = $(patsubst $(HOME)/%,%,$(BR_CACHE_DIR))
 
 define HOST_CCACHE_PATCH_CONFIGURATION
-	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/src/ccache/Config.cpp
-	sed -i 's,".ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/Config.cpp
-	sed -i 's,"/.cache/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/Config.cpp
-	sed -i 's,"/.config/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/Config.cpp
-	sed -i 's,getenv("XDG_CACHE_HOME"),nullptr,' $(@D)/src/ccache/Config.cpp
-	sed -i 's,getenv("XDG_CONFIG_HOME"),nullptr,' $(@D)/src/ccache/Config.cpp
+	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/src/ccache/config.cpp
+	sed -i 's,".ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/config.cpp
+	sed -i 's,"/.cache/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/config.cpp
+	sed -i 's,"/.config/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/config.cpp
+	sed -i 's,getenv("XDG_CACHE_HOME"),nullptr,' $(@D)/src/ccache/config.cpp
+	sed -i 's,getenv("XDG_CONFIG_HOME"),nullptr,' $(@D)/src/ccache/config.cpp
 endef
 
 HOST_CCACHE_POST_PATCH_HOOKS += HOST_CCACHE_PATCH_CONFIGURATION
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
