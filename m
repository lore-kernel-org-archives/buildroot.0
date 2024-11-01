Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA0AE6F093
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 22:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74BFA6072A;
	Fri,  1 Nov 2024 22:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iNxn6ZZhV3JH; Fri,  1 Nov 2024 22:54:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DF3F6072B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DF3F6072B;
	Fri,  1 Nov 2024 22:54:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C8BF6112A
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4FE86072B
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vWpf1FRX_Rq4 for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 22:54:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3E1AE6072A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E1AE6072A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E1AE6072A
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:54:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0255.dip0.t-ipconnect.de [91.58.2.85])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 99AA7A4C1070;
 Fri,  1 Nov 2024 23:54:24 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34926)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t70X9-000000005lU-3nzm;
 Fri, 01 Nov 2024 22:54:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, Daniel Lang <dalang@gmx.at>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>, Julien Olivain <ju.o@free.fr>
Date: Fri,  1 Nov 2024 23:54:19 +0100
Message-Id: <20241101225423.278060-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241101225423.278060-1-bernd@kuhls.net>
References: <20241101225423.278060-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730501664;
 bh=yhC8I2xM7Orbb188jTVQ15WTpYxYPle4I2ZypdeFFqg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SMd9kvmIIx9dPsD8vwsc4Z0CteqrrdRI/RrKJjTN+wDfPjWdyeUhH4jmkns0Om+MB
 xGZmIt8mI6b7jp4br1qyWvehcujie8HKAt1dDOa9k+3+EiC3YiVW8y7paI5/JM9PGs
 b8Z0ntgaeng7aropZRa0R79a6SFOwU6DfuApZJVHTuqQ9HFkF/gkL/qYRij5FPWJhV
 RvgKI3duzCmYuNU35twUCKS5K0STCBVQAuwixznRxUnTADvF6hAbsCLWnFlpraik+o
 4smGB44BlrVnu3zlkH7IyawBtA8VXAHa+pyZE/22e836b0qaCAdmRMNKm6ivPTVx1T
 AYleH72rJS0hw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=SMd9kvmI
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
