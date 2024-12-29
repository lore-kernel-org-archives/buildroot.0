Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE43FE7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 17:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61B8240275;
	Sun, 29 Dec 2024 17:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dxgE2RoeYS9k; Sun, 29 Dec 2024 17:50:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5272340288
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5272340288;
	Sun, 29 Dec 2024 17:50:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BD0B2C8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 17:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EA5C60733
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 17:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mpcn7M-_bkcW for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 17:50:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EDC366060C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDC366060C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDC366060C
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 17:50:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c38e.dip0.t-ipconnect.de [79.214.195.142])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 641A8A4C4188;
 Sun, 29 Dec 2024 18:49:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33440)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tRxQI-000000002d8-0L00;
 Sun, 29 Dec 2024 17:49:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>,
 Daniel Lang <dalang@gmx.at>, Romain Naour <romain.naour@gmail.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Sun, 29 Dec 2024 18:49:49 +0100
Message-Id: <20241229174953.1347624-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241229174953.1347624-1-bernd@kuhls.net>
References: <20241229174953.1347624-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1735494594;
 bh=yhC8I2xM7Orbb188jTVQ15WTpYxYPle4I2ZypdeFFqg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=et50urDcse8UL1xLQCvo5r3q9IyPgDciAUwZtZPt9MhvxYIAfrHK4is901lv6iBCo
 O/xNlvQIsty+SSnVUv1CPYz5InhMowoK6tKYgDaSPW7AdPFz6oOakZVqAd2uhgeiHJ
 6eC/Wnu60n0MAHa8+tijJhaafu5SXCg+RMOCWyn4yTAFJP+nqwzDnWpJ+IdCCDy8Rw
 trMTdClw4Cu2XdIKWRng3f4BL34OUI6nVuN8J8PD56LnFKS+zvTjzTsQYUV0nkVyPC
 pvTo6yCl6eSs6t20salSQIY2AgbIj1qfOzkUcFf7VlKJzqvOipTD54g0lE/aTHFPDT
 Ign88n9umTI0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=et50urDc
Subject: [Buildroot] [PATCH 2/6] package/llvm-project/libclc: add host
 variant
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

Needed for mesa3d bump to 24.1.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/llvm-project/libclc/libclc.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/llvm-project/libclc/libclc.mk b/package/llvm-project/libclc/libclc.mk
index 9f303d6d2f..cfa978a8ac 100644
--- a/package/llvm-project/libclc/libclc.mk
+++ b/package/llvm-project/libclc/libclc.mk
@@ -11,6 +11,7 @@ LIBCLC_LICENSE = Apache-2.0 with exceptions or MIT
 LIBCLC_LICENSE_FILES = LICENSE.TXT
 
 LIBCLC_DEPENDENCIES = host-clang host-llvm host-spirv-llvm-translator
+HOST_LIBCLC_DEPENDENCIES = host-clang host-llvm host-spirv-llvm-translator
 LIBCLC_INSTALL_STAGING = YES
 
 # CMAKE_*_COMPILER_FORCED=ON skips testing the tools and assumes
@@ -39,4 +40,8 @@ LIBCLC_CONF_OPTS = \
 	-DCMAKE_CXX_COMPILER="$(CMAKE_HOST_CXX_COMPILER)" \
 	-DLLVM_CONFIG="$(HOST_DIR)/bin/llvm-config"
 
+HOST_LIBCLC_CONF_OPTS = \
+	-DLIBCLC_TARGETS_TO_BUILD=spirv64-mesa3d-
+
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
