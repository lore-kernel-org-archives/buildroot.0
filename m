Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F049CCA471
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 20:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2D8E61510;
	Fri,  3 Oct 2025 20:15:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xDAbiyc9u7V8; Fri,  3 Oct 2025 20:15:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 260676151A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 260676151A;
	Fri,  3 Oct 2025 20:15:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A6558226
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 982D44010C
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NVBHhEfsu8Vd for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 20:15:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 89FFD400E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89FFD400E2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89FFD400E2
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:15:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c3.dip0.t-ipconnect.de [91.58.3.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AB69EA4C5BC6;
 Fri,  3 Oct 2025 22:15:28 +0200 (CEST)
Received: from [192.168.1.144] (port=47178 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v4mBc-000000007vZ-1F9W;
 Fri, 03 Oct 2025 20:15:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri,  3 Oct 2025 22:15:28 +0200
Message-ID: <20251003201528.2430591-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759522528;
 bh=dx3YzTg1in+fi/SWx2Bq8kKd+Zvj/YX1j+7ub5Nalmc=;
 h=From:To:Cc:Subject:Date:From;
 b=sLdFMW8ARFejBpHVLKiDxK67c2qQFUfiilE6mL2ko8p1jDnYwPCMxmFOXN1heJzZO
 R57err9c/vSFJytL9dHPEvFWNeepHjY2n6EAi5y/hVE4/ULEh8q/2YIZiC7/9Sv8Dj
 k0MzT+2HuzTWCitn5yBZUY7mytWYPUJYfuR0AtC45bCiswSEHZvx4s6o9n0VO78K0S
 hRLk8p4AMuT8DHKHcPUnTad6QYpqNtL74J3u2qQlULVDidgKb4ieSE1uUXcE01uGm2
 SZDcH7P++j5DhnAnJWmPPoOOmL2ccgWgQs/hTKRRSTqafjtOSJuSumwGwuwVkp5cVG
 9ufrm791pQzvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=sLdFMW8A
Subject: [Buildroot] [PATCH 1/1] package/meson: bump version to 1.9.1
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

Release notes: https://mesonbuild.com/Release-notes-for-1-9-0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index c83daae6c9..581cfe62a7 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/1.8.3/meson-1.8.3.tar.gz.asc
-sha256  f118aa910fc0a137cc2dd0122232dbf82153d9a12fb5b0f5bb64896f6a157abf  meson-1.8.3.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/1.9.1/meson-1.9.1.tar.gz.asc
+sha256  4e076606f2afff7881d195574bddcd8d89286f35a17b4977a216f535dc0c74ac  meson-1.9.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 0c460eca6f..29082dcbb5 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.8.3
+MESON_VERSION = 1.9.1
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
