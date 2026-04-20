Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD1BF36C49
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 07:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAC6D6108D;
	Mon, 20 Apr 2026 07:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sirMK9jNl3uV; Mon, 20 Apr 2026 07:58:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C2066106F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776671885;
	bh=3eckmtpKZ39FQ4Wa+iYaOxOrqeNW6Nt3sPQZ47AuOy8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YItvISZVXpWviI8OihldvJ7+V7ixJtS4Xunr9Zjczlk7Lll3E7nBEPI8nRPRXu1/T
	 9UnDX4nF5sMf3JR0wm0o6s0eg1NIny4ndg/4/ehjxwj60wfV5OAUG4jU9OtSjsYPuL
	 oYBWvnvR3d+O43hGhfhkdVhgBYJv/FXByC1mA2oxXDcIOLTQuWHpnTYEByiE0YQ5Ov
	 lUQaCh9mRPSzXyD+S9MphoWZuwgEihOZkrlS3IcmLz+BVLYrlcauWU886uycxdavxx
	 FxC8T/uThS3Pxr1aY5MTlKxvnt+o0IkraKK1mALHOa/j1IMCYrd5zXpuTOS9Yc3lvW
	 m/nalc0ntHekA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C2066106F;
	Mon, 20 Apr 2026 07:58:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AF3E259
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 07:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CBBA822E6
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 07:58:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xXSIK15mVuEE for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 07:58:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E6410806E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6410806E1
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6410806E1
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 07:57:59 +0000 (UTC)
Received: from 91-154-227-245.elisa-laajakaista.fi ([91.154.227.245]
 helo=kodama) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wEjW0-000qws-TU; Mon, 20 Apr 2026 09:57:57 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 351e1726;
 Mon, 20 Apr 2026 07:57:53 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 20 Apr 2026 10:57:51 +0300
Message-ID: <20260420075753.1967051-3-aperez@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420075753.1967051-1-aperez@igalia.com>
References: <20260420075753.1967051-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/g9SxWvcGPSfTDH3GNsK49Lwbhwu9xR8i64YPQW6zos=; b=kWVHrmU8ro6WCduSeJPl+21eAH
 G1C7MO9aHNDVgMDxAmOT0s6956ytJIVUNnmV/gwvYbpPgkRpO8EaTvL70ffekmn1uQUwH7aLIfyC/
 vF6Z2FSvqETUOb0j8Tmo7zEFWSwRe07Vf6sFd2Rw/3wWaG9ZiT+Jaq3386S023Kkbfm7lCSgPNKPJ
 0wEE01pYYrVy9Irv/aJEWx8fTQpKpZ9mOodlyAGb3oXtSsIM9ybB4jUYP1oJgnQ5JHUl8GO73tsZ6
 gVMDauAaRLcy973B+tvYfBaOBbLU9CL/Wr5VKjqPoZ9Lfqqri9VsrInZ4JC54Ngie9fRAopmPx6hq
 cBLfON6Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=kWVHrmU8
Subject: [Buildroot] [PATCH 2/2] package/cage: bump version to 0.3.0
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

This version adds support for the wlr-foreign-toplevel-management and
drm-lease-v1 protocols; switches the wlroots dependency to 0.20.0; and
includes a few fixes. Release notes:

  https://github.com/cage-kiosk/cage/releases/tag/v0.3.0

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/cage/cage.hash | 4 ++--
 package/cage/cage.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/cage/cage.hash b/package/cage/cage.hash
index 018404a2c5..4b05602822 100644
--- a/package/cage/cage.hash
+++ b/package/cage/cage.hash
@@ -1,5 +1,5 @@
-# Locally computed
-sha256  9603ba1a130696dd39793ffab68397db504b378a733c09c0b86a5ebe3d6fe58d  cage-v0.2.1-git4.tar.gz
+# Locally computed, after checking PGP signature
+sha256  cd2510f83bef3e08e660d99492ca7761b218ecb53ee01cdbbeee3d6aabc7734e  cage-0.3.0.tar.gz
 
 # Hashes for license files:
 sha256  e117104073335dbaf78596fb1bedf89dda63c71f60f0b665947b2d369c77ecee  LICENSE
diff --git a/package/cage/cage.mk b/package/cage/cage.mk
index 9b5778449b..4495c59b4f 100644
--- a/package/cage/cage.mk
+++ b/package/cage/cage.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-CAGE_VERSION = v0.2.1
-CAGE_SITE = https://github.com/cage-kiosk/cage.git
-CAGE_SITE_METHOD = git
+CAGE_VERSION = 0.3.0
+CAGE_SITE = https://github.com/cage-kiosk/cage/releases/download/v$(CAGE_VERSION)
 CAGE_LICENSE = MIT
 CAGE_LICENSE_FILES = LICENSE
 CAGE_DEPENDENCIES = host-pkgconf wlroots
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
