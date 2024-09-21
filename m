Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C50CF9C69
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 17:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DCD540628;
	Sat, 21 Sep 2024 17:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9L-Y0Yw560Xc; Sat, 21 Sep 2024 17:27:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A768405CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A768405CD;
	Sat, 21 Sep 2024 17:27:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCB7E1BF479
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 17:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCAA881297
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 17:27:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xEC9OMuK74cM for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 17:27:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CEADC81292
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEADC81292
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CEADC81292
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 17:27:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b0be.dip0.t-ipconnect.de [84.161.176.190])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BEB52A4C2BB9;
 Sat, 21 Sep 2024 19:27:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43696)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1ss3t1-0000000048F-1g0g;
 Sat, 21 Sep 2024 17:27:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 19:27:11 +0200
Message-Id: <20240921172711.3642889-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240921172711.3642889-1-bernd@kuhls.net>
References: <20240921172711.3642889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1726939631;
 bh=8e9fM2oELlupBbdEsnCYzmhzoOAEDBScznx1G+lCqfA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OZ845M21LKcc9slfzHRgDbY5XEsDN28tXGl0b2RdvhEArFz+CZggOIiiARznxRxyL
 VLzUFEVrVlDJgcNced6YEPEVaR8iV3Il6rGxLtKBqVCtZ54vrjtuaBs6zB+VuIWA3J
 dN5S3KTIxzRZFjqhurV0TftYrZubpwukKLgdQsEsgN7iZ9/n6AEzEsPadquFtbYEbD
 lLgPNI18CiLkYBDCuVVmqQLhDM6KWVmmPhZ0bzwoJr9ThlPzr5xhvjdSLMXNbyWMMe
 ZktSI4sUZKg+SzQ80DnCN2nG9DddGUX+PA2flwB3m2yYkCTZ7eihJQeec9Ta+3auDH
 g7ys7gg7kFyOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=OZ845M21
Subject: [Buildroot] [PATCH 3/3] package/intel-gmmlib: bump version to 22.5.2
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
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
index 5080301ee1..1accd2e205 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6dec8eccf0df4924b44de37afa0fd835684328778784dcd556df826b0a71e54f  intel-gmmlib-22.5.1.tar.gz
+sha256  dbf7cc401de7ff386306a23c1c61b3cf7bd86a4d9001b3a1d16a81e6b0e3ab2b  intel-gmmlib-22.5.2.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 8145b372aa..3698d2fff0 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.5.1
+INTEL_GMMLIB_VERSION = 22.5.2
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
