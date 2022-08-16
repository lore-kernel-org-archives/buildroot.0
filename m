Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8086C2BB41
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 10:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A177415C9;
	Tue, 16 Aug 2022 10:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A177415C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SPx3D_1zXrpA; Tue, 16 Aug 2022 10:37:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FB0F4088D;
	Tue, 16 Aug 2022 10:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FB0F4088D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 91CA51BF215
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 10:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79FF481B48
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 10:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79FF481B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x3o26A0KRI5e for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 10:37:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1E2B81B23
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1E2B81B23
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 10:37:26 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso9142924wma.2
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 03:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=MSVxFrHFSw2CsU11J6Q2RIqWbdXtD/79O6a2M6t2uO8=;
 b=zQzT56xxuyj1dob6qzYpoS4Z74W9S+98uoutZDvBn59wHhxdRExD0UnvrNwD1PvXAr
 Fqp5FdUjbzybTn1TC0OTkmfyya1dfN9OZP52uJQuE90qZ+jE7X71Op5fhGhGNSSBRqHR
 ndmCiqJizcbxVC70jx9CPc3J/edgokE7umHO8fPbxIBwzTCmNuQ97VpXxk9recA6fSj1
 yu+MoIACtIHtz30FHOO5Xs1RZnhAjw6nxh4r4pim3BHHziZxHgAFSUpf4KJOdn70La78
 +2LOcDe0v4F13RVCJQMohCeBOcT1Scdy6GHbFt0Q0oYdqJSROhIk/xL5+NBtHYYByA2j
 iDTQ==
X-Gm-Message-State: ACgBeo08xSu92aYTycuN2QhXdo76EG/dB0QF7ARKc1loT0GETtws6LeE
 y3Idm49CUzmvRiyvylmzteq06iQuTf0=
X-Google-Smtp-Source: AA6agR6zbz9MMT7WcLrAlqM39L7GNvPYxZD41BMyJjVHzfkKwY8y8x/21SIRIyK7+GRr3mF1r7mUZg==
X-Received: by 2002:a7b:cb88:0:b0:3a5:ea1c:c541 with SMTP id
 m8-20020a7bcb88000000b003a5ea1cc541mr7069149wmi.114.1660646244723; 
 Tue, 16 Aug 2022 03:37:24 -0700 (PDT)
Received: from pc-140.home ([2a01:cb1c:794:2300:d109:33e7:bc94:49e5])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a05600c190f00b003a5f54e3bbbsm7532278wmq.38.2022.08.16.03.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 03:37:24 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Tue, 16 Aug 2022 12:37:10 +0200
Message-Id: <20220816103710.1278-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=MSVxFrHFSw2CsU11J6Q2RIqWbdXtD/79O6a2M6t2uO8=;
 b=Hi421paL9baCmUuKnORgFOyyYfov0txeEHXchAgmTqoL49+ajaAtxVbXrKbRmY2DyY
 RJ7zWf/QmQL3Xncc5FxeNDdRxFtje45sQOCDDfXCBjCtYtsezovDU5HDFixpPqFQgExL
 RILhZ2I/3+H1k/C4RwCBuEQfWrzLBgsFITeyBbXPyuFA7S7RbwhmTfAE+j3jvVNTCYxu
 hQJtOqCfVdT+DLxLMYveI0AK791YHPeQONeb/irz7sBKZH8s3joy4YpNXmSAd4BgDng0
 Szy7y4IIxMnD3fowblBFGHa5Vix7bqahImgCXmtNw42JefsK8oXdJTDSXZmaSq/eCCRU
 uYXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Hi421paL
Subject: [Buildroot] [PATCH v1 1/1] package/pkg-meson.mk: handle possibly
 non existing compilers
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
Cc: Yann Morin <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To avoid populating the cross-file with non existing compilers,
we tie them to /bin/false

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/pkg-meson.mk | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 0632ab21cf..d675f7f733 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -68,15 +68,29 @@ else
 PKG_MESON_TARGET_CPU_FAMILY = $(ARCH)
 endif
 
+# To avoid populating the cross-file with non existing compilers,
+# we tie them to /bin/false
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+PKG_MESON_TARGET_CXX = $(TARGET_CXX)
+else
+PKG_MESON_TARGET_CXX = /bin/false
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
+PKG_MESON_TARGET_FC = $(TARGET_FC)
+else
+PKG_MESON_TARGET_FC = /bin/false
+endif
+
 # Generates sed patterns for patching the cross-compilation.conf template,
 # since Flags might contain commas the arguments are passed indirectly by
 # variable name (stripped to deal with whitespaces).
 # Arguments are variable containing cflags, cxxflags, ldflags, fcflags
 define PKG_MESON_CROSSCONFIG_SED
         -e "s%@TARGET_CC@%$(TARGET_CC)%g" \
-        -e "s%@TARGET_CXX@%$(TARGET_CXX)%g" \
+        -e "s%@TARGET_CXX@%$(PKG_MESON_TARGET_CXX)%g" \
         -e "s%@TARGET_AR@%$(TARGET_AR)%g" \
-        -e "s%@TARGET_FC@%$(TARGET_FC)%g" \
+        -e "s%@TARGET_FC@%$(PKG_MESON_TARGET_FC)%g" \
         -e "s%@TARGET_STRIP@%$(TARGET_STRIP)%g" \
         -e "s%@TARGET_ARCH@%$(PKG_MESON_TARGET_CPU_FAMILY)%g" \
         -e "s%@TARGET_CPU@%$(GCC_TARGET_CPU)%g" \
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
