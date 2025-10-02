Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEA5CAC5B0
	for <buildroot@archiver.kernel.org>; Thu,  2 Oct 2025 18:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5813B4035A;
	Thu,  2 Oct 2025 18:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aeo8hQKGLkjo; Thu,  2 Oct 2025 18:59:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C3E340342
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C3E340342;
	Thu,  2 Oct 2025 18:59:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 063AA1CE
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 18:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0349240342
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 18:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4nNZkqqW6xJI for <buildroot@buildroot.org>;
 Thu,  2 Oct 2025 18:59:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E6BDC40335
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6BDC40335
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6BDC40335
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 18:59:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc8f.dip0.t-ipconnect.de [79.214.204.143])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 00226A4C59B3
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 20:59:17 +0200 (CEST)
Received: from [192.168.1.144] (port=54408 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v4OWK-0000000009X-2ZsB
 for buildroot@buildroot.org; Thu, 02 Oct 2025 18:59:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  2 Oct 2025 20:59:14 +0200
Message-ID: <20251002185916.2327332-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759431557;
 bh=ltnmN73sl6tNzr78nZTLiHeMYivMSvgYUIovE9AWqYo=;
 h=From:To:Subject:Date:From;
 b=h9Q7eM+05S6sbLnnhAu3q6Bo4hM5z0dFZqtbyYtJdMmrSgmNVYLFuOokV4Rhhp/MI
 UX/CsD6Tj8f2/3KqGSYFRDoOwHQX4Ep8Ry7qMpn1e2GM1JUnBGYdsOj11TJ4Tv1tGM
 eXvAgV7eayRoLTB6rwbp7pi1/wSDQ7xEbncydBntFOJcsXvwsCN1HZCMnfHm9ya/7t
 tjjB9qPEu89SUTU8r+HK8qQJ1Dq2Ub3IANO5CUFPI2QDX1OC4IZZGJVTbWrB58Z1a0
 MOccD5xrwHiSmNbmWvxj4FhJUUU8e5ZTB+e8/NG/gRZHX1uGv03rjaFVFj8wk2ynWU
 +YC/WS2kKaQlw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=h9Q7eM+0
Subject: [Buildroot] [PATCH 1/3] package/intel-gmmlib: bump version to 22.8.2
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
index c4e90dd67f..aef463783c 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9b8eac1891650021ded26b72585e7a2c702a3ba47565c968feabd14ab38d18f7  intel-gmmlib-22.8.1.tar.gz
+sha256  2e43e538a002574f45d480a24e02297c960963dc7914b7328791d9836832ff43  intel-gmmlib-22.8.2.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 18c8e48648..92569a106e 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.8.1
+INTEL_GMMLIB_VERSION = 22.8.2
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
