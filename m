Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87770C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 19:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 455F9820A5;
	Fri, 26 Jul 2024 19:07:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xda4f97mo2Hj; Fri, 26 Jul 2024 19:07:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53362820A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53362820A9;
	Fri, 26 Jul 2024 19:07:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F5B31BF348
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 19:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D09940118
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 19:07:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jBzR9hz1G0W7 for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 19:07:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2913F400FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2913F400FC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2913F400FC
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 19:07:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba5c.dip0.t-ipconnect.de [84.161.186.92])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CDBE4A4C3298;
 Fri, 26 Jul 2024 21:07:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55514)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sXQHY-000000001VJ-3W4p;
 Fri, 26 Jul 2024 19:07:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 26 Jul 2024 21:07:09 +0200
Message-Id: <20240726190712.1634310-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240726190712.1634310-1-bernd@kuhls.net>
References: <20240726190712.1634310-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722020832;
 bh=U01WJnXfVAdizx95WpDSHTUBsWxFCI5BeRj/U/YK3WU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aiViI+NVcTbs+kYP3vYL0BH2yfJyflrd0NwdyzFGKLEWO1AhXrEjI8qp+aL8q6ZfL
 2gtdHUcxb5KI4WByjMompk85nmLZT47fPI/qk5I8evprHUO2onQ8hxIkWEdg7+We+9
 AuvG1kfNMu2ij3TYEwOvpVV49ccJrUSnA84MIE97H+kZ9J5iYO41twfEqAGeX2J0XA
 J+1+7IsIu04vL5I10BTDfQwcQs+F5YoNutOvuqJulhHP8brwmyTqesF8GfzWFVnScw
 17MyzmKiZtw5DVr+nvrieI1kQDIX3QzlL7Vsi5U2A1ZH2WRUVdBRM0DL223zgpdheT
 KfRtVm5DealSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=aiViI+NV
Subject: [Buildroot] [PATCH 2/5] package/llvm-project/libclc: add host
 variant
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Daniel Lang <dalang@gmx.at>,
 Samuel Martin <s.martin49@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
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
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
