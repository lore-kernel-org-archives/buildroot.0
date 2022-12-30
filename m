Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3706C4167B
	for <buildroot@archiver.kernel.org>; Fri, 30 Dec 2022 10:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4864960A64;
	Fri, 30 Dec 2022 10:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4864960A64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xTDnuXk9jEs0; Fri, 30 Dec 2022 10:37:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9846F6066D;
	Fri, 30 Dec 2022 10:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9846F6066D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE3A11BF2E5
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 10:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96ED54014D
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 10:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96ED54014D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LFrn0JbhzMTi for <buildroot@lists.busybox.net>;
 Fri, 30 Dec 2022 10:37:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A261A40124
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A261A40124
 for <buildroot@buildroot.org>; Fri, 30 Dec 2022 10:37:28 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 fm16-20020a05600c0c1000b003d96fb976efso12863473wmb.3
 for <buildroot@buildroot.org>; Fri, 30 Dec 2022 02:37:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Av6EBU/9GKYjZUGYeHdUqkhQgXoV7H+1XEqN+K+deHk=;
 b=ROnqlARh3Vu9NAzOKRrMvLaaWA46BQfmNg5OpxfCNv2lDlvltRvux0ElDAbkX3/YmJ
 5Ycxi8HT/qo5ZqeYS3c7z7QUR43TG1XHuEPIXFqXvLxHt+Q8evDl5gNL8jTR0dZhVegu
 +iJ4ZIIVnWC4Mo7qWvzuGAgvTkHN3iLQ48gAMEEAGWEAeZCs1csdv0wI9WSkmseuGFXV
 wWrmB1jbNsgSKiizbySBiWrqUrcAn0n9aQiXxrcUmvQjNvVa55VJbtBphXQGD8gHMQja
 ur0SGnAZa7dG7W6YfYj6xpOIUB1YIDJ0HY6MXKl5n/BP1HdSMCJrrfLSwJ6zxWvuvIHe
 ZwFA==
X-Gm-Message-State: AFqh2koydeQgqAnWljft3mlFuwydApUOy+CQVNvy6p73h2SmUcihFxVI
 OhzOsvFOmb8R8xKKNWLuXfUK0cncnVU=
X-Google-Smtp-Source: AMrXdXtdbKDatlBg2Fqw5z3U8TaJhTIOypblxrmCibQU7MsyT6ITdMkQyEKOZ6IFDX+XxctZ1Md2Lg==
X-Received: by 2002:a05:600c:47d1:b0:3d3:496b:de9d with SMTP id
 l17-20020a05600c47d100b003d3496bde9dmr22366168wmo.34.1672396646408; 
 Fri, 30 Dec 2022 02:37:26 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c1c0600b003b4ff30e566sm52364481wms.3.2022.12.30.02.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Dec 2022 02:37:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 30 Dec 2022 11:37:22 +0100
Message-Id: <20221230103722.602850-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Av6EBU/9GKYjZUGYeHdUqkhQgXoV7H+1XEqN+K+deHk=;
 b=oC4Wfi72iT/UYy7jEPNfEE/mMQgGj6QghbXDpUiFOOcDK12VK3JYYHUsaIKOGI/rBG
 NYQPi7JlXNX0+0uL5tPY0ULbg4pZ/37rYcXyVNX3b4hjNKLrCqAYbg1FL86pLli/BrYg
 NqSPefMzHQfFSPjYPsZb9oh+R2WB8v5esVx0NASDT8oNtsz4kTnt/xyafZ9+6NCvSvcB
 aS5gtpKouhPq0vWhrNNobcYSbzWYxrW8pJ4TLRJ+UUVWtifIO06OE+9gX5gj83ZCNDsF
 RE6E4gcZhn5+HxpKdsGDuqW68oy2ahwFHZxpbVh7kWiFCQOY7zzoayYPEp4cAcBdmKN0
 PdiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oC4Wfi72
Subject: [Buildroot] [PATCH 1/1] package/hiredis: fix debug install
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

hiredis suffix its debug libraries with "d" since version 1.1.0 and
https://github.com/redis/hiredis/commit/dde6916b42a4723b364355eff8fbb477723a789a
resulting in the following build failure with collectd since commit
bd7e90779861bb603fc1cca03f6fad4d951f7bd9:

    redis . . . . . . . . no (symbol 'redisCommand' not found) (dependency error)

Fixes:
 - http://autobuild.buildroot.org/results/394ebf2b6816c69dbdd7901491c0e3fd52befedc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hiredis/hiredis.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index a5efb61acc..dbb59f44ba 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -11,7 +11,9 @@ HIREDIS_LICENSE = BSD-3-Clause
 HIREDIS_LICENSE_FILES = COPYING
 HIREDIS_CPE_ID_VENDOR = redis
 HIREDIS_INSTALL_STAGING = YES
-HIREDIS_CONF_OPTS = -DDISABLE_TESTS=ON
+# Set CMAKE_BUILD_TYPE to Release or the libraries will be suffixed with "d"
+# resulting in a build failure with collectd
+HIREDIS_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release -DDISABLE_TESTS=ON
 
 ifeq ($(BR2_PACKAGE_OPENSSL)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
 HIREDIS_CONF_OPTS += -DENABLE_SSL=ON
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
