Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D34DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Jul 2022 21:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2FDB408FB;
	Sun, 10 Jul 2022 21:31:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2FDB408FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YOlk8moF6dfV; Sun, 10 Jul 2022 21:31:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 201B9408CD;
	Sun, 10 Jul 2022 21:31:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 201B9408CD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A84101BF3F6
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 21:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 834B284166
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 21:31:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 834B284166
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id luzXqcE7XKWl for <buildroot@lists.busybox.net>;
 Sun, 10 Jul 2022 21:31:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99F0084164
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99F0084164
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 21:31:23 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id z12so4769689wrq.7
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 14:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7B2VEUqJUBW6hn+vZOS93xAeGekl35kpEyT0/OMXtp8=;
 b=a8I2DiY2tCsHgFlELpyf/krv6hj8i0/A/YwM5siEvBs+q9TtdkvRlYwu3ofxUDsZcn
 H92Jn5NEISml8/9xIXBQ011sZ4oHBm9wCKY1uDtqpvbThEDkNDSZ961n7b7UcuSZfFIM
 JSkuT4x3vcvkMHCS7rUJpSKpIzxE6lpAZfsYHnnTE3IEhGpKqhoB/OAbi+VTZgRFkxtX
 yWspUrmahNzJaEjs9Yroa1579bcgLFKdeomAWscH4Z7S+gVsUM/5JGp2KimyDtlJCZhV
 EGEWPu5eduMDYWrOykQLp0rtDDp+Ux5CISAetvAAOiHtCuwqKju/+8H+MhqeqD0SDBoT
 n5BQ==
X-Gm-Message-State: AJIora9sZ2BTDHPkWBlRZ+RJ0e+PV6Sh+DngXhqc2XkIEwWgp26ChA8n
 XG8XIfau+642Rx3ihFuX06FO9RMWOZI=
X-Google-Smtp-Source: AGRyM1sQ+PRVORV2X8ecUiCbP0GjqTaWqAGyBvHi3pLUdtZJoy6HY6YDzd07rChqsUk+m2meCOD88w==
X-Received: by 2002:a5d:4201:0:b0:21d:7b63:1b43 with SMTP id
 n1-20020a5d4201000000b0021d7b631b43mr13214782wrq.225.1657488681457; 
 Sun, 10 Jul 2022 14:31:21 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 co1-20020a0560000a0100b0021cf31e1f7csm4235706wrb.102.2022.07.10.14.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 14:31:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Jul 2022 23:28:22 +0200
Message-Id: <20220710212822.876720-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710212822.876720-1-fontaine.fabrice@gmail.com>
References: <20220710212822.876720-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7B2VEUqJUBW6hn+vZOS93xAeGekl35kpEyT0/OMXtp8=;
 b=frh7zEcSI2uiPI+HfKXwz4V8qZnO8UOYqKsD97VlDDE9PaSZllRwchZsA36/isiD7l
 Gn6dmc77Ul5wYZH1ZUls/QxFSADqraIrTf33Oi/0CEqCA+/bT48BengvM0uUn/MsRzXp
 LDBHf6QCxl1xnGKoN7DPHpYSQRfM3vq0YDHvFeg/EhlyUjy2qHrRa/ze0+E8eXLZNK8Z
 at4wZFlFuw0R0KBsvSAjDp3S+bsQ5VS3dMqC/FC1+/ceEA0wCtIQO1SQvMn6hvpWs+hS
 bawLCHwkop90gEyHDiIigKyEV7gLwGCebRbg5LsszDRtveuiApmJ39712eNtkbyb6h+6
 ETuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=frh7zEcS
Subject: [Buildroot] [PATCH 2/2] package/kvazaar: add cryptopp support
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
Cc: Alexandre Esse <alexandre.esse.dev@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-pkgconf is only needed to find cryptopp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kvazaar/kvazaar.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/kvazaar/kvazaar.mk b/package/kvazaar/kvazaar.mk
index e2ab132203..9354f7ab5f 100644
--- a/package/kvazaar/kvazaar.mk
+++ b/package/kvazaar/kvazaar.mk
@@ -10,7 +10,12 @@ KVAZAAR_SITE = https://github.com/ultravideo/kvazaar/releases/download/v$(KVAZAA
 KVAZAAR_LICENSE = BSD-3-Clause, ISC (greatest, x264asm)
 KVAZAAR_LICENSE_FILES = LICENSE LICENSE.greatest LICENSE.x264asm
 KVAZAAR_INSTALL_STAGING = YES
-KVAZAAR_DEPENDENCIES = host-pkgconf
+
+ifeq ($(BR2_PACKAGE_CRYPTOPP),y)
+KVAZAAR_DEPENDENCIES = host-pkgconf cryptopp
+KVAZAAR_CONF_OPTS = --with-cryptopp
+else
 KVAZAAR_CONF_OPTS = --without-cryptopp
+endif
 
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
