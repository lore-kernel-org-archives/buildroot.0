Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67292D6AAEC
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 18:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3938440478;
	Thu,  2 Apr 2026 18:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VdHMhQZnSxvP; Thu,  2 Apr 2026 18:04:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B89C402A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775153097;
	bh=93ZTYAsQvPg1ZuxTb8hlfPNDpayIiUooCbgIAATPrCs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OQuk8hjHyIseITqJiNghfvU+lvv6NhI0jA4ejaeYGwJP6nUETZsecJZZ1Ci1xOgyb
	 TrEH2JzmrmPMUm57UL0gCS5IBZlbF5ItCiZiXp6uv0I6gWUtz4OUHKlZMPSU0u4qtK
	 T7OtQS26xlWzMBRDRuqPBrieS5jE9fYiztYUoctioMqPTDb8q77e1OfmB7wbIQFnEx
	 fGLao/DG5cyxzkhGAzicw6vJ7EjX0h6kYUC6YwI3iT2tagdzrZmWayBecuOZ4Oxr6A
	 AsXuJBOgHLIylneFJYjs3M7eKT9YIz6t/I7oS8JjfNY1juc+E8qtuyJqEoje2uCUXV
	 eQV8T7EgnULRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B89C402A8;
	Thu,  2 Apr 2026 18:04:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C6C62D3
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EA058067C
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:04:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdypR8qTMyBX for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 18:04:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 06C7180653
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06C7180653
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06C7180653
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:04:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08f0.dip0.t-ipconnect.de [91.58.8.240])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0B063A4C32CE;
 Thu,  2 Apr 2026 20:04:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59796)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w8MPU-000000000Dv-2351;
 Thu, 02 Apr 2026 18:04:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  2 Apr 2026 20:04:52 +0200
Message-ID: <20260402180452.2780094-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775153093;
 bh=lzW1LplJA4D4YQpeP+lT4UJ1AkydUmpYgcFQA+UKqyE=;
 h=From:To:Cc:Subject:Date:From;
 b=ByvqR6+2medi1RIfROGdAXvWJ//a94mxDoxJTAH6JHUT7t89Y0NiP8hI6No5nQImJ
 PQTwa58HFGggBSHpb8J7EWgCfNSfeSnc/F6LEgNaEwfOK2X8KUbj0EgsX/1KRAqqa5
 CDy/Jc07CGX/NFwA2Hex3WH1b/kAsMLtsjygbgI7O7sgbgdiPqggBYfncCypD2dz4E
 oDeYTbKKPrvfSWNOjxMpcTP12yS/ZG+ZcZZjYujygpNW7IT5dUz6vcED4ZmLCyhRRm
 cMd4pcIRFD6JRGL4h98YmOudyYsu9QC6w8yLBT4COnteu6Dzb3cvnmnNaP/68Vo1pH
 q44yckAuq9apw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ByvqR6+2
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump version to 4.3.1
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

https://cmake.org/cmake/help/latest/release/4.3.html#id2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 605bed2a40..5367ae2cd5 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v4.3/cmake-4.3.0-SHA-256.txt
-sha256  f51b3c729f85d8dde46a92c071d2826ea6afb77d850f46894125de7cc51baa77  cmake-4.3.0.tar.gz
+# From https://cmake.org/files/v4.3/cmake-4.3.1-SHA-256.txt
+sha256  0798f4be7a1a406a419ac32db90c2956936fecbf50db3057d7af47d69a2d7edb  cmake-4.3.1.tar.gz
 
 # Locally calculated
 sha256  4382e7c1879ac90e3f101a395d23846fa4dbcaa1eed7265b43681e348754825d  LICENSE.rst
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 952e8174f4..4fdd294f5a 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 4.3
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
