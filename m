Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1CAC3ABC3
	for <buildroot@archiver.kernel.org>; Sun, 11 May 2025 16:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 824F7408AA;
	Sun, 11 May 2025 16:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vm-RUwJW9MeP; Sun, 11 May 2025 16:13:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3D3A40844
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3D3A40844;
	Sun, 11 May 2025 16:13:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FE3F154
 for <buildroot@buildroot.org>; Sun, 11 May 2025 16:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E99B84081F
 for <buildroot@buildroot.org>; Sun, 11 May 2025 16:13:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uJxXjOOtAM-b for <buildroot@buildroot.org>;
 Sun, 11 May 2025 16:13:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 53A6740801
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53A6740801
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53A6740801
 for <buildroot@buildroot.org>; Sun, 11 May 2025 16:13:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b54c.dip0.t-ipconnect.de [84.161.181.76])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2492EA4C055D
 for <buildroot@buildroot.org>; Sun, 11 May 2025 18:13:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59004)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uE9J5-000000003qn-1cDj
 for buildroot@buildroot.org; Sun, 11 May 2025 16:13:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 May 2025 18:13:36 +0200
Message-Id: <20250511161339.3195042-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1746980020;
 bh=UvGLmLa76D72Y0IVJWwq6cf/xfeESw0YN99zkyt1H+U=;
 h=From:To:Subject:Date:From;
 b=SW/NvimSw/paiEy2nx+aBN4JlxDVwxDQ15YosTIWsjN1kBYrU8jHhK2Omyed+hNsu
 ChUb7CpVc31OcN5meRbm0EgqVRHvLDs6CTU+SkRIc3yzf6HEI5AG4RTc395zB+TcYY
 405i3OwAEYXTg0ptcWGF7KyYhqs5UqFeA95jCmKhLuMZZjfasv8okxx8Dx6VAEKQMU
 8UJZ17sMNsUNLwEALhcxCnxnGJW6E1HIuz0myKkd+BfZ2tz+MK8kXJ3UiROJ7h+eoq
 eZAsNC91itRQTKhPWyc31qqr9PDJbN/ZtXz6LL8PWJcevHqb2JfoFUjelQAoDycw5K
 NhQyRNsoEYg3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=SW/NvimS
Subject: [Buildroot] [PATCH 1/4] package/intel-gmmlib: bump version to 22.7.2
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
 package/intel-gmmlib/intel-gmmlib.hash | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index 28a5bf2e91..771b20e074 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3b84d993950069f0a9b0cc373e2f4b026b194d8fdfb2a8856490d17dadd1b5a5  intel-gmmlib-22.7.1.tar.gz
+sha256  36f2ff2b59158d1253a33d735f4e35a1b5740c4751818bdaa222b8ddf96ee881  intel-gmmlib-22.7.2.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 3c87090233..8b269d3e7b 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.7.1
+INTEL_GMMLIB_VERSION = 22.7.2
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
